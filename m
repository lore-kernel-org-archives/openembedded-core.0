Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C83BB719ED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 11:25:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 02 Dec 2016 03:25:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,729,1477983600"; d="scan'208";a="1093624466"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 02 Dec 2016 03:25:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2016 13:25:17 +0200
Message-Id: <20161202112517.12078-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] grub-efi: enforce no-pie for the native build
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
X-List-Received-Date: Fri, 02 Dec 2016 11:25:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi_2.00.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 5a0dc95..9aab813 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -37,7 +37,9 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-
 
 # ldm.c:114:7: error: trampoline generated for nested function 'hook' [-Werror=trampolines]
 # and many other places in the grub code when compiled with some native gcc compilers (specifically, gentoo)
-CFLAGS_append_class-native = " -Wno-error=trampolines"
+#
+# Add a -no-pie as recent (2 Dec 2016) Debian testing seems to default to pie enabled
+CFLAGS_append_class-native = " -Wno-error=trampolines -no-pie"
 
 do_install_class-native() {
 	install -d ${D}${bindir}
-- 
2.10.2


