Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A7FBB731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 20:28:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Sep 2016 13:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,324,1470726000"; d="scan'208";a="1049264989"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.16.231])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2016 13:28:37 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 15:30:50 -0500
Message-Id: <1473712250-4485-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] oe-selftest: check for coverage version before starting tests
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
X-List-Received-Date: Mon, 12 Sep 2016 20:28:38 -0000

python coverage versions lower than 4.x have problems with some distros. Adding the 4.x version as requirement to continue with coverage tracking.

[YOCTO #10207]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/oe-selftest | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 72bf4dd..d9ffd40 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -605,6 +605,10 @@ def buildResultClass(args):
                 if self.coverage_installed:
                     log.info("Coverage is enabled")
 
+                    major_version = int(coverage.version.__version__[0])
+                    if major_version < 4:
+                        log.error("python coverage %s installed. Require version 4 or greater." % coverage.version.__version__)
+                        self.stop()
                     # In case the user has not set the variable COVERAGE_PROCESS_START,
                     # create a default one and export it. The COVERAGE_PROCESS_START
                     # value indicates where the coverage configuration file resides
-- 
2.4.11


