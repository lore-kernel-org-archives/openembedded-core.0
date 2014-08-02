Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D0714609C0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:54:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s728swFu025144 for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:54:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BAEll4tahQ1D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 09:54:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s728ssXk024903
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Aug 2014 09:54:55 +0100
Message-ID: <1406969694.6981.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 02 Aug 2014 09:54:54 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC] pixbufcache: Use sceneQueueComplete event to simplify usage
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
X-List-Received-Date: Sat, 02 Aug 2014 08:55:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

[This is an RFC which depends on a patch to bitbake to operate]

Currently, we have a mess of dependencies for pixbufcache and even then
it breaks since they might be controlled by PACKAGECONFIG.

Instead, this patch proposes an alternative approach where we allow
"fixups" from a sceneQueueComplete() event at the end of the setscene
process. We signal the need for these using simply stamp files.

The one downside is that the processing code needs to be in a global
event handler like base.bbclass rather than pixbufcache.bbclass but this
is probably a price worth paying to avoid the dependency mess?

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4972a98..cd4debe 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -284,8 +284,10 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete"
 python base_eventhandler() {
+    import bb.runqueue
+
     if isinstance(e, bb.event.ConfigParsed):
         e.data.setVar("NATIVELSBSTRING", lsb_distro_identifier(e.data))
         e.data.setVar('BB_VERSION', bb.__version__)
@@ -324,6 +326,15 @@ python base_eventhandler() {
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
             e.data.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
 
+    if isinstance(e, bb.runqueue.sceneQueueComplete):
+        pbfile = e.data.expand("${STAGING_DIR}/needpixbuf")
+        if os.path.exists(pbfile):
+            bb.build.exec_func("gdkpixbuf_complete", e.data)
+            os.remove(pbfile)
+}
+
+gdkpixbuf_complete() {
+	GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_BINDIR_NATIVE}/gdk-pixbuf-query-loaders --update-cache || exit 1
 }
 
 addtask configure after do_patch
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index b8d75bd..19b4982 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -52,21 +52,10 @@ python populate_packages_append() {
 #
 SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
+# See base.bbclass for the other half of this
 pixbufcache_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
-		GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache || exit 1
+		touch ${STAGING_DIR}/needpixbuf
 	fi
 }
-
-# Add all of the dependencies of gdk-pixbuf as dependencies of
-# do_populate_sysroot_setscene so that pixbufcache_sstate_postinst can work
-# (otherwise gdk-pixbuf-query-loaders may not exist or link). Only add
-# gdk-pixbuf-native if we're not building gdk-pixbuf itself.
-#
-# Packages that use this class should extend this variable with their runtime
-# dependencies.
-PIXBUFCACHE_SYSROOT_DEPS = ""
-PIXBUFCACHE_SYSROOT_DEPS_class-native = "${@['gdk-pixbuf-native:do_populate_sysroot_setscene', '']['${BPN}' == 'gdk-pixbuf']} glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene"
-do_populate_sysroot_setscene[depends] += "${PIXBUFCACHE_SYSROOT_DEPS}"
-do_populate_sysroot[depends] += "${@d.getVar('PIXBUFCACHE_SYSROOT_DEPS', True).replace('_setscene','')}"



