Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 48F7971430
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 17:20:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2014 10:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,500,1406617200"; d="scan'208";a="571260087"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.16])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2014 10:19:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Sep 2014 18:19:32 +0100
Message-Id: <42abb7aa60ce4510aef3ee0b9ca16192cdc3e7a1.1410369387.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1410369386.git.paul.eggleton@linux.intel.com>
References: <cover.1410369386.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1410369386.git.paul.eggleton@linux.intel.com>
References: <cover.1410369386.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] sstatesig.py: Add a path argument to dump_lockedsigs()
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
X-List-Received-Date: Wed, 10 Sep 2014 17:20:12 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

Previously the function always used os.getcwd() for the location to
write the locked signatures file. However, that isn't easily used by
calling tasks, so only use os.getcwd() if the caller doesn't specify
a path.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index add2619..9fcbc2b 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -130,8 +130,9 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
-    def dump_lockedsigs(self):
-        bb.plain("Writing locked sigs to " + os.getcwd() + "/locked-sigs.inc")
+    def dump_lockedsigs(self, path=os.getcwd()):
+        outfile = os.path.join(path, "locked-sigs.inc")
+        bb.plain("Writing locked sigs to %s" % outfile)
         types = {}
         for k in self.runtaskdeps:
             fn = k.rsplit(".",1)[0]
@@ -140,7 +141,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                 types[t] = []
             types[t].append(k)
 
-        with open("locked-sigs.inc", "w") as f:
+        with open(outfile, "w") as f:
             for t in types:
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
                 types[t].sort()
-- 
1.9.3


