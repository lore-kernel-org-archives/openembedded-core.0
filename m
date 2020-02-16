Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 617D260BB6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 19:17:01 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u6so17124833wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OvAY0qqq7FyYMMwDySpDWymHuEZ0b7HJ5DFSz+WtcQg=;
	b=L+iqiWA8YwYDg9gXB7CXN7qVXexIjdJ7qfTeqzy4dO84xlzfl0fTTdkQDTU+OyjxvA
	1sEEhCR4mTTxfK//wR0fV9K5hsYmaaDG1gUfGVlbRUmMtxDBcBW9Yidld7sEg4dx0qmz
	cTfcHQ5tDTV2+d91ZD65os9B7yfjwcO/a8wXWRugCqDs/pKo62I3FF8onSF44vuHpxXG
	d184uwJb1V8AqW7DLm92EHvjjS8/lBiTYlCbH4oywjIuEY75nvajgbR+B5TLhzJ2Ty6W
	xrHuFcycn7w5D+hDzgsWETCZF5s98hm/vMzy8WUZcLKYA9cus3vCC+f4XHh97wQge1+g
	fnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OvAY0qqq7FyYMMwDySpDWymHuEZ0b7HJ5DFSz+WtcQg=;
	b=MxFhCFaE8DBYy3L8pl5wq4mMpw6pqPFt4SVJAbUFbwkNPWfiUh9tgCBIEAxoNbSwI9
	vfe7MeJeAmUKGudDRwYt5rSspAYeXw92oEQxi6igK3Yq25FZ+GeHk5eAyCpRInqqnJoz
	s4yj7eHq09CU3fnQwtSudUL0ufjZMzvGiu5MlD8bdzelqFKAnbMHGP2/CYDl7ymtzgLL
	doiLLFNkn5uJ+02rG5eg/1wtzw8jYuBqSpEJF8X3Ee28Vhk3CronCTursIYM67azKWLU
	aPHtXZ0CL6uJTRyiX1ZWutDRKq6zd+Sy005C0HtE/NTy0x4lbIUEjrL6zx+1QTjgsW2f
	5M0w==
X-Gm-Message-State: APjAAAXAXcdeeIxdr5rGSyoi1dRFvAp1e0tUM4eS/lK/bKW/AbI/Imwf
	P19SDiYgwSStkjgbqph2M9fePGiO
X-Google-Smtp-Source: APXvYqyuEIfWOZxNbq7xdlVlsTpo41REQ+8W9FmNLOwUwvLAcPKUldbwKy5gFGkecs5JpmAkDmKaSg==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr16883058wrt.70.1581880621512; 
	Sun, 16 Feb 2020 11:17:01 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	j15sm13329170wrp.9.2020.02.16.11.17.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 11:17:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 20:16:05 +0100
Message-Id: <20200216191605.25665-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] python3: resolve ncurses host contamination
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
X-List-Received-Date: Sun, 16 Feb 2020 19:17:01 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...fig-append-STAGING_LIBDIR-python-sys.patch |  2 +-
 ...up.py-do-not-add-a-curses-include-pa.patch | 48 +++++++++++++++++++
 ...tutils-prefix-is-inside-staging-area.patch |  2 +-
 meta/recipes-devtools/python/python3_3.8.1.bb |  1 +
 4 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch

diff --git a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
index 03f60088fe..e7af3c6f5c 100644
--- a/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
+++ b/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
@@ -1,4 +1,4 @@
-From 77b7af7859bb925c31c5bcbf33f30569a0bc1d40 Mon Sep 17 00:00:00 2001
+From 7ada9c749f6beb51c13a3debc850755e911548a6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 31 Jan 2019 16:46:30 +0100
 Subject: [PATCH] distutils/sysconfig: append
diff --git a/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
new file mode 100644
index 0000000000..e04a91605c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch
@@ -0,0 +1,48 @@
+From 863c09f640a5dfd33ff22915b0d5fee7bc5df70a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 16 Feb 2020 17:50:25 +0100
+Subject: [PATCH] configure.ac, setup.py: do not add a curses include path from
+ the host
+
+This leads to host contamination, and particularly can cause
+curses modules to fail at runtime if the host curses is configured
+differently to native curses (observed on current OpenSuse Tumbleweed
+as dnf failures).
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 6 ------
+ setup.py     | 2 --
+ 2 files changed, 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 915f475..c911011 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4828,12 +4828,6 @@ then
+   [Define if you have struct stat.st_mtimensec])
+ fi
+ 
+-# first curses header check
+-ac_save_cppflags="$CPPFLAGS"
+-if test "$cross_compiling" = no; then
+-  CPPFLAGS="$CPPFLAGS -I/usr/include/ncursesw"
+-fi
+-
+ AC_CHECK_HEADERS(curses.h ncurses.h)
+ 
+ # On Solaris, term.h requires curses.h
+diff --git a/setup.py b/setup.py
+index b0f1541..7208cd0 100644
+--- a/setup.py
++++ b/setup.py
+@@ -973,8 +973,6 @@ class PyBuildExt(build_ext):
+         panel_library = 'panel'
+         if curses_library == 'ncursesw':
+             curses_defines.append(('HAVE_NCURSESW', '1'))
+-            if not CROSS_COMPILING:
+-                curses_includes.append('/usr/include/ncursesw')
+             # Bug 1464056: If _curses.so links with ncursesw,
+             # _curses_panel.so must link with panelw.
+             panel_library = 'panelw'
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 6fe9839f77..61ac3e71dc 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From b1f68fe102b289a10504fae716a9eaa8677e3c5b Mon Sep 17 00:00:00 2001
+From 251347fc970a397a9cd63ed3f87c5e6c52e15187 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH] python3: Add target and native recipes
diff --git a/meta/recipes-devtools/python/python3_3.8.1.bb b/meta/recipes-devtools/python/python3_3.8.1.bb
index c836066215..77968528c7 100644
--- a/meta/recipes-devtools/python/python3_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3_3.8.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
+           file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.25.0


