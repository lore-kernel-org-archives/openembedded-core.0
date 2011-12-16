Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbR99-0007xE-DG
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:19:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2011 22:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96863527"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2011 22:12:50 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:12:29 -0800
Message-Id: <44dafadc37f1341ad9e339c348f8d48857c434f8.1324015417.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
References: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1324015417.git.dvhart@linux.intel.com>
References: <cover.1324015417.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/4] grub-efi: Add efi_gop module to payload for physical console support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 06:19:55 -0000

Without the efi_gop module, the GRUB menu would work, but the Linux
kernel messages would not be displayed to the physical console. Adding
efi_gop causes grub to pass the proper information in the boot parameters
pointer such that the Linux kernel can detect and use the EFI framebuffer.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 40e618c..c86cf50 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -60,7 +60,7 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
 do_mkimage() {
 	./grub-mkimage -p / -d ./grub-core/ \
 		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               boot linux fat serial part_msdos normal
+	               boot linux fat serial part_msdos normal efi_gop
 }
 addtask mkimage after do_compile before do_install
 
-- 
1.7.6.4



