Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1646AE37
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 22:20:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9UMK2c1001848
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 15:20:03 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 30 Oct 2013 15:20:02 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 17:19:21 -0500
Message-ID: <1383171561-21786-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] syslinux.bbclass: Fix default serial port string
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
X-List-Received-Date: Wed, 30 Oct 2013 22:20:02 -0000
Content-Type: text/plain

The default value of SYSLINUX_SERIAL_TTY is not correct.

It should be console=ttyS0,115200 else the boot string generated in
the syslinux menus for the serial choice is not correct.  The kernel
boot parameters will get set to:

/vmlinuz initrd=/initrd LABEL=boot root=/dev/ram0 ttyS0,115200

Note that the above is missing the "console="

The default value will now work the same as the value found in
grub-efi.bbclass.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/syslinux.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 944bd92..2a5b766 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -27,7 +27,7 @@ SYSLINUXDIR = "/"
 # a console=...some_tty...
 SYSLINUX_DEFAULT_CONSOLE ?= ""
 SYSLINUX_SERIAL ?= "0 115200"
-SYSLINUX_SERIAL_TTY ?= "ttyS0,115200"
+SYSLINUX_SERIAL_TTY ?= "console=ttyS0,115200"
 ISO_BOOTIMG = "isolinux/isolinux.bin"
 ISO_BOOTCAT = "isolinux/boot.cat"
 MKISOFS_OPTIONS = "-no-emul-boot -boot-load-size 4 -boot-info-table"
-- 
1.7.9.5


