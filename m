Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAC286ED4C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:38:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O8ck2q011844
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Mar 2014 01:38:46 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 24 Mar 2014 01:38:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 16:38:35 +0800
Message-ID: <e35a840c492573734a19fb20ba7c3c2be63d36f3.1395650119.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395650119.git.hongxu.jia@windriver.com>
References: <cover.1395650119.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] libsoup-2.4: fix compiling failed while mips-gcc optimization enabled
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
X-List-Received-Date: Mon, 24 Mar 2014 08:38:47 -0000
Content-Type: text/plain

There was an error about mips-gcc optimization while compiling
libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.

The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
in gcc/dwarf2out.c:20810:
...
20806       gcc_assert (prev
20807                   && (CALL_P (prev)
20808                       || (NONJUMP_INSN_P (prev)
20809                           && GET_CODE (PATTERN (prev)) == SEQUENCE
20810                           && CALL_P (XVECEXP (PATTERN (prev), 0, 0)))));
...

The issue test code is the C function 'do_qvalue_tests' located in
tests/header-parsing.c.

The 2.45.92 have refactored the test code and this issue has been fixed.
So backport the fix to 2.45.3.

[YOCTO #5512]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ailed-while-mips-gcc-optimization-enabled.patch | 95 ++++++++++++++++++++++
 meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb |  4 +-
 2 files changed, 98 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch

diff --git a/meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch b/meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch
new file mode 100644
index 0000000..3469642
--- /dev/null
+++ b/meta/recipes-support/libsoup/files/fix-compiling-failed-while-mips-gcc-optimization-enabled.patch
@@ -0,0 +1,95 @@
+test/header-parsing.c: fix compiling failed while mips-gcc optimization enabled
+
+There was an error about mips-gcc optimization while compiling
+libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled.
+
+The test code of libsoup-2.4 2.45.3 triggered gcc assert which located
+in gcc/dwarf2out.c:20810:
+...
+20806       gcc_assert (prev
+20807                   && (CALL_P (prev)
+20808                       || (NONJUMP_INSN_P (prev)
+20809                           && GET_CODE (PATTERN (prev)) == SEQUENCE
+20810                           && CALL_P (XVECEXP (PATTERN (prev), 0, 0)))));
+...
+
+The issue test code is the C function 'do_qvalue_tests' located in
+tests/header-parsing.c.
+
+The 2.45.92 have refactored the test code and this issue has been fixed.
+So backport the fix to 2.45.3.
+
+Upstream-Status: backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ tests/header-parsing.c |   28 ++--------------------------
+ 1 file changed, 2 insertions(+), 26 deletions(-)
+
+diff --git a/tests/header-parsing.c b/tests/header-parsing.c
+index 5b2950f..00f5a4e 100644
+--- a/tests/header-parsing.c
++++ b/tests/header-parsing.c
+@@ -896,9 +896,7 @@ do_qvalue_tests (void)
+ {
+ 	int i, j;
+ 	GSList *acceptable, *unacceptable, *iter;
+-	gboolean wrong;
+ 
+-	debug_printf (1, "qvalue tests\n");
+ 	for (i = 0; i < num_qvaluetests; i++) {
+ 		debug_printf (1, "%2d. %s:\n", i + 1, qvaluetests[i].header_value);
+ 
+@@ -907,48 +905,26 @@ do_qvalue_tests (void)
+ 							     &unacceptable);
+ 
+ 		debug_printf (1, "    acceptable: ");
+-		wrong = FALSE;
+ 		if (acceptable) {
+ 			for (iter = acceptable, j = 0; iter; iter = iter->next, j++) {
+ 				debug_printf (1, "%s ", (char *)iter->data);
+-				if (!qvaluetests[i].acceptable[j] ||
+-				    strcmp (iter->data, qvaluetests[i].acceptable[j]) != 0)
+-					wrong = TRUE;
++				g_assert_cmpstr (iter->data, ==, qvaluetests[i].acceptable[j]);
+ 			}
+ 			debug_printf (1, "\n");
+ 			soup_header_free_list (acceptable);
+ 		} else
+ 			debug_printf (1, "(none)\n");
+-		if (wrong) {
+-			debug_printf (1, "    WRONG! expected: ");
+-			for (j = 0; qvaluetests[i].acceptable[j]; j++)
+-				debug_printf (1, "%s ", qvaluetests[i].acceptable[j]);
+-			debug_printf (1, "\n");
+-			errors++;
+-		}
+ 
+ 		debug_printf (1, "  unacceptable: ");
+-		wrong = FALSE;
+ 		if (unacceptable) {
+ 			for (iter = unacceptable, j = 0; iter; iter = iter->next, j++) {
+ 				debug_printf (1, "%s ", (char *)iter->data);
+-				if (!qvaluetests[i].unacceptable[j] ||
+-				    strcmp (iter->data, qvaluetests[i].unacceptable[j]) != 0)
+-					wrong = TRUE;
++				g_assert_cmpstr (iter->data, ==, qvaluetests[i].unacceptable[j]);
+ 			}
+ 			debug_printf (1, "\n");
+ 			soup_header_free_list (unacceptable);
+ 		} else
+ 			debug_printf (1, "(none)\n");
+-		if (wrong) {
+-			debug_printf (1, "    WRONG! expected: ");
+-			for (j = 0; qvaluetests[i].unacceptable[j]; j++)
+-				debug_printf (1, "%s ", qvaluetests[i].unacceptable[j]);
+-			debug_printf (1, "\n");
+-			errors++;
+-		}
+-
+-		debug_printf (1, "\n");
+ 	}
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
index b1199d8..a3629c2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
@@ -15,7 +15,9 @@ PACKAGECONFIG ??= "gnome"
 PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://fix-compiling-failed-while-mips-gcc-optimization-enabled.patch \
+"
 
 SRC_URI[md5sum] = "fe7ec04784c6b97c5f8ea963c8542f59"
 SRC_URI[sha256sum] = "6ac317b931efd2cff9cdea7122987acb3ecb0c32564a9441ba72e5cce021aa12"
-- 
1.8.1.2


