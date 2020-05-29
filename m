Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.29384.1590731592716727128
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 22:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: e18boFVKdh/eG9uTT0mikR2Ub1eJhSeVQsdiqmjDsyYFbJsvHZL2A7Px6ktlDKn2V98bOnrBPW
 +m8VU+q5NClA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:25 -0700
IronPort-SDR: oONlargXi96TQXHoaenvVzwYOsge5u6w+kw5f3uQX69bBk8Ze0RSnxG2l53hGmWDIYMZp+eP3W
 DWr1ryB1yF5g==
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; 
   d="scan'208";a="414866152"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.136.157])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 22:53:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 06/25] sstatesig: Optimise get_taskhash for hashequiv
Date: Fri, 29 May 2020 13:52:42 +0800
Message-Id: <4c7e12ee42ff6ab228c2d8aa23a8153ff0debd4b.1590731377.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1590731377.git.anuj.mittal@intel.com>
References: <cover.1590731377.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With hashequiv the get_taskhash function is called much more regularly
and contains expensive operations. This these don't change based upon
hash in a given build, improve the caching within the function to
reduce overhead.

(From OE-Core rev: de98cfe3cde4b8d5f4b163b5fba3f129651ef06a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.25.4

