Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F578C2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.54590.1718625952451273467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aIl8Z7na;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-704189f1225so3786605b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625952; x=1719230752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVlxdP51uqmt8V/hYcxzn9OiIxxFFIT1B0IhP+WFgYU=;
        b=aIl8Z7narCYYKP87R10v72JzJRNiCvJGwmBXWufEVsN8sSZnMcvjqf3yjWC0ivAQtN
         U5H/ydIbB4kAHelHfWA09Hdm/bGp0/9J8dQPesX1PPjK+TOZqYa3wKcKiEAMeM4xecp9
         r+ZA6wfmonba8xqppyrTMUH0Dft0IUMf2iir/3veEmvoCx7AdmwQDTsLPjYkwM+945G9
         s80Lj0OqPoe9kjPAq6+EjDHFI19qKlbvYu/mdbzpFyIRj+ucxxn/3jSG/J2P5yiaWDoJ
         X/0DCtcp4MxUGwldfgA9p0Yk+CWl8GinXR8h2mVdOftwLRrEmcByWdnSKRUhv19n92Yp
         YHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625952; x=1719230752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVlxdP51uqmt8V/hYcxzn9OiIxxFFIT1B0IhP+WFgYU=;
        b=IYH7oyYdt9HBJIXWVXDTl1ah4Ia6+QmeKkZ43uRLrG0EnhOjucfu2ElGVyG9Lx5R3w
         sIYmaPnss60DOb4rg6Doa5C5ueOxnYzF9mWRurRlYribjWCa6cpXLyJq4Te0ADciJpX4
         AvaiqlnEvzWWvsaiUsBRLjHbUZHO1dVoaiZvwfQlaTZcVyWs5MB6gm8w6fTL8FhEo7gD
         wGNFNFeq5aItD5Hjd2NjLzSAoT/n9oyYGfu5MGh8j48xyJtbScCFn6sUPfwRfNHHz+3C
         yrLSNAq/X6KIQZTlJtDFuISWz7+WVoUFLEPrBvnjRUZ74vCfdDNX4L5dAvmyGlyvcZKj
         SfaA==
X-Gm-Message-State: AOJu0Yx+xqdoavQBo79apDgogv3Jeu/bHBnr+3OdsK403aPjxHKhxRyl
	A6IVNo9S2NRZqxaHSuhhhGX2vWCwU9PAvgRfKEa5ksZwfg/Q8HD2Kad3GAg3CqSTeLuDoTqgra4
	itJg=
X-Google-Smtp-Source: AGHT+IGatIbwL8WgKxHATsZBqP0GlCN/6BkFQSaaRALZxjXJ0Bauxo+uSZKyLSUGo8zoj5rtnXCfUQ==
X-Received: by 2002:a05:6a20:6a21:b0:1b6:d8bd:c42d with SMTP id adf61e73a8af0-1bae7d98214mr9694253637.4.1718625951595;
        Mon, 17 Jun 2024 05:05:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/22] zip: Fix build with gcc-14
Date: Mon, 17 Jun 2024 05:04:55 -0700
Message-Id: <82d58f8bf63d6af80b5a4ad03d5121f1541ae15d.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200828

From: Khem Raj <raj.khem@gmail.com>

zip's configure fails to link this piece of test code:

  int main() { return closedir(opendir(".")); }

with GCC-14 because it now treats implicit declaration of function
as error, unline older GCC version where it was just a warning
and this test would build fine.

Remove 0002-unix.c-Do-not-redefine-DIR-as-FILE.patch which
is now unnecessary.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3422411eb750c7e960b81676637cfb321dbadefb)
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
index 70df5ab872..ec54206335 100644
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
2.34.1


