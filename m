Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EF7C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 23:55:27 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.4467.1639007725720336375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 15:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M6CuoTNw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d24so6978364wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 15:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7h1UTxxI9WUC8zqLA2SWmo5aZIOGAAI2LF9INVgpJc=;
        b=M6CuoTNw8O/CNJcBX76UTyFlue0eBXtHMuN4CTMNtiUAyn7BUEqneP100dICdmfhjO
         T+2brFjVDNM92m7RuNsXccAOdlFRL4u0iOA7yBpajjPr427kGFQYNUoHXoTdfQR9R+Xd
         U6vxOgl6+H5EM4cOl+AmltBEXtPN2ytNuGCuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N7h1UTxxI9WUC8zqLA2SWmo5aZIOGAAI2LF9INVgpJc=;
        b=AR2u+zAYxb6RFHPNZzMnCL4ju7eJi9CgqWrigByqnV26/vREIOKwgxMzwhx8BIp9lF
         hA15shHdmG/Xt5iM+X8MWBWCX8ZpPg5/ADbFJucNr7dRrOwT7yIs+sV2scRddjBeAuAc
         HByYmdwi4P75khprY6cM3xLhyW9h0g7Xiw/TDCwQ2hg5+eCObpP2hduGVzPJBF+BdnT3
         IGCATs/5PxvYxXtoFKc/+oMzP/0wmvA3myX7AFRNAAivAMIwUrrBL4iYqN2uGzzzrlAU
         wf/TF7dl9jiGuUsiAZNHGi3AmDi07WHAZLSBvwUEb34wHD7tGgs01fNXSxny/TO9R6Iu
         4/9A==
X-Gm-Message-State: AOAM532cFDblBS/OXI5XgyymyFlqO3XVQMV6PV8yYElr/ds7Wvu4WWwH
	d8uOGesZiHmYnr7pCTE5Rgy3t5oUT08H4Q==
X-Google-Smtp-Source: 
 ABdhPJy+29BC68wv4HpAGzJq0jLxbp10Ja9StvQJRiS8FFWaGg+ZwygI+ZW6qwLJz0wYoLj71DE71g==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr2162561wrz.545.1639007723576;
        Wed, 08 Dec 2021 15:55:23 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed])
        by smtp.gmail.com with ESMTPSA id 4sm5251707wrz.90.2021.12.08.15.55.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 15:55:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] puzzles: Refresh patches based upon upstream discussion
Date: Wed,  8 Dec 2021 23:55:22 +0000
Message-Id: <20211208235522.601010-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 23:55:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159398

I mentioned these patches to upstream and this cleans them up based upon
our discussion with better fixes, fixed comments and tracking down the correct
issue in the malloc case.

If we can test and confirm them in this form, we should be in a good position
to resovle the issues with upstream and be able to drop the patches ultimately.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Check-for-excessive-values-to-malloc.patch | 92 +++++++++---------
 ...01-map-Fix-stringop-overflow-warning.patch | 38 +++-----
 ...isade-Fix-warnings-with-clang-on-arm.patch | 96 ++++++++++---------
 ...-string-lenght-parameter-to-be-size_.patch | 22 ++---
 ...ix-compiling-failure-with-option-g-O.patch | 33 +++----
 .../puzzles/files/fix-ki-uninitialized.patch  | 31 +++---
 6 files changed, 148 insertions(+), 164 deletions(-)

