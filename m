Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2ABC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 14:02:06 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.21833.1639231325219005760
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 06:02:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L9qryN/d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id i12so8820228wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 06:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcla7HzKrHcLj5yypXvZSOB/oBYxm3kZ11wYDFYc0sU=;
        b=L9qryN/dHo0eE5Fxekx2GOoC1m+VhlUmGo+hvHh+RAEYb8Ty1AtFCyjmUj829DwXqz
         L1mycQyQ0+zbnuCibt5dCVY8HoHlGCWQbdswdpTrDUw5muGXROgxCx0XMsv2vCgpohG0
         aeDuJbx1rcBjHPXeB3exnfmrT4gfKhP36me6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jcla7HzKrHcLj5yypXvZSOB/oBYxm3kZ11wYDFYc0sU=;
        b=hi+U4JX+ckmQPbl1MLPoMh2bCcGz6J/N1nCPWHaATfXhSqsTlWDy+4hZEfRrn+ZT6q
         idhcn5m93fOqQZt2dfiQboJcTTOxY0AnrhfaZufILobTO6q0cx26AKXt0zqO8NR64/Dw
         7IfTTGTgq7fDkgrkslc2ZPgTAVZ1qw0UsWdF6cmhvp+myTBSdE+lTEF8uw/Jqn1PdzAo
         /Y2GjP6HfVD2JdP5QQsTlV/rxBJujuXgCzoeS4RJnEpiia6k9V5jQHwyDISad28TUMHJ
         /LoX5L5Wa1M4dhiPy+ssGyatAwJtI3Bg1oPqUtgJNofyjYCa64Tc+RkuQC8vOCE9OPxF
         WLcQ==
X-Gm-Message-State: AOAM532MlMiZVxniAULoNs0PrL3Uy8AVG8ucjTZXt0+vwtimasyOMcwM
	vGLaTsGWtkK9l92pbL8d+dbIqqh+dU2new==
X-Google-Smtp-Source: 
 ABdhPJxC7Htv1CvAMHlLQdH0/H2umL9M5vnwsiYGjc6rL7hs4ULytxDZ3iOl87ZT87x+DDgwQ5vgiA==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr24493744wmp.127.1639231322472;
        Sat, 11 Dec 2021 06:02:02 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f405:6ac4:2af3:f8d3])
        by smtp.gmail.com with ESMTPSA id
 a1sm6482699wri.89.2021.12.11.06.02.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 06:02:02 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] puzzles: Upgrade to latest git with patches merged
Date: Sat, 11 Dec 2021 14:02:01 +0000
Message-Id: <20211211140201.708094-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 14:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159565

This upgrades to the latest upstream version where several of our fixes
have equivalent fixes merged upstream. The remaining patch should be
fixed soon to.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...Check-for-excessive-values-to-malloc.patch | 45 ------------
 ...01-map-Fix-stringop-overflow-warning.patch | 34 ---------
 ...isade-Fix-warnings-with-clang-on-arm.patch | 72 -------------------
 ...ix-compiling-failure-with-option-g-O.patch | 33 ---------
 .../puzzles/files/fix-ki-uninitialized.patch  | 32 ---------
 meta/recipes-sato/puzzles/puzzles_git.bb      |  7 +-
 6 files changed, 1 insertion(+), 222 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch b/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
