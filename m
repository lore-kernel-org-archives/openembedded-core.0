Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2162577101
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:38:02 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id ho8so157843049pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6sM1MnrsUiHrxvgT6r5CbXG0FlqwOsUaeNsNKDeQcMU=;
	b=zi8VojBrCx015K8RQr9WaEbF1fa1TG3W6dGvvKVWY03Ej904RcHbVE/suZR8D57FNe
	2+WLZD2tDM7uuECijRMHWjUW1pGtcxzXNkaPRlESpJ+DbNuYM/U2DeXWlRH/gOYw/ff3
	V9rIieWp6/P2RexlKcr7Hj5uPPn8NIYkph4xml9s7ABrEvylWPrcSUHhD5yEL9eurFu9
	bGaf5sl09tzgCdeC/x58l+ry4F7tFoern1sZsis5n7RiODYR/wNsAAv7WI2lfPc6P23U
	iAowMuD1ncu6jXHtUNfjLuxMRD0t+hRwch/uhNdiasjDojRZkXHPrFK8LbICzxLm6IIu
	FEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6sM1MnrsUiHrxvgT6r5CbXG0FlqwOsUaeNsNKDeQcMU=;
	b=PcgJsC3XCWoImTFjlfydvAaa6UN2cbrQ1m7Kcx6qYKixNNhEkoLX7RyVmoLY7kK6jm
	uNay35iqQfiJS1U+BdciCylP378I6PXrjSlV90MVZ9ke50Sr+ydELqhaIl90eEyqQk+T
	t7ZipCTGMUHgs3hS4Hsy3l+x3NG0UjvjYhsL9AHRyeh5eOmH3xQfVYsBrhai3TIRyxKW
	XpWL7CyFBvCnO9odYPVZlhopvyoO+rDrObh39Do6wOeeK6iqBC/q0Xef2fv4Xz21ZnOJ
	Xxh8P+6qtfk2DDLfTygRk2UW9XOXhbZzFthgtwIG++Y9rcOpCPVghxTNlSaQOOyh6SGK
	w3Vg==
X-Gm-Message-State: ALoCoQkqNUKOH0k0CtDkGcd3CqEbTK9Ta42iqrcA7B8tV28jE17I5o8Vgg7xbvW47ZgrXrRqyYNIGH9mcw2hyY+6JEFdJr3/LQ==
X-Received: by 10.66.180.48 with SMTP id dl16mr28276870pac.39.1453030683188;
	Sun, 17 Jan 2016 03:38:03 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:38:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:43 -0800
Message-Id: <ac7aabfa155b2f8eaf898b6df9baed720327505d.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 70/73] puzzles: Silence warning on arm with clang
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
X-List-Received-Date: Sun, 17 Jan 2016 11:38:02 -0000

Clang finds overflows when comparison is done between an unsigned char
and a integer constant. So explicitly typecast the constant before
comparison

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-palisade-Fix-warnings-with-clang-on-arm.patch | 72 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
new file mode 100644
index 0000000..5351f8e
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-palisade-Fix-warnings-with-clang-on-arm.patch
@@ -0,0 +1,72 @@
+From 6d8326275802a2e6e61d3e99460af6891ae8362f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 23:10:19 -0800
+Subject: [puzzles][PATCH] palisade: Fix warnings with clang on arm
+
+ARM treats 'char' as unsigned char when 'char' is not qualified with
+'signed' or 'unsigned' explicitly.
+
+This results in warnings e.g.
+
+palisade.c:531:22: error: comparison of constant -1 with expression of
+type 'clue' (aka 'char') is always false
+[-Werror,-Wtautological-constant-out-of-range-compare]
+        if (clues[i] == EMPTY) continue;
+
+Therefore, typcast the contant to char in such places to be explicit
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ palisade.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/palisade.c b/palisade.c
+index 984e616..2b9c25c 100644
+--- a/palisade.c
++++ b/palisade.c
+@@ -295,11 +295,11 @@ static void solver_connected_clues_versus_region_size(solver_ctx *ctx)
+      * If p = q = 3 then the region has size exactly 2. */
+ 
+     for (i = 0; i < wh; ++i) {
+-        if (ctx->clues[i] == EMPTY) continue;
++        if (ctx->clues[i] == (char)EMPTY) continue;
+         for (dir = 0; dir < 4; ++dir) {
+             int j = i + dx[dir] + w*dy[dir];
+             if (disconnected(ctx, i, j, dir)) continue;
+-            if (ctx->clues[j] == EMPTY) continue;
++            if (ctx->clues[j] == (char)EMPTY) continue;
+             if ((8 - ctx->clues[i] - ctx->clues[j] > ctx->params->k) ||
+                 (ctx->clues[i] == 3 && ctx->clues[j] == 3 &&
+                  ctx->params->k != 2))
+@@ -317,7 +317,7 @@ static int solver_number_exhausted(solver_ctx *ctx)
+     int changed = FALSE;
+ 
+     for (i = 0; i < wh; ++i) {
+-        if (ctx->clues[i] == EMPTY) continue;
++        if (ctx->clues[i] == (char)EMPTY) continue;
+ 
+         if (bitcount[(ctx->borders[i] & BORDER_MASK)] == ctx->clues[i]) {
+             for (dir = 0; dir < 4; ++dir) {
+@@ -528,7 +528,7 @@ static int is_solved(const game_params *params, clue *clues,
+     for (i = 0; i < wh; ++i) {
+         if (dsf[i] == UNVISITED) dfs_dsf(i, params->w, border, dsf, TRUE);
+         if (dsf_size(dsf, i) != k) goto error;
+-        if (clues[i] == EMPTY) continue;
++        if (clues[i] == (char)EMPTY) continue;
+         if (clues[i] != bitcount[border[i] & BORDER_MASK]) goto error;
+     }
+ 
+@@ -674,7 +674,7 @@ static char *new_game_desc(const game_params *params, random_state *rs,
+     p = numbers;
+     r = 0;
+     for (i = 0; i < wh; ++i) {
+-        if (numbers[i] != EMPTY) {
++        if (numbers[i] != (char)EMPTY) {
+             while (r) {
+                 while (r > 26) {
+                     *p++ = 'z';
+-- 
+2.7.0
+
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 9c8170c..dab5440 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch \
+           file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
 "
 SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
 PE = "1"
-- 
2.7.0


