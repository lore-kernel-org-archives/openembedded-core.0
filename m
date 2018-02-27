Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C058871B2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:34:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 04:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,400,1515484800"; d="scan'208";a="37809029"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 27 Feb 2018 04:34:18 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0F2125802B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:34:17 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 14:37:07 +0200
Message-Id: <1519735027-10472-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519735027-10472-1-git-send-email-maxin.john@intel.com>
References: <1519735027-10472-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] puzzles: upgrade to latest revision
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
X-List-Received-Date: Tue, 27 Feb 2018 12:34:17 -0000

1. Remove upstreamed patch:
        0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch
2. Bump PE to prevent version going backwards
3. LICENSE checksum change is due to Standardization of character
   encoding of source tree on UTF-8.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...d-paranthesis-to-remove-doubt-about-prece.patch | 47 ----------------------
 meta/recipes-sato/puzzles/puzzles_git.bb           |  7 ++--
 2 files changed, 3 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch b/meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch
deleted file mode 100644
index 19abdd5..0000000
--- a/meta/recipes-sato/puzzles/files/0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7b2949c48a178861f6568a18c8f45e841e36f89e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 7 Feb 2018 23:57:12 -0800
-Subject: [PATCH] signpost: Add paranthesis to remove doubt about precendence
-
-Clang complains e.g.
-
-error: logical not is only applied to the left hand side of
-      this bitwise operator [-Werror,-Wlogical-not-parentheses]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
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
-2.16.1
-
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 4fe6298..bfd8177 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -7,18 +7,17 @@ DEPENDS = "libxt"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=da6110d4ed1225a287eab2bf0ac0193b"
 
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
-           file://0001-signpost-Add-paranthesis-to-remove-doubt-about-prece.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8dfe5cec31e784e4ece2955ecc8cc35ee7e8fbb3"
-PE = "1"
+SRCREV = "2adf0052d66eae88c7a5e55e67fe16e13f7018b5"
+PE = "2"
 PV = "0.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


