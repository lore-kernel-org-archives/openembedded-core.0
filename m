Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C22A860123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730879"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:07:04 +1200
Message-Id: <623e4e15edf449d3ec632013bec8ab3d21f17cc1.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 08/10] lib/oe/sstatesig: print locked sigs file message only when explicitly called
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:53 -0000

If we're building the extensible SDK we don't need to see the "Writing
locked sigs" message; it's only necessary when the user explicitly runs
bitbake -S none <target>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index a58f03a..8224e3a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -130,7 +130,9 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         super(bb.siggen.SignatureGeneratorBasicHash, self).set_taskdata(coredata)
 
     def dump_sigs(self, dataCache, options):
-        self.dump_lockedsigs()
+        sigfile = os.getcwd() + "/locked-sigs.inc"
+        bb.plain("Writing locked sigs to %s" % sigfile)
+        self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
     def get_taskhash(self, fn, task, deps, dataCache):
@@ -181,11 +183,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
-    def dump_lockedsigs(self, sigfile=None, taskfilter=None):
-        if not sigfile:
-            sigfile = os.getcwd() + "/locked-sigs.inc"
-
-        bb.plain("Writing locked sigs to %s" % sigfile)
+    def dump_lockedsigs(self, sigfile, taskfilter=None):
         types = {}
         for k in self.runtaskdeps:
             if taskfilter:
-- 
2.5.5


