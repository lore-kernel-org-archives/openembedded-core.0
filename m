Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88933CF9C73
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:12:24 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.15104.1727187137411129480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=b9D94suJ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4585e250f9dso33731871cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727187136; x=1727791936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dA0wv7BPJukgRQ8wujBlDQ0hLRbUBWXz06G8k73Em74=;
        b=b9D94suJv3/Mn4CdSHe0/BoGnQ3/Gmoa/AVnWFSsh0DSzvXH8Xg1G8FlSNaQeJKXQz
         jUY2jNtfEaLlGlVthAI+We9LsBAH7UTnARfRjRxw2UCndbEqH4/aqwy8kuGTQZG7Vui6
         fGg6Gh30yJdhqnzLEY0F8+P12kf8mv42oVZaVkq4RkCmRXhIlRhFzLJDoDeFgbChXFDZ
         EMPlS6rdKgkdG+n9N0EnRvz48X46ZwrNsiQYDH41njIrJytrU81MBXJe1Hs4+5ONC7TJ
         qpmWvYe31ku9ULXT6cri5F2qZbBrHGkrrjJCpdY+48avY8Fw9QwQjRzkD2ohLGpO/STp
         kd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187136; x=1727791936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dA0wv7BPJukgRQ8wujBlDQ0hLRbUBWXz06G8k73Em74=;
        b=ARWYMcMCLhlBs2s1E80ifglHCm1AuZy1PVz7dK45DMV0rivAYaHeqsjITjIfSJniYh
         DrMXBhvtNLVFXwanzfU5iVDVCviYC9yUQ246ooQ3mE1ou6beo11YFxXe9eBZmDX1clng
         nRksizNp+05aRqYgdWwFQ9QEKgWGF7kc+m0equR7nd+IbVHKYj7Q8GLpvlmfkN3x5M6V
         E/keR/5cTKOUiozvYlQb96Z3QcfC6/H22hbQT13aH4MfT7s7bu+UWKKbki1R4tOQh1Gl
         TDekqfyxR4o+Issb200VE8RHbZAk+opw4bSpvr+qGg7ndp4+2lbBzXZDXEBVN4SDrHxi
         gn5w==
X-Gm-Message-State: AOJu0YznZGIr6KSEv/i8CTWgV5DJlsJjUYpN1/8x5PY/HkgvVipJ+4mG
	PKf1bf5GC6UClwFFlxh6wiWEIqxJTAEsL/Wm1crtXblDw4Hq3LgKJKtPlD5OfETP5pFd7M3eanG
	5VHA=
X-Google-Smtp-Source: AGHT+IFKXhJL+DutgDvP9DdFm+2Kkto4zwi2Qg1x59RCOMZoz8WO7eUc/UVx345QsEi54azsUb9htA==
X-Received: by 2002:a05:622a:30a:b0:456:7fc9:6488 with SMTP id d75a77b69052e-45b204e043amr215337201cf.1.1727187136108;
        Tue, 24 Sep 2024 07:12:16 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b526924d7sm6620711cf.87.2024.09.24.07.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:12:15 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] python3-dtc: upgrade 1.7.0 -> 1.7.1
Date: Tue, 24 Sep 2024 10:12:12 -0400
Message-Id: <20240924141212.2579675-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924141212.2579675-1-tgamblin@baylibre.com>
References: <20240924141212.2579675-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204868

Patch '0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch'
had to be adjusted to apply on the latest version.

Changelog:

