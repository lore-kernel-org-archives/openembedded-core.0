Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29160D3A689
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1982.1730228429552156508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qgZ12bGs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e74900866so4412648b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228429; x=1730833229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNWrLayrp+TxUJAJp9MasF8BGxxABVWfGNfXYcPyOmo=;
        b=qgZ12bGsAJwNUxPAH8KBWjUQdxfkiQV7v/0LYCw4DN6yF3KJQThIWfhqM+/u8aVSfK
         GaO0NaXpjH1xt4T+4Ea7ujVYYxiPm7ypG5dvoNSptNerFmwWhA+UCfA3MaFckA2/DpB8
         NjCeEqcVnFDKBdWD2vE0K9bmH2SbyEpl+31obp/rcxnoQZru8jIkjfo8KBz8N7Wj4Xht
         TBBjRma1MMZU6tDfleokOFgJd/sXGkZGPHovoMeu7IHETMJcHhulM1+0UcNr+LGmjiTD
         LmK8LOunY/BNWETBLjWaRzpmWW5KtJzU3MkOHzQbqD46tqaQNp+r7HvwoS4kGpEaLUxr
         FD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228429; x=1730833229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNWrLayrp+TxUJAJp9MasF8BGxxABVWfGNfXYcPyOmo=;
        b=BMkb6pedYj4fFy0Aqy0bgAZBICMIu6+FgmsBsekisog5kNevvyMU48s/QGQXfKDGRu
         E3s0QwISRnn/Oei1iwJEyVTor75KY36Ic8v/hfdo3FIrYaJRpGLVCU3HHPKC3pk3sIQo
         nUIAvhVxEGQ3nctvB+KnU6CG2VJLLMbSsS0ybGpQGASNwp73inG1j87rUwO3xetieZTQ
         YbdEJwzuiuUhUem7aFdKI3h9qXUjhfVszgizeF8XYiaT2bYKnKlRtHRrBeYBGwDZw5nK
         cNVYp8vi6yAtpErFk74Az3XhsbyLU2qYmJWuiJQ6YlX7oy1aPxIMNbHu2AOGdF0yqNEl
         s5Mg==
X-Gm-Message-State: AOJu0Yyu3cWsDq4et4mIa/fU7GtVjkqsOVZYam0EDuc3Rxz3lP+1fTZY
	H2BFBGXVXtooSd0rYW5GSHz7bLZiBMqDhuEeuHYmNvRif049jX+uxKVD+2fOsm68Y0nTPOlJAGO
	e
X-Google-Smtp-Source: AGHT+IHgEBx6c+CuRtClWc3jFc39o6Oz69FlTYHR4MBvXMxOVeHR8+/f7tE+xh6Lbio8KM3I5cGurA==
X-Received: by 2002:a05:6a00:b55:b0:71e:52cd:9cd4 with SMTP id d2e1a72fcca58-72063028d8emr16678075b3a.20.1730228428356;
        Tue, 29 Oct 2024 12:00:28 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.12.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:00:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/19] zip: Fix build with gcc-14
Date: Tue, 29 Oct 2024 11:59:47 -0700
Message-Id: <fd31dd1abc8199a1865801259e6f96b78a17d994.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730228268.git.steve@sakoman.com>
References: <cover.1730228268.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206524

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


