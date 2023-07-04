Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E2CC001B1
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:29:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.61472.1688484592910936190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=G+Kfveld;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b852785a65so36692775ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484592; x=1691076592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P2sWadhYM0aUSdfgRYnDSq7/4tz3nejCI8tsCxr970=;
        b=G+Kfveld3jMnjNCSAu5xOdGSzyHNtYiSen66EWEXAuK7e7omLQofoIb++GmJcZ7gcs
         LFEzW1FUZPyCFStximJLqnSNlfjDFuIIOXUZKf+ye6HBgEQ4OYtYuwkieG9+oLr5/Jep
         68eGOAe3d0k22QZAmS1kA0DmqF1jVmHLMrUeMq9hgUI2DevktcedFL+qY+EyiqtMHMe+
         AkfMm91igTg2mt6ZmXRgWySt3+WtaWkb2dACp9oFBPVGBthxWSASpIoXyM0IX4mI/t9+
         WL05T3xYwgGq/HGPNnN6TAvbhLxkyOcu9SMOx+H8RqS7ZPZ0KHVZjUaTAHxe+jWPunMB
         UY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484592; x=1691076592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7P2sWadhYM0aUSdfgRYnDSq7/4tz3nejCI8tsCxr970=;
        b=YL2mXgQFRG1+0K+OaM2NDkIqNkUC8757I291miE1ilhkyram3ND1uKUmddsYGu3z95
         R7xvuHGM9dKk+et1lUm9WIOt5oJp3Q13OFzmxpKXAEGL9udYIl9gCdpbFfUFxdflXFE0
         TSU4Y4z1oN3Xh2OdMP7/fyO27BtkB5AmeX97DuVSFmBNWRRYy7qmlV70U2ftjrlYCR/M
         2MeR9P+Psj71TTeOsApwLVu0Xs56gu0XJlCxEp28G+q7FsdrdXp7XSr9ww6B07Oq+/nm
         9r5glTWuqABwDeknk/Y03VRSkshe+V1ce0rFxvRyOfhPyhrFbnV+WTlFWoi69ifUsd9S
         XozA==
X-Gm-Message-State: AC+VfDy0g4phdVuEtwAvomCEFvP5oVUowGB1qzYpPfS6x2gybyyAI9iT
	4CRUFGrv9gYOhkSg2X3XF3wr2eJ3q+RvkUAaiKpaEQ==
X-Google-Smtp-Source: ACHHUZ5cubII6Ycx/VCOqDJvEjZU3Ylkc7Pdd7nlvhJegQvLKLDnCRfKsZ2MuNvge4eZsZ3Bjz+uiQ==
X-Received: by 2002:a17:902:cecb:b0:1b7:dfbd:4dd3 with SMTP id d11-20020a170902cecb00b001b7dfbd4dd3mr30347640plg.9.1688484591710;
        Tue, 04 Jul 2023 08:29:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.29.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:29:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/30] serf: upgrade 1.3.9 -> 1.3.10
Date: Tue,  4 Jul 2023 05:29:08 -1000
Message-Id: <17a46eee905f0ecfdbebb014533848dc7e906ec7.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183841

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


