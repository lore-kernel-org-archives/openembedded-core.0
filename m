Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC891761DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 16:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SGpsTp017402 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:51:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q5AoNEkzrADR
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:51:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6SGpgGB017344
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 17:51:53 +0100
Message-ID: <1438102302.11208.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 17:51:42 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] pixbufcache: Use sceneQueueComplete event to simplify usage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jul 2015 16:51:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Ensuring the native pixbuf cache is correct after new loaders have
been installed is tricky. This needs to be done without races
and work regardless of whether the build is from sstate or freshly
built for one or more modules.

This adds a hook into base.bbclass which is then triggered by the
code from pixbufcache. This patch is an improved version which
means base.bbclass has no pixbuf knowledge and the mechanism can
be reused in other cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 08df7a7..abb50cf 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -204,8 +204,10 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete"
 python base_eventhandler() {
+    import bb.runqueue
+
     if isinstance(e, bb.event.ConfigParsed):
         if not e.data.getVar("NATIVELSBSTRING", False):
             e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
@@ -244,6 +246,17 @@ python base_eventhandler() {
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
 
+    if isinstance(e, bb.runqueue.sceneQueueComplete):
+        completions = e.data.expand("${STAGING_DIR}/sstatecompletions")
+        if os.path.exists(completions):
+            cmds = set()
+            with open(completions, "r") as f:
+                cmds = set(f)
+            e.data.setVar("completion_function", "\n".join(cmds))
+            e.data.setVarFlag("completion_function", "func", "1")
+            bb.debug(1, "Executing SceneQueue Completion commands: %s" % "\n".join(cmds))
+            bb.build.exec_func("completion_function", e.data)
+            os.remove(completions)
 }
 
 CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 9e6ecc8..349967d 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -45,6 +45,10 @@ python populate_packages_append() {
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
 
+gdkpixbuf_complete() {
+	GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_BINDIR_NATIVE}/gdk-pixbuf-query-loaders --update-cache || exit 1
+}
+
 #
 # Add an sstate postinst hook to update the cache for native packages.
 # An error exit during populate_sysroot_setscene allows bitbake to
@@ -52,26 +56,12 @@ python populate_packages_append() {
 #
 SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
+# See base.bbclass for the other half of this
 pixbufcache_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache || exit 1
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot" ]; then
+		${gdkpixbuf_complete}
+	elif [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
+		echo "${gdkpixbuf_complete}" >> ${STAGING_DIR}/sstatecompletions
 	fi
 }
 
-# Add all of the dependencies of gdk-pixbuf as dependencies of
-# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can work
-# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
-# gdk-pixbuf-native if we're not building gdk-pixbuf itself.
-#
-# Packages that use this class should extend this variable with their runtime
-# dependencies.
-PIXBUFCACHE_SYSROOT_DEPS = ""
-PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
-    ${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} \
-    glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
-    libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
-    harfbuzz-native:do_populate_sysroot_setscene \
-    "
-do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
-do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene','')}"



