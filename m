Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F594E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.28166.1735901141092687565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GMRdWBQk;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso120743485e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901139; x=1736505939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GzbU6BTATjxalP8XwIJuy3Y78fCF4kuURLQS5ICwEvU=;
        b=GMRdWBQkILT53yJPZhcY2OxHvVDSN5vii3yApmKOWJa3hUup3H3beY6vBvRO0CZ1X3
         3yOy18gC+ZPW3zIiGfXY521JAaYcYEWGwZEEi/3ByqXF61a8GlpOSafxTzK1hAlB+IrJ
         /NxFe3SiwNxz7e7YeczMRoNXIK1kjPZLt+p+w6Tf9+AU4tJRpWd95nbSjvXVK/Dl3+nT
         AhQbRB1J8P0K6ybEMHgkngNQ+X0mIWqBC1eB3V7L404eSXlTOhvKpgJ0SAeCJsqh6IL7
         yyVAv5lUHPcv6eARVxuVXY3heqhvvDzGU07axwjIUx2zDwrIBHqx/iV4Os5CHHfOnwgr
         3UHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901139; x=1736505939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzbU6BTATjxalP8XwIJuy3Y78fCF4kuURLQS5ICwEvU=;
        b=Z1t8bHFpRxmmP1E62dRC2onl+qXM4NYya6dosPzGYl9saGXzo2F3e6MrJKo10Mz3kR
         zmETCaswuOMW6U9q702smWN7IMT9+J2G9rY/FEvsEpBpE2q/YQSBuI/0oMcsOaZady5+
         HYqAPq7QZFu5C7gL0qjZ5ztIAww42DKr2dJSoYoyGgHFTmaPIQJB2sOsWUC4l9EpVFd0
         if5EPPlFWkZKpIjEFwJ+6L+nUY2LZX85SCoI0n5pICbba8pssWm5zyweOrHmiIQuKxlp
         Tx3OeQk/dULr3GQ7b89jiALHRDNzsjCobBE+yX3+CgOJPVPnPGzacQ4dtZF3mLzTjwv+
         DiXg==
X-Gm-Message-State: AOJu0YwvgZyiXx7xGaim7mtRxE40p+1K2pegkLOsGgWB5pQgzp+WHRQ8
	Xn3RkNnvBYugXE3V9w0X6ECdSRgq7X37KsZroBrCmL3zXR9GHPBvJHqfYg==
X-Gm-Gg: ASbGncsvXy5CQg60U3cC0W63CS00PIQNQHC/96t2PuLMjModWk3Z45tppfMosb1B+Lm
	uXLF6t/32qYR+cCeSAo3uJ/7fYEZmS4w/yJse4hsAfqt2gGWKb6pMrHsnG7Eu0EipleQroqI1Eh
	+nE9lKvXM/yMeYddOya0AdB5v1IxoAQ9Qsk6PTuy9LQawOhsjkORHAoY/4UJ+c2hzMKfZEKCbkp
	lNARKx0SM8dCUeccUNGXPkzWpklQxGB+eB6+0GyRdvm34+EDB+Q9RKitXKh833EjLs0z47zlelW
	DsrLSIgvHDMaUmV0XQ==
X-Google-Smtp-Source: AGHT+IE4Gj+feChXDbqiubwyX03CUbjgaSZTt7/x5vQfPHAc4X9mTEgSjtysBN5MDgwC7lGJFA3IYA==
X-Received: by 2002:a7b:cd98:0:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4366b2f95c5mr406720675e9.4.1735901139310;
        Fri, 03 Jan 2025 02:45:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/11] file: upgrade 5.45 -> 5.46
Date: Fri,  3 Jan 2025 11:45:24 +0100
Message-Id: <20250103104524.4053846-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209342

From: Alexander Kanavin <alex@linutronix.de>

