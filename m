Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9609A6FC54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:23:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8I7Nnc2021182
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Sep 2014 00:23:49 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 00:23:49 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 18 Sep 2014 15:23:42 +0800
Message-ID: <9b3b3793117508cf12ca5df50052939d7055539e.1411023982.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411023982.git.hongxu.jia@windriver.com>
References: <cover.1411023982.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] sstatesig: add new item checking for locked signature dump
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
X-List-Received-Date: Thu, 18 Sep 2014 07:23:51 -0000
Content-Type: text/plain

While dumping locked signature, if there is nothing added
in the current build (such as build the same recipe again),
there are accumulating empty SIGGEN_LOCKEDSIGS added, such as:
...
SIGGEN_LOCKEDSIGS_t-x86-64 += "\
    "
SIGGEN_LOCKEDSIGS_TYPES_qemux86 += "t-x86-64"

SIGGEN_LOCKEDSIGS_t-x86-64 += "\
    "
SIGGEN_LOCKEDSIGS_TYPES_qemux86 += "t-x86-64"
...
Add new item checking to fix the issue.

Invoke set() to drop duplicated types

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 56fd953..b2ffc7e 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -64,7 +64,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 def sstate_lockedsigs(d):
     sigs = {}
     types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
-    for t in types:
+    for t in set(types):
         lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
         for ls in lockedsigs:
             pn, task, h = ls.split(":", 2)
@@ -143,6 +143,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
 
         bb.plain("Writing locked sigs to %s" % sigfile)
         types = {}
+        has_new_lockedsigs = False
         for k in self.runtaskdeps:
             fn = k.rsplit(".",1)[0]
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
@@ -151,6 +152,20 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
                 types[t] = []
             types[t].append(k)
 
+            if not has_new_lockedsigs:
+                pn = self.lockedpnmap[fn]
+                if pn not in self.lockedsigs:
+                    has_new_lockedsigs = True
+                    continue
+                task = k.rsplit(".",1)[1]
+                if task not in self.lockedsigs[pn]:
+                    has_new_lockedsigs = True
+                    continue
+
+        if not has_new_lockedsigs:
+            bb.plain("Nothing added to %s" % sigfile)
+            return
+
         with open(sigfile, "a") as f:
             for t in types:
                 f.write('SIGGEN_LOCKEDSIGS_%s += "\\\n' % t)
-- 
1.9.1


