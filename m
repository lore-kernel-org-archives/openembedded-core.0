Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E61D7974C
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5105.1769846222110590224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K51/1a91;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee07570deso23639645e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846220; x=1770451020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cci+XdPd5TXzBJ7WTfZGi6s8ulHOjrzOjlw31HCfIJo=;
        b=K51/1a91d/rZh3fq9pyR+J/a5M/XoTk/Rxv7ItIgPXOI6nOqh0jUbr771RqoZ9AsoN
         AdER4KZEk29uUwfXNSaccOukQzdeNO6jgnpKo7KJhRDx952T//qPshbFe58E7JF+67OK
         nTSEsSQdS2LLB3yCxZxUXTW9ISv/Lke5eK7sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846220; x=1770451020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cci+XdPd5TXzBJ7WTfZGi6s8ulHOjrzOjlw31HCfIJo=;
        b=S6XTXjEZuyBhdrPnSQjSewWtS5aqjggx5DDBmL4m5JQ74AgZEc7JIeHaVrbbfuxCM1
         KyNi7RNxjULMQaDfoKLeMSHBMNgAuJlvktgUHH+3sx2HYkSmQ35nkpPksno1PccTfh9c
         UuE3q1OIzZ3jZLrBjo9Wn0BBX/WZvKs2Hi0La4nWEnqU7C9raC4kLTa2edzCF2nMMwyC
         iSF1+Km0ITKPMKk51VnG0RhRtKUJZ60k1Y4eVyYdnQJHccgeFOSj1NRqO2dbuEjC7UHu
         qq2nlzOYDn+rZ9vy6ijVLP1sBSRMmv1Ah0v432NnbNDIQsME+n5EpICDCnW6LoZHg5LF
         lQyw==
X-Gm-Message-State: AOJu0YxSjmo28mvDdgndDdnSDAn8DryG1seWmPBnatBw6WMd9EPhWlKZ
	TQSPi61BI44Twv7Z0dTbqBTweO/t/DWvzT5T9SejQMVX9HTolEeBDuMObmFApSsnA69xDnpiuKY
	9x10NbZc=
X-Gm-Gg: AZuq6aIhHtOWDwWaxctW3wsBvnr5RApp6/PGdDf5lpjHh/2hP0UBASNtac0S9fVaVdx
	Ba8Ve35xUl4da8hqlJLJlwhU63pnDg7zf2yPfbv+oyhcD4YLn7dngQCVRLmZpfQhGbQhni2zzJT
	k06An6QazaRZw1OEu7BZ5mB/cs36e5Gp5ST1eoJ0Uy+DadZNh+mI1rn766x9d/G4ZmE2wdB2DRb
	LMFDWSQODN81PAW0lGKSXxiHTFFhRhvjohAWendJtLX9BfZv8L8EaWM4cF40otpg0hMxs0dKAS2
	MLxgJJh9bIeH6iy1cAs/dDV/2hvW5Q+Ur2CQgelzjfEnD6QA4qfJ/gT7aIcPk9wNZDvnvCnT4hp
	Z2k8tDX56imXK97WzfSDkyYYGKZinn4Xz6nTBp+YDt3IejrcZ6uXs96CA0BuKtgQcnEO28KVqkZ
	Iho2ZW7PEiKEE8fp+1ViXz8tu3NheY148s3gD8lKDXYBKLQ0QVyt54U4ZkpY17BuTJdSoa8N6NC
	HkV2Ryo7wX+aejd
X-Received: by 2002:a05:600c:4ec7:b0:47d:586e:2fea with SMTP id 5b1f17b1804b1-482db46b38dmr63115015e9.15.1769846220161;
        Fri, 30 Jan 2026 23:57:00 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/22] libtasn1: Fix CVE-2025-13151
Date: Sat, 31 Jan 2026 08:56:20 +0100
Message-ID: <38882316b7ef6344ec8598c7c73cae229c7b918a.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230214

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://gitlab.com/gnutls/libtasn1/-/commit/d276cc495a2a32b182c3c39851f1ba58f2d9f9b8

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gnutls/libtasn1/CVE-2025-13151.patch      | 30 +++++++++++++++++++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch

diff --git a/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
new file mode 100644
index 00000000000..5047d679840
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
@@ -0,0 +1,30 @@
+From ff7aa7ef2b9ba41df8f2d1e71b05bf2c2ad868dd Mon Sep 17 00:00:00 2001
+From: Vijay Sarvepalli <vssarvepalli@cert.org>
+Date: Mon, 22 Dec 2025 12:24:27 -0500
+Subject: [PATCH] Fix for CVE-2025-13151 Buffer overflow
+
+Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/-/commit/d276cc495a2a32b182c3c39851f1ba58f2d9f9b8]
+CVE: CVE-2025-13151
+
+Signed-off-by: Simon Josefsson <simon@josefsson.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ lib/decoding.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/decoding.c b/lib/decoding.c
+index 1e0fcb3..abcb49f 100644
+--- a/lib/decoding.c
++++ b/lib/decoding.c
+@@ -1983,7 +1983,7 @@ int
+ asn1_expand_octet_string (asn1_node_const definitions, asn1_node *element,
+ 			  const char *octetName, const char *objectName)
+ {
+-  char name[2 * ASN1_MAX_NAME_SIZE + 1], value[ASN1_MAX_NAME_SIZE];
++  char name[2 * ASN1_MAX_NAME_SIZE + 2], value[ASN1_MAX_NAME_SIZE];
+   int retCode = ASN1_SUCCESS, result;
+   int len, len2, len3;
+   asn1_node_const p2;
+-- 
+2.47.1
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
index 8127ba5b1db..bfc011a2f17 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.20.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
+           file://CVE-2025-13151.patch \
            "
 
 DEPENDS = "bison-native"

