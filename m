Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6AED149EC
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 19:52:13 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.4319.1729885927234779228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 12:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/Enz50h;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so30659615e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 12:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729885925; x=1730490725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghnBledP1yzUqGSqGawi8TYM31MGXzBqMy9BdD2Ma6o=;
        b=Y/Enz50hDe4UPYeX74oQxI46ewi/53EVPWNt5k91yCh03E/YR5u2oNBuDlnb7EcsTo
         6sw3Q50j5P9wL9B7qRBTQZjg8az4H2TgEFutF8+ymRx7mBVcsoqgucEmFPw6R9nKrSIN
         39QzZ6fp6wKWTmu5n6grYiEXL1GXZ9wZ8QXILNSS54BtZspyamn2ntPRc/CKanaByVDF
         Zt6Kfm4JbHQJ8pw7h6iw2cck81lxwjhBpXBWALWf7ERQBcb1RIIXU/JcQBZHv/1BnBLF
         0YLLnGxX0BdwwU8jhrb2/aK4NXyEuv/gtBxLHnP1Z64JW87GtuYOB9uNMKXi48h4aBof
         3otQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729885925; x=1730490725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghnBledP1yzUqGSqGawi8TYM31MGXzBqMy9BdD2Ma6o=;
        b=kuZGrYE1kSanSoOW5/Srgix2pLRvcXd2Qm+UGhegisJhpz/12tjNqyZdoedAbBQ6mr
         6IfS4aChA0ixI8UfZ3duB4uGWyehwcRv8A2plJxVj+XUbVyZjqdIp2iw6ty7IyIMPgNY
         zlEUJaXCKzETJVpNju4/AdDLAaqVe+XhVzOoxLXHzCiXId5JiAKv4rKJEDRHai746Wkc
         CJxY10pZ9i91gJqDLb4+YrGU1t3Upl1nvJ/GdVffj2j4bMk2MylKsAS5ApBKAd8mnZk/
         1QQAPNNE8nNTM0M/57PYAwow5p5rQT3mOzzip6oJGr/ddOIVYdoURlqlgUBEL2H7rEaJ
         OFRA==
X-Gm-Message-State: AOJu0YxNtSgHtenZc0aj38mnOtfo5w04ttt35O8UX5zNCtpfOerb+V6/
	+/FR+Mq64VEx00FtczrdR2NZSuLqkS3/kI24z9hHngj5qdPIrBEzESscHw==
X-Google-Smtp-Source: AGHT+IFhgC8xjd1IuYk3L8WTKwAIx9J1lK/w/zw/Y5azJr5s2H67mCzQYe4q5QJT0fvPOhBzAbVvkA==
X-Received: by 2002:a05:600c:5248:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-4319ad065b6mr2516385e9.27.1729885925286;
        Fri, 25 Oct 2024 12:52:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f74b6sm26725915e9.33.2024.10.25.12.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 12:52:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH 2/2] zip: Fix build with gcc-14
Date: Fri, 25 Oct 2024 21:51:54 +0200
Message-ID: <20241025195154.1186400-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025195154.1186400-1-martin.jansa@gmail.com>
References: <20241025195154.1186400-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 19:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206373

From: Khem Raj <raj.khem@gmail.com>

zip's configure fails to link this piece of test code:

  int main() { return closedir(opendir(".")); }

with GCC-14 because it now treats implicit declaration of function
as error, unline older GCC version where it was just a warning
and this test would build fine.

Remove 0002-unix.c-Do-not-redefine-DIR-as-FILE.patch which
is now unnecessary (MJ: this part wasn't applicable for kirkstone).

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3422411eb750c7e960b81676637cfb321dbadefb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...e-dirent.h-for-closedir-opendir-APIs.patch | 45 +++++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 ---------------
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
 3 files changed, 46 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
 delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
new file mode 100644
index 0000000000..0d3af37ded
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
@@ -0,0 +1,45 @@
+From 9db2f8cdbbc0dfb359d3b4e5dfe48c18652ce531 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 May 2024 19:02:46 -0700
+Subject: [PATCH] configure: Include dirent.h for closedir/opendir APIs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC-14 is strict about function prototypes and since the
+testcase tries to compile/link opendir/closedir functions
+without including signatures, it fails to build the test
+due to missing signatures which come from dirent.h
+
+Therefore include the needed system header and make it more
+robust.
+
+Fixes
+a.c:2:21: error: implicit declaration of function ‘closedir’ [-Wimplicit-function-declaration]
+    2 | int main() { return closedir(opendir(".")); }
+      |                     ^~~~~~~~
+a.c:2:30: error: implicit declaration of function ‘opendir’ [-Wimplicit-function-declaration]
+    2 | int main() { return closedir(opendir(".")); }
+      |                              ^~~~~~~
+
+Upstream-Status: Inactive-Upstream
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix/configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/unix/configure b/unix/configure
+index f917086..1dd98c6 100644
+--- a/unix/configure
++++ b/unix/configure
+@@ -591,6 +591,7 @@ $CC $CFLAGS -c conftest.c >/dev/null 2>/dev/null
+ 
+ echo Check for directory libraries
+ cat > conftest.c << _EOF_
++#include <dirent.h>
+ int main() { return closedir(opendir(".")); }
+ _EOF_
+ 
+-- 
+2.45.0
+
diff --git a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch b/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
deleted file mode 100644
index a86e03e620..0000000000
--- a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 76f5bf3546d826dcbc03acbefcf0b10b972bf136 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Aug 2022 17:19:38 -0700
-Subject: [PATCH 2/2] unix.c: Do not redefine DIR as FILE
-
-DIR is already provided on Linux via
-/usr/include/dirent.h system header
-
-Upstream-Status: Inactive-Upstream
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- unix/unix.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/unix/unix.c b/unix/unix.c
-index ba87614..6e6f4d2 100644
---- a/unix/unix.c
-+++ b/unix/unix.c
-@@ -61,13 +61,11 @@ local time_t label_utim = 0;
- /* Local functions */
- local char *readd OF((DIR *));
- 
--
- #ifdef NO_DIR                    /* for AT&T 3B1 */
- #include <sys/dir.h>
- #ifndef dirent
- #  define dirent direct
- #endif
--typedef FILE DIR;
- /*
- **  Apparently originally by Rich Salz.
- **  Cleaned up and modified by James W. Birdsall.
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index b6ec3cd9ad..94de3715d2 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -18,8 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
-           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
+           file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.47.0


