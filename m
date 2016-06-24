Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2C9F73163
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410318"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:44 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:15 +0300
Message-Id: <1466764661-24544-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 02/28] oeqa.utils.commands: use get_bb_vars() in get_bb_var()
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:45 -0000

Get rid of duplicate code.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 0297e53..2e513be 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -172,24 +172,14 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
                 if not variables:
                     break
         lastline = line
+    if variables:
+        # Fill in missing values
+        for var in variables:
+            values[var] = None
     return values
 
 def get_bb_var(var, target=None, postconfig=None):
-    val = None
-    bbenv = get_bb_env(target, postconfig=postconfig)
-    lastline = None
-    for line in bbenv.splitlines():
-        if re.search("^(export )?%s=" % var, line):
-            val = line.split('=', 1)[1]
-            val = val.strip('\"')
-            break
-        elif re.match("unset %s$" % var, line):
-            # Handle [unexport] variables
-            if lastline.startswith('#   "'):
-                val = lastline.split('\"')[1]
-                break
-        lastline = line
-    return val
+    return get_bb_vars([var], target, postconfig)[var]
 
 def get_test_layer():
     layers = get_bb_var("BBLAYERS").split()
-- 
2.6.6


