Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7A68F71A76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 15:47:53 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 14 Dec 2016 07:47:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,347,1477983600"; d="scan'208";a="42467098"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga005.fm.intel.com with ESMTP; 14 Dec 2016 07:47:54 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 07:45:21 +0000
Message-Id: <78c9c118e58c8b406baddaae656e791d7238f198.1481701176.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1481701176.git.mariano.lopez@linux.intel.com>
References: <cover.1481701176.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments
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
X-List-Received-Date: Wed, 14 Dec 2016 15:47:54 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Commit 9d55e9d489cd78be592fb9b4d6484f9060c62fdd broke calling get_bb_vars()
when called without arguments. This fix this issue.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 6acb24a..aecf8cf 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -149,7 +149,8 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
     """Get values of multiple bitbake variables"""
     bbenv = get_bb_env(target, postconfig=postconfig)
 
-    variables = variables.copy()
+    if variables is not None:
+        variables = variables.copy()
     var_re = re.compile(r'^(export )?(?P<var>\w+)="(?P<value>.*)"$')
     unset_re = re.compile(r'^unset (?P<var>\w+)$')
     lastline = None
-- 
2.6.6


