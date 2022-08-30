Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BE9ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 19:01:06 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.15833.1661886056826169163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B9iNYkjf;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id cu2so24150758ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 12:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=BFNiCiQbR4TM6ae2gp/Sx6J7rD6yY9NdaQkImSomKMs=;
        b=B9iNYkjfD+/xNXZGvWvgdaLqy5ti/d7BwfF14TRKT4QCacALlExsv6sl+rivrTuPOi
         iuSzfhZOE+Gm6IS9b14WLLsnHS1zwMs+VgyM7SvU+Zbi46e1oNFNqj33TEtwiLDIsxk5
         CxwlGYyfQzBbyT3m22IS5T9L9QvuHPl1myRkp19q3LNdCYRegAu7sXbJK9S7G3tCWcGF
         Fek6uy+V0Aa2G/QPf+m/xhOIx5iVD41SfttJzpdpBTomD0qOm6AGJuUHU9uHOE812R+I
         NGFclq4U8dgUKufsihkQAvjcIra76XXaGtGaOBybs/1pSmm2SF7bQ3rPEuXRQzVE43E+
         8aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=BFNiCiQbR4TM6ae2gp/Sx6J7rD6yY9NdaQkImSomKMs=;
        b=pM09ZDf30m1cXV9XVXpBDtOqd5plYW/EmpfbLgrtzKDsfBgV/2/0pbO/t1RA8rLf6T
         wO0bsPE/m5Sv9rTAFInWMvuZ+3mIz0er7YlaxdeqPJ6AUrXne7OCPwZnGqAd1BtEo3f0
         veb5YElKCSeJnBr1AqHt1dTw4+dfFQQwQyODLYL8vczKt6TwMJ691Ms7hKHbUZDjgTy6
         oQ+XoTrWqY1wvvo8BfVy3Vudi1L7X3d74m1FTCLzCK8k5/Y5WZ8s/LT3b0fhpS0KQivn
         zTshTEeWkkfoV+3duusw52BCb5/cpXkHdZdy9NUg4WUdz+SdHPG7qGyA9mVUPV0l+bNb
         7HSg==
X-Gm-Message-State: ACgBeo26fNrQdc6uNb/YIkQ1ZgktDzZoGH7z0WxSWy/2PXHCZezhi+tu
	B4wPz+KyeR/d2DhoC1aL8bRpDusuUmig2Q==
X-Google-Smtp-Source: 
 AA6agR7cBR+R/Ergn1mdpFRx08nzybP9Ulxe2wxl7VumDdnZT0lfykuixwrgX3P/q53vvzNESYneXw==
X-Received: by 2002:a17:906:9be4:b0:741:480a:387a with SMTP id
 de36-20020a1709069be400b00741480a387amr11397501ejc.147.1661886054599;
        Tue, 30 Aug 2022 12:00:54 -0700 (PDT)
Received: from localhost.localdomain (ip5b41135b.dynamic.kabel-deutschland.de.
 [91.65.19.91])
        by smtp.gmail.com with ESMTPSA id
 w17-20020aa7dcd1000000b004479df2ff82sm7808398edu.51.2022.08.30.12.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 12:00:54 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCHv2] u-boot: fix CVE-2022-34835
Date: Tue, 30 Aug 2022 21:00:39 +0200
Message-Id: <20220830190039.48510-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 19:01:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170084

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
index 0000000000..9d69828c98
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2022-34835.patch
@@ -0,0 +1,124 @@
+From 26cb16c9d8b5ee3730474ae67ebd14eb4b30e0c6 Mon Sep 17 00:00:00 2001
+From: Nicolas Iooss <nicolas.iooss+uboot@ledger.fr>
+Date: Tue, 30 Aug 2022 20:48:54 +0200
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
+index 43a76299b3..c54b88a1d8 100644
+--- a/cmd/i2c.c
++++ b/cmd/i2c.c
+@@ -246,10 +246,10 @@ int i2c_set_bus_speed(unsigned int speed)
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
+@@ -292,7 +292,7 @@ static int do_i2c_read ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
+ {
+ 	uint	chip;
+ 	uint	devaddr, length;
+-	int alen;
++	uint alen;
+ 	u_char  *memaddr;
+ 	int ret;
+ #ifdef CONFIG_DM_I2C
+@@ -345,7 +345,7 @@ static int do_i2c_write(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[
+ {
+ 	uint	chip;
+ 	uint	devaddr, length;
+-	int alen;
++	uint alen;
+ 	u_char  *memaddr;
+ 	int ret;
+ #ifdef CONFIG_DM_I2C
+@@ -511,8 +511,8 @@ static int do_i2c_md ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
+ {
+ 	uint	chip;
+ 	uint	addr, length;
+-	int alen;
+-	int	j, nbytes, linebytes;
++	uint alen;
++	uint	j, nbytes, linebytes;
+ 	int ret;
+ #ifdef CONFIG_DM_I2C
+ 	struct udevice *dev;
+@@ -630,9 +630,9 @@ static int do_i2c_mw ( cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
+ {
+ 	uint	chip;
+ 	ulong	addr;
+-	int	alen;
++	uint	alen;
+ 	uchar	byte;
+-	int	count;
++	uint	count;
+ 	int ret;
+ #ifdef CONFIG_DM_I2C
+ 	struct udevice *dev;
+@@ -716,8 +716,8 @@ static int do_i2c_crc (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[]
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
+@@ -1023,7 +1023,7 @@ static int do_i2c_probe (cmd_tbl_t *cmdtp, int flag, int argc, char * const argv
+ static int do_i2c_loop(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
+ {
+ 	uint	chip;
+-	int alen;
++	uint    alen;
+ 	uint	addr;
+ 	uint	length;
+ 	u_char	bytes[16];
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


