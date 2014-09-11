Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE956FE64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:04:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8BF4iF9025875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Sep 2014 08:04:44 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Sep 2014 08:04:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 11 Sep 2014 23:04:29 +0800
Message-ID: <f7654c9c712e2a736e7d177186e16b6a261ca7fc.1410446513.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410446513.git.hongxu.jia@windriver.com>
References: <cover.1410446513.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sstatesig: incremental dump lockedsigs
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
X-List-Received-Date: Thu, 11 Sep 2014 15:04:44 -0000
Content-Type: text/plain

While including an existed lockedsigs file to build from
locked sstate-cache, and we want to incremental build the
locked sstate-cache. Config with:
...
SIGGEN_DUMP_LOCKEDSIGS = '1'
SIGGEN_LOCKEDSIGS_CONFIG = "${TOPDIR}/locked-sigs.inc"
require ${SIGGEN_LOCKEDSIGS_CONFIG}
...
So we support to dump lockedsigs file incrementally

Since we improve to handle locking of multiple machines and
add a new SIGGEN_LOCKEDSIGS_TYPES variable which lists the
package architectures to load in. We should add package
architectures as type to self.lockedsigs to reflect that.
Such as:
{recipename:{task:{hash1}}} --> {type:{recipename:{task:{hash1}}}}

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sstatesig.py | 67 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 22 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index c9edd80..8b491a6 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -65,12 +65,15 @@ def sstate_lockedsigs(d):
     sigs = {}
     types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
     for t in types:
+        if t not in sigs:
+            sigs[t] = {}
+
         lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
         for ls in lockedsigs:
             pn, task, h = ls.split(":", 2)
-            if pn not in sigs:
-                sigs[pn] = {}
-            sigs[pn][task] = h
+            if pn not in sigs[t]:
+                sigs[t][pn] = {}
+            sigs[t][pn][task] = h
     return sigs
 
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
@@ -115,10 +118,14 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         recipename = dataCache.pkg_fn[fn]
         self.lockedpnmap[fn] = recipename
         self.lockedhashfn[fn] = dataCache.hashfn[fn]
-        if recipename in self.lockedsigs:
-            if task in self.lockedsigs[recipename]:
+
+        t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
+        if t not in self.lockedsigs:
+            return h
+        if recipename in self.lockedsigs[t]:
+            if task in self.lockedsigs[t][recipename]:
                 k = fn + "." + task
-                h_locked = self.lockedsigs[recipename][task]
+                h_locked = self.lockedsigs[t][recipename][task]
                 self.lockedhashes[k] = h_locked
                 self.taskhash[k] = h_locked
                 #bb.warn("Using %s %s %s" % (recipename, task, h))
@@ -137,6 +144,19 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
+    def update_lockedsigs(self, type, recipename, task, hash):
+        if type not in self.lockedsigs:
+            self.lockedsigs[type] = {}
+
+        if recipename not in self.lockedsigs[type]:
+            self.lockedsigs[type][recipename] = {}
+
+        if task not in self.lockedsigs[type][recipename]:
+            self.lockedsigs[type][recipename][task] = hash
+        elif hash != self.lockedsigs[type][recipename][task]:
+            bb.warn('Conflict %s %s %s (new %s, old %s)' %
+                    (type, recipename, task, hash, self.lockedsigs[type][recipename][task]))
+
     def dump_lockedsigs(self, where_to_dump=None):
         if not where_to_dump:
             where_to_dump = os.getcwd() + "/locked-sigs.inc"
@@ -146,30 +166,33 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         for k in self.runtaskdeps:
             fn = k.rsplit(".",1)[0]
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
-            if t not in types:
-                types[t] = []
-            types[t].append(k)
+            recipename = self.lockedpnmap[fn]
+            task = k.rsplit(".",1)[1]
+            hash = self.taskhash[k]
+            self.update_lockedsigs(t, recipename, task, hash)
 
         with open(where_to_dump, "w") as f:
-            for t in types:
-                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
-                types[t].sort()
-                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
-                for k in sortedk:
-                    fn = k.rsplit(".",1)[0]
-                    task = k.rsplit(".",1)[1]
-                    if k not in self.taskhash:
-                        continue
-                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
+            for type in sorted(self.lockedsigs):
+                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % type)
+
+                for recipename in sorted(self.lockedsigs[type]):
+                    for task in sorted(self.lockedsigs[type][recipename]):
+                        hash = self.lockedsigs[type][recipename][task]
+                        f.write("    " + recipename + ":" + task + ":" + hash + " \\\n")
                 f.write('    "\n')
-            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
+
+            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(self.lockedsigs.keys())))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         checklevel = d.getVar("SIGGEN_LOCKEDSIGS_CHECK_LEVEL", True)
         for task in range(len(sq_fn)):
             if task not in ret:
-                for pn in self.lockedsigs:
-                    if sq_hash[task] in self.lockedsigs[pn].itervalues():
+                t = sq_hashfn[task].split(" ")[1].split(":")[5]
+                if t not in self.lockedsigs:
+                    continue
+
+                for pn in self.lockedsigs[t]:
+                    if sq_hash[task] in self.lockedsigs[t][pn].itervalues():
                         self.checkmsgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?"
                                                % (pn, sq_task[task], sq_hash[task]))
 
-- 
1.9.1


