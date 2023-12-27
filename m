Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED38DC47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:30:35 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.94597.1703644229934149097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lhR3xuvn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c6839373f8so2972729a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 18:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703644228; x=1704249028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asLtdNlsBRUxSxCLH9vo59xHKgXOjfkncl736I886Pk=;
        b=lhR3xuvnRH05ndNCU3GqnQkeW23X2m0NSPmhkHXI2uamEhNTyWLXBCV7j/iS1fwBhQ
         bF6YTn42NWrJt9jKeOGTO+EzOT3efJSnmR9lOxj89eVnIvFbxluFQnMcofLTRhz6Tjmc
         oNvh+B3HBBBQyEe5Qny3YyDd4Gf5SecxRZPtD3+Ml9JvbGvqZswvOh8skB7H6cSFJ0Wr
         V22CSjxBG6YV/LaS4E4uo5pWC3xobwb+T8lfgb4K1GKYJst+WoaBUmfXCAlHSoPhoiyP
         eQThDZFyhO1AZZ3VDQAvKNeyauLGvJW9R38+ej91lAgWobT7Q9gh6ws+zIhvOr8RzIkF
         Pauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644228; x=1704249028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asLtdNlsBRUxSxCLH9vo59xHKgXOjfkncl736I886Pk=;
        b=ljYrgXNDm9fWk2TvmppW4RhPsPFV2ashvodjGpEzZZdVjjxR7sI1jicWhWl2seVTcu
         he4kt0D9sqGnvogscCwCPqjhxKMFSz4C1i9nE2AQbG1TDWQrm+3/aS5QQPUKXtN4+agX
         lPXM7LZxaEjecITZ8APe2uak1E0HVeijeq2DXE/jvq9pzlqG+rXM5/kNuihldR0mH92o
         G25Z1bsU8m6ALa5yJDdgi0/CBRz5NgfUWVh9FtwMriQt3mIBJ5oz4Y2XVYdoNrEKZBE4
         VsD9Grh/3cY8LmNkPot+tvUafRBYttStlx5kE8sD2PB6PM8ocfGrAXVn6hJOevCrJRVr
         ycfQ==
X-Gm-Message-State: AOJu0YwyM6xJVCGMKatL7+v5i9K2am+F2oXFQQ2T6rUmJ7UJdvKjJSuK
	RnXDbBMNW6XYa1K86NyR2fJZ7XIBFNVaya4ENR8uPbRP4OEm+g==
X-Google-Smtp-Source: AGHT+IE4QQenylkJ/sALrCsHS4jIjCgbSB6KuQXTPqx2CZ+AaancRUtJyNlJCQoUnubdM67oug+aig==
X-Received: by 2002:a05:6a20:12cc:b0:196:1b73:3bbe with SMTP id v12-20020a056a2012cc00b001961b733bbemr456530pzg.63.1703644228483;
        Tue, 26 Dec 2023 18:30:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm10982400pfb.81.2023.12.26.18.30.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:30:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] curl: fix CVE-2023-46218
Date: Tue, 26 Dec 2023 16:30:16 -1000
Message-Id: <7bf11847b18d2f9a7e5467d686af817cb504b206.1703644078.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703644078.git.steve@sakoman.com>
References: <cover.1703644078.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 02:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192916

From: Lee Chee Yang <chee.yang.lee@intel.com>

import patch from ubuntu
http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.68.0-1ubuntu2.21.debian.tar.xz

upstream https://github.com/curl/curl/commit/2b0994c29a721c91c57

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-46218.patch            | 52 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-46218.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-46218.patch b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
new file mode 100644
index 0000000000..c9677b6a84
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-46218.patch
@@ -0,0 +1,52 @@
+CVE: CVE-2023-46218
+Upstream-Status: Backport [ import from ubuntu http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.68.0-1ubuntu2.21.debian.tar.xz  upstream https://github.com/curl/curl/commit/2b0994c29a721c91c57  ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
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
+---
+ lib/cookie.c | 24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -967,15 +967,23 @@ Curl_cookie_add(struct Curl_easy *data,
+ #ifdef USE_LIBPSL
+   /* Check if the domain is a Public Suffix and if yes, ignore the cookie. */
+   if(domain && co->domain && !isip(co->domain)) {
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
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 82b07bc554..a8e6c4f3ee 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-38546.patch \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322.patch \
+           file://CVE-2023-46218.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


