Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AD17D71498
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 09:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s859e6GM004521 for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 10:40:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PC8HFTLYhXgn
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 10:40:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s859e1tx004498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Sep 2014 10:40:02 +0100
Message-ID: <1409910002.12482.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Sep 2014 10:40:02 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] sstatesig/sstate: Add support for locked down sstate cache usage
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
X-List-Received-Date: Fri, 05 Sep 2014 09:40:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I've been giving things some thought, specifically why sstate doesn't
get used more and why we have people requesting external toolchains. I'm
guessing the issue is that people don't like how often sstate can change
and the lack of an easy way to lock it down.

Locking it down is actually quite easy so patch implements some basics
of how you can do this (for example to a specific toolchain). With an 
addition like this to local.conf (or wherever):

SIGGEN_LOCKEDSIGS = "\
gcc-cross:do_populate_sysroot:a8d91b35b98e1494957a2ddaf4598956 \
eglibc:do_populate_sysroot:13e8c68553dc61f9d67564f13b9b2d67 \
eglibc:do_packagedata:bfca0db1782c719d373f8636282596ee \
gcc-cross:do_packagedata:4b601ff4f67601395ee49c46701122f6 \
"

the code at the end of the email will force the hashes to those values
for the recipes mentioned. The system would then find and use those
specific objects from the sstate cache instead of trying to build
anything.

Obviously this is a little simplistic, you might need to put an override
against this to only apply those revisions for a specific architecture
for example. You'd also probably want to put code in the sstate hash
validation code to ensure it really did install these from sstate since
if it didn't you'd want to abort the build.

This patch also implements support to add to bitbake -S which dumps the
locked sstate checksums for each task into a ready prepared include file
locked-sigs.inc (currently placed into cwd). There is a function, 
bb.parse.siggen.dump_lockedsigs() which can be called to trigger the 
same functionality from task space.

A warning is added to sstate.bbclass through a call back into the siggen
class to warn if objects are not used from the locked cache. The 
SIGGEN_ENFORCE_LOCKEDSIGS variable controls whether this is just a warning 
or a fatal error.

A script is provided to generate sstate directory from a locked-sigs file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ead829e..6316336 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -710,6 +710,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
+    if hasattr(bb.parse.siggen, "checkhashes"):
+        bb.parse.siggen.checkhashes(missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d)
+
     return ret
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4188873..4ff8aaa 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -61,6 +61,16 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # Default to keep dependencies
     return True
 
+def sstate_lockedsigs(d):
+    sigs = {}
+    lockedsigs = (d.getVar("SIGGEN_LOCKEDSIGS", True) or "").split()
+    for ls in lockedsigs:
+        pn, task, h = ls.split(":", 2)
+        if pn not in sigs:
+            sigs[pn] = {}
+        sigs[pn][task] = h
+    return sigs
+
 class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
     name = "OEBasic"
     def init_rundepcheck(self, data):
@@ -75,10 +85,74 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE", True) or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS", True) or "").split()
+        self.lockedsigs = sstate_lockedsigs(data)
+        self.lockedhashes = {}
+        self.lockedpnmap = {}
         pass
     def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
         return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
 
+    def get_taskdata(self):
+        data = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskdata()
+        return (data, self.lockedpnmap)
+
+    def set_taskdata(self, data):
+        coredata, self.lockedpnmap, self.taskdeps = data
+        super(bb.siggen.SignatureGeneratorBasicHash, self).set_taskdata(coredata)
+
+    def dump_sigs(self, dataCache, options):
+        self.dump_lockedsigs()
+        return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
+
+    def get_taskhash(self, fn, task, deps, dataCache):
+        recipename = dataCache.pkg_fn[fn]
+        self.lockedpnmap[fn] = recipename
+        if recipename in self.lockedsigs:
+            if task in self.lockedsigs[recipename]:
+                k = fn + "." + task
+                h = self.lockedsigs[recipename][task]
+                self.lockedhashes[k] = h
+                self.taskhash[k] = h
+                #bb.warn("Using %s %s %s" % (recipename, task, h))
+                return h
+        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
+        #bb.warn("%s %s %s" % (recipename, task, h))
+        return h
+
+    def dump_sigtask(self, fn, task, stampbase, runtime):
+        k = fn + "." + task
+        if k in self.lockedhashes:
+            return
+        super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
+
+    def dump_lockedsigs(self):
+        bb.plain("Writing locked sigs to " + os.getcwd() + "/locked-sigs.inc")
+        with open("locked-sigs.inc", "w") as f:
+            f.write('SIGGEN_LOCKEDSIGS = "\\\n')
+            #for fn in self.taskdeps:
+            for k in self.runtaskdeps:
+                    #k = fn + "." + task
+                    fn = k.rsplit(".",1)[0]
+                    task = k.rsplit(".",1)[1]
+                    if k not in self.taskhash:
+                        continue
+                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
+            f.write('    "\n')
+
+    def checkhashes(self, missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d):
+        enforce = (d.getVar("SIGGEN_ENFORCE_LOCKEDSIGS", True) or "1") == "1"
+        msgs = []
+        for task in range(len(sq_fn)):
+            if task not in ret:
+                for pn in self.lockedsigs:
+                    if sq_hash[task] in self.lockedsigs[pn].itervalues():
+                        msgs.append("Locked sig is set for %s:%s (%s) yet not in sstate cache?" % (pn, sq_task[task], sq_hash[task]))
+        if msgs and enforce:
+            bb.fatal("\n".join(msgs))
+        elif msgs:
+            bb.warn("\n".join(msgs))
+
+
 # Insert these classes into siggen's namespace so it can see and select them
 bb.siggen.SignatureGeneratorOEBasic = SignatureGeneratorOEBasic
 bb.siggen.SignatureGeneratorOEBasicHash = SignatureGeneratorOEBasicHash
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
new file mode 100755
index 0000000..dfb282e
--- /dev/null
+++ b/scripts/gen-lockedsig-cache
@@ -0,0 +1,40 @@
+#!/usr/bin/env python
+#
+# gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir>
+#
+
+import os
+import sys
+import glob
+import shutil
+import errno
+
+def mkdir(d):
+    try:
+        os.makedirs(d)
+    except OSError as e:
+        if e.errno != errno.EEXIST:
+            raise e
+
+if len(sys.argv) < 3:
+    print("Incorrect number of arguments specified")
+    sys.exit(1)
+
+sigs = []
+with open(sys.argv[1]) as f:
+    for l in f.readlines():
+        if ":" in l:
+            sigs.append(l.split(":")[2].split()[0])
+
+files = set()
+for s in sigs:
+    p = sys.argv[2] + "/" + s[:2] + "/*" + s + "*"
+    files |= set(glob.glob(p))
+    p = sys.argv[2] + "/*/" + s[:2] + "/*" + s + "*"
+    files |= set(glob.glob(p))
+
+for f in files:
+    dst = f.replace(sys.argv[2], sys.argv[3])
+    mkdir(os.path.dirname(dst))
+    os.link(f, dst)
+



