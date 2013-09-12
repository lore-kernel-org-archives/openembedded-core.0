Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF8DF6C00E
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:20:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8CHK4Qo022837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 10:20:04 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 12 Sep 2013 10:20:04 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 12:19:45 -0500
Message-ID: <1379006387-20186-4-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
References: <1379006387-20186-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 3/5] grub-efi-native: Add support for EFI ISO images
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
X-List-Received-Date: Thu, 12 Sep 2013 17:20:03 -0000
Content-Type: text/plain

The iso9660 file system support needs to be added to grub in order to
be able to correctly find the grub.cfg.  The grub commands to locate
the grub.cfg also needs to be encoded into grub's default
configuration.

This change allows the resulting grub binary to work both in the hard
drive / USB boot case or the optical media boot case.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 2d3d68a..3cff838 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -66,9 +66,13 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
 do_mkimage() {
-	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
+	# Search for the grub.cfg on the local boot media with built in config file
+	echo 'search.file /EFI/BOOT/grub.cfg root' > cfg
+	echo 'set prefix=($root)/EFI/BOOT' >> cfg
+
+	./grub-mkimage -c cfg -p /EFI/BOOT -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop
+	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
 }
 addtask mkimage after do_compile before do_install
 
-- 
1.7.9.5


