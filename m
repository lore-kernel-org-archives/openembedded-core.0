Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8423EC43219
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.6562.1635842608350998694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n2TgeBfW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso1169298wmd.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWBBomf2z93SqO+dpxg6JtL+coG2HEiXlT+j/npXFWQ=;
        b=n2TgeBfW2QTjzMot+2Agnl8PbC1EleDCpRDNcsgC/TgiXrwjvOIf6nLpqDu+0e0l4w
         R+QgKWllvUsoWsp5GwDtVh0j7efrhA1r6hOmKj1czVlb8HL81497uUwakdPa07xTTiuZ
         t5N8YLhwc9LgQdQs1SQUuBnNs9AwildFHxKis/SYkS2H5LteVb2ooH5GBaH8fCSj5kJu
         6yTe38ajJb53VhRF3/uO2p970oSFh1B5ucziZJH42gOcT4bN5hOrEMtbi52uFUPJv9fs
         KJSEiCvGSktXH+cAsdyGzAJlcWQ+hzRJxAYfKMW3BvAaqOBcwDSsokAwetCtTxsUWLmO
         CsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWBBomf2z93SqO+dpxg6JtL+coG2HEiXlT+j/npXFWQ=;
        b=KwTy4Fk6EvgrCdbvXXWh98tew3p7VIe7fNmoWn+s1gfnSB8+Pab3zVDR+cUSwpErF+
         QaKqlWXCDuipMJ7lvcny/+Y/r6LTWRGXQIv2dbWF51cD/3B/4X6mYwX92iFuz0P5DYS7
         dfLOecTIdoi3S8i/K0EAwDHsqFp3MbK+6AL0ndemVOB37XSwcah28iCrHdK10vvXbmpN
         tvsgxBfIw9tx96LFZlrYRPnfdKynfRNkC62D2PhGNZfn5ia57m4imdIt6BHNM5svcEOV
         kFQFOU9ex3No+Fa9p7QELKnjrZIEZZOnpvImowztCyCKmqXpOvk+eR7YhnKFYW2qexVu
         gZgw==
X-Gm-Message-State: AOAM531PUfItkvlLrIuerqjAq/5P4Ki3U12P74p9A5PgRWH9TsEoxFaS
	3ZwW5WHv0GPxAkTbdbwwIEwPRvXLgjI=
X-Google-Smtp-Source: 
 ABdhPJwBhJbY8+H46En69aouz5lTowr0aYFNoNZk032+95pwVbbACvjZ5Ny4PRjM9RpPmsLt5BeIaA==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr5440892wmk.40.1635842606902;
        Tue, 02 Nov 2021 01:43:26 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 33/33] perl: backport gdbm 1.2x compatibility fixes
Date: Tue,  2 Nov 2021 09:43:03 +0100
Message-Id: <20211102084303.2974802-33-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157771

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e5fdd87aa205011512cd1e6cc655bcf677fd.patch | 31 ++++++++++++++
 ...2398e766500cb5d83c4d76b642fcf31d997a.patch | 40 +++++++++++++++++++
 ...297a58b8f10ab885c19eec48ea076116cc1f.patch | 25 ++++++++++++
 meta/recipes-devtools/perl/perl_5.34.0.bb     |  3 ++
 4 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
 create mode 100644 meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
 create mode 100644 meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch

