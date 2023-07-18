Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1923EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:26:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.9004.1689690391977317392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=UX7tpM+r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-66869feb7d1so3832078b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690391; x=1692282391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGjFRNpZYoijGvrDmhLHVOxJkqeI4AXQfvu+eRAjabg=;
        b=UX7tpM+rLtJ5aI6zmBTuIEhRQIkgQlQXlXMzkOtA43SL09HfeUGuBEMvBtGhhyS9Rq
         uUF4qZJHqVxpiTFNVuJ5/S1XyBhZvPlX9NWWbOJpseUxM27O6hG+zFpqAGI5JRHm3dUJ
         tnhooDkc4qQ8MwUXraCfaLz/49R5FU6vtKEU+orjptOVe/trj3fD/+Jp7SLSA6aH6YX9
         Vyuk4usJ0Xo5HIOFs2oICOCf2qQ09UKV9cPZHv/azutUCEDv14CZcw/rxE7LzqLwqd7X
         +ZHACvAVBSgQqVEhenITG90zzAxj0tZqOQ5IeKAmR26E9ol3pxtFDbBH3ZMiJSrT6iS0
         5A0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690391; x=1692282391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGjFRNpZYoijGvrDmhLHVOxJkqeI4AXQfvu+eRAjabg=;
        b=lZzlT3Y9B+QU6j3zowB7vVZ135XeKe7tqedjuuUr7LQXaZ3Rdfb0fx4vrPKPJhYiHw
         qJQdxgQYGjkmNky1lNbl7tIP7sN7tySzWN2Df5ImBV6fJ5v95JazusJ6quJvlsRAKXEx
         o42VmUJBySvTOfcvWCXRy48I0bBqjNVzIFpQ43MjI3JazZzFO2yLK7XmNaiT465xpEx7
         p3iFhPB4Qj4CoVbN48hdth3N06nMad1Vtn3ecKEUPhpwhrsFoC0NxgVYSQlue+on5N7M
         WzLMwUTy0XrCwnefISQq8mtr+GzFgwAMi5KndZVgQUPSyQ4HOO+rjv2/t/1bPoXXfo8r
         8Ogw==
X-Gm-Message-State: ABy/qLYwFzMZcvlJPhzb/nWZLAOYuceiDJm0ef+DO8tjfjfjlta7DKx7
	jvdA3OPujXUMAmQXBLIwkjVpMaHXBGH+NK60lp8=
X-Google-Smtp-Source: APBJJlFUF1KpQ8i0mBeHS+v96VEj5hsjQq/tnnaO1byNMWI5qXlpoWrorke4En8TF30b+6iFpVlwfQ==
X-Received: by 2002:a05:6a20:3c8d:b0:134:d4d3:f0a8 with SMTP id b13-20020a056a203c8d00b00134d4d3f0a8mr5670574pzj.3.1689690390958;
        Tue, 18 Jul 2023 07:26:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/27] serf: upgrade 1.3.9 -> 1.3.10
Date: Tue, 18 Jul 2023 04:25:42 -1000
Message-Id: <275c6b7ac72330e14ba55907e8494314b63a9adf.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:26:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184512

From: Alexander Kanavin <alex.kanavin@gmail.com>

Apache Serf 1.3.10 [2023-05-31, from tags/1.3.10, r1910048]
  Support for OpenSSL 3 (r1901937, ...)
  Fix issue #171: Win32: Running tests fails with "no OPENSSL_Applink" error
  Fix issue #194: Win32: Linking error when building against OpenSSL 1.1+
  Fix issue #198: OpenSSL BIO control method incorrectly handles unknown requests
  Fix issue #202: SSL tests are not passing with OpenSSL 3
  Fix error handling when reading the outgoing request body (r1804534, ...)
  Fix handling of invalid chunk lengths in the dechunk bucket (r1804005, ...)
  Fix an endless loop in the deflate bucket with truncated input (r1805301)
  Fix BIO control handlers to support BIO_CTRL_EOF (r1902208)
  Fix a CRT mismatch issue caused by using certain OpenSSL functions (r1909252)
  Build changes to support VS2017, VS2019 and VS2022 (r1712131, ...)
  Build changes to support Python 3 (r1875933)

As serf is undead, we need to reassess all the remaining patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 775cbcc876edcb6c339f342a3253f5afcf6ef163)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 17a46eee905f0ecfdbebb014533848dc7e906ec7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...print-in-the-scons-file-to-unbreak-b.patch | 29 -------------------
 ...sl_buckets.c-do-not-use-ERR_GET_FUNC.patch | 28 ------------------
 ...11083-fix-building-with-scons-3.0.0-.patch | 29 -------------------
 ...ories.without.sandbox-install.prefix.patch |  2 +-
 .../serf/{serf_1.3.9.bb => serf_1.3.10.bb}    |  6 +---
 5 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
 delete mode 100644 meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
 delete mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
 rename meta/recipes-support/serf/{serf_1.3.9.bb => serf_1.3.10.bb} (78%)

