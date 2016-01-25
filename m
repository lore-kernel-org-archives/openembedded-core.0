Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A185731F1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 23:19:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 25 Jan 2016 15:19:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="898196466"
Received: from mrsafer-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.48.62])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2016 15:19:49 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 17:21:26 -0600
Message-Id: <1453764086-24971-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCHv2] ptest-runner_2.0: Add ptest-runner_2.0 recipe.
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
X-List-Received-Date: Mon, 25 Jan 2016 23:19:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ptest-runner 2.0 is C written program for run ptests of
Yocto/Openembedded, is fully compatible with previous version of
ptest-runner that was a shell script that runs ptests sequencially.

The mainly reason for the new ptest-runner in C is because is designed
for run in tiny systems also the old shell script version have problems
when certain ptest hang it becomes blocked indefinitely.

Now the ptest-runner 2.0 support the next features:

	- Specify the directory for search ptests.
	- List available ptests.
	- Specify the timeout for avoid blocking indefinetly.
	- Only run certain ptests.

Proposed features:

	- Adds support for per ptest output file.
	- Adds support for run ptests in parallel (review possible
	  colisions in ptests).

[YOCTO #8021]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../ptest-runner/ptest-runner_2.0.bb               | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
new file mode 100644
index 0000000..94672a82
--- /dev/null
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "A C program to run all installed ptests"
+DESCRIPTION = "The ptest-runner2 package installs a ptest-runner \
+program which loops through all installed ptest test suites and \
+runs them in sequence."
+HOMEPAGE = "https://github.com/alimon/ptest-runner2"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_REV = "8bfdf946e784f4d5757bebee1fbc4b4a3d7a95c4"
+PV = "2.0+git${SRCPV}"
+
+SRC_URI = "git://github.com/alimon/ptest-runner2.git;protocol=https;rev=${SRC_REV}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} = "${bindir}/ptest-runner"
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	install -D -m 0755 ${WORKDIR}/git/ptest-runner ${D}${bindir}/ptest-runner
+}
-- 
2.1.4