diff --git a/meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch b/meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
new file mode 100644
index 0000000000..1cb65d932c
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch
@@ -0,0 +1,31 @@
+From 5bc1e5fdd87aa205011512cd1e6cc655bcf677fd Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Wed, 23 Jun 2021 15:31:42 +0300
+Subject: [PATCH] Fix definition of ITEM_NOT_FOUND for pre-1.13 versions.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ext/GDBM_File/GDBM_File.xs | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/ext/GDBM_File/GDBM_File.xs b/ext/GDBM_File/GDBM_File.xs
+index 494c2889ca89..0125b5dcac4d 100644
+--- a/ext/GDBM_File/GDBM_File.xs
++++ b/ext/GDBM_File/GDBM_File.xs
+@@ -145,10 +145,11 @@ output_datum(pTHX_ SV *arg, char *str, int size)
+ #define gdbm_setopt(db,optflag,optval,optlen) not_here("gdbm_setopt")
+ #endif
+ 
+-#if GDBM_VERSION_MAJOR == 1 && GDBM_VERSION_MINOR < 13        
+-/* Prior to 1.13, gdbm_fetch family functions set gdbm_errno to GDBM_NO_ERROR
+-   if the requested key did not exist */
+-# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_NO_ERROR)
++#if GDBM_VERSION_MAJOR == 1 && GDBM_VERSION_MINOR < 13
++/* Prior to 1.13, only gdbm_fetch set GDBM_ITEM_NOT_FOUND if the requested
++   key did not exist.  Other similar function wouls set GDBM_NO_ERROR instead.
++   The GDBM_ITEM_NOT_FOUND existeds as early as in 1.7.3 */
++# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_NO_ERROR || gdbm_errno == GDBM_ITEM_NOT_FOUND)
+ #else
+ # define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_ITEM_NOT_FOUND)
+ #endif
diff --git a/meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch b/meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
new file mode 100644
index 0000000000..628903f41c
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/aacd2398e766500cb5d83c4d76b642fcf31d997a.patch
@@ -0,0 +1,40 @@
+From aacd2398e766500cb5d83c4d76b642fcf31d997a Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Wed, 23 Jun 2021 10:26:50 +0300
+Subject: [PATCH] Fix GDBM_File to compile with version 1.20 and earlier
+
+* ext/GDBM_File/GDBM_File.xs (ITEM_NOT_FOUND): Define conditionally,
+depending on the GDBM_VERSION_MAJOR and GDBM_VERSION_MINOR.
+Don't assume GDBM_ITEM_NOT_FOUND is a define (it isn't since
+gdbm commit d3e27957).
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ ext/GDBM_File/GDBM_File.xs | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/ext/GDBM_File/GDBM_File.xs b/ext/GDBM_File/GDBM_File.xs
+index cd0bb6f26ffa..494c2889ca89 100644
+--- a/ext/GDBM_File/GDBM_File.xs
++++ b/ext/GDBM_File/GDBM_File.xs
+@@ -145,14 +145,13 @@ output_datum(pTHX_ SV *arg, char *str, int size)
+ #define gdbm_setopt(db,optflag,optval,optlen) not_here("gdbm_setopt")
+ #endif
+ 
+-#ifndef GDBM_ITEM_NOT_FOUND
+-# define GDBM_ITEM_NOT_FOUND GDBM_NO_ERROR
+-#endif
+-
++#if GDBM_VERSION_MAJOR == 1 && GDBM_VERSION_MINOR < 13        
+ /* Prior to 1.13, gdbm_fetch family functions set gdbm_errno to GDBM_NO_ERROR
+    if the requested key did not exist */
+-#define ITEM_NOT_FOUND()                                                \
+-    (gdbm_errno == GDBM_ITEM_NOT_FOUND || gdbm_errno == GDBM_NO_ERROR)
++# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_NO_ERROR)
++#else
++# define ITEM_NOT_FOUND()  (gdbm_errno == GDBM_ITEM_NOT_FOUND)
++#endif
+ 
+ #define CHECKDB(db) do {                        \
+     if (!db->dbp) {                             \
diff --git a/meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch b/meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch
new file mode 100644
index 0000000000..3864f1a121
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/ea57297a58b8f10ab885c19eec48ea076116cc1f.patch
@@ -0,0 +1,25 @@
+From ea57297a58b8f10ab885c19eec48ea076116cc1f Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Wed, 23 Jun 2021 14:24:47 +0300
+Subject: [PATCH] Raise version number in ext/GDBM_File/GDBM_File.pm
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ ext/GDBM_File/GDBM_File.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/GDBM_File/GDBM_File.pm b/ext/GDBM_File/GDBM_File.pm
+index d837536f804c..cb08d091b829 100644
+--- a/ext/GDBM_File/GDBM_File.pm
++++ b/ext/GDBM_File/GDBM_File.pm
+@@ -363,7 +363,7 @@ require XSLoader;
+ );
+ 
+ # This module isn't dual life, so no need for dev version numbers.
+-$VERSION = '1.19';
++$VERSION = '1.20';
+ 
+ XSLoader::load();
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 89de558979..16d45ccff3 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -18,6 +18,9 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://CVE-2021-36770.patch \
+           file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
+           file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
+           file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.20.1


