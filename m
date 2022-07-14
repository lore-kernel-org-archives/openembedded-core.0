Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689C0C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:29 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.3962.1657773384777808528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2zCXL8fJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so7090863pjl.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qp8B7Y497OWZEtGmtIXX/p7V89x/iFwCpXfllLmTx7Q=;
        b=2zCXL8fJ2io/2uk45VsyNz73K54dKp7ks94umspOrh4Rbf2p00W6Y1kfGYk0gqZ+Ir
         7CnGecIl87iuec8E5J8fcPBA6G/KE6ERcNnjM2ONeA5txHSy8SKzb5bySkbVmxpFuvFD
         H/IX5bGSQRi8uHFqYzQVaSqgW9jO++9DouAdmivl5PXHPdCw6V67dTG33G+qXLvMqdQ9
         MzkLR4rqk6KaoK6Gf8HRW5z+DZcTU3LifhVt24mCONpRRNIAqo/dJhd1Ajd3wD/bs04X
         KcaFU7wHBd/MHC0UoXrOJV/x5QFXNapHPYpG+VdogHFvb6zqpYhuH0C/2OQW/dcxrR3W
         OsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qp8B7Y497OWZEtGmtIXX/p7V89x/iFwCpXfllLmTx7Q=;
        b=ym7B16aMnmK619cshNUk6k3fHskFTZfd84uq4ulCXwQHH9362Hgq890g6bx8gq2kpU
         H6z898DdM2zGUTZQGTjdaEOI/UQyJbhOEmn0W55iAZKBOF78DH/6/ronlj9U0rVV1vUa
         aor1m1zElsKBkkqOp/FzFwlyAarcGE1adM7MHS9sNxQnF1Q21RPEEZKhOfj034rrcoqk
         IHoLK5V7q8BnBO1+7j41JWbQiWZZM2QwP8rW5VAQdp0AiJ9xPQNVhoK+cK4ES8opxcOq
         E9RwQQpyNkyn2YjyQc7lcjpbUrF7Yzm3m2qvYnmjniVZKMxgfh65JnyEF/hrFVnpUV+4
         NnbQ==
X-Gm-Message-State: AJIora/Mrmg3MLuAXNUHgtM/tTCKxLMzuQ+M9jwT5YD+3udKf7wi49X4
	CLDT5WyfovmLTIXAsoDb32LUs8OlPNI6xL4l
X-Google-Smtp-Source: 
 AGRyM1vp/9wLQO9ombPiTp8Zox3+8ohhO+HR5GwG6FBTov+JafYTnmz3mowSLFfEXD++GCPnOWcsqA==
X-Received: by 2002:a17:902:8b87:b0:16c:a263:f6d2 with SMTP id
 ay7-20020a1709028b8700b0016ca263f6d2mr3102795plb.150.1657773383624;
        Wed, 13 Jul 2022 21:36:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/27] u-boot: fix CVE-2022-34835
