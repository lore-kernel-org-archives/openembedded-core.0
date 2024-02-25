Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39F7C54E4A
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.7420.1708897974923595154
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Oh6k01+T;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1d51ba18e1bso32693725ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897974; x=1709502774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSvuzTqZo70m1+NfaPkd7XymuFHeK/cFUn/vB90ITgs=;
        b=Oh6k01+TGL3LonunBDk+4vPbRfPnFtoMKVP9FU1Lae2Ll863rEjlbcwJRW903HxczB
         PAUWXUDGhpZ0iwJF4vvzuiOF+g0I5sARPGWk1UbTCXOuSBjd45awlH6FBaySYdtJx7J8
         HmozVcX2JT3+McClkyYs0RfPMLmj/CMz+3ss5vIc3c8RHUVDkTPCMfXyCFI16C0RvSDq
         zvJ14mOYp/izcl3vVf1lSgdLzsi4xZc+mKasYXmBTztfdNn7QM6bCd7psoMBsxUprAsD
         TQPBfb+oh2nL4dG8j9YWbfpEd6wA9aaKMmR9Hq0Vh/LZmhXB0E7oWKOQgVg72A4V8qD4
         gQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897974; x=1709502774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSvuzTqZo70m1+NfaPkd7XymuFHeK/cFUn/vB90ITgs=;
        b=P9Cm+V55qjDFR1M7SrHmpuXaJ1vCS/8eQWJ7AVnZ/s/rj9D71OdntaUk+YEA59vvRw
         Ch61h7TsJIRj1Ew/IP/8sbLMglG1IjVvioSkavrY00oAgp84lXm+YjclBTfhjexjBVZz
         nPkiaHnvcw1qzmBlcd4AsErH78CgnK/dM1WvE9srWeKypgGI5T70kYTswtIop5LmZmMT
         LqFpFhmqqpOunV9BQaLUevwiLUSCzdpd4QR+cwwQ6OYBSsyohkOSV/i+Jxu1h0vmK1U+
         UhUXSqt256vNAHMAy3KvjVSyOaBFposGhaJ6wMYC6EIFpJ5Yza2Tvf13r9HdIRdrl/or
         MA0w==
X-Gm-Message-State: AOJu0YzDH42ZdhqV5Qv2ZSz/7oiq3USuBD1HQpiEnC+MDoWe+0bpE+nc
	+bpIemHhWxA+b5HiDmapg9Mvqxr7zrk0hlLzxWrOWVIjGuVTciNuFn46urUvqlLi3cNlOj+fzwL
	l/TNaCg==
X-Google-Smtp-Source: AGHT+IFVoW86dgaHA72WUMXNzzgNxb3RWwO0TWlg0XJz0msbgG9AHabzPkkK/CujGIsMVKsdvn0cqA==
X-Received: by 2002:a17:902:c185:b0:1da:2128:eb28 with SMTP id d5-20020a170902c18500b001da2128eb28mr5655353pld.65.1708897974081;
        Sun, 25 Feb 2024 13:52:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:52:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/22] libuv: fix CVE-2024-24806
