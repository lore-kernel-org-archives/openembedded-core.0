Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E237B6B269
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 17:47:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 04 Apr 2014 10:47:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,796,1389772800"; d="scan'208";a="507126386"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2014 10:47:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 18:46:39 +0100
Message-Id: <e62799a9a1dcc8284920e795096947f85a9f2af4.1396633542.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1396633542.git.paul.eggleton@linux.intel.com>
References: <cover.1396633542.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 4/4] sstatesig: Anchor inherits class tests
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
X-List-Received-Date: Fri, 04 Apr 2014 17:47:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids a nasty sstate hash corruption issue where the
fact the testimage bbclass was inherited meant that the checksum
changed due to testimage.bbclass being confused with image.bbclass.

This patch anchors the bbclass names to avoid this confusion.

(From OE-Core master rev: 943a75a4f3b6877e4092dae14b59b7afef8cad3d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 1bcaacf..a1efc7b 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -10,9 +10,9 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return x.startswith("nativesdk-")
     def isKernel(fn):
         inherits = " ".join(dataCache.inherits[fn])
-        return inherits.find("module-base.bbclass") != -1 or inherits.find("linux-kernel-base.bbclass") != -1
+        return inherits.find("/module-base.bbclass") != -1 or inherits.find("/linux-kernel-base.bbclass") != -1
     def isImage(fn):
-        return "image.bbclass" in " ".join(dataCache.inherits[fn])
+        return "/image.bbclass" in " ".join(dataCache.inherits[fn])
 
     # Always include our own inter-task dependencies
     if recipename == depname:
-- 
1.9.0


