Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 80E79764A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407579"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:43 +0300
Message-Id: <955430345ec10c6c1dda34e2b2c9f64e75d50f38.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 14/26] puzzles: switch svn for git, as upstream has done the same
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Also, drop puzzles_x32_abi_time.patch as it has been merged upstream

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../puzzles/files/puzzles_x32_abi_time.patch       | 30 ----------------------
 .../puzzles/{puzzles_r10286.bb => puzzles_git.bb}  |  7 ++---
 2 files changed, 4 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
 rename meta/recipes-sato/puzzles/{puzzles_r10286.bb => puzzles_git.bb} (89%)

diff --git a/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch b/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
deleted file mode 100644
index 63ab0b8..0000000
--- a/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix printf's for time_t value add castings because ISOC90
-don't support long long int that is used in x32 ABI for 
-time_t.
-
-Upstream-Status: Backport
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
---- a/magnets.c	2015-03-15 11:57:39.106674811 +0000
-+++ b/magnets.c	2015-03-15 11:57:58.638674795 +0000
-@@ -2562,7 +2562,7 @@
-         goto done;
-     }
-     s = new_game(NULL, p, desc);
--    printf("%s:%s (seed %ld)\n", id, desc, seed);
-+    printf("%s:%s (seed %ld)\n", id, desc, (long) seed);
-     if (aux) {
-         /* We just generated this ourself. */
-         if (verbose || print) {
---- a/signpost.c	2015-03-15 11:58:52.866674751 +0000
-+++ b/signpost.c	2015-03-15 11:59:08.190674738 +0000
-@@ -2393,7 +2393,7 @@
-         }
-     }
- 
--    sprintf(newseed, "%lu", time(NULL));
-+    sprintf(newseed, "%lu", (unsigned long) time(NULL));
-     seedstr = dupstr(newseed);
- 
-     if (id || !stdin_desc) {
diff --git a/meta/recipes-sato/puzzles/puzzles_r10286.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
similarity index 89%
rename from meta/recipes-sato/puzzles/puzzles_r10286.bb
rename to meta/recipes-sato/puzzles/puzzles_git.bb
index 1ad8d1b..6346c06 100644
--- a/meta/recipes-sato/puzzles/puzzles_r10286.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,12 +10,13 @@ REQUIRED_DISTRO_FEATURES = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 
-SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV} \
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
            file://fix-compiling-failure-with-option-g-O.patch \
-           file://puzzles_x32_abi_time.patch \
 "
+SRCREV = "aa1a9375be96cd8e0f89a670359c3c80ad7cf937"
+PV = "0.0+git${SRCPV}"
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep distro_features_check
 
-- 
2.1.4


