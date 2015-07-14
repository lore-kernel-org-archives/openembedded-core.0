Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E48E375F1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 21:56:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 14:56:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,475,1432623600"; d="scan'208";a="606232594"
Received: from fgalanel-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.60])
	by orsmga003.jf.intel.com with ESMTP; 14 Jul 2015 14:56:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 22:56:00 +0100
Message-Id: <f7d52e3c57e480958ae834384aa8699b173cf97e.1436910107.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436910107.git.paul.eggleton@linux.intel.com>
References: <cover.1436910107.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436910107.git.paul.eggleton@linux.intel.com>
References: <cover.1436910107.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] lib/oe/recipeutils: fix replace_dir_vars to return the correct variables
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
X-List-Received-Date: Tue, 14 Jul 2015 21:56:13 -0000

If we sort by length of name here we get the variables we are interested
in first. I've tested this with all of the variables we care about (the
ones at the top of bitbake.conf) and it returns the right results.

This fixes the failures we've been seeing in the oe-selftest
test_recipetool_appendfile_* tests.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index bd812cc..78d6926 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -617,7 +617,8 @@ def find_layerdir(fn):
 def replace_dir_vars(path, d):
     """Replace common directory paths with appropriate variable references (e.g. /etc becomes ${sysconfdir})"""
     dirvars = {}
-    for var in d:
+    # Sort by length so we get the variables we're interested in first
+    for var in sorted(d.keys(), key=len):
         if var.endswith('dir') and var.lower() == var:
             value = d.getVar(var, True)
             if value.startswith('/') and not '\n' in value and value not in dirvars:
-- 
2.1.0


