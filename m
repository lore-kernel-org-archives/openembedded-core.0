Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id DD4ED78A4F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:42:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 04:42:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,422,1515484800"; d="scan'208";a="179744470"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 04:42:17 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 04:41:49 -0800
Message-Id: <2918d33de857ec94e839e09965cb8335307c3c31.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
References: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH 1/7] meta/classes: add ptest-perl.bbclass
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
X-List-Received-Date: Sun, 04 Mar 2018 12:42:17 -0000

* Enable easier testing of perl modules
  - Installs t/* to PTEST_PATH
  - Uses common run-ptest script

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/ptest-perl.bbclass | 30 ++++++++++++++++++++++++++++++
 meta/files/ptest-perl/run-ptest | 16 ++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/classes/ptest-perl.bbclass
 create mode 100644 meta/files/ptest-perl/run-ptest

diff --git a/meta/classes/ptest-perl.bbclass b/meta/classes/ptest-perl.bbclass
new file mode 100644
index 0000000000..a4bc40b51a
--- /dev/null
+++ b/meta/classes/ptest-perl.bbclass
@@ -0,0 +1,30 @@
+inherit ptest
+
+FILESEXTRAPATHS_prepend := "${COREBASE}/meta/files:"
+
+SRC_URI += "file://ptest-perl/run-ptest"
+
+do_install_ptest_perl() {
+	install -d ${D}${PTEST_PATH}
+	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
+		install -m 0755 ${WORKDIR}/ptest-perl/run-ptest ${D}${PTEST_PATH}
+	fi
+	cp -r ${B}/t ${D}${PTEST_PATH}
+	chown -R root:root ${D}${PTEST_PATH}
+}
+
+FILES_${PN}-ptest_prepend = "${PTEST_PATH}/t/* ${PTEST_PATH}/run-ptest "
+
+RDEPENDS_${PN}-ptest_prepend = "perl "
+
+addtask install_ptest_perl after do_install_ptest_base before do_package
+
+python () {
+    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.setVarFlag('do_install_ptest_perl', 'fakeroot', '1')
+
+    # Remove all '*ptest_perl' tasks when ptest is not enabled
+    if not(d.getVar('PTEST_ENABLED') == "1"):
+        for i in ['do_install_ptest_perl']:
+            bb.build.deltask(i, d)
+}
diff --git a/meta/files/ptest-perl/run-ptest b/meta/files/ptest-perl/run-ptest
new file mode 100644
index 0000000000..c9f9ca94d0
--- /dev/null
+++ b/meta/files/ptest-perl/run-ptest
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+for case in `find t -type f -name '*.t'`; do
+    perl $case >$case.output 2>&1
+    ret=$?
+    cat $case.output
+    if [ $ret -ne 0 ]; then
+        echo "FAIL: ${case%.t}"
+    elif grep -i 'SKIP' $case.output; then
+        echo "SKIP: ${case%.t}"
+    else
+        echo "PASS: ${case%.t}"
+    fi
+
+    rm -f $case.output
+done
-- 
2.14.3


