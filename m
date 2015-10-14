Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA94770C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 20:27:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2015 13:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,682,1437462000"; d="scan'208";a="826791025"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.25.92])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2015 13:27:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 21:27:25 +0100
Message-Id: <02872ca21582b78fa5320a8f85d4edab446506ee.1444854425.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1444854425.git.paul.eggleton@linux.intel.com>
References: <cover.1444854425.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1444854425.git.paul.eggleton@linux.intel.com>
References: <cover.1444854425.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] devtool: extract: fix error handling
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
X-List-Received-Date: Wed, 14 Oct 2015 20:27:32 -0000

If recipe parsing fails we need to exit out instead of attempting to use
the data object that's set to None, which resulted in a traceback.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6ce3144..5d7e903 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -225,6 +225,9 @@ def extract(args, config, basepath, workspace):
     import bb
 
     tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    if not tinfoil:
+        # Error already shown
+        return 1
 
     rd = parse_recipe(config, tinfoil, args.recipename, True)
     if not rd:
@@ -271,6 +274,8 @@ def _prep_extract_operation(config, basepath, recipename):
        trying to extract a package. Returns the tinfoil instance to be used."""
     tinfoil = setup_tinfoil(basepath=basepath)
     rd = parse_recipe(config, tinfoil, recipename, True)
+    if not rd:
+        return None
 
     if bb.data.inherits_class('kernel-yocto', rd):
         tinfoil.shutdown()
@@ -500,6 +505,9 @@ def modify(args, config, basepath, workspace):
                            args.srctree)
     if args.extract:
         tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+        if not tinfoil:
+            # Error already shown
+            return 1
     else:
         tinfoil = setup_tinfoil(basepath=basepath)
 
-- 
2.1.0


