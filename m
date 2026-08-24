Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF0AC5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 13:01:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15971.1787576474146464219
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 06:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TMWVloVI;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49557167508so13076665e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 06:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787576472; x=1788181272; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ev2bAQl1ZGq4ysHJ/OlDeIT3qLeXWbw12vjk3VUTlN8=;
        b=TMWVloVInm0fJveKMap9hPYrCL0WJfH3ASvTEdt2L9cHwTtFcY5VoIReJezFjqYnDu
         19llkTDmCqAddQa5HDKkHQA++KmbdIUBTmUeqWFNzhU8eMbYLZC0+NLP1oMgOpIhIe2N
         4Wddhesujh8sNitacZHfzrCg5wx1EoAjCs4+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576472; x=1788181272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ev2bAQl1ZGq4ysHJ/OlDeIT3qLeXWbw12vjk3VUTlN8=;
        b=kjea5WPmIkfJwOPSzfn69EwY6mfF7q+7WeF2NP42mMGaYp3Zb96zCMrP2ileuLtvSp
         YngjkGTtu4ci1ploBzBLHh5vFqepuiLttowv+UCeuT/dC2DJz14yO7J22+Irm+J/oLL0
         REAEddobuYhAuVrCV14+Z9AvG9K8EXRiV1YT5T6Pw30bTqRZ7s2nSJZwN58BdL5AI29f
         OYP2+gVaKQox9LTy1RZ/l7gaU2ofbWaP1PhRo6UthjTNMiTVDrBUeCAIRh2ppPwT65ot
         EvBeXp2Uz6qWqlTmhUKJzFwL44Cm5Ld7O8l6MEhvLMZoQMJVDN3avC7/SaugEM3MA+Ue
         Sgxg==
X-Gm-Message-State: AFuF++nYL7dPaT1Wg26u7JPG6cCgZ31gg91XrDAez8MY3k2wDt3VyGFP
	t3jBfvNMDxwySdRrwe5YG0VnbbHgJ4oJPEOvDZlWDNPu1O/j2jUmq0xEwuNl1CPY09RdC8f7W0q
	G3ZKy1yU=
X-Gm-Gg: AR+sD11bSWgNHcC5qTm6rt5xfO82rZxkDqXInw9aLWO1NwybEVk9qnJbJNTBXHEqgYQ
	iTukOj5SeQzyf0k8kaJaqM7ZNilqNZhiiymp5hy9B+PJJO7V/79M113LByhQ2zwqdhxzWX7km1o
	euS64HcPIWz9FqM2DI453W9D+4nKotW9FmRYdqOSn2wfXu/gifEK3UJwjRlc0uaBt1lH/oPDUNL
	GHSvpoDbc7pOrYbP1DTg625opLiRjhOI9AkorBaoH810TDvVg8z9+9g3BHrfvMCf7DPScPiOMBU
	QbGm4JE8GZbUFyz2+ASUih/JDaBt7vKcYUYnXIFYsGUdtm3Oqmfcli2lkDPO7T4pruyA1kzNd4Q
	1mq0OHcoJa90LKfzl4owPORNrxew+clbc2AhisaurTtCv1ZE8JgMJxwjh0bdFHKehy5XeVqVTqX
	UTb6tAR/66U+W9TNWtYXviGDQNXvWmXV6auPLDwuOBjM10jeaU2ikapjWoRwzgw+gni04297GrE
	4VaCJNJeD4Z9DBjR9AM8dvywhzAh6N9q2dkPg6V0gk9hiPKrLX2AH+boKN2I53bwzNdzcs=
X-Received: by 2002:a05:600c:5486:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-499b825a4bcmr316744425e9.0.1787576440390;
        Mon, 24 Aug 2026 06:00:40 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c35935f5sm61379865e9.2.2026.08.24.06.00.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 06:00:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/19] libssh2: fix CVE-2026-66033
Date: Mon, 24 Aug 2026 14:59:46 +0200
Message-ID: <f2f021c5a250f64889bc901d40e9cf0ebbc98e35.1787576160.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787576160.git.yoann.congal@smile.fr>
References: <cover.1787576160.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 13:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244117

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-66033
https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6

libssh2 ptest results (qemux86-64):
  before: PASSED: 1 FAILED: 0 SKIPPED: 0
  after:  PASSED: 1 FAILED: 0 SKIPPED: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../libssh2/libssh2/CVE-2026-66033.patch      | 45 +++++++++++++++++++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch

diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch b/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
new file mode 100644
index 00000000000..bb046a6eae2
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-66033.patch
@@ -0,0 +1,45 @@
+From d1b6996c3b31ce6b60d5a820ecc33880e61ef0ae Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Thu, 23 Jul 2026 10:32:04 +0200
+Subject: [PATCH] openssl: fix potential OOB read/write with AES-GCM in
+ `ssh2_cipher_crypt()`
+
+By applying two bounds checks to non-debug builds.
+
+Reported-by: Vladimir Eli Tokarev
+Fixes GHSA-c4f7-cvfc-33j7
+Follow-up to 3c953c05d67eb1ebcfd3316f279f12c4b1d600b4 #797
+
+Closes #2401
+
+CVE: CVE-2026-66033
+Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/a2ed82d40964bbc0d64cd717aa0a5a892117d2e6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/openssl.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/openssl.c b/src/openssl.c
+index eba05031..28ae1cc0 100644
+--- a/src/openssl.c
++++ b/src/openssl.c
+@@ -1042,13 +1042,15 @@ _libssh2_cipher_crypt(_libssh2_cipher_ctx * ctx,
+     const int aadlen = (is_aesgcm && IS_FIRST(firstlast)) ? 4 : 0;
+     /* size of AT, if present */
+     const int authenticationtag = IS_LAST(firstlast) ? authlen : 0;
+-    /* length to encrypt */
+-    const int cryptlen = (unsigned int)blocksize - aadlen - authenticationtag;
++    unsigned int cryptlen; /* length to encrypt */
+ 
+     (void)algo;
+ 
+-    assert(blocksize <= sizeof(buf));
+-    assert(cryptlen >= 0);
++    if(blocksize > sizeof(buf) ||
++       blocksize < (size_t)(aadlen + authenticationtag))
++        return 1;
++
++    cryptlen = (unsigned int)blocksize - aadlen - authenticationtag;
+ 
+ #if LIBSSH2_AES_GCM
+     /* First block */
diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
index bd7d1f7b1d1..de435a836db 100644
--- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2025-15661-2.patch \
            file://CVE-2025-15661-3.patch \
            file://CVE-2026-66032.patch \
+           file://CVE-2026-66033.patch \
            "
 
 SRC_URI[sha256sum] = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7"