99031e3 (tag: v1.7.1, origin/master, origin/main, origin/HEAD, master) Bump version to v1.7.1
3d5e376 setup: Move setting of srcdir down to the bottom
e277553 setup: Collect top-level code together
7e5a889 setup: Move version and full_description into a function
78b6a85 Tidy up some pylint warnings
3501d37 Require Python 3
bcd02b5 fdtoverlay: remove wrong singular article in a comment
84b056a checks: relax graph checks for overlays
1df7b04 pylibfdt/Makefile.pylibfdt: use project's flags to compile the extension
61e88fd libfdt: overlay: Fix phandle overwrite check for new subtrees
49d3089 meson: fix installation with meson-python
d54aaf9 pylibfdt: clean up python build directory
ab86f1e pylibfdt: add VERSION.txt to Python sdist
7b8a30e pylibfdt: fix Python version
ff4f17e pylibfdt/Makefile.pylibfdt: fix Python library being rebuild during install
9e313b1 pylibfdt/meson.build: fix Python library being rebuilt during install
d598fc3 tests/run_tests.sh: fix Meson library path being dropped
b98239d tests/meson.build: fix python and yaml tests not running
c17d76a checks: Check the overall length of "interrupt-map"
ae26223 libfdt: overlay: Refactor overlay_fixup_phandle
4dd831a libfdt: tests: Update test case for overlay_bad_fixup
e6d2942 tests: Remove two_roots and named_root from LIBTREE_TESTS_L and add all dtb filenames generated by dumptrees to TESTS_TREES_L in Makefile.tests
855c934 tests: fix tests broken under Meson
4fd3f4f github: enforce testing pylibfdt and yaml support
9ca7d62 meson: split run-tests by type
bb51223 meson: fix dependencies of tests
e819006 meson: fix pylibfdt missing dependency on libfdt
8221238 pylibfdt: fix get_mem_rsv for newer Python versions
1fad065 libfdt: overlay: ensure that existing phandles are not overwritten
b0aacd0 github: add windows/msys CI build
ae97d97 github: Don't accidentally suppress test errors
057a7db github: Display meson test logs on failure
92b5d4e pylibfdt: Remove some apparently deprecated options from setup.py
417e329 github: Update to newer checkout action
5e6cefa fix MinGW format attribute
24f6001 libfdt: Simplify adjustment of values for local fixups
da39ee0 libfdt: rework shared/static libraries
a669223 Makefile: do not hardcode the `install` program path
3fbfdd0 libfdt: fix duplicate meson target
dcef5f8 tests: use correct pkg-config when cross compiling
0b8026f meson: allow building from shallow clones
95c74d7 treesource: Restore string list output when no type markers
2283dd7 libfdt: fdt_path_offset_namelen: Reject empty path
79b9e32 libfdt: fdt_get_alias_namelen: Validate aliases
52157f1 pylibfdt: Support boolean properties
d774337 dtc: fix missing string in usage_opts_help
ad8bf9f libfdt: Fix fdt_appendprop_addrrange documentation
6c5e189 github: add workflow for Meson builds
a3dc9f0 libfdt: rename libfdt-X.Y.Z.so to libfdt.so.X.Y.Z
3501994 workflows: build: remove setuptools_scm hack
cd3e230 pylibfdt: use fallback version in tarballs
0f58645 move release version into VERSION.txt
3816595 libfdt: add missing version symbols
5e98b59 editorconfig: use tab indentation for version.lds
d030a89 tests: generate dtbs in Meson build directory
8d8372b tests: fix use of deprecated meson methods
761114e pylibtfdt: fix use of deprecated meson method
bf6377a meson: set minimum Meson version to 0.56.0
4c68e4b libfdt: fix library version to match project version
bdc5c87 meson: allow disabling tests
f088e38 Makefile: allow to install libfdt without building executables
6df5328 Fix use of <ctype.h> functions
ccf1f62 libfdt: Fix a typo in libfdt.h
71a8b8e libfdt: meson: Fix linking on macOS linker
589d8c7 dtc: Add an option to generate __local_fixups__ and __fixups__
e836466 CI: Add build matrix with multiple Linux distributions
3b02a94 dtc: Correct invalid dts output with mixed phandles and integers
d488895 tests: Add additional tests for device graph checks
ea3b9a1 checks: Fix crash in graph_child_address if 'reg' cell size != 1
b2b9671 livetree: fix off-by-one in propval_cell_n() bounds check
ab481e4 Add definition for a GitHub Actions CI job
c88038c Drop obsolete/broken CI definitions
0ac8b30 yaml: Depend on libyaml >= 0.2.3
f1657b2 tests: Add test cases for bad endpoint node and remote-endpoint prop checks
44bb89c checks: Fix segmentation fault in check_graph_node
60bcf1c improve documentation for fdt_path_offset()
a6f997b add fdt_get_symbol() and fdt_get_symbol_namelen() functions
18f5ec1 use fdt_path_getprop_namelen() in fdt_get_alias_namelen()
df09327 add fdt_path_getprop_namelen() helper
129bb4b doc: dt-object-internal: Fix a typo
390f481 fdtoverlay: Drop a a repeated article
9f8b382 manual: Fix and improve documentation about -@
2cdf93a fdtoverlay: Fix usage string to not mention "<type>"
72fc810 build-sys: add -Wwrite-strings
083ab26 tests: fix leaks spotted by ASAN
6f8b28f livetree: fix leak spotted by ASAN
fd68bb8 Make name_node() xstrdup its name argument
4718189 Delay xstrdup() of node and property names coming from a flat tree
0b842c3 Make build_property() xstrdup its name argument
9cceabe checks: correct I2C 10-bit address check
0d56145 yamltree.c: fix -Werror=discarded-qualifiers & -Werror=cast-qual
61fa22b checks: make check.data const
7a1d72a checks.c: fix check_msg() leak
ee57999 checks.c: fix heap-buffer-overflow
44c9b73 tests: fix -Wwrite-strings
5b60f51 srcpos.c: fix -Wwrite-strings
32174a6 meson: Fix cell overflow tests when running from meson
64a907f meson.build: bump version to 1.7.0
e3cde06 Add -Wsuggest-attribute=format warning, correct warnings thus generated
4182182 Use #ifdef NO_VALGRIND
71c19f2 Do not redefine _GNU_SOURCE if already set

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...erlay-make-overlay_get_target-public.patch | 23 +++++++++----------
 ...hon3-dtc_1.7.0.bb => python3-dtc_1.7.1.bb} |  2 +-
 2 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb => python3-dtc_1.7.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
