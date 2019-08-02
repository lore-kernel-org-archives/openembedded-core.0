Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id A74986011A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 15:22:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r1so77546832wrl.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Aug 2019 08:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QOAFrhu2kUJEcYbfv0MTcxmmcg+7tLqlkO70K7PRiLY=;
	b=cjJ8m5EiYwMV9CjHdyWPgeGAgHK9vfbOxmkWgyQX+qXZGYdRs5ZK9amZf14N7OFqXi
	/c4KaxK2DQ0U7IHbK3s++4Nf5UAhCXseKijVSjS0+14JBRe6X/z2jgFSEnNJgGgsYJpS
	p36FpAU6Rd3Uq5z37fON51EijFI1rYuwVF8JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QOAFrhu2kUJEcYbfv0MTcxmmcg+7tLqlkO70K7PRiLY=;
	b=bJfe9NxJkC00DoouZ5LkWBI8/wlZpF2R8d2FS27/NJiDTkPSS9qcrUs+j+zvcMU3P4
	i/8/w7L8Dq2vZ0m7LlYop+/m0HEtjsP3f0tiuxlfdfRR3PlJmuTEqk1hBASYscV7S6Mj
	nJXSmegA0MJqqm/YaHDYc0peG96CqX+WJfKCVoSMODGmvcG/z7BVs0n+ZcBoB+L3Ky1E
	ubA/pNtehcH6WaVNN/Y7hkz4xxkjLE+HvMd0C81KjCUoDb+AhVrp75rWrDzlwYR42eNo
	3cwatDpCpOgCdRt3ks38As6knJvR24sa77UEqB1cGQvQJ2m/ePk3SY1QM33KHF4qWCXL
	NM0A==
X-Gm-Message-State: APjAAAXFM9Y83/mMa8n/xG0uiSOZhuVIOc0yTfpvfutKz3Cs4boJTGFP
	Cs0YkyNtXMr2G384nPFdS/68HoVCivQ=
X-Google-Smtp-Source: APXvYqxANiPOwl2d88ZyTUikDTDko0ZwcKZejJBr+r15256DUbw6EnOUA4Zrm84Hng0PYxyYH04MGA==
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr70542232wrw.8.1564759348130;
	Fri, 02 Aug 2019 08:22:28 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r4sm46734991wrq.82.2019.08.02.08.22.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 02 Aug 2019 08:22:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 16:22:20 +0100
Message-Id: <20190802152220.16954-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
References: <20190802152220.16954-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 8/8] sstatesig: Updates to match bitbake siggen changes
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
X-List-Received-Date: Fri, 02 Aug 2019 15:22:28 -0000
Content-Transfer-Encoding: 8bit

Update the metadata to correspond to the bitbake siggen task specification
format change. This standardises on "<fn>:<task>" everywhere rather than
the "." delimiter that was being used in some places.

This is an API breaking change but means we now have a consistent format
being used throughout the codebase without compatibility APIs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/copy_buildsystem.py |  2 +-
 meta/lib/oe/sstatesig.py        | 54 ++++++++++++++-------------------
 2 files changed, 23 insertions(+), 33 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 246ff582503..cb663b21c66 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -174,7 +174,7 @@ class BuildSystem(object):
 def generate_locked_sigs(sigfile, d):
     bb.utils.mkdirhier(os.path.dirname(sigfile))
     depd = d.getVar('BB_TASKDEPDATA', False)
-    tasks = ['%s.%s' % (v[2], v[1]) for v in depd.values()]
+    tasks = ['%s:%s' % (v[2], v[1]) for v in depd.values()]
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
 def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, pruned_output):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 80aafa0c2d1..ee4f28e5eff 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -59,7 +59,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # is machine specific.
     # Therefore if we're not a kernel or a module recipe (inheriting the kernel classes)
     # and we reccomend a kernel-module, we exclude the dependency.
-    depfn = dep.rsplit(".", 1)[0]
+    depfn = dep.rsplit(":", 1)[0]
     if dataCache and isKernel(depfn) and not isKernel(fn):
         for pkg in dataCache.runrecs[fn]:
             if " ".join(dataCache.runrecs[fn][pkg]).find("kernel-module-") != -1:
