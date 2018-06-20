Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id CBBCF75556
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 14:07:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2018 07:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,247,1526367600"; d="scan'208";a="65764521"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2018 07:07:25 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 1358B58012D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 07:07:24 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2018 17:07:20 +0300
Message-Id: <1529503642-7158-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/5] puzzles: upgrade to latest revision
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
X-List-Received-Date: Wed, 20 Jun 2018 14:07:37 -0000

Remove upstreamed patch:
        0001-Use-labs-instead-of-abs.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../files/0001-Use-labs-instead-of-abs.patch       | 46 ----------------------
 meta/recipes-sato/puzzles/puzzles_git.bb           |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch

diff --git a/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch b/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
deleted file mode 100644
index f43d1df..0000000
--- a/meta/recipes-sato/puzzles/files/0001-Use-labs-instead-of-abs.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9808dc09e08937c9bffd858d3ded428225a4312a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Sep 2015 09:02:38 +0000
-Subject: [PATCH] Use labs instead of abs
-
-cluevals is array of longs so we have to use labs() instead of abs()
-since abs() returns int
-
-Fixes
-
-keen.c:1458:17: error: absolute value function 'abs' given an argument
-of type 'long' but has parameter of type 'int' which may cause
-truncation of value
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- keen.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/keen.c b/keen.c
-index a6a7238..1631992 100644
---- a/keen.c
-+++ b/keen.c
-@@ -1043,7 +1043,7 @@ done
- 		    cluevals[j] *= grid[i];
- 		    break;
- 		  case C_SUB:
--		    cluevals[j] = abs(cluevals[j] - grid[i]);
-+		    cluevals[j] = labs(cluevals[j] - grid[i]);
- 		    break;
- 		  case C_DIV:
- 		    {
-@@ -1455,7 +1455,7 @@ static int check_errors(const game_state *state, long *errors)
- 		cluevals[j] *= state->grid[i];
- 		break;
- 	      case C_SUB:
--		cluevals[j] = abs(cluevals[j] - state->grid[i]);
-+		cluevals[j] = labs(cluevals[j] - state->grid[i]);
- 		break;
- 	      case C_DIV:
- 		{
--- 
-2.5.1
-
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 7d08b96..7a6114a 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,13 +10,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
-           file://0001-Use-labs-instead-of-abs.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "c6e0161dd475415316ed66dc82794d68e52f0025"
+SRCREV = "506b07352ae225c74e79f6c6e7872bc2005bdb53"
 PE = "2"
 PV = "0.0+git${SRCPV}"
 
-- 
2.4.0


