Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ED7D3781DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:26:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0H8Q2Ei021098
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 17 Jan 2018 00:26:04 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 00:26:01 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 17 Jan 2018 03:25:58 -0500
Message-ID: <1516177558-24610-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] grub/grub-efi: fix conflict
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
X-List-Received-Date: Wed, 17 Jan 2018 08:26:05 -0000
Content-Type: text/plain

While installing grub and grub-efi, there are conflict files
in ${sysconfdir} ${datadir} ${bindir} ${sbindir}.

- Since all of the conflicted files are tools which is
  common for grub and grub-efi, we split them (except
  grub-editenv) to grub-common in grub.

- The package grub-common runtime depends grub-editenv

- The package grub-editenv runtime provides grub-efi-editenv

- Remove SYSROOT_DIRS_BLACKLIST

- The recipe grub-efi does not generate the duplicated files
  and use runtime depends grub-common to instead

Debian and Fedora do the similar thing.

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

[YOCTO #11639]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.02.bb |  9 +++++----
 meta/recipes-bsp/grub/grub2.inc        |  8 --------
 meta/recipes-bsp/grub/grub_2.02.bb     | 14 +++++++++++++-
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 128da16..112a99d 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -3,7 +3,7 @@ require grub2.inc
 GRUBPLATFORM = "efi"
 
 DEPENDS_append_class-target = " grub-efi-native"
-RDEPENDS_${PN}_class-target = "diffutils freetype"
+RDEPENDS_${PN}_class-target = "diffutils freetype grub-common"
 
 SRC_URI += " \
            file://cfg \
@@ -41,7 +41,9 @@ do_install_class-native() {
 	install -m 755 grub-mkimage ${D}${bindir}
 }
 
-do_install_append_class-target() {
+do_install_class-target() {
+    oe_runmake 'DESTDIR=${D}' -C grub-core install
+
     # Remove build host references...
     find "${D}" -name modinfo.sh -type f -exec \
         sed -i \
@@ -69,8 +71,7 @@ do_deploy_class-native() {
 
 addtask deploy after do_install before do_build
 
-FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
-                ${datadir}/grub \
+FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                 "
 
 # 64-bit binaries are expected for the bootloader with an x32 userland
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 28f96bb..79a84e9 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -67,12 +67,4 @@ do_configure_prepend() {
 	${S}/autogen.sh )
 }
 
-# grub and grub-efi's sysroot/${datadir}/grub/grub-mkconfig_lib are
-# conflicted, remove it since no one uses it.
-SYSROOT_DIRS_BLACKLIST += "${datadir}/grub/grub-mkconfig_lib"
-
-PACKAGES =+ "${PN}-editenv"
-
-FILES_${PN}-editenv = "${bindir}/grub-editenv"
-RDEPENDS_${PN} += "${PN}-editenv"
 RDEPENDS_${PN}_class-native = ""
diff --git a/meta/recipes-bsp/grub/grub_2.02.bb b/meta/recipes-bsp/grub/grub_2.02.bb
index 3e61f6a..e097375 100644
--- a/meta/recipes-bsp/grub/grub_2.02.bb
+++ b/meta/recipes-bsp/grub/grub_2.02.bb
@@ -1,6 +1,18 @@
 require grub2.inc
 
-RDEPENDS_${PN} += "diffutils freetype"
+RDEPENDS_${PN}-common += "${PN}-editenv"
+RDEPENDS_${PN} += "diffutils freetype ${PN}-common"
+
+RPROVIDES_${PN}-editenv += "${PN}-efi-editenv"
+
+PACKAGES =+ "${PN}-editenv ${PN}-common"
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
1.8.3.1


