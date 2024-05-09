Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B630C04FFE
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 02:38:57 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1055.1715222335176342192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 19:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RDXaYPSl;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f447976de7so427800b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 19:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715222334; x=1715827134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwx9WvMKCaeUXVf84YKcdCco2VobnoUOq4sS1x/vjEY=;
        b=RDXaYPSl+ED+ay8eJj8S0Ggi5PfU+s0VdLsIhUOTPh1oS8RIkkyLwgpiclBfIxBXLs
         BgmKRAr5bMSqxsUSoVVqJcCZWGnF791ey6+co2LBP+rhejxMwthVh18Q61JD8wW56ooB
         loL4A3vm+9r29HLXyuakunAxGCgao4x4JGwe4XJ1HldoLBsW3dqSzSnnRY6tqHhn3liD
         IFLgwOCK7Z3xkI94tEiKQCRmF80K+hFa6tVQ9oE8Bh/xcdxQ+EzFzd5QXOXQb58RQNAM
         RGUkCbtyLTeiR+VV1tNAw5vp1g4/nkYLspKLYYjNla+TdKHAu7G00dEFarfpARONRvMn
         XzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715222334; x=1715827134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwx9WvMKCaeUXVf84YKcdCco2VobnoUOq4sS1x/vjEY=;
        b=vOe4rurySLr9zCyEe8/q1KQM/Nlh/QK8bHobjhaWZxhSYdcuYIrFpNfSezjtc3PPV3
         eYNembtN8+iHSK3YHF7NO7hqDyVSdiDXB2naiIvfdkMSnKMnKUC0sc8rrFVV9jark790
         KKhPGXJ/D7Hor1BrmT8vZRcdSd4WP1TLvM/BmhPPRTXhmrRjQ3fyz59cKk6fMvIFECS6
         FlDO+Mb7anWPn0CKnVGBAy2urFE0olWi5HBHhvkjD6aTivY4f0UZ3d9l9PTGfZhoKaPu
         p9orsdhFrVztN3ln3kmEtFb5Q56syTeeCXxaiGAjTv+T/k4CDbFCto/8fmjxd8Lvq6/h
         ujtg==
X-Gm-Message-State: AOJu0Yxw//cW9HtSifO5dn3y5UdBmgSRKOe94moWAgM+2fPa62YMkU6R
	uvPWJzTnI8OaJs+oLXKjwFwulog0FoSoIVfdP5D9vOjB82h9GF1UjNRoX8ns
X-Google-Smtp-Source: AGHT+IHnnOoWZuv1w/80BwDFwsJ5uZ3iyRiFGzl6c7YniOCX4kcnT76dp+srdW+/b71FXlic8/61MQ==
X-Received: by 2002:aa7:8c10:0:b0:6e6:ccec:fdc0 with SMTP id d2e1a72fcca58-6f49c2bfd01mr4907142b3a.33.1715222334090;
        Wed, 08 May 2024 19:38:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a6664dsm270274b3a.12.2024.05.08.19.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 19:38:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH V2] zip: Fix build with gcc-14
Date: Wed,  8 May 2024 19:38:48 -0700
Message-ID: <20240509023848.586972-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 02:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199136

zip's configure fails to link this piece of test code:

  int main() { return closedir(opendir(".")); }

with GCC-14 because it now treats implicit declaration of function
as error, unline older GCC version where it was just a warning
and this test would build fine.

Remove 0002-unix.c-Do-not-redefine-DIR-as-FILE.patch which
is now unnecessary.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Redo the patches differently

 ...e-dirent.h-for-closedir-opendir-APIs.patch | 45 +++++++++++++++++++
 ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 ---------------
 meta/recipes-extended/zip/zip_3.0.bb          |  2 +-
 3 files changed, 46 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
 delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch b/meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
new file mode 100644
index 00000000000..0d3af37ded2
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
index a86e03e6203..00000000000
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
index 70df5ab8728..ec542063357 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
            file://0002-configure-support-PIC-code-build.patch \
            file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
            file://0001-configure-Specify-correct-function-signatures-and-de.patch \
-           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
            file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
+           file://0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.45.0


