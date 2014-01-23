Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDF86E3D8
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 14:35:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0NEZuRF027205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 06:35:56 -0800 (PST)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 06:35:56 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 08:32:42 -0600
Message-ID: <1390487566-13569-3-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
References: <1390487566-13569-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/6] unfs3, unfs-server: Replace all instances of unfs-server with unfs3
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
X-List-Received-Date: Thu, 23 Jan 2014 14:35:55 -0000
Content-Type: text/plain

Other recipes dependencies and even some comments need to be updated
for the removal of unfs-server and the replacement with unfs3.  The
unfs3 is a complete drop in replacement providing all the prior
functionality of NFSv2 but also adding NFSv3.

[YOCTO #5639]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/conf/distro/include/seperatebuilddir.inc      |    4 ++--
 meta/recipes-core/meta/meta-ide-support.bb         |    2 +-
 .../nativesdk-packagegroup-sdk-host.bb             |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
 meta/site/ix86-common                              |    2 +-
 meta/site/x86_64-linux                             |    2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 3c36c22..64e8f6d 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -528,7 +528,7 @@ B_pn-nativesdk-renderproto = "${SEPB}"
 B_pn-nativesdk-sqlite3 = "${SEPB}"
 B_pn-nativesdk-systemtap = "${SEPB}"
 # Not automake, no out of tree build support
-#B_pn-nativesdk-unfs-server = "${SEPB}"
+#B_pn-nativesdk-unfs3 = "${SEPB}"
 B_pn-nativesdk-util-macros = "${SEPB}"
 B_pn-nativesdk-xcb-proto = "${SEPB}"
 B_pn-nativesdk-xcmiscproto = "${SEPB}"
@@ -676,7 +676,7 @@ B_pn-tremor = "${SEPB}"
 B_pn-tslib = "${SEPB}"
 B_pn-udev = "${SEPB}"
 # Not automake, no out of tree build support
-#B_pn-unfs-server-native = "${SEPB}"
+#B_pn-unfs3-native = "${SEPB}"
 B_pn-usbutils = "${SEPB}"
 B_pn-util-linux = "${SEPB}"
 B_pn-util-linux-native = "${SEPB}"
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index d4c410e..40bda28 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-DEPENDS = "virtual/libc gdb-cross qemu-native qemu-helper-native unfs-server-native"
+DEPENDS = "virtual/libc gdb-cross qemu-native qemu-helper-native unfs3-native"
 PR = "r3"
 
 inherit meta toolchain-scripts
diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 1065f30..855fe4e 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -15,7 +15,7 @@ RDEPENDS_${PN} = "\
     nativesdk-qemu \
     nativesdk-qemu-helper \
     nativesdk-pseudo \
-    nativesdk-unfs-server \
+    nativesdk-unfs3 \
     nativesdk-opkg \
     nativesdk-libtool \
     nativesdk-autoconf \
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 2fef7b0..e3422f5 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -146,7 +146,7 @@ fi
 
 if [ "$YOCTOADT_NFS_UTIL" == "Y" ] || [ "$YOCTOADT_NFS_UTIL" == "y" ]; then
   echo_info "\nInstalling unfs ..."
-  $OPKG_INSTALL_NATIVE_CMD nativesdk-unfs-server &>> $YOCTOADT_INSTALL_LOG_FILE
+  $OPKG_INSTALL_NATIVE_CMD nativesdk-unfs3 &>> $YOCTOADT_INSTALL_LOG_FILE
   check_result
 fi
 
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index c88f82a..07d4f1d 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -213,7 +213,7 @@ DEPENDS = "\
     tiff-native \
     tzcode-native \
     u-boot-mkimage-native \
-    unfs-server-native \
+    unfs3-native \
     unifdef-native \
     unzip-native \
     update-rc.d-native \
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index 21fcf38..5cd2ce2 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -216,7 +216,7 @@ moz_cv_size_of_JS_BYTES_PER_DOUBLE=8
 #ofono
 ac_cv_lib_c_signalfd=${ac_cv_lib_c_signalfd=yes}
 
-#unfs-server
+#unfs3
 nfsd_cv_broken_setfsuid=${nfsd_cv_broken_setfsuid=0}
 nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
 nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index b4434fe..573a907 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -98,7 +98,7 @@ ac_cv_alignof_CORBA_wchar=2
 lf_cv_sane_realloc=yes
 as_cv_unaligned_access=${as_cv_unaligned_access=yes}
 
-#unfs-server
+#unfs3
 nfsd_cv_broken_setfsuid=${nfsd_cv_broken_setfsuid=0}
 nfsd_cv_func_statfs=${nfsd_cv_func_statfs=statfs2_bsize}
 nfsd_cv_bsd_signals=${nfsd_cv_bsd_signals=yes}
-- 
1.7.9.5


