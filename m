Return-Path: <mazliana.mohamad@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5EBB479969
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 11:14:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2018 03:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,322,1539673200"; d="scan'208";a="116494311"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2018 03:14:28 -0800
From: mazliana.mohamad@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2018 18:59:26 +0800
Message-Id: <1544093967-5387-1-git-send-email-mazliana.mohamad@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] scripts/test-case-mgmt: add "manualexecution" as a tool
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
X-List-Received-Date: Thu, 06 Dec 2018 11:14:29 -0000

From: Mazliana <mazliana.mohamad@intel.com>

Integrated the test-case-mgmt "store", "report" with "manual execution".Manual test execution is one
of an alternative test case management tool of Testopia. This script has only a bare-minimum function.
Bare-minimum function refer to function where the user can only execute all of the test cases that
component have.

To use these scripts, first source oe environment, then run the entry point script to look for help.
        $ test-case-mgmt

To execute manual test cases, execute the below
        $ test-case-mgmt manualexecution <manualjsonfile>

By default testresults.json store in poky/<build_dir>/tmp/log/manual

[YOCTO #12651]

Signed-off-by: Mazliana <mazliana.mohamad@intel.com>
---
 scripts/test-case-mgmt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/test-case-mgmt b/scripts/test-case-mgmt
index b832ee2..ef69db4 100755
--- a/scripts/test-case-mgmt
+++ b/scripts/test-case-mgmt
@@ -17,6 +17,11 @@
 # To store test result & log, execute the below
 #    $ test-case-mgmt store <source_dir> <git_branch>
 #
+# To execute manual test cases, execute the below
+#    $ test-case-mgmt manualexecution <manualjsonfile>
+#
+# By default testresults.json for manualexecution in poky/<build>/tmp/log/manual/
+#
 # Copyright (c) 2018, Intel Corporation.
 #
 # This program is free software; you can redistribute it and/or modify it
@@ -40,6 +45,7 @@ import argparse_oe
 import scriptutils
 import testcasemgmt.store
 import testcasemgmt.report
+import testcasemgmt.manualexecution
 logger = scriptutils.logger_create('test-case-mgmt')
 
 def _validate_user_input_arguments(args):
@@ -74,6 +80,8 @@ def main():
     testcasemgmt.store.register_commands(subparsers)
     subparsers.add_subparser_group('report', 'Reporting for test result & log', 200)
     testcasemgmt.report.register_commands(subparsers)
+    subparsers.add_subparser_group('manualexecution', 'Execute manual test cases', 100)
+    testcasemgmt.manualexecution.register_commands(subparsers)
     args = parser.parse_args()
     if args.debug:
         logger.setLevel(logging.DEBUG)
-- 
2.7.4