Date: Sun, 25 Feb 2024 11:52:21 -1000
Message-Id: <9aa207a91a78309015aa0070a98769c821a7ecd6.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196154

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0f2d7e784a256b54b2385043438848047bc2a629]
Upstream-Status: Backport [https://github.com/libuv/libuv/commit/3530bcc30350d4a6ccf35d2f7b33e23292b9de70]
Upstream-Status: Backport [https://github.com/libuv/libuv/commit/e0327e1d508b8207c9150b6e582f0adf26213c39]

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libuv/libuv/CVE-2024-24806-1.patch        | 56 +++++++++++++++++++
 .../libuv/libuv/CVE-2024-24806-2.patch        | 44 +++++++++++++++
 .../libuv/libuv/CVE-2024-24806-3.patch        | 31 ++++++++++
 .../libuv/libuv_1.44.2.bb                     |  6 +-
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch

diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
new file mode 100644
index 0000000000..d263cced8d
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
@@ -0,0 +1,56 @@
+From b8ee33667d265b936d60ee7f0ba0b22463ccb019 Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Thu, 18 Jan 2024 14:51:40 +0100
+Subject: [PATCH] fix: always zero-terminate idna output
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0f2d7e784a256b54b2385043438848047bc2a629]
+CVE: CVE-2024-24806
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c6q6
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/idna.c       | 5 +++--
+ test/test-idna.c | 4 ++++
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/idna.c b/src/idna.c
+index 93d982ca..ce7f2746 100644
+--- a/src/idna.c
++++ b/src/idna.c
+@@ -308,8 +308,9 @@ long uv__idna_toascii(const char* s, const char* se, char* d, char* de) {
+       return rc;
+   }
+ 
+-  if (d < de)
+-    *d++ = '\0';
++  if (d >= de)
++    return UV_EINVAL;
+ 
++  *d++ = '\0';
+   return d - ds;  /* Number of bytes written. */
+ }
+diff --git a/test/test-idna.c b/test/test-idna.c
+index f4fad965..d079be55 100644
+--- a/test/test-idna.c
++++ b/test/test-idna.c
+@@ -99,6 +99,7 @@ TEST_IMPL(utf8_decode1) {
+ TEST_IMPL(utf8_decode1_overrun) {
+   const char* p;
+   char b[1];
++  char c[1];
+ 
+   /* Single byte. */
+   p = b;
+@@ -112,6 +113,9 @@ TEST_IMPL(utf8_decode1_overrun) {
+   ASSERT_EQ((unsigned) -1, uv__utf8_decode1(&p, b + 1));
+   ASSERT_EQ(p, b + 1);
+ 
++  b[0] = 0x7F;
++  ASSERT_EQ(UV_EINVAL, uv__idna_toascii(b, b + 1, c, c + 1));
++
+   return 0;
+ }
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
new file mode 100644
index 0000000000..b0ed5f0ea2
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
@@ -0,0 +1,44 @@
+From 96f881c8f600da33ec4ecec450ec491990ce613b Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Thu, 18 Jan 2024 14:52:38 +0100
+Subject: [PATCH] fix: reject zero-length idna inputs
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/3530bcc30350d4a6ccf35d2f7b33e23292b9de70]
+CVE: CVE-2024-24806
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c6q6
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ src/idna.c       | 3 +++
+ test/test-idna.c | 1 +
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/idna.c b/src/idna.c
+index ce7f2746..858b19d0 100644
+--- a/src/idna.c
++++ b/src/idna.c
+@@ -274,6 +274,9 @@ long uv__idna_toascii(const char* s, const char* se, char* d, char* de) {
+   char* ds;
+   int rc;
+ 
++  if (s == se)
++    return UV_EINVAL;
++
+   ds = d;
+ 
+   si = s;
+diff --git a/test/test-idna.c b/test/test-idna.c
+index d079be55..d59b521e 100644
+--- a/test/test-idna.c
++++ b/test/test-idna.c
+@@ -114,6 +114,7 @@ TEST_IMPL(utf8_decode1_overrun) {
+   ASSERT_EQ(p, b + 1);
+ 
+   b[0] = 0x7F;
++  ASSERT_EQ(UV_EINVAL, uv__idna_toascii(b, b + 0, c, c + 1));
+   ASSERT_EQ(UV_EINVAL, uv__idna_toascii(b, b + 1, c, c + 1));
+ 
+   return 0;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch
new file mode 100644
index 0000000000..733660cf05
--- /dev/null
+++ b/meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch
@@ -0,0 +1,31 @@
+From a7443ee6b3b3c6a12708148aa9bb001b7782905c Mon Sep 17 00:00:00 2001
+From: Santiago Gimeno <santiago.gimeno@gmail.com>
+Date: Wed, 7 Feb 2024 20:27:58 +0100
+Subject: [PATCH] test: empty strings are not valid IDNA
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/e0327e1d508b8207c9150b6e582f0adf26213c39]
+CVE: CVE-2024-24806
+
+Fixes: https://github.com/libuv/libuv/security/advisories/GHSA-f74f-cvh7-c6q6
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ test/test-idna.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/test-idna.c b/test/test-idna.c
+index d59b521e..37da38de 100644
+--- a/test/test-idna.c
++++ b/test/test-idna.c
+@@ -150,8 +150,8 @@ TEST_IMPL(idna_toascii) {
+   /* Illegal inputs. */
+   F("\xC0\x80\xC1\x80", UV_EINVAL);  /* Overlong UTF-8 sequence. */
+   F("\xC0\x80\xC1\x80.com", UV_EINVAL);  /* Overlong UTF-8 sequence. */
++  F("", UV_EINVAL);
+   /* No conversion. */
+-  T("", "");
+   T(".", ".");
+   T(".com", ".com");
+   T("example", "example");
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
index 27e79276b5..e2cd3c3247 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.44.2.bb
@@ -6,7 +6,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d"
 
 SRCREV = "0c1fa696aa502eb749c2c4735005f41ba00a27b8"
-SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https"
+SRC_URI = "git://github.com/libuv/libuv.git;branch=v1.x;protocol=https \
+           file://CVE-2024-24806-1.patch \
+           file://CVE-2024-24806-2.patch \
+           file://CVE-2024-24806-3.patch \
+          "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


