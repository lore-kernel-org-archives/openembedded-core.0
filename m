Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 12A186E6B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u05HqvwU008061 for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 17:52:57 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZAD4HL-Pl3WT
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 17:52:57 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u05HqtkJ008057
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jan 2016 17:52:56 GMT
Message-ID: <1452016375.7598.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 05 Jan 2016 17:52:55 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image: Condense do_rootfs function/flags
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
X-List-Received-Date: Tue, 05 Jan 2016 17:52:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Various prefuncs and flags and addtask statements make sense to belong together
in one clearer function now, this patch cleans things up a bit.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index da64cad..81971fe 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -191,8 +191,6 @@ inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
-
-
 # some default locales
 IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
 
@@ -202,19 +200,17 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IM
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-do_rootfs[dirs] = "${TOPDIR}"
-do_rootfs[cleandirs] += "${S}"
-
-# Must call real_do_rootfs() from inside here, rather than as a separate
-# task, so that we have a single fakeroot context for the whole process.
-do_rootfs[umask] = "022"
-
 inherit rootfs-postcommands
 
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
 
-python rootfs_process_ignore() {
+fakeroot python do_rootfs () {
+    from oe.rootfs import create_rootfs
+    from oe.image import create_image
+    from oe.manifest import create_manifest
+
+    # Handle package exclusions
     excl_pkgs = d.getVar("PACKAGE_EXCLUDE", True).split()
     inst_pkgs = d.getVar("PACKAGE_INSTALL", True).split()
     inst_attempt_pkgs = d.getVar("PACKAGE_INSTALL_ATTEMPTONLY", True).split()
@@ -233,40 +229,35 @@ python rootfs_process_ignore() {
 
     d.setVar("PACKAGE_INSTALL", ' '.join(inst_pkgs))
     d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", ' '.join(inst_attempt_pkgs))
-}
-do_rootfs[prefuncs] += "rootfs_process_ignore"
 
-# We have to delay the runtime_mapping_rename until just before rootfs runs
-# otherwise, the multilib renaming could step in and squash any fixups that
-# may have occurred.
-python rootfs_runtime_mapping() {
+    # Ensure we handle package name remapping
+    # We have to delay the runtime_mapping_rename until just before rootfs runs
+    # otherwise, the multilib renaming could step in and squash any fixups that
+    # may have occurred.
     pn = d.getVar('PN', True)
     runtime_mapping_rename("PACKAGE_INSTALL", pn, d)
     runtime_mapping_rename("PACKAGE_INSTALL_ATTEMPTONLY", pn, d)
     runtime_mapping_rename("BAD_RECOMMENDATIONS", pn, d)
-}
-do_rootfs[prefuncs] += "rootfs_runtime_mapping"
-
-fakeroot python do_rootfs () {
-    from oe.rootfs import create_rootfs
-    from oe.image import create_image
-    from oe.manifest import create_manifest
 
-    # generate the initial manifest
+    # Generate the initial manifest
     create_manifest(d)
 
-    # generate rootfs
+    # Generate rootfs
     create_rootfs(d)
 
     # generate final images
     create_image(d)
 }
+do_rootfs[dirs] = "${TOPDIR}"
+do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
+do_rootfs[cleandirs] += "${S}"
+do_rootfs[umask] = "022"
+addtask rootfs before do_build
 
 MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
-
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
 do_patch[noexec] = "1"
@@ -281,7 +272,6 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
-addtask rootfs before do_build
 # Allow the kernel to be repacked with the initramfs and boot image file as a single file
 do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
 do_bundle_initramfs[nostamp] = "1"



