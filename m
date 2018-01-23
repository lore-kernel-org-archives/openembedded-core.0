Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 855D6787B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="24037627"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 23 Jan 2018 06:04:14 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id F37965800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:13 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:46 +0200
Message-Id: <1516716352-32735-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/12] puzzles: upgrade to latest commit
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:16 -0000

Remove upstreamed patch:
        0001-Clarify-conditions-to-avoid-compiler-errors.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...arify-conditions-to-avoid-compiler-errors.patch | 48 ----------------------
 meta/recipes-sato/puzzles/puzzles_git.bb           |  1 -
 2 files changed, 49 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch b/meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
deleted file mode 100644
index 89aa158..0000000
--- a/meta/recipes-sato/puzzles/files/0001-Clarify-conditions-to-avoid-compiler-errors.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 72f2e9043ef509992dfa61791638db87bf0ae37b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 6 Dec 2016 01:20:00 +0000
-Subject: [PATCH] Clarify conditions to avoid compiler errors
-
-Fix errors pointed out by clang
-
-error: logical not is only applied to the left hand side of this bitwise operator [-Werror,-Wlogical-not-parentheses]
-|         if (only_immutable && !copy->flags[i] & FLAG_IMMUTABLE) continue;
-|                               ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- signpost.c | 2 +-
- tracks.c   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/signpost.c b/signpost.c
-index aa2e13a..2e2dff2 100644
---- a/signpost.c
-+++ b/signpost.c
-@@ -284,7 +284,7 @@ static int check_nums(game_state *orig, game_state *copy, int only_immutable)
-     int i, ret = 1;
-     assert(copy->n == orig->n);
-     for (i = 0; i < copy->n; i++) {
--        if (only_immutable && !copy->flags[i] & FLAG_IMMUTABLE) continue;
-+        if (only_immutable && !(copy->flags[i] & FLAG_IMMUTABLE)) continue;
-         assert(copy->nums[i] >= 0);
-         assert(copy->nums[i] <= copy->n);
-         if (copy->nums[i] != orig->nums[i]) {
-diff --git a/tracks.c b/tracks.c
-index 5b27350..ca44ce1 100644
---- a/tracks.c
-+++ b/tracks.c
-@@ -1072,7 +1072,7 @@ static int solve_check_single_sub(game_state *state, int si, int id, int n,
-         x = i%w;
-         y = i/w;
-         if (abs(ox-x) > 1 || abs(oy-y) > 1) {
--            if (!state->sflags[i] & S_TRACK)
-+            if (!(state->sflags[i] & S_TRACK))
-                 did += solve_set_sflag(state, x, y, S_NOTRACK, what);
-         }
-     }
--- 
-1.9.1
-
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 6148e40..6574e1d 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
-           file://0001-Clarify-conditions-to-avoid-compiler-errors.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.4.0


