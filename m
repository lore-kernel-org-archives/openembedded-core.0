Return-Path: <valentin.popa@intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D615E65FB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:07:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2014 08:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1010,1389772800"; d="scan'208";a="537126431"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2014 08:06:20 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 May 2014 18:05:57 +0300
Message-Id: <382ac100ef48197952d228be64cb37019399383c.1399561398.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
In-Reply-To: <cover.1399561398.git.valentin.popa@intel.com>
References: <cover.1399561398.git.valentin.popa@intel.com>
Subject: [PATCH 2/4] libsoup: upgrade to 2.46.0
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
X-List-Received-Date: Thu, 08 May 2014 15:07:14 -0000

Removed merged patches:
fix-compiling-failed-while-mips-gcc-optimization-enabled.patch

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 ...ailed-while-mips-gcc-optimization-enabled.patch | 95 ----------------------
 ...libsoup-2.4_2.45.3.bb => libsoup-2.4_2.46.0.bb} |  9 +-
 2 files changed, 4 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.45.3.bb => libsoup-2.4_2.46.0.bb} (78%)

diff --git a/meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch b/meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch
deleted file mode 100644
index 3469642..0000000
--- a/meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-test/header-parsing.c: fix compiling failed while mips-gcc optimization enabled
-
-There was an error about mips-gcc optimization while compiling
-libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.
-
-The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
-in gcc/dwarf2out.c:20810:
-...
-20806       gcc_assert (prev
-20807                   && (CALL_P (prev)
-20808                       || (NONJUMP_INSN_P (prev)
-20809                           && GET_CODE (PATTERN (prev)) == SEQUENCE
-20810                           && CALL_P (XVECEXP (PATTERN (prev), 0, 0)))));
-...
-
-The issue test code is the C function 'do_qvalue_tests' located in
-tests/header-parsing.c.
-
-The 2.45.92 have refactored the test code and this issue has been fixed.
-So backport the fix to 2.45.3.
-
-Upstream-Status: backport
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/header-parsing.c |   28 ++--------------------------
- 1 file changed, 2 insertions(+), 26 deletions(-)
-
-diff --git a/tests/header-parsing.c b/tests/header-parsing.c
-index 5b2950f..00f5a4e 100644
---- a/tests/header-parsing.c
-+++ b/tests/header-parsing.c
-@@ -896,9 +896,7 @@ do_qvalue_tests (void)
- {
- 	int i, j;
- 	GSList *acceptable, *unacceptable, *iter;
--	gboolean wrong;
- 
--	debug_printf (1, "qvalue tests\n");
- 	for (i = 0; i < num_qvaluetests; i++) {
- 		debug_printf (1, "%2d. %s:\n", i + 1, qvaluetests[i].header_value);
- 
-@@ -907,48 +905,26 @@ do_qvalue_tests (void)
- 							     &unacceptable);
- 
- 		debug_printf (1, "    acceptable: ");
--		wrong = FALSE;
- 		if (acceptable) {
- 			for (iter = acceptable, j = 0; iter; iter = iter->next, j++) {
- 				debug_printf (1, "%s ", (char *)iter->data);
--				if (!qvaluetests[i].acceptable[j] ||
--				    strcmp (iter->data, qvaluetests[i].acceptable[j]) != 0)
--					wrong = TRUE;
-+				g_assert_cmpstr (iter->data, ==, qvaluetests[i].acceptable[j]);
- 			}
- 			debug_printf (1, "\n");
- 			soup_header_free_list (acceptable);
- 		} else
- 			debug_printf (1, "(none)\n");
--		if (wrong) {
--			debug_printf (1, "    WRONG! expected: ");
--			for (j = 0; qvaluetests[i].acceptable[j]; j++)
--				debug_printf (1, "%s ", qvaluetests[i].acceptable[j]);
--			debug_printf (1, "\n");
--			errors++;
--		}
- 
- 		debug_printf (1, "  unacceptable: ");
--		wrong = FALSE;
- 		if (unacceptable) {
- 			for (iter = unacceptable, j = 0; iter; iter = iter->next, j++) {
- 				debug_printf (1, "%s ", (char *)iter->data);
--				if (!qvaluetests[i].unacceptable[j] ||
--				    strcmp (iter->data, qvaluetests[i].unacceptable[j]) != 0)
--					wrong = TRUE;
-+				g_assert_cmpstr (iter->data, ==, qvaluetests[i].unacceptable[j]);
- 			}
- 			debug_printf (1, "\n");
- 			soup_header_free_list (unacceptable);
- 		} else
- 			debug_printf (1, "(none)\n");
--		if (wrong) {
--			debug_printf (1, "    WRONG! expected: ");
--			for (j = 0; qvaluetests[i].unacceptable[j]; j++)
--				debug_printf (1, "%s ", qvaluetests[i].unacceptable[j]);
--			debug_printf (1, "\n");
--			errors++;
--		}
--
--		debug_printf (1, "\n");
- 	}
- }
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
similarity index 78%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
index a3629c2..f062b2e 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.46.0.bb
@@ -15,12 +15,11 @@ PACKAGECONFIG ??= "gnome"
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://fix-compiling-failed-while-mips-gcc-optimization-enabled.patch \
-"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "fe7ec04784c6b97c5f8ea963c8542f59"
-SRC_URI[sha256sum] = "6ac317b931efd2cff9cdea7122987acb3ecb0c32564a9441ba72e5cce021aa12"
+
+SRC_URI[md5sum] = "86765c0093efaf3006fa2960d170d097"
+SRC_URI[sha256sum] = "fa3d5574c1a2df521242e2ca624a2b3057121798cab9f8f40525aa186a7b15a3"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.9.1


