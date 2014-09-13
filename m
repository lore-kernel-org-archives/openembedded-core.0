Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 369DF65D59
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 02:46:04 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id v10so2428804pde.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 19:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=MPl6BJZoCwYdjEFBrSClezIkQBz3s4Fbfm34jm1zgq0=;
	b=NatiEeyoln1WURC4Ph570u8SbeaJJIlIRvo64+JhPnltoOd2kKea+/vmQd1gGQ/Poh
	fXidKRzQmpNQBppVmGPH6/jixp7Q/GoeY7ZKnOGG1WvO9Lx01XeLXDpYhV3tcELiAhHu
	+y3CNLhT/eG/1Mp7g8JXE2WbHITDDE8g4AWLNw82/Oczy/2qHWL2EZVJSaZcpEdTOT5e
	gsPuf4afSFcIuL05XF9OjGlkMwKTdZdlSIVYoSLF2QSyUXM9wURyMLONo2Bk/o6MiU0T
	sBCTvinmbD+x+TXfh3LOGIzicFKpP0E91614B5MfkOEUOptz1qW5udGYC0KJbzv5PA1d
	yI9g==
X-Received: by 10.68.189.137 with SMTP id gi9mr17483059pbc.87.1410576364729;
	Fri, 12 Sep 2014 19:46:04 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id f12sm1133044pdl.94.2014.09.12.19.46.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Sep 2014 19:46:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Sep 2014 19:46:00 -0700
Message-Id: <1410576360-16199-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2] machine: add qemuppc64 machine
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
X-List-Received-Date: Sat, 13 Sep 2014 02:46:06 -0000

override USER_CLASSES as prelink does not work on ppc64

V2:
    use _remove instead of overriding USER_CLASSES
    USER_CLASSES_remove = "image-prelink"
    IMAGE_PREPROCESS_COMMAND_remove = "prelink_image;"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/qemuppc64.conf | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
new file mode 100644
index 0000000..14d5c90
--- /dev/null
+++ b/meta/conf/machine/qemuppc64.conf
@@ -0,0 +1,17 @@
+#@TYPE: Machine
+#@NAME: qemu PPC 64 Emulator setup
+#@DESCRIPTION: Machine configuration for running an PPC system under qemu emulation
+
+require conf/machine/include/qemu.inc
+DEFAULTTUNE ?= "ppc64p6"
+require conf/machine/include/tune-power6.inc
+
+#prelink broken on ppc64
+USER_CLASSES_remove = "image-prelink"
+IMAGE_PREPROCESS_COMMAND_remove = "prelink_image;"
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+IMAGE_FSTYPES = "ext2 ext3"
+
+SERIAL_CONSOLE ?= "ttyS0"
-- 
1.9.1


