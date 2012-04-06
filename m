Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SGFyf-0007W1-Tf
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 22:41:50 +0200
Received: by mail-pb0-f47.google.com with SMTP id um15so2434215pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 13:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=0n+DpJRAtZk+vwVmQPZ5bqUEzZdGpnP7xliqyw6tp9Y=;
	b=mvk1mCn1X/lIAnSxhQtJWB+BE62zXklzhRHMuEZAzdOHp3EKJCLGVE7TscjRASw6GE
	ozIeA8JBwV7nWBvHb8Jvg2Dm8r0NhJpx2zFnmnL7JBNCF9gU8mvE6Jzy7AmDCRr+nxxP
	qBI9oFAR8Wm7kP8yGwtDT9g2nYNh0gq0pAwCCyRcpqLoOhg1rJk6nmXpbPDVaZk+WYuU
	AOPm1nKYfDNARvz1Ox3gjUJac/xemp9S+P79xKTIzl/BVZ8l3t2JSAguT2vtbM5jE15z
	GyGtheF/VBe2QCEwSjrzjNHN6K+HeUEJuLJo4z2b8tZE3ILHtajN5b7D46p/MHNyQhR4
	C/1g==
Received: by 10.68.197.65 with SMTP id is1mr18381506pbc.70.1333744357475;
	Fri, 06 Apr 2012 13:32:37 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id t5sm7142378pbm.64.2012.04.06.13.32.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Apr 2012 13:32:36 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2012 13:32:34 -0700
Message-Id: <867a4b3a4bf7d2256c77acc10b4d4e142e53f13b.1333744298.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333744298.git.dvhart@linux.intel.com>
References: <cover.1333744298.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQn5RhrFvdfKjsRNfUVHWsxZHfe9XY/6r+jwkKZtiwxvOOQNT2WbdgSZvGfFZ/htpLQDJYvw
Cc: Darren Hart <dvhart@linux.intel.com>, Rahul Saxena <rahul.saxena@intel.com>
Subject: [PATCH 1/1] grub-efi: Include GPT partition EXT FS support
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
X-List-Received-Date: Fri, 06 Apr 2012 20:41:50 -0000

Fixes [YOCTO 2257]

GPT partitions are common for EFI systems. Add support for them by
including the part_gpt partition module in the grub-efi image. In
order to allow for loading a Linux kernel from an EXT* filesystem,
include the ext2 module as well.

With this fix applied, I was able to boot from a USB key using a
GPT partition table with the following layout:

  $ sudo gdisk -l /dev/sdc
  GPT fdisk (gdisk) version 0.8.2

  Partition table scan:
    MBR: protective
    BSD: not present
    APM: not present
    GPT: present

  Found valid GPT with protective MBR; using GPT.
  Disk /dev/sdc: 7669824 sectors, 3.7 GiB
  Logical sector size: 512 bytes
  Disk identifier (GUID): 68FA7CD4-E0C3-4A8E-82B5-1331C9B17A3C
  Partition table holds up to 128 entries
  First usable sector is 34, last usable sector is 7669790
  Partitions will be aligned on 2-sector boundaries
  Total free space is 7428816 sectors (3.5 GiB)

  Number  Start (sector)    End (sector)  Size       Code  Name
     1              34           32801   16.0 MiB    0700      # FAT16
     2           32802          240974   101.6 MiB   0700      # EXT3

From within GRUB, booted as bootia32.efi from the BOOT partition, I
booted the OS with the following commands:

  grub> linux (hd0,gpt2)/vmlinuz rootwait root=/dev/sda2 console=ttyS0,115200
  grub> boot

This change will enable BSP developers to use the grub-efi image in
their own images as well as enable upcoming changes to the installer
to support EFI.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Kishore Bodke <kishore.k.bodke@intel.com>
CC: Rahul Saxena <rahul.saxena@intel.com>
---
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index c951152..93e9290 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r5"
+PR = "r6"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
@@ -61,7 +61,7 @@ EXTRA_OECONF = "--with-platform=efi --disable-grub-mkfont \
 do_mkimage() {
 	./grub-mkimage -p /EFI/BOOT -d ./grub-core/ \
 		       -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
-	               boot linux fat serial part_msdos normal efi_gop
+	               boot linux ext2 fat serial part_msdos part_gpt normal efi_gop
 }
 addtask mkimage after do_compile before do_install
 
-- 
1.7.5.4



