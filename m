Return-Path: <ee.peng.yeoh@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Oct 2019 01:42:22 UTC
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6B14E7FA49
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 01:42:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 18:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,242,1569308400"; d="scan'208";a="198783695"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 28 Oct 2019 18:35:15 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 09:35:13 +0800
Message-Id: <1572312913-76832-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] resulttool/store.py: Enable add extra test environment data
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
X-List-Received-Date: Tue, 29 Oct 2019 01:42:22 -0000

Enable the option to add extra test environment data to the
configuration of each test result (as optional).

Example of optional test environment data include:
	- custom packages included for runtime test
	- detail machine specification used as target
	- detail host environment used for bitbake

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/lib/resulttool/store.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 79c83dd..e0951f0 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -24,6 +24,8 @@ def store(args, logger):
         configvars = resultutils.extra_configvars.copy()
         if args.executed_by:
             configvars['EXECUTED_BY'] = args.executed_by
+        if args.extra_test_env:
+            configvars['EXTRA_TEST_ENV'] = args.extra_test_env
         results = {}
         logger.info('Reading files from %s' % args.source)
         if resultutils.is_url(args.source) or os.path.isfile(args.source):
@@ -98,4 +100,5 @@ def register_commands(subparsers):
                               help='don\'t error if no results to store are found')
     parser_build.add_argument('-x', '--executed-by', default='',
                               help='add executed-by configuration to each result file')
-
+    parser_build.add_argument('-t', '--extra-test-env', default='',
+                              help='add extra test environment data to each result file configuration')
-- 
2.7.4


