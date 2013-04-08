Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michel.thebeau@windriver.com>) id 1UPIlD-00053M-El
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 22:33:52 +0200
Received: from yow-mthebeau-lx2.wrs.com (yow-mthebeau-lx2.wrs.com
	[128.224.146.159])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r38KFvrl011251;
	Mon, 8 Apr 2013 13:15:59 -0700 (PDT)
From: michel.thebeau@windriver.com
To: richard.purdie@linuxfoundation.org
Date: Mon,  8 Apr 2013 16:15:53 -0400
Message-Id: <1365452153-21650-4-git-send-email-michel.thebeau@windriver.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
References: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
Cc: Bruce.Ashfield@windriver.com, Michel.Thebeau@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: [poky] [PATCH 1/1] routerstationpro: strip the output kernel of .comment section
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 20:33:55 -0000

From: Michel Thebeau <michel.thebeau@windriver.com>

The routerstationpro has a 16mb flash which the kernel image should
fit into.  The default build type for vmlinux then should be a
stripped vmlinux.

Use KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  to do this.

Reverts commit 9cd3816e4db97c8fd093a120a75a2b5d193afcdd, which causes:
RedBoot> load -v vlm-boards/19256/kernel
Using default protocol (TFTP)
Unrecognized image type: 0x0

[YOCTO 3515]
[YOCTO 4220]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
---
 meta-yocto-bsp/conf/machine/routerstationpro.conf |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/routerstationpro.conf b/meta-yocto-bsp/conf/machine/routerstationpro.conf
index a727e2a..723625b 100644
--- a/meta-yocto-bsp/conf/machine/routerstationpro.conf
+++ b/meta-yocto-bsp/conf/machine/routerstationpro.conf
@@ -6,8 +6,9 @@ require conf/machine/include/tune-mips32.inc
 
 MACHINE_FEATURES = "screen keyboard pci usbhost ext2 ext3 serial"
 
-KERNEL_ALT_IMAGETYPE = "vmlinux"
-KERNEL_IMAGETYPE = "vmlinux.bin"
+KERNEL_IMAGETYPE = "vmlinux"
+KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
+KERNEL_IMAGE_STRIP_EXTRA_SECTIONS  = ".comment"
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "3.4%"
-- 
1.7.9.7



