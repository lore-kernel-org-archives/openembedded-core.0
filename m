Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id E3CF97FEE6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 13:28:31 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p17so2519523wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 05:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JtzhwN7JSOl1R3wWddeHitYyRY0oLNX1rtzGdFX1lEs=;
	b=j5aXAUkeAFifd9s9K+BZ2idwCeB5rYReYL2MqEx+cSWMZXtTuONPGR/JrNz+QQMSZw
	PxSiouVxLbCJ2HDWCo4oB8EuG0D/eNSybO52TfdCdzYsAqZ1sOEiOyjesIwbvn9jCpJi
	L2AmKCcHnEYFTpjyYffiK+4Ig20EHhNlEP9W8bgjsREXlTf3BKyXZr0PSMdldZDpCkMv
	3pw8cvG/AbKZ+U1p++p79nXYeaFZqaqbbkbXTj7kbWZk0j/Zae7fPiW65T4XA2jrk0zv
	2a56vYXZcnuBeHNVmJjHMS9mklTWjUVsomudxdpNK50EF+JprJHas30uBpNa/Nh71AGN
	hnxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JtzhwN7JSOl1R3wWddeHitYyRY0oLNX1rtzGdFX1lEs=;
	b=h/k/wHz6nsKqDHQdRa3VViNNl9b6CQIreYNVEpbdgG7xUN3T9NvvMUe+HTdyL5kBpA
	1Hvl80Y6PaIFgz7YU6cjmc681jWebYqhZUMBYEKtX47VR5HfOo/hlUCZr9lqnuOn9vH6
	tV3KbyFq2hvnBMR0ghRbmRF4M5jOx/sO1I4zQAgfIMXsRA54N44TW01oeiFQy6cimiM+
	ghNdtNhziCHI+V6rajgdm5zDFnBlMVDg0L2BWNOYEKgF97Wf/LuyFCk3uevZ5h6diqLR
	iJFCfUrHxVJlFqR5L552kDXOmHcGwfWl5x4SZOCXv3JtKz2GxtkvHPtE2HgKja3vW+Sc
	wuqw==
X-Gm-Message-State: APjAAAWE7TqxFn2RSHc/PuBQOTwBQCPn39rqbsBlFRy8FA2dYytE6hpI
	2Wvu+vdf4mkBUNrdf0u1ZThbIxHhQ9Q=
X-Google-Smtp-Source: APXvYqx2btJGsKfhpjOz5aUo4nIn1ZV7eMnGI5gpJPCZiHJM3UDryeliQbYktIyPl9eY9s8/TtxdPQ==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr3713100wmg.18.1578490112471; 
	Wed, 08 Jan 2020 05:28:32 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	x10sm4607028wrp.58.2020.01.08.05.28.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 05:28:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 14:27:56 +0100
Message-Id: <20200108132759.95603-25-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108132759.95603-1-alex.kanavin@gmail.com>
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
Subject: [PATCH 25/28] kbd: fix failing ptests
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
X-List-Received-Date: Wed, 08 Jan 2020 13:28:32 -0000

Some assumptions about where data files are needs to be adjusted.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../kbd/set-proper-path-of-resources.patch    | 58 ++++++++++++++-----
 meta/recipes-core/kbd/kbd_2.2.0.bb            |  4 +-
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
index 5872cef36b7..4b1e5b8eeb8 100644
--- a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
+++ b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
@@ -1,4 +1,4 @@
-From 7f953dd689155bc1224a3369205c310bb5b760a7 Mon Sep 17 00:00:00 2001
+From cb3af8fb072f8999dbb5160bdc95a102b02fd37a Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Fri, 30 Sep 2016 16:49:55 +0800
 Subject: [PATCH] kbd: create ptest sub-package
@@ -19,38 +19,53 @@ run as expected.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 ---
- tests/Makefile.am           | 2 +-
- tests/alt-is-meta.in        | 6 ++----
+ tests/Makefile.am           | 4 ++--
+ tests/alt-is-meta.in        | 2 +-
+ tests/dumpkeys-bkeymap.in   | 4 ++--
  tests/dumpkeys-fulltable.in | 2 +-