deleted file mode 100644
index b572b55d1cf..00000000000
--- a/meta/recipes-sato/puzzles/files/0001-malloc-Check-for-excessive-values-to-malloc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-tree234: Avoid excessive values to malloc
-
-with whole program optimizers like lto, smalloc() is inlined the excessive
-constant argument is propagated to malloc() and ultimately triggers the warning.
-
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c: In function 'disptree':
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:46:17: error: argument 1 value '18446744073709551612' exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
-|    46 | #define smalloc malloc
-|       |                 ^
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:1631:17: note: in expansion of macro 'smalloc'
-|  1631 |     leveldata = smalloc(ht * (width+2));
-|       |                 ^~~~~~~
-| In file included from tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:29:
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/recipe-sysroot/usr/include/stdlib.h:539:14: note: in a call to allocation function 'malloc' declared here
-|   539 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
-|       |              ^~~~~~
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:46:17: error: argument 1 value '18446744073709551600' exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
-|    46 | #define smalloc malloc
-|       |                 ^
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:1632:18: note: in expansion of macro 'smalloc'
-|  1632 |     ctx.levels = smalloc(ht * sizeof(char *));
-|       |                  ^~~~~~~
-| In file included from tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/git/tree234.c:29:
-| tmp/work/core2-64-poky-linux/puzzles/2_0.0+gitAUTOINC+640f9235c7-r0/recipe-sysroot/usr/include/stdlib.h:539:14: note: in a call to allocation function 'malloc' declared here
-|   539 | extern void *malloc (size_t __size) __THROW __attribute_malloc__
-|       |              ^~~~~~
-| cc1: some warnings being treated as errors
-
-Upstream-Status: Submitted [email discussion with upstream]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: git/tree234.c
-===================================================================
---- git.orig/tree234.c
-+++ git/tree234.c
-@@ -1621,7 +1621,7 @@ void disptree(tree234 *t) {
-     dispctx ctx;
-     char *leveldata;
-     int width = count234(t);
--    int ht = height234(t) * 3 - 2;
-+    unsigned int ht = height234(t) * 3 - 2;
-     int i;
- 
-     if (!t->root) {
diff --git a/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch b/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
deleted file mode 100644
index 7f46d3ec0eb..00000000000
--- a/meta/recipes-sato/puzzles/files/0001-map-Fix-stringop-overflow-warning.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-map: Fix stringop-overflow warning
-
-Fixes
-
-../git/map.c: In function 'new_game_desc':
-../git/map.c:1663:23: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
- 1663 |         ret[retlen++] = ',';
-      |         ~~~~~~~~~~~~~~^~~~~
-../git/./map.c: In function 'new_game_desc':
-../git/./map.c:1663:23: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
- 1663 |         ret[retlen++] = ',';
-      |         ~~~~~~~~~~~~~~^~~~~
-
-Upstream-Status: Submitted [email discussion with upstream]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/map.c
-===================================================================
---- git.orig/map.c
-+++ git/map.c
-@@ -1659,6 +1659,10 @@ static char *new_game_desc(const game_pa
- 	    }
- 	}
- 
-+        if (retlen + 10 >= retsize) {
-+            retsize = retlen + 256;
-+            ret = sresize(ret, retsize, char);
-+        }
- 	ret[retlen++] = 'a'-1 + run;
- 	ret[retlen++] = ',';
- 
diff --git a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
deleted file mode 100644
index 07eb1d32f65..00000000000
--- a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From: Khem Raj <raj.khem@gmail.com>
-
-palisade: Fix warnings with clang on arm
-
-ARM treats 'char' as unsigned char when 'char' is not qualified with
-'signed' or 'unsigned' explicitly.
-
-This results in warnings e.g.
-
-palisade.c:531:22: error: comparison of constant -1 with expression of
-type 'clue' (aka 'char') is always false
-[-Werror,-Wtautological-constant-out-of-range-compare]
-        if (clues[i] == EMPTY) continue;
-
-Therefore, typcast the contant to char in such places to be explicit
-
-Upstream-Status: Submitted [email discussion with upstream]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: git/palisade.c
-===================================================================
---- git.orig/palisade.c
-+++ git/palisade.c
-@@ -46,7 +46,7 @@ struct game_params {
-     int w, h, k;
- };
- 
--typedef char clue;
-+typedef signed char clue;
- typedef unsigned char borderflag;
- 
- typedef struct shared_state {
-@@ -242,7 +242,7 @@ typedef struct solver_ctx {
-  * thing is done.  See how it is propagated across multiple squares.]
-  */
- 
--#define EMPTY (~0)
-+#define EMPTY ((clue)-1)
- 
- #define BIT(i) (1 << (i))
- #define BORDER(i) BIT(i)
-@@ -622,7 +622,7 @@ static char *new_game_desc(const game_pa
- {
-     int w = params->w, h = params->h, wh = w*h, k = params->k;
- 
--    clue *numbers = snewn(wh + 1, clue), *p;
-+    clue *numbers = snewn(wh + 1, clue);
-     borderflag *rim = snewn(wh, borderflag);
-     borderflag *scratch_borders = snewn(wh, borderflag);
- 
-@@ -682,7 +682,8 @@ static char *new_game_desc(const game_pa
-     sfree(shuf);
-     sfree(dsf);
- 
--    p = numbers;
-+    char *output = snewn(wh + 1, char), *p = output;
-+
-     r = 0;
-     for (i = 0; i < wh; ++i) {
-         if (numbers[i] != EMPTY) {
-@@ -699,7 +700,8 @@ static char *new_game_desc(const game_pa
-     }
-     *p++ = '\0';
- 
--    return sresize(numbers, p - numbers, clue);
-+    sfree(numbers);
-+    return sresize(output, p - output, char);
- }
- 
- static const char *validate_desc(const game_params *params, const char *desc)
diff --git a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch b/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
deleted file mode 100644
index 4ee75431667..00000000000
--- a/meta/recipes-sato/puzzles/files/fix-compiling-failure-with-option-g-O.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From: Hongxu Jia <hongxu.jia@windriver.com>
-
-gtk.c: fix compiling failure with option -g -O
-
-There was a compile failure with option -g -O
-...
-././gtk.c: In function 'main':
-././gtk.c:2911:6: error: 'error' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-      fprintf(stderr, "%s: %s\n", pname, error);
-      ^
-cc1: all warnings being treated as errors
-...
-
-Fix by initializing pointer 'error' with NULL
-
-Upstream-Status: Submitted [email discussion with upstream]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Index: git/gtk.c
-===================================================================
---- git.orig/gtk.c
-+++ git/gtk.c
-@@ -3578,7 +3578,7 @@ static void list_presets_from_menu(struc
- int main(int argc, char **argv)
- {
-     char *pname = argv[0];
--    char *error;
-+    char *error = NULL;
-     int ngenerate = 0, px = 1, py = 1;
-     bool print = false;
-     bool time_generation = false, test_solve = false, list_presets = false;
diff --git a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch b/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
deleted file mode 100644
index b182240240b..00000000000
--- a/meta/recipes-sato/puzzles/files/fix-ki-uninitialized.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-tree123: avoid compiler unitialized variable error
-
-The compiler does not realize that we must go through the while()
-loop at least once, so we replace it with a for() loop.
-
-Upstream-Status: Submitted [email discussion with upstream]
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Index: git/tree234.c
-===================================================================
---- git.orig/tree234.c
-+++ git/tree234.c
-@@ -335,7 +335,7 @@ static void *add234_internal(tree234 *t,
-     }
- 
-     n = t->root;
--    while (n) {
-+    do {
- 	LOG(("  node %p: %p/%d \"%s\" %p/%d \"%s\" %p/%d \"%s\" %p/%d\n",
- 	     n,
- 	     n->kids[0], n->counts[0], n->elems[0],
-@@ -388,7 +388,7 @@ static void *add234_internal(tree234 *t,
- 	if (!n->kids[ki])
- 	    break;
- 	n = n->kids[ki];
--    }
-+    } while (n);
- 
-     add234_insert(NULL, e, NULL, &t->root, n, ki);
- 
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 8ac62d52e57..da466f3efca 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -8,16 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=6e7d24cf1c949887ee9447a1e2a4a24c"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
-           file://fix-compiling-failure-with-option-g-O.patch \
-           file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-pattern.c-Change-string-lenght-parameter-to-be-size_.patch \
-           file://fix-ki-uninitialized.patch \
-           file://0001-malloc-Check-for-excessive-values-to-malloc.patch \
-           file://0001-map-Fix-stringop-overflow-warning.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "640f9235c79cdb1a924b0148cb312b0f02253364"
+SRCREV = "d399a6b23051335ce3107f11822ae352816fcd50"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.32.0