diff --git a/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch b/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
index 66af6afa2f3..b572b55d1cf 100644
--- a/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
+++ b/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
@@ -1,49 +1,45 @@
-From 1c01a5bc9ac7f8aaa484b1a8e0e74aa5f8899d0e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 8 Nov 2020 11:17:59 -0800
-Subject: [PATCH] malloc: Check for excessive values to malloc
-
-with whole program optimizers like lto smalloc()
-is inlined the excessive constant argument is propagated to
-malloc() and ultimately triggers the warning.
-
-malloc.c:15:9: error: argument 1 range [18446744065119617024, 18446744073709551580] exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
-
-therefore add a check before excessive constant argument before calling
-malloc
-
-Note that this will not happen with normal compile since they happen to
-be in different translation units and compiler can not semantically
-analyze as much
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- malloc.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/malloc.c b/malloc.c
-index a7fa7c5..520377c 100644
---- a/malloc.c
-+++ b/malloc.c
-@@ -2,6 +2,7 @@
-  * malloc.c: safe wrappers around malloc, realloc, free, strdup
-  */
+tree234: Avoid excessive values to malloc
+
+with whole program optimizers like lto, smalloc() is inlined the excessive
+constant argument is propagated to malloc() and ultimately triggers the warning.
+
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c: In function 'disptree':
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:46:17: error: argument 1 value '18446744073709551612' exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
+|    46 | #define smalloc malloc
+|       |                 ^
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:1631:17: note: in expansion of macro 'smalloc'
+|  1631 |     leveldata = smalloc(ht * (width+2));
+|       |                 ^~~~~~~
+| In file included from tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:29:
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/recipe-sysroot/usr/include/stdlib.h:539:14: note: in a call to allocation function 'malloc' declared here
+|   539 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
+|       |              ^~~~~~
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:46:17: error: argument 1 value '18446744073709551600' exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
+|    46 | #define smalloc malloc
+|       |                 ^
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:1632:18: note: in expansion of macro 'smalloc'
+|  1632 |     ctx.levels = smalloc(ht * sizeof(char *));
+|       |                  ^~~~~~~
+| In file included from tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:29:
+| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/recipe-sysroot/usr/include/stdlib.h:539:14: note: in a call to allocation function 'malloc' declared here
+|   539 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
+|       |              ^~~~~~
+| cc1: some warnings being treated as errors
+
+Upstream-Status: Submitted [email discussion with upstream]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/tree234.c
+===================================================================
+--- git.orig/tree234.c
++++ git/tree234.c
+@@ -1621,7 +1621,7 @@ void disptree(tree234 *t) {
+     dispctx ctx;
+     char *leveldata;
+     int width = count234(t);
+-    int ht = height234(t) * 3 - 2;
++    unsigned int ht = height234(t) * 3 - 2;
+     int i;
  
-+#include <stdint.h>
- #include <stdlib.h>
- #include <string.h>
- #include "puzzles.h"
-@@ -12,6 +13,8 @@
-  */
- void *smalloc(size_t size) {
-     void *p;
-+    if (size > PTRDIFF_MAX)
-+	fatal("exceeds maximum object size");
-     p = malloc(size);
-     if (!p)
- 	fatal("out of memory");
--- 
-2.29.2
-
+     if (!t->root) {
diff --git a/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch b/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
index a02d8732ab1..7f46d3ec0eb 100644
--- a/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
+++ b/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
@@ -1,7 +1,5 @@
-From 3d78d4cffcdc1242892b6c21c26d1c96938c48d1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Feb 2021 10:02:43 -0800
-Subject: [PATCH] map: Fix stringop-overflow warning
+map: Fix stringop-overflow warning
 
 Fixes
 
@@ -14,29 +12,23 @@ Fixes
  1663 |         ret[retlen++] = ',';
       |         ~~~~~~~~~~~~~~^~~~~
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [email discussion with upstream]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- map.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
 
-diff --git a/map.c b/map.c
-index 412305c..fa0c493 100644
---- a/map.c
-+++ b/map.c
-@@ -1659,8 +1659,10 @@ static char *new_game_desc(const game_params *params, random_state *rs,
+Index: git/map.c
+===================================================================
+--- git.orig/map.c
++++ git/map.c
+@@ -1659,6 +1659,10 @@ static char *new_game_desc(const game_pa
  	    }
  	}
  
--	ret[retlen++] = 'a'-1 + run;
--	ret[retlen++] = ',';
-+	if(ret != NULL) {
-+		ret[retlen++] = 'a'-1 + run;
-+		ret[retlen++] = ',';
-+	}
++        if (retlen + 10 >= retsize) {
++            retsize = retlen + 256;
++            ret = sresize(ret, retsize, char);
++        }
+ 	ret[retlen++] = 'a'-1 + run;
+ 	ret[retlen++] = ',';
  
- 	run = 0;
- 	for (i = 0; i < n; i++) {
--- 
-2.30.1
-
diff --git a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
index 143e898a513..07eb1d32f65 100644
--- a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
+++ b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
@@ -1,7 +1,6 @@
-From 453587d714473b806473b309727f865b673cbc06 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Jan 2016 23:10:19 -0800
-Subject: [PATCH] palisade: Fix warnings with clang on arm
+
+palisade: Fix warnings with clang on arm
 
 ARM treats 'char' as unsigned char when 'char' is not qualified with
 'signed' or 'unsigned' explicitly.
@@ -15,54 +14,59 @@ type 'clue' (aka 'char') is always false
 
 Therefore, typcast the contant to char in such places to be explicit
 
+Upstream-Status: Submitted [email discussion with upstream]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Submitted
----
- palisade.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
 
-diff --git a/palisade.c b/palisade.c
-index 6ffbf2d..8b54d42 100644
---- a/palisade.c
-+++ b/palisade.c
-@@ -304,11 +304,11 @@ static void solver_connected_clues_versus_region_size(solver_ctx *ctx)
-      * If p = q = 3 then the region has size exactly 2. */
+Index: git/palisade.c
+===================================================================
+--- git.orig/palisade.c
++++ git/palisade.c
+@@ -46,7 +46,7 @@ struct game_params {
+     int w, h, k;
+ };
  
-     for (i = 0; i < wh; ++i) {
--        if (ctx->clues[i] == EMPTY) continue;
-+        if (ctx->clues[i] == (char)EMPTY) continue;
-         for (dir = 0; dir < 4; ++dir) {
-             int j = i + dx[dir] + w*dy[dir];
-             if (disconnected(ctx, i, j, dir)) continue;
--            if (ctx->clues[j] == EMPTY) continue;
-+            if (ctx->clues[j] == (char)EMPTY) continue;
-             if ((8 - ctx->clues[i] - ctx->clues[j] > ctx->params->k) ||
-                 (ctx->clues[i] == 3 && ctx->clues[j] == 3 &&
-                  ctx->params->k != 2))
-@@ -326,7 +326,7 @@ static bool solver_number_exhausted(solver_ctx *ctx)
-     bool changed = false;
+-typedef char clue;
++typedef signed char clue;
+ typedef unsigned char borderflag;
  
-     for (i = 0; i < wh; ++i) {
--        if (ctx->clues[i] == EMPTY) continue;
-+        if (ctx->clues[i] == (char)EMPTY) continue;
+ typedef struct shared_state {
+@@ -242,7 +242,7 @@ typedef struct solver_ctx {
+  * thing is done.  See how it is propagated across multiple squares.]
+  */
  
-         if (bitcount[(ctx->borders[i] & BORDER_MASK)] == ctx->clues[i]) {
-             for (dir = 0; dir < 4; ++dir) {
-@@ -538,7 +538,7 @@ static bool is_solved(const game_params *params, clue *clues,
-     for (i = 0; i < wh; ++i) {
-         if (dsf[i] == UNVISITED) dfs_dsf(i, params->w, border, dsf, true);
-         if (dsf_size(dsf, i) != k) goto error;
--        if (clues[i] == EMPTY) continue;
-+        if (clues[i] == (char)EMPTY) continue;
-         if (clues[i] != bitcount[border[i] & BORDER_MASK]) goto error;
-     }
+-#define EMPTY (~0)
++#define EMPTY ((clue)-1)
  
-@@ -685,7 +685,7 @@ static char *new_game_desc(const game_params *params, random_state *rs,
-     p = numbers;
+ #define BIT(i) (1 << (i))
+ #define BORDER(i) BIT(i)
+@@ -622,7 +622,7 @@ static char *new_game_desc(const game_pa
+ {
+     int w = params->w, h = params->h, wh = w*h, k = params->k;
+ 
+-    clue *numbers = snewn(wh + 1, clue), *p;
++    clue *numbers = snewn(wh + 1, clue);
+     borderflag *rim = snewn(wh, borderflag);
+     borderflag *scratch_borders = snewn(wh, borderflag);
+ 
+@@ -682,7 +682,8 @@ static char *new_game_desc(const game_pa
+     sfree(shuf);
+     sfree(dsf);
+ 
+-    p = numbers;
++    char *output = snewn(wh + 1, char), *p = output;
++
      r = 0;
      for (i = 0; i < wh; ++i) {
--        if (numbers[i] != EMPTY) {
-+        if (numbers[i] != (char)EMPTY) {
-             while (r) {
-                 while (r > 26) {
-                     *p++ = 'z';
+         if (numbers[i] != EMPTY) {
+@@ -699,7 +700,8 @@ static char *new_game_desc(const game_pa
+     }
+     *p++ = '\0';
+ 
+-    return sresize(numbers, p - numbers, clue);
++    sfree(numbers);
++    return sresize(output, p - output, char);
+ }
+ 
+ static const char *validate_desc(const game_params *params, const char *desc)
diff --git a/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch b/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
index 7ca582fe5d6..5e240bfea57 100644
--- a/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
+++ b/meta/recipes-sato/puzzles/files/0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch
@@ -1,26 +1,25 @@
-From 3af5a1e579e3324a13ba1f892c7befb3ab32d899 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Mar 2019 21:56:57 -0800
-Subject: [PATCH] pattern.c: Change string lenght parameter to be size_t in
- do_row()
+
+pattern.c: Change string lenght parameter to be size_t in do_row()
 
 This fixes below error on some architectures e.g. RISC-V
 
 pattern.c:455:9: error: 'memset' specified size between 18446744071562067968 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]                                                                     455 |         memset(deduced, DOT, (size_t)len);                                                                                   |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [email discussion with upstream]
 
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
  pattern.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/pattern.c b/pattern.c
-index ffadd3f..4e5f187 100644
---- a/pattern.c
-+++ b/pattern.c
-@@ -428,7 +428,7 @@ static bool do_row(unsigned char *known, unsigned char *deduced,
+Index: git/pattern.c
+===================================================================
+--- git.orig/pattern.c
++++ git/pattern.c
+@@ -429,7 +429,7 @@ static bool do_row(unsigned char *known,
                     unsigned char *row,
                     unsigned char *minpos_done, unsigned char *maxpos_done,
                     unsigned char *minpos_ok, unsigned char *maxpos_ok,
@@ -29,6 +28,3 @@ index ffadd3f..4e5f187 100644
                     unsigned int *changed
  #ifdef STANDALONE_SOLVER
                     , const char *rowcol, int index, int cluewid
--- 
-2.17.1
-
diff --git a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
index 28040523d4f..4ee75431667 100644
--- a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
+++ b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
@@ -1,17 +1,9 @@
-From 876c6ff1e20f51b0921acda99861f476b6423f26 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 11 Aug 2014 12:39:53 +0800
-Subject: [PATCH] gtk.c: fix compiling failure with option -g -O
 
-There were compiling failure with option -g -O
+gtk.c: fix compiling failure with option -g -O
+
+There was a compile failure with option -g -O
 ...
-././gtk.c: In function 'configure_area':
-././gtk.c:397:2: error: 'cr' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-  cairo_set_source_rgb(cr,
-  ^
-././gtk.c:384:14: note: 'cr' was declared here
-     cairo_t *cr;
-              ^
 ././gtk.c: In function 'main':
 ././gtk.c:2911:6: error: 'error' may be used uninitialized in this function [-Werror=maybe-uninitialized]
       fprintf(stderr, "%s: %s\n", pname, error);
@@ -19,21 +11,18 @@ There were compiling failure with option -g -O
 cc1: all warnings being treated as errors
 ...
 
-Initialized pointer 'cr' and 'error' with NULL
+Fix by initializing pointer 'error' with NULL
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [email discussion with upstream]
 
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
----
- gtk.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gtk.c b/gtk.c
-index 4565836..5e83b48 100644
---- a/gtk.c
-+++ b/gtk.c
-@@ -2944,7 +2944,7 @@ static void list_presets_from_menu(struct preset_menu *menu)
+Index: git/gtk.c
+===================================================================
+--- git.orig/gtk.c
++++ git/gtk.c
+@@ -3578,7 +3578,7 @@ static void list_presets_from_menu(struc
  int main(int argc, char **argv)
  {
      char *pname = argv[0];
diff --git a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
index 7218d620ec1..b182240240b 100644
--- a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
+++ b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
@@ -1,25 +1,32 @@
-puzzles: avoid compiler unitialized variable error
+tree123: avoid compiler unitialized variable error
 
 The compiler does not realize that we must go through the while()
 loop at least once, so we replace it with a for() loop.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [email discussion with upstream]
 
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
---- a/tree234.c
-+++ b/tree234.c
-@@ -326,8 +326,11 @@ static void *add234_internal(tree234 *t,
- 	return orig_e;
+Index: git/tree234.c
+===================================================================
+--- git.orig/tree234.c
++++ git/tree234.c
+@@ -335,7 +335,7 @@ static void *add234_internal(tree234 *t,
      }
  
--    n = t->root;
+     n = t->root;
 -    while (n) {
-+    /*
-+     * We know t->root is not NULL.  The logic
-+     * to break out of this is at the end of the loop.
-+     */
-+    for (n = t->root;;) {
++    do {
  	LOG(("  node %p: %p/%d \"%s\" %p/%d \"%s\" %p/%d \"%s\" %p/%d\n",
  	     n,
  	     n->kids[0], n->counts[0], n->elems[0],
+@@ -388,7 +388,7 @@ static void *add234_internal(tree234 *t,
+ 	if (!n->kids[ki])
+ 	    break;
+ 	n = n->kids[ki];
+-    }
++    } while (n);
+ 
+     add234_insert(NULL, e, NULL, &t->root, n, ki);
+ 
-- 
2.32.0


