Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DE0CDB46C
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 08:33:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38126.1781857999648758929
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 01:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IfAe9gRu;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso28089145e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 01:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781857998; x=1782462798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47LNk8txhtYnT5HNBlKtfD6c3xajyCwoDiG9VDU0mps=;
        b=IfAe9gRuO8KBBFzDPypGLzyaRqjwDMEwTgM1B7brhaGsNSo7MfCnT2c9l/TwREUOjr
         nmMogF70UsDrdrEGGwHOAaih5yYuilOiG0mR/NZIg24qY0TvJRIBh6gPlGtDKv3IYcko
         BEYC/rsUCbfxVk+uStn0YCkqlUMTzOPkejsCiUNcsr5yVoHKfSiY5PEewS+Z7hmesH9P
         11bqzaChFeXPkKKW0hgQvFSomcnc/98SdUAWypkHmJosUgglV8LpIDrx7v93uqBvondS
         NOF9T02qWhejLuJ5vnIkLVtsaP0/+fXYxfsNUGOEG2jcy8DhDVpeEBwPcTwUDmMxdp7C
         8O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857998; x=1782462798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47LNk8txhtYnT5HNBlKtfD6c3xajyCwoDiG9VDU0mps=;
        b=ZUVl8Rc8Qk5xig92OTHZrJ7ZlT+Arvud8jGqA1UkF0JioIXV8L9p3K0nviR9xcSL0h
         pLG/sUQq5Kbic3x8r+ppsLsFAyQFiy0sVbFKDoXTEQbD54TujsvCN8vkjsoAuerCbWcA
         yAdYjk5/UQ4cBxIWkCpvINYGZVwF9EE6Od00Xt+Az4O/SaPJrL3PClPzK1Gx/cWb/MOW
         24Ke8CGmwW3qYig61NIf8ENxEiFtUNdq7/vSNJyuiLeACwz90N21GyjBkDqjWSpiDRs/
         hApQfqycud8r/cEyk1EO9prFKK26CyAPEgCLpiXFFcOXpbimBBfGVSmdHrk9MmCfpmuW
         mvDw==
X-Gm-Message-State: AOJu0YxLifePQHn4IO7ewMTd15DTPGRh00HlGQQlbmP83G0YvZgFGpZ4
	7q2E1nhLGYCOxMnUPppCawYOKW5LjONY67DHlPQwnDAPpvSN8texgu4s8KaRGm/t
X-Gm-Gg: AfdE7cliKPwYdemc73IDWOa1VS5+msI79NQC1RU7ckXfiWLYViQddYlaULvODp8ycOp
	Qh0wx4MtE5isfG/EYCw4h73XgkWJhMMHDcAInLNpfb8T3GqyMEyZj/ZStZ+aR2L7CWApXVMH48o
	qJQKzY0hwKszIELhjOUhb0ukHz50GJSpawyxc3TJQHgSWigo/GqgPdqqTo6wD3QXC0stw/O4G9f
	oGVle3yfaJOVeMbkQZBur5vv6p8N98DgwwL6Imf1UsJjqBs6GEUHvJbfy64/XRJKIVxvnvO1+2c
	PyBRLz0V0hTCk1qPJlK5fx/o78VR/XaHXKXB80ZgEJeQDJPuccmF85Rt/Pf1SggNNjnuPRW+LhD
	ULX6Ff+p/YfnbkpF8H+RSPIxgSwr1iUL9bKhENfqLDC3ItVN9x1+qRQ0u4WiwHk28itg3dkHjG9
	zguhYbX/6yPkXJ447XRtK5w6FotpX9qOs9SaDDa7nIifPW22Pc
X-Received: by 2002:a05:600c:e556:10b0:492:37a3:acda with SMTP id 5b1f17b1804b1-49240897a3bmr23042045e9.0.1781857997741;
        Fri, 19 Jun 2026 01:33:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc429a1sm5878368f8f.30.2026.06.19.01.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:33:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/15] parted: upgrade 3.6 -> 3.7
Date: Fri, 19 Jun 2026 10:32:54 +0200
Message-ID: <20260619083305.3505156-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260619083305.3505156-1-alex.kanavin@gmail.com>
References: <20260619083305.3505156-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 08:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239147

From: Alexander Kanavin <alex@linutronix.de>

Drop three patches, as they're either obsolete, or merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...CH-parted-fix-do_version-declaration.patch | 40 -------------------
 ...o-linker-flags-for-libparted-fs-resi.patch | 34 ----------------
 .../parted/files/autoconf-2.73.patch          | 22 ----------
 .../parted/files/fix-doc-mandir.patch         | 14 ++++++-
 .../parted/{parted_3.6.bb => parted_3.7.bb}   |  5 +--
 5 files changed, 13 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
 delete mode 100644 meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
 delete mode 100644 meta/recipes-extended/parted/files/autoconf-2.73.patch
 rename meta/recipes-extended/parted/{parted_3.6.bb => parted_3.7.bb} (88%)

