Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web09.171.1630174352106874414
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rqaMZOrJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.171, mailfrom: steve@sakoman.com)
Received: by mail-il1-f171.google.com with SMTP id r6so10841549ilt.13
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nHB7gYDfI9uEUosV0IzsC41rObRZQDg2iQPbJXHUR7I=;
        b=rqaMZOrJpVVzD49qkNH3uxnVBZ/aHdTxtG1XHUA3U+n/NbRsJIUeYUzO7hofwbrJQ3
         FPI8nWayYjB+DI8tsPtWETwJeCZQf/0u7VA8MQE4PpdREvcFasnWJdYJWRx6EfL78fon
         87ExjLeWb7JKRcx5Xjy4ffNB0/v7oUvMwis+/dppLoRtJZNvJPmfjGtem8IieFwVniGi
         Qw+oO6kFHi48xI6XjS6irbSzJJpZxt8YXVvhffA6AGtWb4A/MLE/f6BRJBb9iTP4KMLb
         5cgsU01PQzFCoo8iWhfGku3qj33zfGeZfDKQWmyRV+1xzvmTZqBqSfrwa8c06MCKcNgZ
         /XOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nHB7gYDfI9uEUosV0IzsC41rObRZQDg2iQPbJXHUR7I=;
        b=MF+TlKWT0NjVzDP5TF85kUqVZdCxMAnEo3q9vy5pSQ/XYsm0COUX2uTi7rerThmgp9
         Mi+5ySE15se8xggOhc055X4QmUUAkpjAF+RZpDo5fXXRd9sJ2w0um4l0tX+K91P8XZN3
         gqblV6sLId4iwzUfzaUX11JLu9Q6lPJcQyCAIbV2XbXXhmbtK7AFYAmLYiLkYio5K6ic
         bDdgl4nIp2FFi1twZGXzqawAVqsS4zXO7QYvCsDXuIZafhgmU5sr1PoqB4uqEOZt+swi
         uFS/UhYoPLA6jBRrC4DgWihn34TVnFRWRp+W0+mdfh8PDTJGgLtbCnshzzlEyyrwaI93
         1qxQ==
X-Gm-Message-State: AOAM5317vaawIt2qw8MP7JposGo73wXoWQn/nr/W8PbSTlbKaj5RneEH
	H9pPNDaAt19wWNUvpSu/vb255ucbVV49fC2/
X-Google-Smtp-Source: ABdhPJzyHmq0xJ1DHECZeVsEyUTtPEd/xnoWrM6LxrGscYB6lED+HRFgSp/nvQocz82H5SxyMsCtfg==
X-Received: by 2002:a92:d0d1:: with SMTP id y17mr11104462ila.91.1630174351065;
        Sat, 28 Aug 2021 11:12:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:12:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/36] qemu: Security fix CVE-2020-25085
Date: Sat, 28 Aug 2021 08:10:56 -1000
Message-Id: <6b4c58a31ec11e557d40c31f2532985dd53e61eb.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 105773
Type: Security Fix
Disposition: Backport from https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg00733.html
ChangeID: 77c8a9e75b94da3c03c64c95d9e6ab9d45037572
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           | 41 +++++++++--------
 .../qemu/qemu/CVE-2020-25085.patch            | 46 +++++++++++++++++++
 2 files changed, 67 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e25c2524aa..a33008670b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,27 +35,28 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-7039-2.patch \
            file://CVE-2020-7039-3.patch \
            file://0001-Add-enable-disable-udev.patch \
-	   file://CVE-2020-7211.patch \
-	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
+           file://CVE-2020-7211.patch \
+           file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://CVE-2020-11102.patch \
-	   file://CVE-2020-11869.patch \
-	   file://CVE-2020-13361.patch \
-	   file://CVE-2020-10761.patch \
-	   file://CVE-2020-10702.patch \
-	   file://CVE-2020-13659.patch \
-	   file://CVE-2020-13800.patch \
-	   file://CVE-2020-13362.patch \
-	   file://CVE-2020-15863.patch \
-	   file://CVE-2020-14364.patch \
-	   file://CVE-2020-14415.patch \
-	   file://CVE-2020-16092.patch \
-	   file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
-	   file://CVE-2019-20175.patch \
-	   file://CVE-2020-24352.patch \
-	   file://CVE-2020-25723.patch \
-	   file://CVE-2021-20203.patch \
-	   file://CVE-2021-3392.patch \
-	   "
+           file://CVE-2020-11869.patch \
+           file://CVE-2020-13361.patch \
+           file://CVE-2020-10761.patch \
+           file://CVE-2020-10702.patch \
+           file://CVE-2020-13659.patch \
+           file://CVE-2020-13800.patch \
+           file://CVE-2020-13362.patch \
+           file://CVE-2020-15863.patch \
+           file://CVE-2020-14364.patch \
+           file://CVE-2020-14415.patch \
+           file://CVE-2020-16092.patch \
+           file://0001-target-mips-Increase-number-of-TLB-entries-on-the-34.patch \
+           file://CVE-2019-20175.patch \
+           file://CVE-2020-24352.patch \
+           file://CVE-2020-25723.patch \
+           file://CVE-2021-20203.patch \
+           file://CVE-2021-3392.patch \
+           file://CVE-2020-25085.patch \
+           "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI[md5sum] = "278eeb294e4b497e79af7a57e660cb9a"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
new file mode 100644
index 0000000000..be19256cef
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-25085.patch
@@ -0,0 +1,46 @@
+From dfba99f17feb6d4a129da19d38df1bcd8579d1c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Tue, 1 Sep 2020 15:22:06 +0200
+Subject: [PATCH] hw/sd/sdhci: Fix DMA Transfer Block Size field
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The 'Transfer Block Size' field is 12-bit wide.
+
+See section '2.2.2. Block Size Register (Offset 004h)' in datasheet.
+
+Two different bug reproducer available:
+- https://bugs.launchpad.net/qemu/+bug/1892960
+- https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Fsdhci_oob_write1
+
+Cc: qemu-stable@nongnu.org
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Fixes: d7dfca0807a ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20200901140411.112150-3-f4bug@amsat.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-25085
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/sd/sdhci.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-4.2.0/hw/sd/sdhci.c
+===================================================================
+--- qemu-4.2.0.orig/hw/sd/sdhci.c
++++ qemu-4.2.0/hw/sd/sdhci.c
+@@ -1129,7 +1129,7 @@ sdhci_write(void *opaque, hwaddr offset,
+         break;
+     case SDHC_BLKSIZE:
+         if (!TRANSFERRING_DATA(s->prnsts)) {
+-            MASKED_WRITE(s->blksize, mask, value);
++            MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+         }
+ 
-- 
2.25.1