- 3 files changed, 4 insertions(+), 6 deletions(-)
+ tests/dumpkeys-mktable.in   | 4 ++--
+ 5 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f32b9aa..973cd26 100644
+index 8d0ab69..5147c28 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -7,7 +7,7 @@ AM_CPPFLAGS = \
+@@ -7,8 +7,8 @@ AM_CPPFLAGS = \
  	-I$(builddir)/../src/libkeymap \
  	-I$(srcdir)/../src/libkbdfile \
  	-I$(builddir)/../src/libkbdfile \
 -	-DDATADIR=\"$(srcdir)\" \
+-	-DABS_DATADIR=\"$(realpath $(srcdir))\" \
 +	-DDATADIR=\".\" \
- 	-DABS_DATADIR=\"$(realpath $(srcdir))\" \
++	-DABS_DATADIR=\"/usr/lib/kbd/ptest/tests\" \
  	-DBUILDDIR=\"$(builddir)\"
  
+ AM_CFLAGS = $(CHECK_CFLAGS) $(CODE_COVERAGE_CFLAGS)
 diff --git a/tests/alt-is-meta.in b/tests/alt-is-meta.in
-index 3a1441f..772fb51 100755
+index 3a1441f..d829f2e 100755
 --- a/tests/alt-is-meta.in
 +++ b/tests/alt-is-meta.in
-@@ -7,10 +7,8 @@ cd "$cwd"
+@@ -7,7 +7,7 @@ cd "$cwd"
  rc=0
  temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
  
 -datadir="@DATADIR@/data/alt-is-meta"
--
--./libkeymap-showmaps "$datadir"/alt-is-meta.map > "$temp" || rc=$?
--cmp -s "$datadir/alt-is-meta.output" "$temp" || rc=$?
-+./libkeymap-showmaps ./alt-is-meta.map > "$temp" || rc=$?
-+cmp -s "./alt-is-meta.output" "$temp" || rc=$?
++datadir="./data/alt-is-meta"
+ 
+ ./libkeymap-showmaps "$datadir"/alt-is-meta.map > "$temp" || rc=$?
+ cmp -s "$datadir/alt-is-meta.output" "$temp" || rc=$?
+diff --git a/tests/dumpkeys-bkeymap.in b/tests/dumpkeys-bkeymap.in
+index 03d4ca2..d1d0e26 100755
+--- a/tests/dumpkeys-bkeymap.in
++++ b/tests/dumpkeys-bkeymap.in
+@@ -9,8 +9,8 @@ temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
+ 
+ datadir="@DATADIR@"
+ 
+-./libkeymap-bkeymap "$datadir/"../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
+-cmp -s "$datadir/data/dumpkeys-bkeymap/bkeymap.bin" "$temp" || rc=$?
++./libkeymap-bkeymap ../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
++cmp -s "./data/dumpkeys-bkeymap/bkeymap.bin" "$temp" || rc=$?
  
  if [ "$rc" != 0 ]; then
  	printf 'failed\n'
@@ -67,3 +82,18 @@ index a3a5ece..67a73ef 100755
  
  check_keymap() {
  	local kmap temp rc
+diff --git a/tests/dumpkeys-mktable.in b/tests/dumpkeys-mktable.in
+index 0f17c40..7e5161d 100755
+--- a/tests/dumpkeys-mktable.in
++++ b/tests/dumpkeys-mktable.in
+@@ -7,8 +7,8 @@ cd "$cwd"
+ rc=0
+ temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
+ 
+-./libkeymap-mktable "@DATADIR@/"../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
+-cmp -s "@DATADIR@/data/dumpkeys-mktable/defkeymap.c" "$temp" || rc=$?
++./libkeymap-mktable ../data/keymaps/i386/qwerty/defkeymap.map > "$temp" || rc=$?
++cmp -s "./data/dumpkeys-mktable/defkeymap.c" "$temp" || rc=$?
+ 
+ if [ "$rc" != 0 ]; then
+ 	printf 'failed\n'
diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
index 88041bc8789..df9b0bb90bd 100644
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
@@ -45,7 +45,9 @@ do_install_ptest() {
 	-e '/^lib.*_SOURCES =/d' -e '/$(EXEEXT):/,/^$/d' ${D}${PTEST_PATH}/tests/Makefile
 
     find ${B}/tests -executable -exec install {} ${D}${PTEST_PATH}/tests \;
-    find ${S}/tests \( -name \*.map -o -name \*.bin -o -name \*.output \) -exec install {} ${D}${PTEST_PATH}/tests \;
+    cp -rf ${S}/tests/data ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/findfile ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/data ${D}${PTEST_PATH}
 
     install -D -m 755 ${S}/config/test-driver ${D}${PTEST_PATH}/config/test-driver
 }
-- 
2.17.1


