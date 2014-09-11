Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D121D65CE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:04:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8BF4acq027223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Sep 2014 08:04:36 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 11 Sep 2014 08:04:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 11 Sep 2014 23:04:25 +0800
Message-ID: <0b32d841875c0b908c713e9e88c68a17312ea673.1410446513.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410446513.git.hongxu.jia@windriver.com>
References: <cover.1410446513.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] Richard Purdie : sstatesig/sstate: Add support for locked down sstate cache usage
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
X-List-Received-Date: Thu, 11 Sep 2014 15:04:39 -0000
Content-Type: text/plain

From: "git@opal.openembedded.org" <git@opal.openembedded.org>

Module: openembedded-core.git
Branch: master-next
Commit: a12e33a584a77df4bdd9ad6a5d1a58f4dde10317
URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a12e33a584a77df4bdd9ad6a5d1a58f4dde10317

Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Fri Sep  5 10:40:02 2014 +0100

sstatesig/sstate: Add support for locked down sstate cache usage

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
---
 meta/classes/sstate.bbclass |  3 ++
 meta/lib/oe/sstatesig.py    | 74 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/gen-lockedsig-cache | 40 ++++++++++++++++++++++++
 3 files changed, 117 insertions(+)
 create mode 100755 scripts/gen-lockedsig-cache

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 67e0c1d..0cb5235 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -712,6 +712,9 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, sq_hashfn, d):
             evdata['found'].append( (sq_fn[task], sq_task[task], sq_hash[task], sstatefile ) )
         bb.event.fire(bb.event.MetadataEvent("MissedSstate", evdata), d)
 
+    if hasattr(bb.parse.siggen, "checkhashes"):
+        bb.parse.siggen.checkhashes(missed, ret, sq_fn, sq_task, sq_hash, sq_hashfn, d)
+
     return ret
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 4188873..7b860c5 100644
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
+        coredata, self.lockedpnmap = data
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
-- 
1.9.1