@@ -142,8 +142,10 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
-    def get_taskhash(self, fn, task, deps, dataCache):
-        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(fn, task, deps, dataCache)
+    def get_taskhash(self, tid, deps, dataCache):
+        h = super(bb.siggen.SignatureGeneratorBasicHash, self).get_taskhash(tid, deps, dataCache)
+
+        (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
         recipename = dataCache.pkg_fn[fn]
         self.lockedpnmap[fn] = recipename
@@ -153,34 +155,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         if recipename in self.unlockedrecipes:
             unlocked = True
         else:
-            def get_mc(tid):
-                tid = tid.rsplit('.', 1)[0]
-                if tid.startswith('mc:'):
-                    elems = tid.split(':')
-                    return elems[1]
             def recipename_from_dep(dep):
-                # The dep entry will look something like
-                # /path/path/recipename.bb.task, virtual:native:/p/foo.bb.task,
-                # ...
-
-                fn = dep.rsplit('.', 1)[0]
+                fn = bb.runqueue.fn_from_tid(dep)
                 return dataCache.pkg_fn[fn]
 
-            mc = get_mc(fn)
             # If any unlocked recipe is in the direct dependencies then the
             # current recipe should be unlocked as well.
-            depnames = [ recipename_from_dep(x) for x in deps if mc == get_mc(x)]
+            depnames = [ recipename_from_dep(x) for x in deps if mc == bb.runqueue.mc_from_tid(x)]
             if any(x in y for y in depnames for x in self.unlockedrecipes):
                 self.unlockedrecipes[recipename] = ''
                 unlocked = True
 
         if not unlocked and recipename in self.lockedsigs:
             if task in self.lockedsigs[recipename]:
-                k = fn + "." + task
                 h_locked = self.lockedsigs[recipename][task][0]
                 var = self.lockedsigs[recipename][task][1]
-                self.lockedhashes[k] = h_locked
-                self.taskhash[k] = h_locked
+                self.lockedhashes[tid] = h_locked
+                self.taskhash[tid] = h_locked
                 #bb.warn("Using %s %s %s" % (recipename, task, h))
 
                 if h != h_locked:
@@ -192,36 +183,35 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         return h
 
     def dump_sigtask(self, fn, task, stampbase, runtime):
-        k = fn + "." + task
-        if k in self.lockedhashes:
+        tid = fn + ":" + task
+        if tid in self.lockedhashes:
             return
         super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigtask(fn, task, stampbase, runtime)
 
     def dump_lockedsigs(self, sigfile, taskfilter=None):
         types = {}
-        for k in self.runtaskdeps:
+        for tid in self.runtaskdeps:
             if taskfilter:
-                if not k in taskfilter:
+                if not tid in taskfilter:
                     continue
-            fn = k.rsplit(".",1)[0]
+            fn = bb.runqueue.fn_from_tid(tid)
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
             t = 't-' + t.replace('_', '-')
             if t not in types:
                 types[t] = []
-            types[t].append(k)
+            types[t].append(tid)
 
         with open(sigfile, "w") as f:
             l = sorted(types)
             for t in l:
                 f.write('SIGGEN_LOCKEDSIGS_%s = "\\\n' % t)
                 types[t].sort()
-                sortedk = sorted(types[t], key=lambda k: self.lockedpnmap[k.rsplit(".",1)[0]])
-                for k in sortedk:
-                    fn = k.rsplit(".",1)[0]
-                    task = k.rsplit(".",1)[1]
-                    if k not in self.taskhash:
+                sortedtid = sorted(types[t], key=lambda tid: self.lockedpnmap[bb.runqueue.fn_from_tid(tid)])
+                for tid in sortedtid:
+                    (_, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
+                    if tid not in self.taskhash:
                         continue
-                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[k] + " \\\n")
+                    f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.taskhash[tid] + " \\\n")
                 f.write('    "\n')
             f.write('SIGGEN_LOCKEDSIGS_TYPES_%s = "%s"' % (self.machine, " ".join(l)))
 
@@ -229,11 +219,11 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         with open(sigfile, "w") as f:
             tasks = []
             for taskitem in self.taskhash:
-                (fn, task) = taskitem.rsplit(".", 1)
+                (fn, task) = taskitem.rsplit(":", 1)
                 pn = self.lockedpnmap[fn]
                 tasks.append((pn, task, fn, self.taskhash[taskitem]))
             for (pn, task, fn, taskhash) in sorted(tasks):
-                f.write('%s.%s %s %s\n' % (pn, task, fn, taskhash))
+                f.write('%s:%s %s %s\n' % (pn, task, fn, taskhash))
 
     def checkhashes(self, sq_data, missed, found, d):
         warn_msgs = []
-- 
2.20.1


