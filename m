Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3EADA606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 18:41:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Apr 2015 11:41:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,551,1422950400"; d="scan'208";a="706414976"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 11:41:27 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 52DB86A408D;
	Thu,  9 Apr 2015 11:41:04 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 21:41:20 +0300
Message-Id: <1428604880-18852-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: Add argv argument to main
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
X-List-Received-Date: Thu, 09 Apr 2015 18:41:27 -0000

Make it possible to call wic as an API from tests passing
command line parameters as arguments to main.

This is yet another enabler for wic unit testing.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index fd4a678..5bedd90 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -279,13 +279,13 @@ def start_logging(loglevel):
     logging.basicConfig(filname='wic.log', filemode='w', level=loglevel)
 
 
-def main():
+def main(argv):
     parser = optparse.OptionParser(version="wic version %s" % __version__,
                                    usage=wic_usage)
 
     parser.disable_interspersed_args()
 
-    (options, args) = parser.parse_args()
+    (options, args) = parser.parse_args(argv)
 
     if len(args):
         if args[0] == "help":
@@ -298,7 +298,7 @@ def main():
 
 if __name__ == "__main__":
     try:
-        ret = main()
+        ret = main(sys.argv[1:])
     except Exception:
         ret = 1
         import traceback
-- 
2.1.4


