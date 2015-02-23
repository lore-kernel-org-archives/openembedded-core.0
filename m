Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 819FE706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537363"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:36 +0000
Message-Id: <ebd0585a01235b7da61dc235381f0230524a406c.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] sstatesig: Add ability to filter list of tasks for locked-sigs.inc
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:48 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index af7617e..62e75c2 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -137,13 +137,16 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
-    def dump_lockedsigs(self, sigfile=None):
+    def dump_lockedsigs(self, sigfile=None, taskfilter=None):
         if not sigfile:
             sigfile = os.getcwd() + "/locked-sigs.inc"
 
         bb.plain("Writing locked sigs to %s" % sigfile)
         types = {}
         for k in self.runtaskdeps:
+            if taskfilter:
+                if not k in taskfilter:
+                    continue
             fn = k.rsplit(".",1)[0]
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
             t = 't-' + t.replace('_', '-')
-- 
1.9.3