diff --git a/meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch b/meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
deleted file mode 100644
index 4a5832ac1a..0000000000
--- a/meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 99f6e1b0d68281b63218d6adfe68cd9e331ac5be Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Sep 2018 10:50:08 -0700
-Subject: [PATCH] Fix syntax of a print() in the scons file to unbreak building
- with most recent scons version.
-
-* SConstruct Use Python 3.0 valid syntax to make Scons 3.0.0 happy on both python
-  3.0 and 2.7.
-
-Upstream-Status: Backport
-[https://svn.apache.org/viewvc/serf/trunk/SConstruct?r1=1809132&r2=1811083&diff_format=h]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- SConstruct | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index 1670459..18a45fa 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -184,7 +184,7 @@ CALLOUT_OKAY = not (env.GetOption('clean') or env.GetOption('help'))
- 
- unknown = opts.UnknownVariables()
- if unknown:
--  print 'Warning: Used unknown variables:', ', '.join(unknown.keys())
-+  print('Warning: Used unknown variables:', ', '.join(unknown.keys()))
- 
- apr = str(env['APR'])
- apu = str(env['APU'])
diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
deleted file mode 100644
index 91ccc8a474..0000000000
--- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2f45711a66ff99886b6e4a5708e2db01a63e5af4 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 10 Sep 2021 11:05:10 +0200
-Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
-
-Upstream removed it in
-https://github.com/openssl/openssl/pull/16004
-
-Upstream-Status: Inactive-Upstream [lastrelease: 2015, lastcommit: 2019]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- buckets/ssl_buckets.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/buckets/ssl_buckets.c b/buckets/ssl_buckets.c
-index b01e535..9801f87 100644
---- a/buckets/ssl_buckets.c
-+++ b/buckets/ssl_buckets.c
-@@ -1325,8 +1325,7 @@ static int ssl_need_client_cert(SSL *ssl, X509 **cert, EVP_PKEY **pkey)
-                 return 0;
-             }
-             else {
--                printf("OpenSSL cert error: %d %d %d\n", ERR_GET_LIB(err),
--                       ERR_GET_FUNC(err),
-+                printf("OpenSSL cert error: %d %d\n", ERR_GET_LIB(err),
-                        ERR_GET_REASON(err));
-                 PKCS12_free(p12);
-                 bio_meth_free(biom);
diff --git a/meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch b/meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
deleted file mode 100644
index 02fa9e3a06..0000000000
--- a/meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 565211fd082ef653ca9c44a345350fc1451f5a0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 3 Sep 2018 11:12:38 -0700
-Subject: [PATCH] Follow-up to r1811083 fix building with scons 3.0.0 and
- Python3
-
-* SConstruct: Append decode('utf-8) to FILE.get_contents() to avoid
-  TypeError: cannot use a string pattern on a bytes-like object
-
-Upstream-Status: Backport
-[https://svn.apache.org/viewvc/serf/trunk/SConstruct?r1=1811088&r2=1814604]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- SConstruct | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/SConstruct b/SConstruct
-index 877731e..7678bb1 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -169,7 +169,7 @@ env.Append(BUILDERS = {
- match = re.search('SERF_MAJOR_VERSION ([0-9]+).*'
-                   'SERF_MINOR_VERSION ([0-9]+).*'
-                   'SERF_PATCH_VERSION ([0-9]+)',
--                  env.File('serf.h').get_contents(),
-+                  env.File('serf.h').get_contents().decode('utf-8'),
-                   re.DOTALL)
- MAJOR, MINOR, PATCH = [int(x) for x in match.groups()]
- env.Append(MAJOR=str(MAJOR))
diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
index 4105868a7e..91640d6044 100644
--- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -31,7 +31,7 @@ ERROR: scons install execution failed.
   and the installed paths (including the paths inside libserf*.pc)
   look correct
 
-Upstream-Status: Inactive-Upstream [lastrelease: 2015, lastcommit: 2019]
+Upstream-Status: Pending
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.10.bb
similarity index 78%
rename from meta/recipes-support/serf/serf_1.3.9.bb
rename to meta/recipes-support/serf/serf_1.3.10.bb
index 669f42b8e7..c6b51452aa 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.10.bb
@@ -7,16 +7,12 @@ HOMEPAGE = "http://serf.apache.org/"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch \
-           file://0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch \
            file://0002-SConstruct-Fix-path-quoting-for-.def-generator.patch \
            file://0003-gen_def.patch \
-           file://0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch \
            file://SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch \
-           file://0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch \
            "
 
-SRC_URI[md5sum] = "370a6340ff20366ab088012cd13f2b57"
-SRC_URI[sha256sum] = "549c2d21c577a8a9c0450facb5cca809f26591f048e466552240947bdf7a87cc"
+SRC_URI[sha256sum] = "be81ef08baa2516ecda76a77adf7def7bc3227eeb578b9a33b45f7b41dc064e6"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-- 
2.34.1