Drop patch merged upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../file/{file_5.45.bb => file_5.46.bb}       |  7 +-
 ...0001-PR-579-net147-Fix-stack-overrun.patch | 33 +++++++
 ...-reset-previous-negative-offset-in-m.patch | 93 +++++++++++++++++++
 .../recipes-devtools/file/files/print_c.patch | 27 ------
 4 files changed, 130 insertions(+), 30 deletions(-)
 rename meta/recipes-devtools/file/{file_5.45.bb => file_5.46.bb} (90%)
 create mode 100644 meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch
 create mode 100644 meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch
 delete mode 100644 meta/recipes-devtools/file/files/print_c.patch

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.46.bb
similarity index 90%
rename from meta/recipes-devtools/file/file_5.45.bb
rename to meta/recipes-devtools/file/file_5.46.bb
index fa8dc576dcc..e97fac99f21 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.46.bb
@@ -12,10 +12,11 @@ DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
-           file://print_c.patch \
-          "
+           file://0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch \
+           file://0001-PR-579-net147-Fix-stack-overrun.patch \
+           "
 
-SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
+SRCREV = "c5aa4f7f8d5063fb3c37ad57bf54bb67ec641a09"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
diff --git a/meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch b/meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch
new file mode 100644
index 00000000000..57725b1c5f5
--- /dev/null
+++ b/meta/recipes-devtools/file/files/0001-PR-579-net147-Fix-stack-overrun.patch
@@ -0,0 +1,33 @@
+From fc6b51aa67a11806c95363e1bec925d15b3a98a5 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Thu, 5 Dec 2024 18:35:40 +0000
+Subject: [PATCH] PR/579: net147: Fix stack overrun.
+
+Upstream-Status: Backport [https://github.com/file/file/commit/b3384a1fbfa1fee99986e5750ab8e700de4f24ad]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/readelf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index fe4cf541..d209d86d 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -27,7 +27,7 @@
+ #include "file.h"
+ 
+ #ifndef lint
+-FILE_RCSID("@(#)$File: readelf.c,v 1.196 2024/11/11 15:49:11 christos Exp $")
++FILE_RCSID("@(#)$File: readelf.c,v 1.197 2024/12/05 18:35:40 christos Exp $")
+ #endif
+ 
+ #ifdef BUILTIN_ELF
+@@ -1726,7 +1726,7 @@ dophn_exec(struct magic_set *ms, int clazz, int swap, int fd, off_t off,
+ 	Elf64_Phdr ph64;
+ 	const char *linking_style;
+ 	unsigned char nbuf[NBUFSIZE];
+-	char interp[128];
++	char interp[NBUFSIZE];
+ 	ssize_t bufsize;
+ 	size_t offset, align, need = 0;
+ 	int pie = 0, dynamic = 0;
diff --git a/meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch b/meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch
new file mode 100644
index 00000000000..7601e6dead0
--- /dev/null
+++ b/meta/recipes-devtools/file/files/0001-Use-4-in-default-reset-previous-negative-offset-in-m.patch
@@ -0,0 +1,93 @@
+From b310a0c2d3e4a1c12d579ad5c0266f1092a91340 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Wed, 27 Nov 2024 15:37:46 +0000
+Subject: [PATCH] Use +4 in default reset previous negative offset in magic in
+ zip entry
+
+Upstream-Status: Backport [https://github.com/file/file/commit/b310a0c2d3e4a1c12d579ad5c0266f1092a91340]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ magic/Magdir/archive | 50 +++++++++++++++++++++++---------------------
+ 1 file changed, 26 insertions(+), 24 deletions(-)
+
+diff --git a/magic/Magdir/archive b/magic/Magdir/archive
+index c8f440dc..b920f993 100644
+--- a/magic/Magdir/archive
++++ b/magic/Magdir/archive
+@@ -1,5 +1,5 @@
+ #------------------------------------------------------------------------------
+-# $File: archive,v 1.206 2024/11/26 19:39:14 christos Exp $
++# $File: archive,v 1.207 2024/11/27 15:37:46 christos Exp $
+ # archive:  file(1) magic for archive formats (see also "msdos" for self-
+ #           extracting compressed archives)
+ #
+@@ -1875,15 +1875,6 @@
+ >>>>>-22	string	PK\005\006
+ >>>>>>(-6.l-16)	string	APK\x20Sig\x20Block\x2042	\b, with APK Signing Block
+ 
+-# Keyman Compiled Package File (keyman.com)
+-# https://help.keyman.com/developer/current-version/reference/file-types/kmp
+-# Find start of central directory
+->>>(-6.l)	string		PK\001\002
+-# Scan central directory for string 'kmp.json', will suffice for a
+-# package containing about 150 files
+->>>>(-6.l)	search/9000	kmp.json	Keyman Compiled Package File
+-!:mime	application/vnd.keyman.kmp+zip
+-!:ext kmp
+ 
+ # Specialised zip formats which start with a member named 'mimetype'
+ # (stored uncompressed, with no 'extra field') containing the file's MIME type.
+@@ -2123,25 +2114,36 @@
+ #>30	search/100/b application/epub+zip	EPUB document
+ #!:mime application/epub+zip
+ 
+-# Generic zip archives (Greg Roelofs, c/o zip-bugs@wkuvx1.wku.edu)
+-#   Next line excludes specialized formats:
++# APK Signing Block
+ >(26.s+30)	leshort	!0xcafe
+ >>30	search/100/b !application/epub+zip
+->>>26    string          !\x8\0\0\0mimetype	Zip archive data
+-!:mime	application/zip
+->>>>4	beshort		x			\b, at least
+->>>>4	use		zipversion
+->>>>4	beshort		x			to extract
+->>>>8	beshort		x			\b, compression method=
+->>>>8	use		zipcompression
+->>>>0x161	string		WINZIP		\b, WinZIP self-extracting
+-# APK Signing Block
+->0	default	x
+->>-22	string	PK\005\006
+->>>(-6.l-16)	string	APK\x20Sig\x20Block\x2042	Android package (APK), with APK Signing Block
++>>>26    string          !\x8\0\0\0mimetype
++>>>>-22	string	PK\005\006
++>>>>>(-6.l-16)	string	APK\x20Sig\x20Block\x2042	Android package (APK), with APK Signing Block
+ !:mime	application/vnd.android.package-archive
+ !:ext	apk
+ 
++# Keyman Compiled Package File (keyman.com)
++# https://help.keyman.com/developer/current-version/reference/file-types/kmp
++# Find start of central directory
++>>>>>(-6.l)	string		PK\001\002
++# Scan central directory for string 'kmp.json', will suffice for a
++# package containing about 150 files
++>>>>>>(-6.l)	search/9000	kmp.json	Keyman Compiled Package File
++!:mime	application/vnd.keyman.kmp+zip
++!:ext kmp
++
++# Generic zip archives (Greg Roelofs, c/o zip-bugs@wkuvx1.wku.edu)
++#   Next line excludes specialized formats:
++>>>>+4	default		x
++>>>>>4	beshort		x			Zip archive data, at least
++!:mime	application/zip
++>>>>>4	use		zipversion
++>>>>>4	beshort		x			to extract
++>>>>>8	beshort		x			\b, compression method=
++>>>>>8	use		zipcompression
++>>>>>0x161	string		WINZIP		\b, WinZIP self-extracting
++
+ # Zip archives (Greg Roelofs, c/o zip-bugs@wkuvx1.wku.edu)
+ 0	string		PK\005\006	Zip archive data (empty)
+ !:mime application/zip
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/file/files/print_c.patch b/meta/recipes-devtools/file/files/print_c.patch
deleted file mode 100644
index 760813f9c28..00000000000
--- a/meta/recipes-devtools/file/files/print_c.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e329257b8e22362b62e6c930447ef6feadd63f32 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Mon, 7 Aug 2023 22:37:19 +0000
-Subject: [PATCH] print.c: initialize timezone data for localtime_r()
-
-The man page for localtime() points out that while it acts
-like tzset() has been called, localtime_r() might not.  We
-have a local version of localtime_r() that avoids this, but
-we do not compile it.
-
-Upstream-Status: Submitted [file@astron.com]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- src/print.c | 1 +
- 1 file changed, 1 insertion(+)
-
---- git.orig/src/print.c
-+++ git/src/print.c
-@@ -289,6 +289,7 @@ file_fmtdatetime(char *buf, size_t bsize
- 		goto out;
- 
- 	if (flags & FILE_T_LOCAL) {
-+		tzset();
- 		tm = localtime_r(&t, &tmz);
- 	} else {
- 		tm = gmtime_r(&t, &tmz);
-- 
2.39.5