index a2df482e3aa..ff3fd1867bf 100644
--- a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
+++ b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
@@ -1,4 +1,4 @@
-From 4d4703e0199fb3556c37694e4d951785abca22fd Mon Sep 17 00:00:00 2001
+From 20b224b8ab1837778dfd0e7171643a5d26675f95 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Wed, 19 Jan 2022 12:46:42 -0500
 Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() public"
@@ -6,7 +6,6 @@ Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() public"
 This reverts commit 45f3d1a095dd3440578d5c6313eba555a791f3fb.
 
 Upstream-Status: Inappropriate [embedded specific]
-
 ---
  libfdt/fdt_overlay.c | 29 ++++++++++++++++++++++-------
  libfdt/libfdt.h      | 18 ------------------
@@ -14,7 +13,7 @@ Upstream-Status: Inappropriate [embedded specific]
  3 files changed, 22 insertions(+), 26 deletions(-)
 
 diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
-index 5c0c398..d217e79 100644
+index 28b667f..e6e9382 100644
 --- a/libfdt/fdt_overlay.c
 +++ b/libfdt/fdt_overlay.c
 @@ -40,22 +40,37 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
@@ -59,7 +58,7 @@ index 5c0c398..d217e79 100644
  		if (path)
  			ret = fdt_path_offset(fdt, path);
  		else
-@@ -621,7 +636,7 @@ static int overlay_merge(void *fdt, void *fdto)
+@@ -848,7 +863,7 @@ static int overlay_merge(void *fdt, void *fdto)
  		if (overlay < 0)
  			return overlay;
  
@@ -68,7 +67,7 @@ index 5c0c398..d217e79 100644
  		if (target < 0)
  			return target;
  
-@@ -764,7 +779,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
+@@ -991,7 +1006,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
  			return -FDT_ERR_BADOVERLAY;
  
  		/* get the target of the fragment */
@@ -77,7 +76,7 @@ index 5c0c398..d217e79 100644
  		if (ret < 0)
  			return ret;
  		target = ret;
-@@ -786,7 +801,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
+@@ -1013,7 +1028,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
  
  		if (!target_path) {
  			/* again in case setprop_placeholder changed it */
@@ -87,10 +86,10 @@ index 5c0c398..d217e79 100644
  				return ret;
  			target = ret;
 diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
-index a7f432c..7f117e8 100644
+index 0677fea..c72337b 100644
 --- a/libfdt/libfdt.h
 +++ b/libfdt/libfdt.h
-@@ -2116,24 +2116,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
+@@ -2184,24 +2184,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
   */
  int fdt_overlay_apply(void *fdt, void *fdto);
  
@@ -116,7 +115,7 @@ index a7f432c..7f117e8 100644
  /* Debugging / informational functions                                */
  /**********************************************************************/
 diff --git a/libfdt/version.lds b/libfdt/version.lds
-index cbce5d4..7ab85f1 100644
+index 989cd89..ae5f8c6 100644
 --- a/libfdt/version.lds
 +++ b/libfdt/version.lds
 @@ -77,7 +77,6 @@ LIBFDT_1.2 {
@@ -124,9 +123,9 @@ index cbce5d4..7ab85f1 100644
  		fdt_setprop_inplace_namelen_partial;
  		fdt_create_with_flags;
 -		fdt_overlay_target_offset;
+ 		fdt_get_symbol;
+ 		fdt_get_symbol_namelen;
  	local:
- 		*;
- };
 -- 
-2.19.1
+2.39.5
 
diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb b/meta/recipes-devtools/python/python3-dtc_1.7.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-dtc_1.7.0.bb
rename to meta/recipes-devtools/python/python3-dtc_1.7.1.bb
index 85e48d46942..269095bd8c9 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.1.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "99031e3a4a6e479466ae795790b44727434ca27d"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


