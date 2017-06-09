Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6BF78285
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:24:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v599OkIo012688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 9 Jun 2017 02:24:47 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Jun 2017 02:24:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 05:24:41 -0400
Message-ID: <632f1df128d810607582b55d0f1566615e13c28d.1497000088.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1497000088.git.hongxu.jia@windriver.com>
References: <cover.1497000088.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] grub/grub-efi: fix conflict
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
X-List-Received-Date: Fri, 09 Jun 2017 09:24:47 -0000
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

[YOCTO #11639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb |  7 +++++--
 meta/recipes-bsp/grub/grub2.inc        |  4 ----
 meta/recipes-bsp/grub/grub_2.02.bb     | 13 ++++++++++---
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 9d494d5..3c87cb7 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -3,7 +3,7 @@ require grub2.inc
 GRUBPLATFORM = "efi"
 
 DEPENDS_class-target = "grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype"
+RDEPENDS_${PN}_class-target = "diffutils freetype grub-common"
 
 SRC_URI += " \
            file://cfg \
@@ -41,6 +41,10 @@ do_install_class-native() {
 	install -m 755 grub-mkimage ${D}${bindir}
 }
 
+do_install_class-target() {
+	oe_runmake 'DESTDIR=${D}' -C grub-core install
+}
+
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
 
 do_deploy() {
@@ -59,7 +63,6 @@ do_deploy_class-native() {
 addtask deploy after do_install before do_build
 
 FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
-                ${datadir}/grub \
                 "
 
 # 64-bit binaries are expected for the bootloader with an x32 userland
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bb6ebdd..2bf3245 100644
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
diff --git a/meta/recipes-bsp/grub/grub_2.02.bb b/meta/recipes-bsp/grub/grub_2.02.bb
index 57c6559..ea41ee9 100644
--- a/meta/recipes-bsp/grub/grub_2.02.bb
+++ b/meta/recipes-bsp/grub/grub_2.02.bb
@@ -1,10 +1,17 @@
 require grub2.inc
 
-RDEPENDS_${PN} = "diffutils freetype grub-editenv"
+RDEPENDS_${PN}-common = "${PN}-editenv"
+RDEPENDS_${PN} = "diffutils freetype ${PN}-common"
 
-PACKAGES =+ "grub-editenv"
+PACKAGES =+ "${PN}-editenv ${PN}-common"
 
-FILES_grub-editenv = "${bindir}/grub-editenv"
+FILES_${PN}-editenv = "${bindir}/grub-editenv"
+FILES_${PN}-common = " \
+    ${bindir} \
+    ${sysconfdir} \
+    ${sbindir} \
+    ${datadir}/grub \
+"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
-- 
2.8.1