diff --git a/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
deleted file mode 100644
index a8ea7ec4f7..0000000000
--- a/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From eb6bb2e8dfc78ca1a187d07ea29b23a805c61794 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 20 Nov 2024 12:22:22 +0000
-Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
-
-With gcc 15-20241117 compile fails with the below error, update the
-do_version declaration to match the header in command.h
-
-../../parted/parted.c: In function '_init_commands':
-../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
- 2469 |         do_version,
-      |         ^~~~~~~~~~
-      |         |
-      |         int (*)(void)
-In file included from ../../parted/parted.c:28:
-../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
-   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
-      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271]
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Brian C. Lane <bcl@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- parted/parted.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parted/parted.c b/parted/parted.c
-index 3abb52f..fc2aeba 100644
---- a/parted/parted.c
-+++ b/parted/parted.c
-@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
- }
- 
- static int
--do_version ()
-+do_version (PedDevice** dev, PedDisk** diskp)
- {
-     printf ("\n%s\n%s",
-             prog_name,
diff --git a/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch b/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
deleted file mode 100644
index 10354f1ed9..0000000000
--- a/meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1fc88332f7e906294fd889287b9e84cefc7f1586 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 12 Jun 2023 10:40:07 -0700
-Subject: [PATCH] fs: Add libuuid to linker flags for libparted-fs-resize
- library
-
-This library uses uuid_generate function which comes from libuuid and
-hence it should be mentioned on linker cmdline
-
-fixes
-| aarch64-yoe-linux-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: uuid_generate
-| >>> referenced by /mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/fatresize/1.1.0-r0/recipe-sysroot/usr/lib/libparted-fs-resize.so
-
-Upstream-Status: Submitted [https://alioth-lists.debian.net/pipermail/parted-devel/2023-June/005873.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libparted/fs/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
-index 2f345f3..a8970eb 100644
---- a/libparted/fs/Makefile.am
-+++ b/libparted/fs/Makefile.am
-@@ -75,6 +75,7 @@ libparted_fs_resize_la_LDFLAGS =		\
- EXTRA_DIST += fsresize.sym
- libparted_fs_resize_la_DEPENDENCIES = $(sym_file)
- 
-+libparted_fs_resize_la_LIBADD   = $(UUID_LIBS)
- libparted_fs_resize_la_SOURCES = \
-   r/filesys.c			\
-   r/fat/bootsector.c		\
--- 
-2.41.0
-
diff --git a/meta/recipes-extended/parted/files/autoconf-2.73.patch b/meta/recipes-extended/parted/files/autoconf-2.73.patch
deleted file mode 100644
index 63dea88bfc..0000000000
--- a/meta/recipes-extended/parted/files/autoconf-2.73.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-The gnulib largefile macro needs updating to work with autoconf 2.73. Rather
-than the full code:
-
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=f91f633858cf132e50924224c50d6264a92caabb
-
-Just tweak the exiting code to work with 2.73. The next parted upgrade should
-update to new gnulib
-
-Upstream-Status: Inappropriate
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
---- a/m4/largefile.m4
-+++ b/m4/largefile.m4
-@@ -27,7 +27,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # Work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
diff --git a/meta/recipes-extended/parted/files/fix-doc-mandir.patch b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
index 0711d4e297..76551f0b6e 100644
--- a/meta/recipes-extended/parted/files/fix-doc-mandir.patch
+++ b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
@@ -1,3 +1,8 @@
+From fe0f3729a7b6396b0d9cc54897955c1af56fc9db Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Thu, 15 Mar 2012 23:17:52 +0100
+Subject: [PATCH] parted: update to version 3.1
+
 Upstream-Status: Submitted [bug-parted@gnu.org]
 
 | for po in `ls -1 ./*.pt_BR.po 2>/dev/null`; do \
@@ -6,9 +11,14 @@ Upstream-Status: Submitted [bug-parted@gnu.org]
 | Makefile:904: *** Recursive variable `mandir' references itself (eventually).  Stop.
 
 Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ doc/po4a.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- parted-3.1/doc/po4a.mk.orig	2012-03-15 14:09:11.555831872 +0100
-+++ parted-3.1/doc/po4a.mk	2012-03-15 14:10:44.243830985 +0100
+diff --git a/doc/po4a.mk b/doc/po4a.mk
+index aaf4024..9c8672a 100644
+--- a/doc/po4a.mk
++++ b/doc/po4a.mk
 @@ -23,7 +23,7 @@
  # threshold is 80%), it won't be distributed, and the build won't fail.
  #
diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-extended/parted/parted_3.7.bb
similarity index 88%
rename from meta/recipes-extended/parted/parted_3.6.bb
rename to meta/recipes-extended/parted/parted_3.7.bb
index 8f703d162f..dfa3ee163d 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.7.bb
@@ -8,13 +8,10 @@ DEPENDS = "ncurses util-linux virtual/libiconv"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
-           file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch \
-           file://autoconf-2.73.patch \
-           file://0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "3b43dbe33cca0f9a18601ebab56b7852b128ec1a3df3a9b30ccde5e73359e612"
+SRC_URI[sha256sum] = "008de57561a4f3c25a0648e66ed11e7b30be493889b64334a6d70f2c1951ef7b"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
-- 
2.47.3


