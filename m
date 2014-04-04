Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD23610CD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:47:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2014 10:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,796,1389772800"; d="scan'208";a="507126335"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2014 10:46:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 18:46:36 +0100
Message-Id: <a1cc5ac89cbe0f229f36bea2346998c517f02cf4.1396633542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 1/4] sstatesig.py: Fix image regeneration issue
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
X-List-Received-Date: Fri, 04 Apr 2014 17:47:21 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With the "ABI safe" recipes, we've been excluding those from signatures. This
is fine in the general case but in the specific case of image recipes it breaks.

A good test case is the interfaces file. Editting this causes init-ifupdown
to rebuild but not an image containing it (e.g. core-image-minimal).

We need to ensure the checksums are added to the image recipes and this change
does that.

(From OE-Core master rev: fd085f15e7cd093953f974f69277e130174d551d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 852fb7e..1bcaacf 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -11,6 +11,8 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isKernel(fn):
         inherits = " ".join(dataCache.inherits[fn])
         return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
+    def isImage(fn):
+        return "image.bbclass" in " ".join(dataCache.inherits[fn])
 
     # Always include our own inter-task dependencies
     if recipename == depname:
@@ -32,7 +34,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return False
 
     # Exclude well defined machine specific configurations which don't change ABI
-    if depname in siggen.abisaferecipes:
+    if depname in siggen.abisaferecipes and not isImage(fn):
         return False
 
     # Exclude well defined recipe->dependency
-- 
1.9.0


