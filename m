Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9092D73196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 21:05:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 13 Jul 2016 14:05:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,359,1464678000"; d="scan'208";a="733801395"
Received: from apbalanx-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.177.79])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jul 2016 14:04:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 09:04:21 +1200
Message-Id: <62416e0d1f60d5489becbece2e645ad431e07147.1468443702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468443702.git.paul.eggleton@linux.intel.com>
References: <cover.1468443702.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] lib/oe/recipeutils: fix a few issues in find_layerdir()
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
X-List-Received-Date: Wed, 13 Jul 2016 21:05:09 -0000

* Allow the function to be called with the base layer path (in which
  case it will just return the same path)
* Ensure that the function doesn't recurse indefinitely if it's called
  on a file that's not inside a layer
* Correct the doc comment for accuracy

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index e3c4b8a..cb4ed53 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -728,14 +728,16 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
 
 
 def find_layerdir(fn):
-    """ Figure out relative path to base of layer for a file (e.g. a recipe)"""
-    pth = os.path.dirname(fn)
+    """ Figure out the path to the base of the layer containing a file (e.g. a recipe)"""
+    pth = fn
     layerdir = ''
     while pth:
         if os.path.exists(os.path.join(pth, 'conf', 'layer.conf')):
             layerdir = pth
             break
         pth = os.path.dirname(pth)
+        if pth == '/':
+            return None
     return layerdir
 
 
-- 
2.5.5


