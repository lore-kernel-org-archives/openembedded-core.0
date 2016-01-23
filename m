Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4D69977058
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:15 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e65so4055392pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zvO5tJgECyzNATKCrcV42FLuOh5PrVTJ5Ye/G+OgNy4=;
	b=PPsZRX5cUjNsMYnLqvgBg6LoKSDe+lf1LAJnb11U+yF8K4xpyVwPFdPvFWv53YK8tO
	3TZDI6VoJ9OioJPhICoa3HWdIvQtgPW2R2btushwy1QTxDf+M82HOP1Tp9mzjKosYzSa
	+M57QNf0Ca8RORMBxc/smUmk3Y7aJhsa4yf4b0H0whbnlXY1d94Sb3jWqDl2/jz+sgfc
	skiux4k0BxuRHbsnGQdhbOe9WTWgIdZxU4FW0aAHd6MuDSr3Eg5HxHmOCMvcoAeKqGQG
	ANdDq6VeLfFkOv75anUfU/eV1gGe4PIbRrCSVUc+qumE2x/8vR6I8d+Zx1td0+pVA+mj
	H+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zvO5tJgECyzNATKCrcV42FLuOh5PrVTJ5Ye/G+OgNy4=;
	b=movX5znqG5lI0zdaLCmTgAVwi/8r5uHbjNz0OiFtAooteJrE1GqnMXp58M8ggwHMIl
	SfJWGuYddwn1n+ntdr3FLgie1R5Wnpx8AW+ms/eWynknLbbaRFJAV4cSqqgXYxRpMEBj
	G+nPN16JirIQMiW5VHNOq6+XltCzgI2OzbJSRsbzao310ouJR+ahye5QVGMb1+7wBUA9
	CHX5jeVkzIm9vw4/Mnj5C6C4Wlf6uprwK6Azj0ann5Wrq5TaybOVfZmQFBUNslOmFnuh
	TmbqmT1rdRXWGVregiRjGVB17vtzILOBrA90vuZlyTR01TCTYLOArbxvywdzHequ7bxz
	JKng==
X-Gm-Message-State: AG10YOQbmgUMNtKizLDg86XAXGNjZgWK87cZssGhoQLqKu/5vb5jtohHEVuBU2LNL4Tq/Q==
X-Received: by 10.98.80.79 with SMTP id e76mr8761187pfb.126.1453512376811;
	Fri, 22 Jan 2016 17:26:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:25:59 -0800
Message-Id: <1453512366-11405-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/7] sqlite3: fix the parallel build fix patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Jan 2016 01:26:16 -0000

The previous parallel.patch broke dynamically linking sqlite3 with
libsqlite3.so (ie using the --disable-static-shell configure option).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3/parallel.patch | 46 +++++++++++++---------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-support/sqlite/sqlite3/parallel.patch b/meta/recipes-support/sqlite/sqlite3/parallel.patch
index 87471f0..7b886a6 100644
--- a/meta/recipes-support/sqlite/sqlite3/parallel.patch
+++ b/meta/recipes-support/sqlite/sqlite3/parallel.patch
@@ -1,24 +1,32 @@
-build: Fix parallel build problems
+From 140476c3e6a6f497bdd95c0c039cb9a680f5a414 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Fri, 22 Jan 2016 15:53:04 -0800
+Subject: [PATCH] parallel build fix
 
-Avoid parallel build errors related to sqlite3.o target.
+When statically linking the sqlite3 binary, ensure that it depends on
+its own version of sqlite3.o, instead of the version being built (in
+parallel) for use in the libsqlite3.a static library.
 
 Upstream-Status: Pending
 
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
-diff -Naur sqlite-autoconf-3100000-orig/Makefile.am sqlite-autoconf-3100000/Makefile.am
---- sqlite-autoconf-3100000-orig/Makefile.am	2016-01-06 14:03:00.000000000 +0200
-+++ sqlite-autoconf-3100000/Makefile.am	2016-01-12 13:14:03.620117514 +0200
-@@ -6,10 +6,8 @@
- libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
- 
- bin_PROGRAMS = sqlite3
--sqlite3_SOURCES = shell.c sqlite3.h
--EXTRA_sqlite3_SOURCES = sqlite3.c
--sqlite3_LDADD = @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
--sqlite3_DEPENDENCIES = @EXTRA_SHELL_OBJ@
-+sqlite3_SOURCES = shell.c sqlite3.c sqlite3.h
-+sqlite3_LDADD = @READLINE_LIBS@
- sqlite3_CFLAGS = $(AM_CFLAGS)
- 
- include_HEADERS = sqlite3.h sqlite3ext.h
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index e9b3950..0e8f043 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -129,7 +129,7 @@ AC_ARG_ENABLE(static-shell, [AS_HELP_STRING(
+   [statically link libsqlite3 into shell tool [default=yes]])], 
+   [], [enable_static_shell=yes])
+ if test x"$enable_static_shell" == "xyes"; then
+-  EXTRA_SHELL_OBJ=sqlite3.$OBJEXT
++  EXTRA_SHELL_OBJ=sqlite3-sqlite3.$OBJEXT
+ else
+   EXTRA_SHELL_OBJ=libsqlite3.la
+ fi
+-- 
+1.9.1
+
-- 
1.9.1


