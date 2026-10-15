Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B895FCCA466
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:09 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8000.1792098305861407390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 14:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dv8a4VK1;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-354ba08cfd1so9575796eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 14:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792098305; x=1792703105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qiZg8eX+ycO6+Ox7jKhtcWmZ8VZ9sH00ipM8dCoD94=;
        b=dv8a4VK15MVT0nZNI998nH8rkk6mIiKstsBKcJlDNADLXnw2/evcO79pgUPn4rY4Z1
         rPoIWeIwZiAbYiuYCP9pXFpoacwcHWGYY4aFAYJTCTyGGJBnhVkqvtkowqeo2BPSiUW1
         dz2p0O/pRI01bg4FbN3TFilqayIh3t63bv5z2NdgD25hnz68V59hJA9ukEcI4tOWTPIU
         H9lUZi3HVmetyHJWpyqXo66bCLfcmCnZMa6u2s+6e4jL6NjFAQVUwsWBAtZ01E+eP2Vb
         v6EXebjmWPECUhUv51n/mhWyqsvfE9OOagDhaic1fmYig+EPwic2znHeUxDfrOiMAEKI
         0ERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098305; x=1792703105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qiZg8eX+ycO6+Ox7jKhtcWmZ8VZ9sH00ipM8dCoD94=;
        b=fDkCPryCK6yviQ0imsiKHZ8Fs5hCmU8dIfR5vtIdi21ZMPHSGO/cdkkO5NV/3wvU+8
         ZJPChSzC9LGA5YjXiaqkjkU5ORdvB0JzaAt1wa3+kDoH2N4AXhZaB3IJ6dUQ57CZkGRi
         9MtPlZQEgzhJY3C+NU8tTChJoZqmrCGroP4k4UeKGMfm7KwiEa3CKhF8fEO5Eu9jSwYL
         g62W8pWgwCY4OpewWKrqjieE7rthmb/1bip9Z+AIB7xLPjnrW55Zn/TFQVgMjIbAP3HL
         nNOMA3dzCfnhOKQXp2fjI76uzutv4iTvHqxNyqg1+KN/wWyEBmcFXJ6XtBsHYkxhrRgI
         ZTZA==
X-Gm-Message-State: AFq9FYLa/m1N9VFXPndTuHfKmocR/7o8zeRr4hY9nL3fR6pg6kdXqNXU
	muCTNJImT5+MsLgFFW1XlBNr953gEH9SVdHd+4WzoYhdx3QWS8xDh1BFtucQkeiD1LM=
X-Gm-Gg: AYBFou1Q+OEDNTyz2aqtzhsr/FB9rHlNdB9O6FvauATALBj2xuaaY+quU4li5HUluLA
	jTyVbKk2vo4tJJnqz6ITP892SwDzyG0gm3jQ0JEA1mVmFRsoFUbgCXg8I4rDwFW669+u36/eyXW
	q5Q06GbxbcyFd63ATlZ5WG6+yniiuBvbXHGrbo8hWSxPHee9/K6b49/I81RpJ3qvDCMxWXoM17F
	Hrrc/bv0//Cx0p2ykqrNM2C/ciraknmQM/Q6cvTDNQtdJiJBUyIiv5EgWPoF/sufMvsBK8BCbDl
	jkl9VSTgFBrazb2Jiq6fR4wezHUDf2oXr8glBbogtmahcyCkTEpemp/TDP9DjXnWZ7USsIN1Oq7
	lUH0zmLed7P9WvKDSKhRv0S3O50cwgpyGbspJGo72/uAyk/8WG19qmtz+qed35G3FdPEu/BE9k2
	Xb1jjL4qlSLeZcM2Rv76uHaShp0jHHfATt7eJ1AqrH4ArKisjwV6H2wuVmRbWzJ9MYfG9znJFM0
	xWaC9IKCDmC9vp5JROLiaWTGBfkpjyE7jMDNtCH4OImWaJk6MEe226eq89uyIyg1sNkGuPJaaSj
	dqmpUhv+oywhS6VtWT0hL6DEkXEI2rN7IXU9JDMlGVqKye+KImg9OvJMmQx7Xu+wtqy6Ro4DlKm
	pxUVyIZ4QN7MihFupcyQNE49pNefb6f+OM+ZMZMQkWYI6/SPNpPYLa3fyIvEnk/pakoOWJ7B1Ul
	h3q88YDeUnkbFvj2BZXK0dLwXI0wBB6wSBnFXHHVVcuc1uWA==
X-Received: by 2002:a05:7300:d084:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-35d8c3a3c06mr8888051eec.39.1792098304685;
        Thu, 15 Oct 2026 14:05:04 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm528036eec.14.2026.10.15.14.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 14:05:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] opensbi: Fix build with clang 23
