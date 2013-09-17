Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 743746C7FB
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:32:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8HDWTlb006691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 06:32:29 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 06:32:29 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Tue, 17 Sep 2013 08:32:12 -0500
Message-ID: <1379424738-16798-4-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
References: <1379424738-16798-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [v3 PATCH 3/9] grub-efi-native: Add support for EFI ISO images
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
X-List-Received-Date: Tue, 17 Sep 2013 13:32:27 -0000
Content-Type: text/plain

The iso9660 file system support needs to be added to grub in order to
be able to correctly find the grub.cfg.  The grub commands to locate
the grub.cfg also needs to be encoded into grub's default
configuration.

This change allows the resulting grub binary to work both in the hard
drive / USB boot case or the optical media boot case.

[YOCTO #4100]

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-bsp/grub/files/cfg               |    2 ++
 meta/recipes-bsp/grub/grub-efi-native_2.00.bb |    7 +++++--
 2 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/cfg

diff --git a/meta/recipes-bsp/grub/files/cfg b/meta/recipes-bsp/grub/files/cfg
new file mode 100644
index 0000000..ffffe47
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/cfg
@@ -0,0 +1,2 @@
+search.file /EFI/BOOT/grub.cfg root
+set prefix=($root)/EFI/BOOT
diff --git a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 2d3d68a..04973b5 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -23,6 +23,7 @@ PR = "r2"
 PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
+           file://cfg \
            file://grub-2.00-fpmath-sse-387-fix.patch \
            file://grub-2.00-fix-enable_execute_stack-check.patch \
            file://grub-2.00-disable-help2man.patch \
@@ -66,9 +67,11 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
 do_mkimage() {
-	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
+	# Search for the grub.cfg on the local boot media by using the
+	# built in cfg file provided via this recipe
+	./grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop
+	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search
 }
 addtask mkimage after do_compile before do_install
 
-- 
1.7.9.5


