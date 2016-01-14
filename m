Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B59F4731D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 22:25:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 14 Jan 2016 14:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,296,1449561600"; d="scan'208";a="881619234"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.151])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jan 2016 14:25:23 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: poky@yoctoproject.org
Date: Thu, 14 Jan 2016 16:27:02 -0600
Message-Id: <2a9a9e8df578c4d6e2bed5e0545c89df2f9709e5.1452808372.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452808370.git.anibal.limon@linux.intel.com>
References: <cover.1452808370.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1452808370.git.anibal.limon@linux.intel.com>
References: <cover.1452808370.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org,
	georgex.l.musat@intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 1/3] ptest-runner2: Add new ptest-runner2 recipe.
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
X-List-Received-Date: Thu, 14 Jan 2016 22:25:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ptest-runner2 is C written program for run ptests of
Yocto/Openembedded, is fully compatible with previous version of
ptest-runner that was a shell script that runs ptests sequencially.

The mainly reason for the new ptest-runner in C is because is designed
for run in tiny systems also the old shell script version have problems
when certain ptest hang it becomes blocked indefinitely.

Now the ptest-runner2 support the next features:

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
 .../ptest-runner2/ptest-runner2_0.1.bb             | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb

diff --git a/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb b/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb
new file mode 100644
index 0000000..97c640c
--- /dev/null
+++ b/meta/recipes-support/ptest-runner2/ptest-runner2_0.1.bb
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
+SRC_URI = "git://github.com/alimon/ptest-runner2.git;protocol=https;tag=v0.1"
+PV = "0.1+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+FILES_${PN} = "${bindir}/ptest-runner"
+
+RCONFLICTS_${PN} = "ptest-runner"
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


