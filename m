Return-Path: <costin.c.constantin@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD60770C5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:38:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Jan 2016 11:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,341,1449561600"; d="scan'208";a="897371818"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2016 11:38:08 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 24B362C8001;
	Sun, 24 Jan 2016 12:26:02 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jan 2016 21:49:50 +0200
Message-Id: <1453664991-31706-12-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
References: <1453664991-31706-1-git-send-email-costin.c.constantin@intel.com>
Subject: [PATCH 12/13] buildtools-with-tc.bb: extend buildtools-tarball to include test cases
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
X-List-Received-Date: Sun, 24 Jan 2016 19:38:08 -0000

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


