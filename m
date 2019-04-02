Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1793B7CDF4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:09:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2019 00:09:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="136812740"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 02 Apr 2019 00:09:02 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 14:38:03 +0800
Message-Id: <1554187084-13032-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] resulttool: Enable report for single result file
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
X-List-Received-Date: Tue, 02 Apr 2019 07:09:03 -0000

Current validation check function inside resulttool disallow the
report for single result file although the underlying library
was able to handle both directory and file as source input to report.
Removed the validation check as it was no longer needed and to
enable report for single result file.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/resulttool | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/resulttool b/scripts/resulttool
index 5a89e1c..18ac101 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -51,13 +51,6 @@ import resulttool.report
 import resulttool.manualexecution
 logger = scriptutils.logger_create('resulttool')
 
-def _validate_user_input_arguments(args):
-    if hasattr(args, "source_dir"):
-        if not os.path.isdir(args.source_dir):
-            logger.error('source_dir argument need to be a directory : %s' % args.source_dir)
-            return False
-    return True
-
 def main():
     parser = argparse_oe.ArgumentParser(description="OEQA test result manipulation tool.",
                                         epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
@@ -80,9 +73,6 @@ def main():
     elif args.quiet:
         logger.setLevel(logging.ERROR)
 
-    if not _validate_user_input_arguments(args):
-        return -1
-
     try:
         ret = args.func(args, logger)
     except argparse_oe.ArgumentUsageError as ae:
-- 
2.7.4


