Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB41D7DEBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 03:58:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4E3vtkd005704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 20:58:06 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 13 May 2019 20:57:45 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2019 23:57:16 -0400
Message-ID: <20190514035716.27376-5-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
References: <20190514035716.27376-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] valgrind: fix call/cachegrind ptests
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
X-List-Received-Date: Tue, 14 May 2019 03:58:14 -0000
Content-Type: text/plain

Use the *_annotate executables from ${bindir}

Actually install cachegrind/tests/a.c since it is used by
the call/cachegrind/tests/ann[12].vgtest files.

With this change and the previous commits, the ptest results
on qemux86-64 when invoked with:
    runqemu qemux86 kvm nographic slirp qemuparams="-m 2048"
are:

=== Test Summary ===
TOTAL: 159
PASSED: 149
FAILED: 1
SKIPPED: 9

Only drd/tests/pth_detached3 remains to be fixed.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.15.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 8fecdefb91..f8b6b003a1 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -160,6 +160,8 @@ do_install_ptest() {
         cd $saved_dir
     done
 
+    # Hide then restore a.c that is used by ann[12].vgtest in call/cachegrind
+    mv ${D}${PTEST_PATH}/cachegrind/tests/a.c ${D}${PTEST_PATH}/cachegrind/tests/a_c
     # clean out build artifacts before building the rpm
     find ${D}${PTEST_PATH} \
          \( -name "Makefile*" \
@@ -168,6 +170,14 @@ do_install_ptest() {
         -o -name "*.S" \
         -o -name "*.h" \) \
         -exec rm {} \;
+    mv ${D}${PTEST_PATH}/cachegrind/tests/a_c ${D}${PTEST_PATH}/cachegrind/tests/a.c
+
+    # find *_annotate in ${bindir} for yocto build
+    sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann1.vgtest
+    sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann2.vgtest
+
+    sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann1.vgtest
+    sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann2.vgtest
 
     # needed by massif tests
     cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
-- 
2.17.0


