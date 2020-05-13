Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.8460.1589383494816448396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 08:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04DFOp1j025420
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 10:24:53 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][ 1/2] sstatesig: Optimise get_taskhash for hashequiv
Date: Wed, 13 May 2020 10:24:50 -0500
Message-Id: <20200513152451.162042-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513152451.162042-1-mark.hatle@kernel.crashing.org>
References: <20200513152451.162042-1-mark.hatle@kernel.crashing.org>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With hashequiv the get_taskhash function is called much more regularly
and contains expensive operations. This these don't change based upon
hash in a given build, improve the caching within the function to
reduce overhead.

(From OE-Core rev: de98cfe3cde4b8d5f4b163b5fba3f129651ef06a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/lib/oe/sstatesig.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index b2316b12b8..f1abff0c45 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -151,6 +151,13 @@ class SignatureGeneratorOEBasicHashMixIn(object):
 
     def get_taskhash(self, tid, deps, dataCache):
         h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(tid, deps, dataCache)
+        if tid in self.lockedhashes:
+            if self.lockedhashes[tid]:
+                return self.lockedhashes[tid]
+            else:
+                return h
+
+        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(tid, deps, dataCache)
 
         (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
@@ -187,17 +194,19 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                                           % (recipename, task, h, h_locked, var))
 
                 return h_locked
+
+        self.lockedhashes[tid] = False
         #bb.warn("%s %s %s" % (recipename, task, h))
         return h
 
     def get_unihash(self, tid):
-        if tid in self.lockedhashes:
+        if tid in self.lockedhashes and self.lockedhashes[tid]:
             return self.lockedhashes[tid]
         return super().get_unihash(tid)
 
     def dump_sigtask(self, fn, task, stampbase, runtime):
         tid = fn + ":" + task
-        if tid in self.lockedhashes:
+        if tid in self.lockedhashes and self.lockedhashes[tid]:
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
-- 
2.17.1

