Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17FC57C4B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 08:41:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x118eDRG003452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Feb 2019 00:40:48 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.435.0;
	Fri, 1 Feb 2019 00:40:20 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <Qi.Chen@windriver.com>
Date: Fri, 1 Feb 2019 00:40:20 -0800
Message-ID: <20190201084020.113386-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] systemd: improve reproducibility
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
X-List-Received-Date: Fri, 01 Feb 2019 08:41:15 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Considering it's meanlingness to get test dir in
compiled env, remove ABS_BUILD_DIR and ABS_SRC_DIR
lines in src/shared/tests.c to improve reproducibility
to fix below issue:
WARNING: systemd-1_239-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/systemd/1_239-r0/packages-split/systemd/lib/systemd/libsystemd-shared-239.so in package contained reference to tmpdir [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-test-improve-reproducibility.patch   | 40 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-test-improve-reproducibility.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-test-improve-reproducibility.patch b/meta/recipes-core/systemd/systemd/0001-test-improve-reproducibility.patch
new file mode 100644
index 00000000000..3d7aa7fc238
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-test-improve-reproducibility.patch
@@ -0,0 +1,40 @@
+From f28a0e2a5f6a9ace858219c6f2513a5280acab48 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 1 Feb 2019 00:18:04 -0800
+Subject: [PATCH] test.c: improve reproducibility
+
+It's meanlingness to run test in compiled env,
+so uncoment the lines to avoid introducing
+ABS_BUILD_DIR and ABS_SRC_DIR to improve
+reproducibility to fix below issue:
+WARNING: systemd-1_239-r0 do_package_qa: QA Issue: File /work/core2-64-wrs-linux/systemd/1_239-r0/packages-split/systemd/lib/systemd/libsystemd-shared-239.so in package contained reference to tmpdir [buildpaths]
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/shared/tests.c | 8 ++------
+ 1 file changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/src/shared/tests.c b/src/shared/tests.c
+index 6b3df0aa07..7ac25eefea 100644
+--- a/src/shared/tests.c
++++ b/src/shared/tests.c
+@@ -37,12 +37,8 @@ const char* get_testdata_dir(const char *suffix) {
+                 _cleanup_free_ char *exedir = NULL;
+                 assert_se(readlink_and_make_absolute("/proc/self/exe", &exedir) >= 0);
+ 
+-                /* Check if we're running from the builddir. If so, use the compiled in path. */
+-                if (path_startswith(exedir, ABS_BUILD_DIR))
+-                        assert_se(snprintf(testdir, sizeof(testdir), "%s/test", ABS_SRC_DIR) > 0);
+-                else
+-                        /* Try relative path, according to the install-test layout */
+-                        assert_se(snprintf(testdir, sizeof(testdir), "%s/testdata", dirname(exedir)) > 0);
++                  /* Try relative path, according to the install-test layout */
++                  assert_se(snprintf(testdir, sizeof(testdir), "%s/testdata", dirname(exedir)) > 0);
+ 
+                 /* test this without the suffix, as it may contain a glob */
+                 if (access(testdir, F_OK) < 0) {
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index f843f588bdb..62ca9b146e7 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -41,6 +41,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0024-journald-do-not-store-the-iovec-entry-for-process-co.patch \
            file://0025-journald-set-a-limit-on-the-number-of-fields.patch \
            file://0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch \
+           file://0001-test-improve-reproducibility.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.17.1


