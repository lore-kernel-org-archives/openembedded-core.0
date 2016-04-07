Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B4C6477011
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:34:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Apr 2016 16:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="780431305"
Received: from bitbang.jf.intel.com ([10.7.199.152])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2016 16:34:58 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 16:34:50 -0700
Message-Id: <dd9d3ad62f35cc78f4e5ffa9fbfc9f8cd0eb2c53.1460071932.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/5] sstatesig.py: Improve the SIGGEN_LOCKEDSIGS_TASKSIG_CHECK message
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
X-List-Received-Date: Thu, 07 Apr 2016 23:34:58 -0000

The previous message when signatures didn't match between the metadata
and the locked signatures file, the message output was a bit confusing.

Now the message should be of the form:

The zlib-native:do_install sig is computed to be
53531910a2a7848432da89def942a91a, but the sig is locked to
d25ba9035f7ccb308e51bbe1066e8d27 in SIGGEN_LOCKEDSIGS_t-x86-64

which will hopefully be more useful in understanding the problem.

[YOCTO #9195]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b2319ff..009adea 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -65,12 +65,13 @@ def sstate_lockedsigs(d):
     sigs = {}
     types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
     for t in types:
-        lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
+        siggen_lockedsigs_var = "SIGGEN_LOCKEDSIGS_%s" % t
+        lockedsigs = (d.getVar(siggen_lockedsigs_var, True) or "").split()
         for ls in lockedsigs:
             pn, task, h = ls.split(":", 2)
             if pn not in sigs:
                 sigs[pn] = {}
-            sigs[pn][task] = h
+            sigs[pn][task] = [h, siggen_lockedsigs_var]
     return sigs
 
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
@@ -138,14 +139,15 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         if recipename in self.lockedsigs:
             if task in self.lockedsigs[recipename]:
                 k = fn + "." + task
-                h_locked = self.lockedsigs[recipename][task]
+                h_locked = self.lockedsigs[recipename][task][0]
+                var = self.lockedsigs[recipename][task][1]
                 self.lockedhashes[k] = h_locked
                 self.taskhash[k] = h_locked
                 #bb.warn("Using %s %s %s" % (recipename, task, h))
 
                 if h != h_locked:
-                    self.mismatch_msgs.append('The %s:%s sig (%s) changed, use locked sig %s to instead'
-                                          % (recipename, task, h, h_locked))
+                    self.mismatch_msgs.append('The %s:%s sig is computed to be %s, but the sig is locked to %s in %s'
+                                          % (recipename, task, h, h_locked, var))
 
                 return h_locked
         #bb.warn("%s %s %s" % (recipename, task, h))
-- 
2.5.5


