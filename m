Return-Path: <Catalin.Enache@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CAB0731A3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 12:10:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u46CA94C019273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 May 2016 05:10:09 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 6 May 2016 05:10:08 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 May 2016 15:13:50 +0300
Message-ID: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] grub-efi: run autogen.sh before configure
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
X-List-Received-Date: Fri, 06 May 2016 12:10:09 -0000
Content-Type: text/plain

When adding new source files from upstream the autogen.sh
script needs to be run.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 5a0dc95..62ded6e 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -2,6 +2,7 @@ require grub2.inc
 
 DEPENDS_class-target = "grub-efi-native"
 RDEPENDS_${PN}_class-target = "diffutils freetype"
+DEPENDS += "autogen-native"
 PR = "r3"
 
 SRC_URI += " \
@@ -39,6 +40,11 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
 CFLAGS_append_class-native = " -Wno-error=trampolines"
 
+do_configure_prepend() {
+    ( cd ${S}
+    ${S}/autogen.sh )
+}
+
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
-- 
2.7.4


