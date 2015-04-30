Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE8E265CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 11:04:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 30 Apr 2015 04:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,676,1422950400"; d="scan'208";a="487625050"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Apr 2015 04:04:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id AC8176A408F;
	Thu, 30 Apr 2015 04:04:27 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 14:04:50 +0300
Message-Id: <1430391890-6083-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/utils: Allow ~ in bblayers
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
X-List-Received-Date: Thu, 30 Apr 2015 11:05:00 -0000

Bitbake can parse ~ in bblayer's paths.
Added this functionality to oeqa code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index e8a467f..bc1dbb1 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -155,6 +155,8 @@ def get_test_layer():
     layers = get_bb_var("BBLAYERS").split()
     testlayer = None
     for l in layers:
+        if '~' in l:
+            l = os.path.expanduser(l)
         if "/meta-selftest" in l and os.path.isdir(l):
             testlayer = l
             break
-- 
2.1.4


