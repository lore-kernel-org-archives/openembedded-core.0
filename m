Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1311271475
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 10:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s85AtK0s008045 for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 11:55:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6Uy3KE3zv0QI
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 11:55:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s85AtHNZ008040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 11:55:18 +0100
Message-ID: <1409914518.12482.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Sep 2014 11:55:18 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] sstatesig: Improve to handle locking of multiple machines
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
X-List-Received-Date: Fri, 05 Sep 2014 10:55:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Instead of a single monolithic SIGGEN_LOCKEDSIGS, split this into
separate variables, one per sstate package architecture. Add in
a new SIGGEN_LOCKEDSIGS_TYPES variable which lists the package
architectures to load in.

SIGGEN_LOCKEDSIGS_TYPES is made machine specific using overrides.

Also sort the hashes in the lists by PN to make diffing them easier.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

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



