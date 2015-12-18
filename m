Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 76603731C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2015 04:28:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="863931807"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2015 04:28:52 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id B67976A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:53 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:41:04 +0200
Message-Id: <ba3d364af8626bb06303816f232cb11df2e308ff.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 12/12] buildtools-with-tc.bb: extend buildtools-tarball to include test cases
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:52 -0000

recipes-core/meta/buildtools-with-tc.bb is a new recipe that uses
all buildtools-tarball has to offer and adds test cases support.

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/recipes-core/meta/buildtools-with-tc.bb | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-with-tc.bb

diff --git a/meta/recipes-core/meta/buildtools-with-tc.bb b/meta/recipes-core/meta/buildtools-with-tc.bb
new file mode 100644
index 0000000..84a57ee
--- /dev/null
+++ b/meta/recipes-core/meta/buildtools-with-tc.bb
@@ -0,0 +1,37 @@
+DESCRIPTION = "This recipe is used to extend the functionality of buildtools-tarball \
+               by adding the test harness plus binaries that might be required for DUTs.\
+              "
+
+require ${COREBASE}/meta/recipes-core/meta/buildtools-tarball.bb
+inherit testimage
+
+SDK_TITLE += "with test cases and binaries"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+TEST_EXPORT_ONLY = "1"
+TEST_TARGET = "simpleremote"
+IMAGE_NO_MANIFEST = "1"
+
+addtask testimage before do_populate_sdk
+
+tar_sdk_prepend () {
+  mkdir ${SDK_OUTPUT}${SDKPATH}/exported_tests 2>/dev/null
+  for i in $(ls ${TEST_EXPORT_DIR})
+  do
+    if [ ${i} != "tar_files" ]
+    then
+      cp -r ${TEST_EXPORT_DIR}/${i} ${SDK_OUTPUT}${SDKPATH}/exported_tests
+    fi
+  done
+  sed -i 's/\"pkgmanifest\": \"\"/\"pkgmanifest\": \"\\ndropbear\\n\"/' ${SDK_OUTPUT}${SDKPATH}/exported_tests/testdata.json
+  cp ${SDK_OUTPUT}${SDKPATH}/exported_tests/testdata.json ${TEST_EXPORT_DIR}
+}
+
+create_shar_append () {
+  message='echo "To run exported tests, go into exported_tests directory and run ./runexported.py"'
+  sed -i "/exit\ 0/i \
+${message}" ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh
+}
+
-- 
2.5.0


