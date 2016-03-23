Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9428060290
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:44:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2016 06:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="674417015"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Mar 2016 06:44:27 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 839976A4006;
	Wed, 23 Mar 2016 07:32:10 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 13:24:33 +0200
Message-Id: <1458732273-3491-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: fix type of no-table option
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
X-List-Received-Date: Wed, 23 Mar 2016 13:44:29 -0000

Type of --no-table option was incorrectly set in new wks parser.
It causes parser to require argument for this option, which makes
wic to fail with wks files that use --no-table:
    Error: argument --no-table: expected one argument

Changed action parameter to 'store_true' to fix the issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/ksparser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 2f1e097..8c3f808 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -113,7 +113,7 @@ class KickStart(object):
         part.add_argument('--fsoptions', dest='fsopts')
         part.add_argument('--fstype')
         part.add_argument('--label')
-        part.add_argument('--no-table')
+        part.add_argument('--no-table', action='store_true')
         part.add_argument('--ondisk', '--ondrive', dest='disk')
         part.add_argument("--overhead-factor", type=overheadtype, default=1.3)
         part.add_argument('--part-type')
-- 
2.1.4


