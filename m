Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9A36C660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:16:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 20:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,289,1539673200"; d="scan'208";a="96057611"
Received: from thivuong-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.138.218])
	by orsmga008.jf.intel.com with ESMTP; 27 Nov 2018 20:16:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:16:15 +1300
Message-Id: <a011972aa867daf32d00685f54f5565c8c1ab588.1543378296.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1543378296.git.paul.eggleton@linux.intel.com>
References: <cover.1543378296.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] lib/oe/recipeutils: patch_recipe(): fix replacing varflag values
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
X-List-Received-Date: Wed, 28 Nov 2018 04:16:35 -0000

The code here wasn't correctly getting the variable history for
varflags, so for example if you did a devtool upgrade on a recipe where
the SRC_URI checksums were in the .inc file (typical for python recipes
in order to support both python 2 and 3) then after the upgrade the
new values would be set in the recipe and the old values were left in
the .inc, which is not right. Teach the code here how to get the history
for varflags so it works properly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 9de291f5b59..886ad26f178 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -81,11 +81,19 @@ def get_var_files(fn, varlist, d):
     """
     varfiles = {}
     for v in varlist:
-        history = d.varhistory.variable(v)
         files = []
-        for event in history:
-            if 'file' in event and not 'flag' in event:
-                files.append(event['file'])
+        if '[' in v:
+            varsplit = v.split('[')
+            varflag = varsplit[1].split(']')[0]
+            history = d.varhistory.variable(varsplit[0])
+            for event in history:
+                if 'file' in event and event.get('flag', '') == varflag:
+                    files.append(event['file'])
+        else:
+            history = d.varhistory.variable(v)
+            for event in history:
+                if 'file' in event and not 'flag' in event:
+                    files.append(event['file'])
         if files:
             actualfile = files[-1]
         else:
-- 
2.17.2


