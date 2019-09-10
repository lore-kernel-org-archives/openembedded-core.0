Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDF871B1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 20:45:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8AKj3q2029893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 13:45:03 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 13:45:01 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2019 16:44:43 -0400
Message-ID: <20190910204445.21958-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910204445.21958-1-Randy.MacLeod@windriver.com>
References: <20190910204445.21958-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] valgrind: make a few more ptests pass
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
X-List-Received-Date: Tue, 10 Sep 2019 20:45:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Adjust two memcheck vgtest files to deal with relative paths
that are in test executables when cross-compiling.
Add libgomp to enable OpenMP tests.
Add the bz2 executable for memcheck/tests/vcpu_bz2.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ust-path-filter-for-2-memcheck-tests.patch | 40 +++++++++++++++++++
 .../valgrind/valgrind_3.15.0.bb               |  5 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch b/meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch
new file mode 100644
index 0000000000..a93fe92c9e
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-adjust-path-filter-for-2-memcheck-tests.patch
@@ -0,0 +1,40 @@
+From bf63e35c3036e6040c8cfecabc7160b1f36b0591 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Wed, 28 Aug 2019 12:31:15 -0400
+Subject: [PATCH] adjust path filter for 2 memcheck tests
+
+Test executables produced when cross-compiling can contain
+relative paths such as:
+   coregrind/tests/../../../valgrind-3.15.0/coregrind/
+Use the --fullpath-after option to match and therefore
+suppress more of the prefix to enable test to pass.
+
+Inappropriate [embedded specific]
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ memcheck/tests/badfree3.vgtest | 2 +-
+ memcheck/tests/varinfo5.vgtest | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/memcheck/tests/badfree3.vgtest b/memcheck/tests/badfree3.vgtest
+index 3dfc5fd8a..57eec21f3 100644
+--- a/memcheck/tests/badfree3.vgtest
++++ b/memcheck/tests/badfree3.vgtest
+@@ -1,3 +1,3 @@
+ prog: badfree
+-vgopts: -q --fullpath-after=memcheck/ --fullpath-after=coregrind/
++vgopts: -q --fullpath-after=/valgrind-3.15.0/memcheck/ --fullpath-after=/valgrind-3.15.0/coregrind/
+ stderr_filter_args: badfree.c
+diff --git a/memcheck/tests/varinfo5.vgtest b/memcheck/tests/varinfo5.vgtest
+index 063d00dce..6907bb2f6 100644
+--- a/memcheck/tests/varinfo5.vgtest
++++ b/memcheck/tests/varinfo5.vgtest
+@@ -1,3 +1,3 @@
+ prog: varinfo5
+-vgopts: --fullpath-after=memcheck/  --fullpath-after=coregrind/ --read-var-info=yes --read-inline-info=yes -q
++vgopts: --fullpath-after=/valgrind-3.15.0/memcheck/  --fullpath-after=/valgrind-3.15.0/coregrind/ --read-var-info=yes --read-inline-info=yes -q
+ stderr_filter: filter_varinfo3
+-- 
+2.22.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 7bb6001d90..bf0ca57c93 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0002-valgrind-adjust-std_list-expected-output.patch \
+           file://0001-adjust-path-filter-for-2-memcheck-tests.patch \
            "
 SRC_URI[md5sum] = "46e5fbdcbc3502a5976a317a0860a975"
 SRC_URI[sha256sum] = "417c7a9da8f60dd05698b3a7bc6002e4ef996f14c13f0ff96679a16873e78ab1"
@@ -109,7 +110,7 @@ RDEPENDS_${PN} += "perl"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " bash file perl perl-module-file-glob procps sed ${PN}-dbg"
+RDEPENDS_${PN}-ptest += " bash file libgomp perl perl-module-file-glob procps sed ${PN}-dbg"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
@@ -158,6 +159,8 @@ do_install_ptest() {
     cp ${B}/config.h ${D}${PTEST_PATH}
     mkdir ${D}${PTEST_PATH}/perf
     cp ${B}/perf/bigcode ${D}${PTEST_PATH}/perf
+    # needed by memcheck/tests/vcpu_bz2
+    cp ${B}/perf/bz2 ${D}${PTEST_PATH}/perf
 
     # Hide then restore a.c that is used by ann[12].vgtest in call/cachegrind
     mv ${D}${PTEST_PATH}/cachegrind/tests/a.c ${D}${PTEST_PATH}/cachegrind/tests/a_c
-- 
2.22.0


