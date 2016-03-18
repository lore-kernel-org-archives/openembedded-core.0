Return-Path: <william.c.randle@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 043356E666
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 18:17:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2016 11:17:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,356,1455004800"; d="scan'208";a="940360075"
Received: from wcrandle-mobl1.amr.corp.intel.com ([10.254.114.227])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2016 11:17:46 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 11:16:27 -0700
Message-Id: <1458324987-30874-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v3] grub: add -Wno-error=trampolines to native CFLAGS
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
X-List-Received-Date: Fri, 18 Mar 2016 18:17:46 -0000

(Resend as mailer munged previous submission. Also updated comments
to indicate problem is not limited to gcc 5.3.0.)

Adds -Wno-error=trampolines to native CFLAGS prevent multiple compile
errors when using gentoo builf of gcc.

[YOCTO #9201]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 4e80e18..ca73234 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -35,6 +35,10 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile ac_cv_sizeof_off_t=8', '--disable-largefile', d)}"
 
+# ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
+# and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
+CFLAGS_append_class-native = " -Wno-error=trampolines"
+
 do_install_class-native() {
 	install -d ${D}${bindir}
 	install -m 755 grub-mkimage ${D}${bindir}
-- 
2.5.0


