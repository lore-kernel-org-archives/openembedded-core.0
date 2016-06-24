Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51BE270018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410311"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:14 +0300
Message-Id: <1466764661-24544-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 01/28] oeqa.utils.commands: Introduce get_bb_vars()
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:44 -0000

A new function for getting values of multiple bitbake variables at the
same time.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 18fe39e..0297e53 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -141,6 +141,39 @@ def get_bb_env(target=None, postconfig=None):
     else:
         return bitbake("-e", postconfig=postconfig).output
 
+def get_bb_vars(variables=None, target=None, postconfig=None):
+    """Get values of multiple bitbake variables"""
+    bbenv = get_bb_env(target, postconfig=postconfig)
+
+    var_re = re.compile(r'^(export )?(?P<var>[a-zA-Z]\w+)="(?P<value>.*)"$')
+    unset_re = re.compile(r'^unset (?P<var>[a-zA-Z]\w+)$')
+    lastline = None
+    values = {}
+    for line in bbenv.splitlines():
+        match = var_re.match(line)
+        val = None
+        if match:
+            val = match.group('value')
+        else:
+            match = unset_re.match(line)
+            if match:
+                # Handle [unexport] variables
+                if lastline.startswith('#   "'):
+                    val = lastline.split('"')[1]
+        if val:
+            var = match.group('var')
+            if variables is None:
+                values[var] = val
+            else:
+                if var in variables:
+                    values[var] = val
+                    variables.remove(var)
+                # Stop after all required variables have been found
+                if not variables:
+                    break
+        lastline = line
+    return values
+
 def get_bb_var(var, target=None, postconfig=None):
     val = None
     bbenv = get_bb_env(target, postconfig=postconfig)
-- 
2.6.6


