Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8852EC04A94
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:54 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.7369.1686734993701845490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fSTcPQUe;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9741caaf9d4so74792066b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734992; x=1689326992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrYFJSG7buc8MBouB+W9LxpFiCMN2wYRgd2+TVNgoq8=;
        b=fSTcPQUe1MV6SEbvwU369AMCGKPRj6qMuChWvT9SzOaEyj4KhPgvA0FZO0hQ9zBxKv
         OE3BpPbugvvGenmXAnystfMUdLS6y1XXI509c9HNQGg4CkQ1yAvuBbq373CaKZeZnL2w
         bdseAlr9JXmsuAY2toQCWK8ASb4vtpp/h/kxChtDNq6rVXqp5ntuJZp+R3Wu2Rrgrx4B
         AEsWHi7vOlgfEEuryEikjqlbuDuKxXRKaZsguZ2waK9ljsp5vI0XWGGV7nkh5E8BbhHa
         GkbddgFPBsPYkoJrh2S18u+Mcf122yjOrQJ7sScHfqnqKJ4JJVhFwYrtH/8Z8lRqyRAD
         lcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734992; x=1689326992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrYFJSG7buc8MBouB+W9LxpFiCMN2wYRgd2+TVNgoq8=;
        b=iqB8FZmEz7+Jk92NiFUzoxWoopRUfP91dH0Dy3JGC0UCIc8Upj2IMAo5FDesDM0jL8
         YC/3/BB6DPbwDy6dkmdtkfn6C6ffN+O0HzW2JWqyUL/LZ3dNWr1jeHnRMWrOjaGpKI/n
         tSFWZ9NJRWYMBL2DAngSK+wwaol1lWCQwbzQQo82U2d+QHUScQnFX25rg5NwLaCdhkaN
         mJ9JUBpnlmDZf3rrCHGpwAHS/9ctJKOwJdxxDAupSdUqOMpofRsK8NbZl2isBkJ/MdY2
         55NAUXZhPR+hTwYOf2IfZ9ZniBVxr8tyxMb8z9o8LOnIV9X7MJE1F2g1PlmekDnaIrbC
         bVtQ==
X-Gm-Message-State: AC+VfDy+9FN7thr7igxsGnfJmigOj/Ew6lmqwrsugj0xP7mnmhSmTfJ3
	GK5PPjxz0kcLvsgy5CtMEaeNPDvQY9A=
X-Google-Smtp-Source: ACHHUZ6s8BufvcnAzO5zHi7pxpAJ9u2ilFzCMA0j4BvHG0L4ggR8GoIqlt6XW53n5CQgDtZy+FOaLA==
X-Received: by 2002:a17:907:2da4:b0:981:a949:2807 with SMTP id gt36-20020a1709072da400b00981a9492807mr9753009ejc.1.1686734992100;
        Wed, 14 Jun 2023 02:29:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 45/55] serf: upgrade 1.3.9 -> 1.3.10
Date: Wed, 14 Jun 2023 11:29:08 +0200
Message-Id: <20230614092918.4065570-45-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182790

As serf is undead, we need to reassess all the remaining patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
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
index 4a5832ac1a5..00000000000
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
index 91ccc8a474a..00000000000
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
index 02fa9e3a062..00000000000
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
index 4105868a7e2..91640d60443 100644
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
index 669f42b8e7c..c6b51452aa3 100644
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
2.30.2


