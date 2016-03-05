Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2AB60017
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Mar 2016 09:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u259eAto004156; Sat, 5 Mar 2016 09:40:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EDT9FMHeDxYE; Sat,  5 Mar 2016 09:40:10 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u259e4w2004151
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 5 Mar 2016 09:40:05 GMT
Message-ID: <1457170804.2804.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 05 Mar 2016 09:40:04 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] uninative/mtools: Set GCONV_PATH centrally to ensure the correct value
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
X-List-Received-Date: Sat, 05 Mar 2016 09:40:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The existing GCONV_PATH set in the mcopy wrapper doens't work with the updated 
uninative directory layout. It also means that it might not work correctly in the
native case when uninative is not in use.

Tweak uninative to set GCONV_PATH into the environment for everything to
avoid these problems. Refactoring the code in uninative into a function 
is beneficial at this point.

Based on a patch from Randy Witt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 7f242de..6abcbed 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -57,9 +57,7 @@ python uninative_event_fetchloader() {
         cmd = d.expand("mkdir -p ${STAGING_DIR}-uninative; cd ${STAGING_DIR}-uninative; tar -xjf ${UNINATIVE_DLDIR}/${UNINATIVE_TARBALL}; ${STAGING_DIR}-uninative/relocate_sdk.py ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux ${UNINATIVE_LOADER} ${UNINATIVE_LOADER} ${STAGING_DIR}-uninative/${BUILD_ARCH}-linux/${bindir_native}/patchelf-uninative")
         subprocess.check_call(cmd, shell=True)
 
-        d.setVar("NATIVELSBSTRING", "universal")
-        d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
-        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
+        enable_uninative(d)
 
     except bb.fetch2.BBFetchException as exc:
         bb.warn("Disabling uninative as unable to fetch uninative tarball: %s" % str(exc))
@@ -76,14 +74,21 @@ python uninative_event_enable() {
     This event handler is called in the workers and is responsible for setting
     up uninative if a loader is found.
     """
+    enable_uninative(d)
+}
 
+def enable_uninative(d):
     loader = d.getVar("UNINATIVE_LOADER", True)
     if os.path.exists(loader):
         bb.debug(2, "Enabling uninative")
         d.setVar("NATIVELSBSTRING", "universal")
+
+        uninative_dir = "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux"
         d.appendVar("SSTATEPOSTUNPACKFUNCS", " uninative_changeinterp")
-        d.prependVar("PATH", "${STAGING_DIR}-uninative/${BUILD_ARCH}-linux${bindir_native}:")
-}
+        d.prependVar("PATH", "%s${bindir_native}:" % uninative_dir)
+        # We need this so mcopy (mtools) can find codepages correctly for example
+        d.setVar("GCONV_PATH", "%s${libdir_native}/gconv" % uninative_dir)
+        d.setVarFlag("GCONV_PATH", "export", "1")
 
 python uninative_changeinterp () {
     import subprocess
diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
index 26d52a9..3423917 100644
--- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
+++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
@@ -51,8 +51,3 @@ do_install_prepend () {
     mkdir -p ${D}/${bindir}
     mkdir -p ${D}/${datadir}
 }
-
-do_install_append_class-native () {
-    create_wrapper ${D}${bindir}/mcopy \
-        GCONV_PATH=${libdir}/gconv
-}
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 479fd32..efde547 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -48,8 +48,3 @@ do_install_prepend () {
     mkdir -p ${D}/${bindir}
     mkdir -p ${D}/${datadir}
 }
-
-do_install_append_class-native () {
-    create_wrapper ${D}${bindir}/mcopy \
-        GCONV_PATH=${libdir}/gconv
-}



