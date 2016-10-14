Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9D50571ABE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 18:32:07 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2016 11:32:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,346,1473145200"; d="scan'208";a="20111734"
Received: from shealy-mobl4.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.27.118])
	by orsmga004.jf.intel.com with ESMTP; 14 Oct 2016 11:32:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 21:32:01 +0300
Message-Id: <a73adb3cfa9964608cd1b5f751dfbb8de351c279.1476469708.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1476469708.git.jussi.kukkonen@intel.com>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] piglit: Package tests in compressed form as well
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
X-List-Received-Date: Fri, 14 Oct 2016 18:32:07 -0000

Modify packaging so that generated tests are available in two forms:
* piglit-generated-tests contains the tests as they are now (1.5GB
  when installed)
* piglit-generated-tests-compressed contains a tar.gz with the same
  files (45 MB when installed)

Add wrapper script that decompresses the tests at runtime: this
requires 1.5GB free space.
---
 meta/recipes-graphics/piglit/piglit/piglit.sh | 20 ++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 20 +++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/piglit.sh

diff --git a/meta/recipes-graphics/piglit/piglit/piglit.sh b/meta/recipes-graphics/piglit/piglit/piglit.sh
new file mode 100644
index 0000000..3308b70
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/piglit.sh
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# If we're using compressed generated tests we may need to
+# decompress first. This is going to require at least 1.5 GB of space
+if [[ /usr/lib/piglit/generated_tests.tar.gz -nt /usr/lib/piglit/generated_tests/ ]]; then
+    echo "Decompressing generated tests..."
+    tar -C /usr/lib/piglit/ -zxf /usr/lib/piglit/generated_tests.tar.gz || {
+        echo "Failed to decompress tests, exiting."
+        exit 1
+    }
+    touch /usr/lib/piglit/generated_tests
+fi
+
+if ! [[ -d /usr/lib/piglit/generated_tests ]]; then
+    echo "NOTE: No generated tests found, install piglit-generated-tests-compressed"
+    echo "      or piglit-generated-tests to include them in the tests."
+fi
+
+echo "Now running piglit..."
+PIGLIT_NO_WINDOW=1 piglit.real "$@"
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 82adcde..916154a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
            file://0001-cmake-Link-utils-with-xcb-explicitly.patch \
            file://0001-cmake-Link-test-utils-with-ldl.patch \
+           file://piglit.sh \
            "
 
 # From 2016-07-07
@@ -39,9 +40,14 @@ do_configure_prepend() {
 }
 
 do_install() {
-	oe_runmake -C ${B} 'DESTDIR=${D}' install/strip
+    oe_runmake -C ${B} 'DESTDIR=${D}' install/strip
+    mv ${D}${bindir}/piglit ${D}${bindir}/piglit.real
+    install -m 755 ${WORKDIR}/piglit.sh ${D}${bindir}/piglit
+    tar -C ${D}${libdir}/piglit/ -czf ${D}${libdir}/piglit/generated_tests.tar.gz generated_tests/
 }
 
+PACKAGES =+ "${PN}-generated-tests ${PN}-generated-tests-compressed"
+
 RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
 	python3-subprocess python3-misc python3-importlib \
 	python3-unixadmin python3-xml python3-multiprocessing \
@@ -50,3 +56,15 @@ RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
 	"
 
 INSANE_SKIP_${PN} += "dev-so already-stripped"
+
+SUMMARY_${PN}-generated-tests = "Generated piglit tests (multiple GB)"
+FILES_${PN}-generated-tests = "${libdir}/piglit/generated_tests/*"
+CONFLICTS_${PN}-generated-tests = "${PN}-generated-tests-compressed"
+
+SUMMARY_${PN}-generated-tests-compressed = "Generated piglit tests in compressed archive"
+FILES_${PN}-generated-tests-compressed = "${libdir}/piglit/generated_tests.tar.gz"
+CONFLICTS_${PN}-generated-tests-compressed = "${PN}-generated-tests"
+pkg_postrm_${PN}-generated-tests-compressed () {
+    rm -rf $D${libdir}/piglit/generated_tests/
+}
+
-- 
2.9.3


