Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3DB97F322
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 05:51:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x785pY9s008856
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Aug 2019 22:51:44 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 7 Aug 2019 22:51:23 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Aug 2019 13:51:22 +0800
Message-ID: <1565243482-302122-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] grub/grub-efi: fix conflict for aach64
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
X-List-Received-Date: Thu, 08 Aug 2019 05:51:53 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

MACHINE = qemuarm64
IMAGE_INSTALL_append = ' grub grub-efi'

do_rootfs failed with error:
file /usr/lib64/grub/arm64-efi/acpi.module conflicts between attempted installs of grub-2.02-r0.aarch64 and grub-efi-2.02-r0.aarch64
file /usr/lib64/grub/arm64-efi/adler32.module conflicts between attempted installs of grub-2.02-r0.aarch64 and grub-efi-2.02-r0.aarch64
...
file /usr/lib64/grub/arm64-efi/zfsinfo.module conflicts between attempted installs of grub-2.02-r0.aarch64 and grub-efi-2.02-r0.aarch64

For arm64, grub and grub-efi both compiled GRUBD2 with platform
arm64-efi, arm64 only support platform efi. So both packages have
almost same folder and content /usr/lib64/grub/arm64-efi/*

if Machine set to qemux86_64, do_rootfs will not have this problem,
since for grub, it compiled with platform i386-pc, for grub-efi,
compiled with platform x86-64-efi.

From commit:
commit 4e9bb03238af48c70075037a77094a8c1bddf284
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Wed Jan 17 03:25:58 2018 -0500

    grub/grub-efi: fix conflict

    While installing grub and grub-efi, there are conflict files
    in ${sysconfdir} ${datadir} ${bindir} ${sbindir}.

    - Since all of the conflicted files are tools which is
      common for grub and grub-efi, we split them (except
      grub-editenv) to grub-common in grub.

common tools for grub and grub-efi are installed into grub-common,
for aarch64, also shipped libdir into this common packages.
in this way, for qemuarm64, package grub is empty, and package grub-efi
use lib in package grub-common

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 5 +++++
 meta/recipes-bsp/grub/grub_2.04.bb     | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index 0028a9b..104a1c0 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -81,6 +81,10 @@ do_install_class-target() {
         {} +
 }
 
+do_install_append_aarch64() {
+    rm -rf  ${D}/${prefix}/
+}
+
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 configfile search loadenv test"
 
@@ -99,6 +103,7 @@ FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                /boot/EFI/BOOT/${GRUB_IMAGE} \
                "
 
+FILES_${PN}_remove_aarch64 = "${libdir}/grub/${GRUB_TARGET}-efi"
 
 # 64-bit binaries are expected for the bootloader with an x32 userland
 INSANE_SKIP_${PN}_append_linux-gnux32 = " arch"
diff --git a/meta/recipes-bsp/grub/grub_2.04.bb b/meta/recipes-bsp/grub/grub_2.04.bb
index e097375..1d1a456 100644
--- a/meta/recipes-bsp/grub/grub_2.04.bb
+++ b/meta/recipes-bsp/grub/grub_2.04.bb
@@ -14,6 +14,10 @@ FILES_${PN}-common = " \
     ${datadir}/grub \
 "
 
+FILES_${PN}-common_append_aarch64 = " \
+    ${libdir}/${BPN} \
+"
+
 do_install_append () {
     install -d ${D}${sysconfdir}/grub.d
     # Remove build host references...
-- 
2.7.4


