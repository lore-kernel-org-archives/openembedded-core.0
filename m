Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FFB165CE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:04:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8BF4cKB025869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Sep 2014 08:04:39 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Sep 2014 08:04:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 11 Sep 2014 23:04:26 +0800
Message-ID: <7afd3df45e3b3b2a918d75cb17f4ae94922dfc89.1410446513.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410446513.git.hongxu.jia@windriver.com>
References: <cover.1410446513.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] Richard Purdie : sstatesig: Improve to handle locking of multiple machines
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
X-List-Received-Date: Thu, 11 Sep 2014 15:04:38 -0000
Content-Type: text/plain

From: "git@opal.openembedded.org" <git@opal.openembedded.org>

Module: openembedded-core.git
Branch: master-next
Commit: a702eb50674ba7017c63829272082d4005237f13
URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a702eb50674ba7017c63829272082d4005237f13

Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Sep  5 11:55:18 2014 +0100

sstatesig: Improve to handle locking of multiple machines

Instead of a single monolithic SIGGEN_LOCKEDSIGS, split this into
separate variables, one per sstate package architecture. Add in
a new SIGGEN_LOCKEDSIGS_TYPES variable which lists the package
architectures to load in.

SIGGEN_LOCKEDSIGS_TYPES is made machine specific using overrides.

Also sort the hashes in the lists by PN to make diffing them easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 7b860c5..add2619 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -63,12 +63,14 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
 def sstate_lockedsigs(d):
     sigs = {}
-    lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS", True) or "").split()
-    for ls in lockedsigs:
-        pn, task, h = ls.split(":", 2)
-        if pn not in sigs:
-            sigs[pn] = {}
-        sigs[pn][task] = h
+    types = (d.getVar("SIGGEN_LOCKEDSIGS_TYPES", True) or "").split()
+    for t in types:
+        lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS_%s" % t, True) or "").split()
+        for ls in lockedsigs:
+            pn, task, h = ls.split(":", 2)
+            if pn not in sigs:
+                sigs[pn] = {}
+            sigs[pn][task] = h
     return sigs
 
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
@@ -88,16 +90,18 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         self.lockedsigs = sstate_lockedsigs(data)
         self.lockedhashes = {}
         self.lockedpnmap = {}
+        self.lockedhashfn = {}
+        self.machine = data.getVar("MACHINE", True)
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 
     def get_taskdata(self):
         data = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskdata()
-        return (data, self.lockedpnmap)
+        return (data, self.lockedpnmap, self.lockedhashfn)
 
     def set_taskdata(self, data):
-        coredata, self.lockedpnmap = data
+        coredata, self.lockedpnmap, self.lockedhashfn = data
         super(bb.siggen.SignatureGeneratorBasicHash, self).set_taskdata(coredata)
 
     def dump_sigs(self, dataCache, options):
@@ -107,6 +111,7 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     def get_taskhash(self, fn, task, deps, dataCache):
         recipename = dataCache.pkg_fn[fn]
         self.lockedpnmap[fn] = recipename
+        self.lockedhashfn[fn] = dataCache.hashfn[fn]
         if recipename in self.lockedsigs:
             if task in self.lockedsigs[recipename]:
                 k = fn + "." + task
@@ -127,17 +132,27 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
 
     def dump_lockedsigs(self):
         bb.plain("Writing locked sigs to " + os.getcwd() + "/locked-sigs.inc")
+        types = {}
+        for k in self.runtaskdeps:
+            fn = k.rsplit(".",1)[0]
+            t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
+            if t not in types:
+                types[t] = []
+            types[t].append(k)
+
         with open("locked-sigs.inc", "w") as f:
-            f.write('SIGGEN_LOCKEDSIGS = "\\\n')
-            #for fn in self.taskdeps:
-            for k in self.runtaskdeps:
-                    #k = fn + "." + task
+            for t in types:
+                f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
+                types[t].sort()
+                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]]) 
+                for k in sortedk:
                     fn = k.rsplit(".",1)[0]
                     task = k.rsplit(".",1)[1]
                     if k not in self.taskhash:
                         continue
                     f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
-            f.write('    "\n')
+                f.write('    "\n')
+            f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(types.keys())))
 
     def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
         enforce = (d.getVar("SIGGEN_ENFORCE_LOCKEDSIGS", True) or "1") == "1"
-- 
1.9.1


