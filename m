Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BB0EEF33A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 08:56:01 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39959.1772700953048778018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 00:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qAZ4iY1j;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4327790c4e9so5966286f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772700951; x=1773305751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYoNDMjelospYlbKoZqhkBVyOEU0ikkLfF8ZJ9JjW+U=;
        b=qAZ4iY1jCHWjl4bqfumZA92VWEJmqJQM3QNPEA5FtWrcHHXU8tgrP+druED1puGmIc
         /yzUjiySzdkC4ANdCSrFMNGJjRFQqlqD78A2LtHrlyW1EKKAmyABin/kUUkivbHidI9D
         X54WkqCDYctkSrEaLaYKVQYvzhM54qbJPmIGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772700951; x=1773305751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYoNDMjelospYlbKoZqhkBVyOEU0ikkLfF8ZJ9JjW+U=;
        b=GBpgSnpxMZL2QQVJCSkLVjkdgXY0jQF/KV2ouMLGz+/S9M+XP93LiI6Na+3+LUQ9Uu
         AnaCl8qSdUYRYriZxAK7unEcH3SYcLGmzez8GgnEegwinWVcG/s80dWpYkcQTwhYLK2d
         rVqXouj7mkYm+9XGSO5MgXmr+G8mqBeBSF7l1I9owMfc67YlCJ7pPBHB1djFjeKjxLCC
         SHuicz4mFwUAkpi0uj5WrCU+WTzIBHMC0XYs2/ryeEQ0ZWDY3rS9ONhsn6AIqc7dVQwf
         2kHi1lBDI5LRwlpMujvHRREkSSA2JFy6xQXvyR0TcA3/p5pnVz39o/+gyo+XXurhuKFf
         v7nQ==
X-Gm-Message-State: AOJu0YxIuXqk7Uw+AxHOudDERvIQvjZmC1P8RwkoTwoJUTpT5fuBfUk9
	OoDdt3DAT6H4tl1RzDjPZt+MKwAYoFX/ngKnvTvqUXlbMbUI0JxamNG4yz1ux5PufjljEa201NF
	/wmaI
X-Gm-Gg: ATEYQzyqQUd0AjZldcFxn73w9qrfXa7dioMh9yvAz5BlbAao3ywxKy7ZgjoeLa/04/8
	6yFqrRJxhHSIpRFWP5KbLG+2HgC1wgORiMwafjq4ncxxD74S5tqPQ5e2Q8kARCL3e+Nr6i9BUSV
	k1YrwkdX0PNdyo1yLlVGPYB4lBDyt5oK0U2639D2HA0gO6VdbwuHxDBXLH6VIuJYyt9triB8i7f
	LBuJSl8VdmZSKYEW3AvrVPWknLsDJ7dXikP/dJNVqgIvjBJhToV9KQKu/Cx4SyTjeNBVTOCp7Pe
	JdkjVyAZjsbBhZrlaNpnM5gxvP5DTC/Qj9ON9uk84Sm4rd9FmcZWEDOmWVdJSk+pKCuVVJBi4j/
	2FaszrYZKhLZbupjIbgPzErOkutW2vWCDY50IW2da923b3GQv6Zs7oWA+QXAw+rMI4pf8Eywdbo
	qpqHuAtnmaq76fGWkkNk324s0vZ8fGhY6NVRCT/bAV5TdZ70My5o1vDd8BMiig1WnFpQmKUMoex
	jH2jM7ENTs17uxDtKEacISLdPK+
X-Received: by 2002:a05:600c:8b2e:b0:480:68ed:1e70 with SMTP id 5b1f17b1804b1-485198d0f8emr86809385e9.35.1772700950974;
        Thu, 05 Mar 2026 00:55:50 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a20sm59405175e9.9.2026.03.05.00.55.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 00:55:50 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/12] zlib: Fix CVE-2026-27171
Date: Thu,  5 Mar 2026 09:54:56 +0100
Message-ID: <56fa706a39e837f5c4b9e782f215fa98ea23df12.1772700454.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772700454.git.yoann.congal@smile.fr>
References: <cover.1772700454.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 08:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232459

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patch from [1] also mentioned in [2]

[1] https://github.com/madler/zlib/issues/904
[2] https://security-tracker.debian.org/tracker/CVE-2026-27171

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
new file mode 100644
index 00000000000..e6a8a3eac5f
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
@@ -0,0 +1,63 @@
+From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Sun, 21 Dec 2025 18:17:56 -0800
+Subject: [PATCH] Check for negative lengths in crc32_combine functions.
+
+Though zlib.h says that len2 must be non-negative, this avoids the
+possibility of an accidental infinite loop.
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
+CVE: CVE-2026-27171
+
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ crc32.c | 4 ++++
+ zlib.h  | 4 ++--
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/crc32.c b/crc32.c
+index 6c38f5c..33d8c79 100644
+--- a/crc32.c
++++ b/crc32.c
+@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
+ 
+ /* ========================================================================= */
+ uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
++    if (len2 < 0)
++        return 0;
+ #ifdef DYNAMIC_CRC_TABLE
+     once(&made, make_crc_table);
+ #endif /* DYNAMIC_CRC_TABLE */
+diff --git a/zlib.h b/zlib.h
+index 8d4b932..8c7f8ac 100644
+--- a/zlib.h
++++ b/zlib.h
+@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
+    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
+    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
+    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
+-   len2. len2 must be non-negative.
++   len2. len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ /*
+ ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
+ 
+      Return the operator corresponding to length len2, to be used with
+-   crc32_combine_op(). len2 must be non-negative.
++   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
+ */
+ 
+ ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index ef831421216..892467a1fbd 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
+           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 

