Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 435D271987
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 03:17:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAN3HfAv014918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Nov 2016 19:17:41 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 19:17:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 22:17:37 -0500
Message-ID: <e40aee8b335c72557154bbc58da2231690eb7cee.1479871002.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1479871002.git.hongxu.jia@windriver.com>
References: <cover.1479871002.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub/grub-efi: fix conflict
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
X-List-Received-Date: Wed, 23 Nov 2016 03:17:41 -0000
Content-Type: text/plain

While installing grub and grub-efi, there are conflict files
in ${sysconfdir} ${datadir} ${bindir} ${sbindir}.

Debian use a common package grub-common for both of pc bios and efi,
and use package grub-pc-bin for pc bios, grub-efi-amd64-bin for efi.
Both of grub-pc-bin and grub-efi-amd64-bin requires grub-common.
https://packages.debian.org/sid/grub-common
https://packages.debian.org/jessie/grub-pc-bin
https://packages.debian.org/jessie/grub-efi-amd64-bin

Fedora use a common package grub2-tools for both of pc bios and efi,
and use package grub2 for pc bios, grub2-efi-modules for efi.
Both of grub2 and grub2-efi-modules requires grub2-tools.
https://www.rpmfind.net/linux/RPM/fedora/devel/rawhide/x86_64/g/grub2-tools-2.02-0.34.fc24.x86_64.html
https://www.rpmfind.net/linux/RPM/fedora/devel/rawhide/x86_64/g/grub2-2.02-0.34.fc24.x86_64.html
https://www.rpmfind.net/linux/RPM/fedora/devel/rawhide/x86_64/g/grub2-efi-modules-2.02-0.34.fc24.x86_64.html

For OE, we use a common package grub-common for both of pc bios and efi,
and use package grub for pc bios, grub-efi for efi.
Both of grubc and grub-efi runtime depends grub-common.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 12 +++++++++---
 meta/recipes-bsp/grub/grub2.inc        |  4 ----
 meta/recipes-bsp/grub/grub_2.00.bb     | 18 +++++++++++-------
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 5a0dc95..72983da 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -1,7 +1,7 @@
 require grub2.inc
 
 DEPENDS_class-target = "grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype"
+RDEPENDS_${PN}_class-target = "diffutils freetype grub-common"
 PR = "r3"
 
 SRC_URI += " \
@@ -44,6 +44,13 @@ do_install_class-native() {
 	install -m 755 grub-mkimage ${D}${bindir}
 }
 
+do_install_append_class-target(){
+	# Remove duplicated
+	for dir in ${sysconfdir} ${datadir} ${bindir} ${sbindir}; do
+		rm -rf ${D}$dir
+	done
+}
+
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
 
 do_deploy() {
@@ -61,8 +68,7 @@ do_deploy_class-native() {
 
 addtask deploy after do_install before do_build
 
-FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
-                ${datadir}/grub \
+FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                 "
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b10f633..1bb7b84 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -64,7 +64,3 @@ do_configure_prepend() {
 	( cd ${S}
 	${S}/autogen.sh )
 }
-
-# grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
-# conflicted, remove it since no one uses it.
-SYSROOT_DIRS_BLACKLIST += "${datadir}/grub/grub-mkconfig_lib"
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 07e1d10..7bfece0 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -1,6 +1,8 @@
 require grub2.inc
 
-RDEPENDS_${PN} = "diffutils freetype grub-editenv"
+RDEPENDS_${PN} = "diffutils freetype ${PN}-common"
+RDEPENDS_${PN}-common = "${PN}-editenv"
+
 PR = "r1"
 
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
@@ -8,13 +10,15 @@ EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
-PACKAGES =+ "grub-editenv"
-
-FILES_grub-editenv = "${bindir}/grub-editenv"
+PACKAGES =+ "${PN}-editenv ${PN}-common"
 
-do_install_append () {
-    install -d ${D}${sysconfdir}/grub.d
-}
+FILES_${PN}-editenv = "${bindir}/grub-editenv"
+FILES_${PN}-common = " \
+    ${bindir} \
+    ${sysconfdir} \
+    ${sbindir} \
+    ${datadir}/grub \
+"
 
 INSANE_SKIP_${PN} = "arch"
 INSANE_SKIP_${PN}-dbg = "arch"
-- 
2.8.1


