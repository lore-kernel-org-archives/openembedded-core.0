Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbR95-0007x9-5Q
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 07:19:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Dec 2011 22:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="47810835"
Received: from unknown (HELO localhost) ([10.255.15.170])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Dec 2011 22:12:51 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2011 22:12:30 -0800
Message-Id: <61487032f52e7451da5c15ec96f7989c62c251b2.1324015417.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
References: <089ed32e1415e3133606078604acfc20c5423752.1324015417.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1324015417.git.dvhart@linux.intel.com>
References: <cover.1324015417.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/4] grub-efi: specify prefix so it can find grub.cfg
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
X-List-Received-Date: Fri, 16 Dec 2011 06:19:51 -0000

Specify /EFI/BOOT as the grub prefix so the grub efi payload can find
the grub.cfg in the same directory. Ultimately, it might make more sense
to install the grub tools and the grub-core modules to sysroot and make the
grub-efi bbclass generate the image in the required format as part of the
bootimg generation. However, bootimg is currently the only user, so make the
correction here to resolve the immediate issue.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index c86cf50..9183812 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r1"
+PR = "r2"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
@@ -58,7 +58,7 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --target=${GRUB_TARGET} --enable-efiemu=no --program-prefix=''"
 
 do_mkimage() {
-	./grub-mkimage -p / -d ./grub-core/ \
+	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
 		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               boot linux fat serial part_msdos normal efi_gop
 }
-- 
1.7.6.4