Date: Wed, 13 Jul 2022 18:35:27 -1000
Message-Id: 
 <21b66e6ffe440d819483899d191ffe9ab70534fd.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168004

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport patch to fix CVE-2022-34835.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ffer-overflow-vulnerability-in-i2c-m.patch | 126 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch b/meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch
new file mode 100644
index 0000000000..04ded5b119
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch
@@ -0,0 +1,126 @@
+From 8f8c04bf1ebbd2f72f1643e7ad9617dafa6e5409 Mon Sep 17 00:00:00 2001
+From: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
+Date: Fri, 10 Jun 2022 14:50:25 +0000
+Subject: [PATCH] i2c: fix stack buffer overflow vulnerability in i2c md
+ command
+
+When running "i2c md 0 0 80000100", the function do_i2c_md parses the
+length into an unsigned int variable named length. The value is then
+moved to a signed variable:
+
+    int nbytes = length;
+    #define DISP_LINE_LEN 16
+    int linebytes = (nbytes > DISP_LINE_LEN) ? DISP_LINE_LEN : nbytes;
+    ret = dm_i2c_read(dev, addr, linebuf, linebytes);
+
+On systems where integers are 32 bits wide, 0x80000100 is a negative
+value to "nbytes > DISP_LINE_LEN" is false and linebytes gets assigned
+0x80000100 instead of 16.
+
+The consequence is that the function which reads from the i2c device
+(dm_i2c_read or i2c_read) is called with a 16-byte stack buffer to fill
+but with a size parameter which is too large. In some cases, this could
+trigger a crash. But with some i2c drivers, such as drivers/i2c/nx_i2c.c
+(used with "nexell,s5pxx18-i2c" bus), the size is actually truncated to
+a 16-bit integer. This is because function i2c_transfer expects an
+unsigned short length. In such a case, an attacker who can control the
+response of an i2c device can overwrite the return address of a function
+and execute arbitrary code through Return-Oriented Programming.
+
+Fix this issue by using unsigned integers types in do_i2c_md. While at
+it, make also alen unsigned, as signed sizes can cause vulnerabilities
+when people forgot to check that they can be negative.
+
+Signed-off-by: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
+Reviewed-by: Heiko Schocher <hs@denx.de>
+
+CVE: CVE-2022-34835
+Upstream-Status: Backport [8f8c04bf1ebbd2f72f1643e7ad9617dafa6e5409]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ cmd/i2c.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/cmd/i2c.c b/cmd/i2c.c
+index 9050b2b8d2..bd04b14024 100644
+--- a/cmd/i2c.c
++++ b/cmd/i2c.c
+@@ -200,10 +200,10 @@ void i2c_init_board(void)
+  *
+  * Returns the address length.
+  */
+-static uint get_alen(char *arg, int default_len)
++static uint get_alen(char *arg, uint default_len)
+ {
+-	int	j;
+-	int	alen;
++	uint	j;
++	uint	alen;
+ 
+ 	alen = default_len;
+ 	for (j = 0; j < 8; j++) {
+@@ -247,7 +247,7 @@ static int do_i2c_read(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	uint	devaddr, length;
+-	int alen;
++	uint	alen;
+ 	u_char  *memaddr;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+@@ -301,7 +301,7 @@ static int do_i2c_write(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	uint	devaddr, length;
+-	int alen;
++	uint	alen;
+ 	u_char  *memaddr;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+@@ -469,8 +469,8 @@ static int do_i2c_md(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	uint	addr, length;
+-	int alen;
+-	int	j, nbytes, linebytes;
++	uint	alen;
++	uint	j, nbytes, linebytes;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+ 	struct udevice *dev;
+@@ -589,9 +589,9 @@ static int do_i2c_mw(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	ulong	addr;
+-	int	alen;
++	uint	alen;
+ 	uchar	byte;
+-	int	count;
++	uint	count;
+ 	int ret;
+ #if CONFIG_IS_ENABLED(DM_I2C)
+ 	struct udevice *dev;
+@@ -676,8 +676,8 @@ static int do_i2c_crc(struct cmd_tbl *cmdtp, int flag, int argc,
+ {
+ 	uint	chip;
+ 	ulong	addr;
+-	int	alen;
+-	int	count;
++	uint	alen;
++	uint	count;
+ 	uchar	byte;
+ 	ulong	crc;
+ 	ulong	err;
+@@ -985,7 +985,7 @@ static int do_i2c_loop(struct cmd_tbl *cmdtp, int flag, int argc,
+ 		       char *const argv[])
+ {
+ 	uint	chip;
+-	int alen;
++	uint	alen;
+ 	uint	addr;
+ 	uint	length;
+ 	u_char	bytes[16];
+-- 
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index 0d2464d74b..f2443723e2 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -3,6 +3,7 @@ require u-boot.inc
 
 SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-riscv-fix-build-with-binutils-2.38.patch \
+                   file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.25.1


