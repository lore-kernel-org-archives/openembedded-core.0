Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3B80060034
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2015 21:28:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 15 Mar 2015 14:25:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,405,1422950400"; d="scan'208";a="467614979"
Received: from feifeich-mobl.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.252.141.167])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2015 14:21:44 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2015 15:28:53 -0600
Message-Id: <16ec46878a5437dd95f9af61e29222583b578a6f.1426454666.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426454666.git.anibal.limon@linux.intel.com>
References: <cover.1426454666.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426454666.git.anibal.limon@linux.intel.com>
References: <cover.1426454666.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] puzzles: Fix build in x32 ABI
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
X-List-Received-Date: Sun, 15 Mar 2015 21:28:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add patch for make castings to time_t values that are long long int
in x32 ABI.

[YOCTO #7447]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../puzzles/files/puzzles_x32_abi_time.patch       | 28 ++++++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch

diff --git a/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch b/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
new file mode 100644
index 0000000..560a97a
--- /dev/null
+++ b/meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Backport
+
+Fix printf's for time_t value add castings because ISOC90
+don't support long long int that is used in x32 ABI for 
+time_t.
+
+--- a/magnets.c	2015-03-15 11:57:39.106674811 +0000
++++ b/magnets.c	2015-03-15 11:57:58.638674795 +0000
+@@ -2562,7 +2562,7 @@
+         goto done;
+     }
+     s = new_game(NULL, p, desc);
+-    printf("%s:%s (seed %ld)\n", id, desc, seed);
++    printf("%s:%s (seed %ld)\n", id, desc, (long) seed);
+     if (aux) {
+         /* We just generated this ourself. */
+         if (verbose || print) {
+--- a/signpost.c	2015-03-15 11:58:52.866674751 +0000
++++ b/signpost.c	2015-03-15 11:59:08.190674738 +0000
+@@ -2393,7 +2393,7 @@
+         }
+     }
+ 
+-    sprintf(newseed, "%lu", time(NULL));
++    sprintf(newseed, "%lu", (unsigned long) time(NULL));
+     seedstr = dupstr(newseed);
+ 
+     if (id || !stdin_desc) {
diff --git a/meta/recipes-sato/puzzles/puzzles_r10116.bb b/meta/recipes-sato/puzzles/puzzles_r10116.bb
index 6ee4d96..3bc2c85 100644
--- a/meta/recipes-sato/puzzles/puzzles_r10116.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r10116.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 
 SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV} \
            file://fix-compiling-failure-with-option-g-O.patch \
+           file://puzzles_x32_abi_time.patch \
 "
 
 S = "${WORKDIR}/${BPN}"
-- 
1.9.1


