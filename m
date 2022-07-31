Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99F7CC00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 11:05:50 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.12081.1659265544250540219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 04:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kihSa5gw;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id w7so8095946ply.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 04:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=yxpoNNShoM+plntjA6Y2GXg+hAkNQOgo2mVnImSSn9I=;
        b=kihSa5gwv2hOHnrzZQuUNy4FL31J8zcob84z7j0GGo5xrJYGhzL2zdbevJcVkd7Z9v
         FGKHQCA9Eq6R4zu9HEvCNlJYu13PKtFDj6HrTqKfoE5YbaQng0hMyyPtCmry5g3A49bL
         8UpOfosXqFFDUEpSoP7diZHABJppFlfJgBnvhHqgvJlp8EGhUHnDgnxfJCofR8c8HD5L
         nObmrEePAprW5O4r/SlZ5fp1syYPVgduCTR+bpHI2XILZHZoOT+uUrWv5UCFFhEQ4n03
         OvvXyPgtx4RcDZTuzp3nE80G0ZQ5Y29maexhC6y/owzoq3lDD4K3bv9OfAVSsRGA37wD
         MrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=yxpoNNShoM+plntjA6Y2GXg+hAkNQOgo2mVnImSSn9I=;
        b=zXVK6UTKCCbF/762B+sNXhyUC37ZDHj6EhIXJiSQBNXzInbQhRe0hNvFkxU3k3rlxJ
         ZH7Z8mqpyxVHtCQThc348K4wrcKnlx/0rg4XvBKc4n1oOL5agFSAk715uEDSS+9Q0yGN
         Ubq/aXTtlb6vli74p1yhu8X2+/DQzD990557Rxw8duZwIovqe3ZwxXIoT09Tt+dNiwqB
         Q9jACBeoOt+nN4M57xVIjtO2u8HUq6VMbys6zt7i1RRfuX6NGxu8QRVIGRCg2SAWIRTY
         TxSDFhNQiYm2Ij8If88iaZHblgRi6OttsU1b8RTcs5wCVftO8DJLh4u9IgguK2zqhMkF
         KLHA==
X-Gm-Message-State: ACgBeo168oBauJ+b9NtAiYlyjscRjBQo431JteqLbrgo/c6itJ50Dcp5
	AOAHJspil+xDoE6uRL1NL3HTTnLd7sarnA==
X-Google-Smtp-Source: 
 AA6agR4F5NN/nsK284/88tvDtQ9iK2U8bV0zSwWtYgiOPusqxXwOS8omgJjPpgKtQWuhhA2ft4eTUg==
X-Received: by 2002:a17:903:11d1:b0:16c:defc:a098 with SMTP id
 q17-20020a17090311d100b0016cdefca098mr11844090plh.50.1659265543267;
        Sun, 31 Jul 2022 04:05:43 -0700 (PDT)
Received: from localhost.localdomain ([117.111.17.45])
        by smtp.gmail.com with ESMTPSA id
 b12-20020a17090a550c00b001f2fbf2c42esm6497172pji.26.2022.07.31.04.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 04:05:42 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] u-boot: fix CVE-2022-34835
Date: Sun, 31 Jul 2022 13:01:27 +0200
Message-Id: <20220731110127.15278-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Jul 2022 11:05:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168684

i2c: fix stack buffer overflow vulnerability in i2c md command

CVE: CVE-2022-34835

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../u-boot/files/CVE-2022-34835.patch         | 124 ++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2020.01.bb     |   4 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch b/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch
new file mode 100644
index 0000000000..f1c1a91dcf
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch
@@ -0,0 +1,124 @@
+From 19cc75158388ec7e09e0d2bd7a2866d08974d059 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/8f8c04bf1ebbd2f72f1643e7ad9617dafa6e5409]
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
+---
+ cmd/i2c.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/cmd/i2c.c b/cmd/i2c.c
+index 43a76299b3..f239d3f336 100644
+--- a/cmd/i2c.c
++++ b/cmd/i2c.c
+@@ -246,10 +246,10 @@ int i2c_set_bus_speed(unsigned int speed)
+  *
+  * Returns the address length.
+  */
+-static uint get_alen(char *arg, int default_len)
++static uint get_alen(char *arg, uint default_len)
+ {
+-      int     j;
+-      int     alen;
++      uint    j;
++      uint    alen;
+
+       alen = default_len;
+       for (j = 0; j < 8; j++) {
+@@ -292,7 +292,7 @@ static int do_i2c_read ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
+ {
+       uint    chip;
+       uint    devaddr, length;
+-      int alen;
++      uint    alen;
+       u_char  *memaddr;
+       int ret;
+ #ifdef CONFIG_DM_I2C
+@@ -345,7 +345,7 @@ static int do_i2c_write(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[
+ {
+       uint    chip;
+       uint    devaddr, length;
+-      int alen;
++      uint    alen;
+       u_char  *memaddr;
+       int ret;
+ #ifdef CONFIG_DM_I2C
+@@ -511,8 +511,8 @@ static int do_i2c_md ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
+ {
+       uint    chip;
+       uint    addr, length;
+-      int alen;
+-      int     j, nbytes, linebytes;
++      uint    alen;
++      uint    j, nbytes, linebytes;
+       int ret;
+ #ifdef CONFIG_DM_I2C
+       struct udevice *dev;
+@@ -630,9 +630,9 @@ static int do_i2c_mw ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
+ {
+       uint    chip;
+       ulong   addr;
+-      int     alen;
++      uint    alen;
+       uchar   byte;
+-      int     count;
++      uint    count;
+       int ret;
+ #ifdef CONFIG_DM_I2C
+       struct udevice *dev;
+@@ -716,8 +716,8 @@ static int do_i2c_crc (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
+ {
+       uint    chip;
+       ulong   addr;
+-      int     alen;
+-      int     count;
++      uint    alen;
++      uint    count;
+       uchar   byte;
+       ulong   crc;
+       ulong   err;
+@@ -1023,7 +1023,7 @@ static int do_i2c_probe (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
+ static int do_i2c_loop(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
+ {
+       uint    chip;
+-      int alen;
++      uint    alen;
+       uint    addr;
+       uint    length;
+       u_char  bytes[16];
+--
+2.25.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
index 02d67c0db2..16e2340bb6 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2020.01.bb
@@ -2,3 +2,7 @@ require u-boot-common.inc
 require u-boot.inc
 
 DEPENDS += "bc-native dtc-native"
+
+SRC_URI_append = " \
+    file://CVE-2022-34835.patch \
+"
-- 
2.25.1


