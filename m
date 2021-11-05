Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9591C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 08:48:21 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.2746.1636102100933596979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQZHvfi5;
 spf=pass (domain: gmail.com, ip: 209.85.128.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 71so6420505wma.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWBBomf2z93SqO+dpxg6JtL+coG2HEiXlT+j/npXFWQ=;
        b=MQZHvfi5ooP3+2qC0nz2/x0rVwceELKRpet48TYZUi6L5j5wSnlQDzawcu2S4ibK1y
         kfgxtFJIrXDXzPHXMAjX1kHLRPfwybVgSg7m8bVkQnc0974oVbQS7RDrzTL+zpVbLkOK
         ClxTjPfWKVmRGMNCLe+lbLa47pQm7FGffFAbNSHmAsADYXyKP6+RoYOLRGT5RrMcB/x5
         oIFckr/6gP1cW7K401sxemRCpCirjq6z5O8r90l5mRuE0hIB029HJ1GaYChaJ9m/OkNn
         zYG+rURc0CcqJtyAcwBzbORQ+4pcbzAjEi8qCr9ItcoKvaQ4NakOg1y1GxX7CCImHx9C
         jhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWBBomf2z93SqO+dpxg6JtL+coG2HEiXlT+j/npXFWQ=;
        b=k/rHEoZU6jZmJ+a25pX68uCaYnJ2NOTMahXTyv2c8fzJU5cp19mSpEJ7yrG+YNA/tg
         sDpqiqCs6aGiCqWURnkuF7j9aOA+RU/UAOOUVDL2/SoxrXFJuvAMFRfo5LLimEZoQahY
         rGVaq/Q39R6ovzKRI3EOjUhHoh/h9FFzr9Ze74WAH7S15blVnjJNejM6nW36ZHvVPluN
         Kw9bVcrUOJnxKCxytiejd7FqmYun2v8hyAwdc+nlyH9PPGPNPlOCE+omqgOPINIp/AL/
         Z1Ecw6boAo1JHRunEuygUWefub1ANdc4L9KN++myQNOU8SRSAVhrk5k+nErxZEqihBxV
         BojQ==
X-Gm-Message-State: AOAM5327V2xqvv73HVbPFS+x8jf6Zh3Sc0t8JlrYI4Ehf9bD6ZPhUH/R
	hy/Ti7L1I8X/FFUANsDjLGQC5Yy/oH0=
X-Google-Smtp-Source: 
 ABdhPJwl22QZHSTPF3MNEe32SXCq3pvsMWXl941v5tbV/l7bnngVeX0NVT+louZyKJHmID0/aKFp6A==
X-Received: by 2002:a05:600c:19c8:: with SMTP id
 u8mr792465wmq.155.1636102099482;
        Fri, 05 Nov 2021 01:48:19 -0700 (PDT)
Received: from nereus.lab.linutronix.de. ([109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d7sm7230432wrw.87.2021.11.05.01.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:48:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] perl: backport gdbm 1.2x compatibility fixes
Date: Fri,  5 Nov 2021 09:48:07 +0100
Message-Id: <20211105084812.1828227-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211105084812.1828227-1-alex@linutronix.de>
References: <20211105084812.1828227-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 08:48:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157883

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


