Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D94586011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 08:24:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 14 Apr 2016 01:24:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,484,1455004800"; d="scan'208";a="686085002"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.255.145.9])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Apr 2016 01:24:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Apr 2016 20:24:18 +1200
Message-Id: <67fe1d7da766ad3c0170755753cdeab175a3fac6.1460622215.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460622215.git.paul.eggleton@linux.intel.com>
References: <cover.1460622215.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1460622215.git.paul.eggleton@linux.intel.com>
References: <cover.1460622215.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: update-recipe: handle where SRC_URI is appended to with +=
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
X-List-Received-Date: Thu, 14 Apr 2016 08:24:56 -0000

If a recipe sets SRC_URI and then appends more items to it with +=
(such as the current rpm recipe in OE-Core), the code in
patch_recipe_file() was failing with a traceback. Work around the
problem for now by dropping the existing lines if we understand the
operation, else just set the value outright at the end. This leaves
something to be desired as it either doesn't respect the existing
structure or leaves a mess but it's better than the current
breakage.

We'll need to come up with a better solution later. Part of the problem
is the existing code structure doesn't allow for patch_recipe_file() to
know what's being added or removed - it only knows the final value that
the caller wants set.

Fixes [YOCTO #9458].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 5e0fda5..6c7adb5 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -235,9 +235,10 @@ def patch_recipe_file(fn, values, patch=False, relpath=''):
                     outputvalue(k, newlines, rewindcomments=True)
                     del remainingnames[k]
             # Now change this variable, if it needs to be changed
-            if varname in existingnames:
-                outputvalue(varname, newlines)
-                del remainingnames[varname]
+            if varname in existingnames and op in ['+=', '=', '=+']:
+                if varname in remainingnames:
+                    outputvalue(varname, newlines)
+                    del remainingnames[varname]
                 return None, None, 0, True
         else:
             if varname in values:
-- 
2.5.5