Date: Thu, 15 Oct 2026 14:05:00 -0700
Message-ID: <20261015210500.2749924-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 21:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247897

Clang 23 adds -Wunused-but-set-global, enabled by -Wall, which
flags file-static globals in the sifive and cadence UART drivers
that are written but never read. opensbi builds with -Werror, so
the compile fails. Add a patch, submitted upstream, removing the dead
variables.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-Remove-unused-baudrate-frequency-gl.patch | 67 +++++++++++++++++++
 meta/recipes-bsp/opensbi/opensbi_1.9.bb       |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch

diff --git a/meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch b/meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch
new file mode 100644
index 0000000000..b62c7c5b57
--- /dev/null
+++ b/meta/recipes-bsp/opensbi/files/0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch
@@ -0,0 +1,67 @@
+From b2b51e3de12703caad6fbb624d711d411ac0aae4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Oct 2026 13:26:30 -0700
+Subject: [PATCH] lib: utils/serial: Remove unused baudrate/frequency globals
+
+The sifive-uart and cadence-uart drivers store the input clock
+frequency and baudrate into file-static globals during init, but
+never read them back; the divisor is computed directly from the
+function arguments. Clang 23 adds -Wunused-but-set-global, which is
+enabled by -Wall, so the build fails with -Werror:
+
+  sifive-uart.c:34:12: error: variable 'uart_in_freq' set but not used [-Werror,-Wunused-but-set-global]
+  sifive-uart.c:35:12: error: variable 'uart_baudrate' set but not used [-Werror,-Wunused-but-set-global]
+
+Drop the dead variables.
+
+Upstream-Status: Submitted [https://lore.kernel.org/opensbi/20261015203610.835320-1-khem.raj@oss.qualcomm.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/utils/serial/cadence-uart.c | 4 ----
+ lib/utils/serial/sifive-uart.c  | 4 ----
+ 2 files changed, 8 deletions(-)
+
+diff --git a/lib/utils/serial/cadence-uart.c b/lib/utils/serial/cadence-uart.c
+index 30fbb95..80dc429 100644
+--- a/lib/utils/serial/cadence-uart.c
++++ b/lib/utils/serial/cadence-uart.c
+@@ -39,8 +39,6 @@
+ /* clang-format on */
+ 
+ static volatile void *uart_base;
+-static u32 uart_in_freq;
+-static u32 uart_baudrate;
+ 
+ /*
+  * Find minimum divisor divides in_freq to max_target_hz;
+@@ -95,8 +93,6 @@ static struct sbi_console_device cadence_console = {
+ int cadence_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
+ {
+ 	uart_base     = (volatile void *)base;
+-	uart_in_freq  = in_freq;
+-	uart_baudrate = baudrate;
+ 
+ 	/* Disable interrupts */
+ 	set_reg(UART_REG_IDR, 0xFFFFFFFF);
+diff --git a/lib/utils/serial/sifive-uart.c b/lib/utils/serial/sifive-uart.c
+index 5563713..235976e 100644
+--- a/lib/utils/serial/sifive-uart.c
++++ b/lib/utils/serial/sifive-uart.c
+@@ -31,8 +31,6 @@
+ /* clang-format on */
+ 
+ static volatile char *uart_base;
+-static u32 uart_in_freq;
+-static u32 uart_baudrate;
+ 
+ /**
+  * Find minimum divisor divides in_freq to max_target_hz;
+@@ -94,8 +92,6 @@ static struct sbi_console_device sifive_console = {
+ int sifive_uart_init(unsigned long base, u32 in_freq, u32 baudrate)
+ {
+ 	uart_base     = (volatile char *)base;
+-	uart_in_freq  = in_freq;
+-	uart_baudrate = baudrate;
+ 
+ 	/* Configure baudrate */
+ 	if (in_freq && baudrate)
diff --git a/meta/recipes-bsp/opensbi/opensbi_1.9.bb b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
index 954753d97e..96167f7c73 100644
--- a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
@@ -12,6 +12,7 @@ SRCREV = "cbf9f6734dd85a982c63e3cb5db7ffe09da839ca"
 SRC_URI = " \
             git://github.com/riscv/opensbi.git;branch=master;protocol=https;tag=v${PV} \
             file://0001-Makefile-don-t-grep-when-setting-CC_SUPPORT_ZICSR_ZI.patch \
+            file://0002-lib-utils-serial-Remove-unused-baudrate-frequency-gl.patch \
             "
 
 TARGET_DBGSRC_DIR = "/share/opensbi/*/generic/firmware/"

