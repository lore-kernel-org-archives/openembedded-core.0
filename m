Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0EA071CB1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:10 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id p66so665695pga.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z32Wvx3xak57ZSvYtQJirG5N1x+ZsnHi1ffC6fDDm8s=;
	b=mcQ9j3IzINYsN9MpquUjHhjOVcoIpViBQIpvj0uU+Y4xIpRbtz8Fx81dxP97tuthzq
	DJfIFBE7I0r8Y4T/fhEV2Bm1PPuHmlMHy/S2I6GcyPKp1KZbmd2mPEfwmW5MNqToWxPK
	qS1Z3spA/FokwpD2/6ipPZtKjj1+/WFzCki97wGmL9TAHhDjKmkpVN9fDlc6Wq22GCly
	ebzAtYoBkCPuV0U2rc5kGG+6OYt2BsrqtsXpAioNR0LZHf/XQ5YB1MLqtzSSEQMaiCfA
	2OXDvTmhm4WRgu7RJEFYXwac4uzKAc8sZNwqey2rWtiY9EEAuQ2UJmr2Uo+LQminEDev
	WRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z32Wvx3xak57ZSvYtQJirG5N1x+ZsnHi1ffC6fDDm8s=;
	b=NMYqOOV3W7DwYoKjJEJ38Cq79OTmGrvHS/mytDOUu4or7Na3E0vZohSaZ6oeArpU0y
	T3SK7ygUZUnz7ly4jK3K6PzVY5JVRSHSJ+AT2QLQlDYtGAdEC5pllblzOyO376X1qLl4
	NsnWuqZc1huBnx4ADkFBUZJ5eG8nX7PFF03hFDGj+X/GVZoqny9Vnn3KE/lBcPMQekWp
	bxBYcIs8mplrkDYax2J+Ldgrp8MFDox572gGJVQqjSoWrngPO/fmP+bT7wJZ2HFaxDc4
	pYeQ56vD4tx2U4t8JqZRVxhvxv/13WeVX/YjCpGVH6UPgGRBVxl1uerOmZ4rKItAa38X
	CjKw==
X-Gm-Message-State: AKaTC02HdIhjqU2GBMx5j/QGqkHpZl0+2/ZeqLT9Pd7wSSpErg3tVXBJqwOFg8IY6B0Clw==
X-Received: by 10.99.101.65 with SMTP id z62mr140578274pgb.74.1481252291900;
	Thu, 08 Dec 2016 18:58:11 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:57:59 -0800
Message-Id: <20161209025801.20775-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 6/8] puzzles: Upgrade and fix with clang
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:10 -0000

Delete upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...arify-conditions-to-avoid-compiler-errors.patch | 48 ++++++++++++++++++++++
 ...mpiler-errors-about-uninitialized-use-of-.patch | 32 ---------------
 meta/recipes-sato/puzzles/puzzles_git.bb           |  4 +-
 3 files changed, 50 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch b/meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
new file mode 100644
index 0000000..89aa158
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
@@ -0,0 +1,48 @@
+From 72f2e9043ef509992dfa61791638db87bf0ae37b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Dec 2016 01:20:00 +0000
+Subject: [PATCH] Clarify conditions to avoid compiler errors
+
+Fix errors pointed out by clang
+
+error: logical not is only applied to the left hand side of this bitwise operator [-Werror,-Wlogical-not-parentheses]
+|         if (only_immutable && !copy->flags[i] & FLAG_IMMUTABLE) continue;
+|                               ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ signpost.c | 2 +-
+ tracks.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/signpost.c b/signpost.c
+index aa2e13a..2e2dff2 100644
+--- a/signpost.c
++++ b/signpost.c
+@@ -284,7 +284,7 @@ static int check_nums(game_state *orig, game_state *copy, int only_immutable)
+     int i, ret = 1;
+     assert(copy->n == orig->n);
+     for (i = 0; i < copy->n; i++) {
+-        if (only_immutable && !copy->flags[i] & FLAG_IMMUTABLE) continue;
++        if (only_immutable && !(copy->flags[i] & FLAG_IMMUTABLE)) continue;
+         assert(copy->nums[i] >= 0);
+         assert(copy->nums[i] <= copy->n);
+         if (copy->nums[i] != orig->nums[i]) {
+diff --git a/tracks.c b/tracks.c
+index 5b27350..ca44ce1 100644
+--- a/tracks.c
++++ b/tracks.c
+@@ -1072,7 +1072,7 @@ static int solve_check_single_sub(game_state *state, int si, int id, int n,
+         x = i%w;
+         y = i/w;
+         if (abs(ox-x) > 1 || abs(oy-y) > 1) {
+-            if (!state->sflags[i] & S_TRACK)
++            if (!(state->sflags[i] & S_TRACK))
+                 did += solve_set_sflag(state, x, y, S_NOTRACK, what);
+         }
+     }
+-- 
+1.9.1
+
diff --git a/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch b/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
deleted file mode 100644
index 0b971c4..0000000
--- a/meta/recipes-sato/puzzles/files/0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 78d6d1706c21ad467520075ff7a8bf15cfbd68b3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Dec 2015 22:13:16 +0000
-Subject: [PATCH] rect: Fix compiler errors about uninitialized use of
- variables
-
-error: 'r2.x' may be used uninitialized in this function
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- rect.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/rect.c b/rect.c
-index 55667c0..fa3a786 100644
---- a/rect.c
-+++ b/rect.c
-@@ -1317,7 +1317,8 @@ static char *new_game_desc(const game_params *params_in, random_state *rs,
-                     if (ndirs > 0) {
-                         int which, dir;
-                         struct rect r1, r2;
--
-+                        memset(&r1, 0, sizeof(struct rect));
-+                        memset(&r2, 0, sizeof(struct rect));
-                         which = random_upto(rs, ndirs);
-                         dir = dirs[which];
- 
--- 
-2.6.4
-
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 20b9889..a25c007 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
-           file://0001-rect-Fix-compiler-errors-about-uninitialized-use-of-.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
+           file://0001-Clarify-conditions-to-avoid-compiler-errors.patch \
 "
-SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
+SRCREV = "8dfe5cec31e784e4ece2955ecc8cc35ee7e8fbb3"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.10.2


