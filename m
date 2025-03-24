Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A52C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.43713.1742834034181581754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ex9CzTMz;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223a7065ff8so16430295ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834033; x=1743438833; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWmBR/8YqPDppqC7CmlImLkDpOXUYMjZbTS1tgNsv30=;
        b=ex9CzTMzB2yeM9GXe8w2pb9m1Kd3RZG+AqfQAUYI9LMT631QD/GvwuJNIHjLzC5hTE
         ZrAoPh2ycRPRPO+PG8dDuUF3ifjmTwtsCbiK5vzSDl1X8q2mkL6q3RRagcmmYjVPuSqR
         XZQiKFmZNvlRnfImlez5X+hnjimbfCJDjpkl7U+2msro+Nn0WuJcWC3YiJ8OuMO9u89s
         rbyq6KzxoeXYR2HmRmqp38pF6UuVvg+U9hNgVhvBM9863C5D8s5EMBLRSCTc7eOHfg/A
         Rh9rO42Z+Mvwyop4DjmBSpB/uUNWcsfzu2Nxn8zm3A4WVZAIYzoihB8lfPPOJlnUAvxi
         x8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834033; x=1743438833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWmBR/8YqPDppqC7CmlImLkDpOXUYMjZbTS1tgNsv30=;
        b=pPTIOkFxdbIOVdShsRz8j2D7OxVjyeqm9iIFqz7zv0Zt6ST5n1rJuE0ruuYWByiGZ7
         gcE94TROgbRR7cSHfNWYPX2aROYRMlVTPG/ad/za8CyxN/otQ0PbocMs7B3AuwRWKySG
         DIUBRdJdqH7MsJRtqj/LojJViN3lJI17KGECXWcEKvfgYpIAfgz0/Ap1FxU0WKsTnjYt
         dasdpAQ54/3jPfg44635poJ+Bdl+A6qlV7GJmnwVJrIKRZowi89seqLKZXdBLtwk9dN1
         O9swcWfKUqan1Yv4Nu0v4UTYQIW2jE5Ne7WdAjjcWC201quXAHlNXM1FFLu9ex+eiN1T
         qMxg==
X-Gm-Message-State: AOJu0YzwtzMOXdK8pGno/Z+E5UTqL5j+SUjFtfJN068b2AnKtta5iNBA
	xm7IGoRkNXkHCetiVeGGV3rUqDrRvyqWj4d2goGA6xoTD05LAmJGEKEs5pEI
X-Gm-Gg: ASbGncte56GnnujPVo/vo1UzuLb2Kmzzgho0HFZsSNAPFc988v86MWKfWLnQC85fjp8
	Vr6BpmiZGPYA/0tm5jqkUnmFqAYcO6t5R7hNnIpUnAs0X/0Rbazi6q9iWGlaS5UnmkrF1nTTSRj
	+QVjnsPkftMTF9h1QJ4o1pkex4CDYIhBvhioOmsyk1fc7Kw3EcD5WD6Rxj81CiW8VIXaT5bBvgA
	iCq/5OpXsC5Mv8Te1SjnqCT1Kr5P+7ZegoJ87DJ9wyN7F0F26wefH08hxqfk/BhrQYAt52HT8I/
	ImrEhfdzJOeuUrqQrChYSy3FLeuHvYHqlv9O
X-Google-Smtp-Source: AGHT+IE1NiIFejjLPuX+wJftGQxdfbTh7sfnrhDF6jRjuOfz0uUhqH1kIS5SB2GG8EZ9byftAP43mw==
X-Received: by 2002:a05:6a20:4320:b0:1f5:6a1a:3284 with SMTP id adf61e73a8af0-1fe4344e868mr24974242637.40.1742834033333;
        Mon, 24 Mar 2025 09:33:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:33 -0700
Subject: [PATCH 12/21] mtd-utils: Fix GCC version detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-12-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213544

Helps building with GCC with 0 in minor version e.g. 15.0.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Improve-check-for-GCC-compiler-version.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb       |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch b/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
new file mode 100644
index 0000000000000000000000000000000000000000..3cd58e053db5352007bc979bb140378607c30663
--- /dev/null
+++ b/meta/recipes-devtools/mtd/files/0001-Improve-check-for-GCC-compiler-version.patch
@@ -0,0 +1,34 @@
+From e7adb21350ff3b96dbd2de56a127e9d916c08d62 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 22 Mar 2025 19:05:32 -0700
+Subject: [PATCH] Improve check for GCC compiler version
+
+When using unreleased compiler has version like
+15.0.1 and that test fails because __GNUC_MINOR__ < 1
+becomes true, therefore check for full version string
+which is more rubust.
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2025-March/108860.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ubifs-utils/common/atomic.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ubifs-utils/common/atomic.h b/ubifs-utils/common/atomic.h
+index f287d43..95754b2 100644
+--- a/ubifs-utils/common/atomic.h
++++ b/ubifs-utils/common/atomic.h
+@@ -2,8 +2,12 @@
+ #ifndef __ATOMIC_H__
+ #define __ATOMIC_H__
+ 
++#define GCC_VERSION (__GNUC__ * 10000 \
++                     + __GNUC_MINOR__ * 100 \
++                     + __GNUC_PATCHLEVEL__)
++
+ /* Check GCC version, just to be safe */
+-#if !defined(__GNUC__) || (__GNUC__ < 4) || (__GNUC_MINOR__ < 1)
++#if GCC_VERSION < 40100
+ # error atomic.h works only with GCC newer than version 4.1
+ #endif /* GNUC >= 4.1 */
+ 
diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
index aa593ac14f537efdf70ab9a0198245897c903984..2f7043b9773de5912bcd60d8021f8f1c1fec642d 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
@@ -16,7 +16,8 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
            file://0001-ubifs-utils-ubifs.h-Include-fcntl.h.patch \
            file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
            file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch \
-           file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch"
+           file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch \
+           file://0001-Improve-check-for-GCC-compiler-version.patch"
 
 S = "${WORKDIR}/git"
 

-- 
2.49.0


