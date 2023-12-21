Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010FFC46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.43010.1703124561444198602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ejeFnITN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28bc20cb501so1077662a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124560; x=1703729360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZpzs660G6da1Ukof+0K8YYNQ+/MT9mDfNvC3YMbWLA=;
        b=ejeFnITNDlNg+1rbVJw9fsKii/aJ6jvdYsfsntvr4kMibaAJTzNWi2OYagh4XDk2K1
         wp0z+yVgihrNUWREG3WPcaqy8j6hR0J/l24SwVUqBh6HdIxRd6jmWBdGcUjPc50bkjPH
         pzzfmFR3zTwEf3rUcAtcioGwQeDdaouiNLv/EDmBaPsY6NRGOKmx/sFxzq+oe9CbVvrS
         vC3J+zkRcnsI3Zp1tVRKGQS4yOMzMNFYV4Kz5ZyiIlGBtT9EWTd+VRhxFGCb6YJFZ7uN
         xoU8lMEYfGBQnnH5M35vSJHDBe5AatZalYpJ8FIa9CKtO/lsr8Qv5nnFlFmFITGvZDYC
         viOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124560; x=1703729360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZpzs660G6da1Ukof+0K8YYNQ+/MT9mDfNvC3YMbWLA=;
        b=lSimV5NHOwnTSHWCNrXrQapmqvifNSaXboY5dt/Qz1gqWpBwQfgcpta+/54BUe4MRs
         zPRbeYwn1eaI66t8ldvU/ECBuVAGwPWahUOSBWSRxANLZgyBLrSfMLsDB2gAb4dmi6YG
         LT36IITXovSPNUSEj9Lu8b+Rjii2FFahBFuLhxT+B8tUVYj+bbtjLQ/qGWNl6j6BMsxs
         GcZneD30GKAKwN2Kku4zz02eocRGsA7NMYJTYqcWfBrRYw11GBY9RFFvJFuRVbhQX/xb
         bgeYkDWMtoEnYApljKKb6511CTFkZWjzkP+bdhFSI6ABBbbLhv9IYC1kGjfnH7AU9/r5
         OArA==
X-Gm-Message-State: AOJu0YyBxY5Z8OpKnPoy4EOFdmybxlpWqmfe5bCsjhdFPYuIsGAsjBiv
	Lqyl8DKoZKsumWSdl49OdJRlKyLKt/7+DT8UmS7afEDdBnX+rA==
X-Google-Smtp-Source: AGHT+IF5Da3dH8xSH47v0La6dgzMm/PirkVSRFFtq9LnRt6K1cguvamhh6gx1aCt2wYWKiR6GNG5FQ==
X-Received: by 2002:a17:90b:3554:b0:28b:d358:d50c with SMTP id lt20-20020a17090b355400b0028bd358d50cmr2546033pjb.34.1703124560168;
        Wed, 20 Dec 2023 18:09:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] curl: Fix CVE-2023-46218
Date: Wed, 20 Dec 2023 16:09:02 -1000
Message-Id: <f27a93299f554e0bde610f70e6a042b4a24abf20.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192814

From: Poonam Jadhav <ppjadhav456@gmail.com>

Add patch to fix CVE-2023-46218

Link: https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.88.1-8ubuntu2.4/curl_7.88.1-8ubuntu2.4.debian.tar.xz
      https://github.com/curl/curl/commit/2b0994c29a721c91c57

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-46218.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46218.patch b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
new file mode 100644
index 0000000000..d7d7908ea0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
@@ -0,0 +1,52 @@
+Backport of:
+
+From 2b0994c29a721c91c572cff7808c572a24d251eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 23 Nov 2023 08:15:47 +0100
+Subject: [PATCH] cookie: lowercase the domain names before PSL checks
+
+Reported-by: Harry Sintonen
+
+Closes #12387
+
+CVE: CVE-2023-46218
+Upstream-Status: Backport [https://github.com/curl/curl/commit/2b0994c29a721c91c57]
+Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
+---
+ lib/cookie.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -1044,15 +1044,23 @@ Curl_cookie_add(struct Curl_easy *data,
+    * dereference it.
+    */
+   if(data && (domain && co->domain && !Curl_host_is_ipnum(co->domain))) {
+-    const psl_ctx_t *psl = Curl_psl_use(data);
+-    int acceptable;
+-
+-    if(psl) {
+-      acceptable = psl_is_cookie_domain_acceptable(psl, domain, co->domain);
+-      Curl_psl_release(data);
++    bool acceptable = FALSE;
++    char lcase[256];
++    char lcookie[256];
++    size_t dlen = strlen(domain);
++    size_t clen = strlen(co->domain);
++    if((dlen < sizeof(lcase)) && (clen < sizeof(lcookie))) {
++      const psl_ctx_t *psl = Curl_psl_use(data);
++      if(psl) {
++        /* the PSL check requires lowercase domain name and pattern */
++        Curl_strntolower(lcase, domain, dlen + 1);
++        Curl_strntolower(lcookie, co->domain, clen + 1);
++        acceptable = psl_is_cookie_domain_acceptable(psl, lcase, lcookie);
++        Curl_psl_release(data);
++      }
++      else
++        acceptable = !bad_domain(domain);
+     }
+-    else
+-      acceptable = !bad_domain(domain);
+ 
+     if(!acceptable) {
+       infof(data, "cookie '%s' dropped, domain '%s' must not "
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 471bc47f34..a36d03f668 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-32001.patch \
            file://CVE-2023-38545.patch \
            file://CVE-2023-38546.patch \
+           file://CVE-2023-46218.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


