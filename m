Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.16.1591983412026709536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:36:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=myH61z01;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id b5so9519654iln.5
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MtEyc4qPtrgODdFThKuqFTwZSFEzxVARxMWU/9I7vB4=;
        b=myH61z01qQy3rlqbJt1qjOPpLorVo4uJY6hcJelN/mw+5zexoPz0d1r6iXcjHTc8Vl
         9Lls/fT8yHPyWQlNspCZabBwS0StKRstctb93nMIzg9Kg2rVP50adMfB+I5EJeyt8tkU
         /neyzFX7b02Gn9NzVHFpw6Eq+H+/SAELw/7KQcGgd01VH1P+AX7MJ6ti+hd4xDjfCG9Y
         fv7FamsClcYk22dOxsbVeRUSWuPHtfFtn6jze2v+MsPfuqhP+vxAc2zVChoXsp9a0RVy
         ernA1M/sDb6FcTO6bTq0y3n4x0p1osQn6ur2w+MqCAncgWpwwx0DcsQmq0rqb3bY9pjD
         aNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MtEyc4qPtrgODdFThKuqFTwZSFEzxVARxMWU/9I7vB4=;
        b=CelQ9PqKCue4af8Y/AGFLGLeCbNx8qEpllydf2S5M80N0zjKyjv6h/36ZEfRN4pVFR
         7a/FKus4+cU31NSqby8TS6hOCIg0T/RE3q7czi+u2/mLoaBBZfA0GN0dh2rzLXnaI40T
         zaJc2cqqflwO6mRB3oxdgMb14mKVojqyYmKAwwNV8YrfEZtGoiuAz6uhGnwBGV9GY310
         GYhoCv9q6Hnux3n0BMPZJoiSqg+L/gmSO8Y0Ob2VtYbB6+YBI7sPJGPzCEDgS4ipFI4F
         KTRtmdOz08RPU5WImPFgzxgOU5hssYKEnIiMzCo0eh+HR0Ynvipc43USz9Y2WFOJ/z4D
         025w==
X-Gm-Message-State: AOAM5328JCZyE86GDQy00dbOh9uFUOumqKWmzHZUdNWY26bshIT2ItL1
	+Zfwnw4hwUCLHfH6Wm9ASKvXXteJ
X-Google-Smtp-Source: ABdhPJzDiwCTferNSvriPAPnU6+W5gxkqWab+gEK82xwWobexrIcEGOUIxnX9274tBU4T1inJ/eaQw==
X-Received: by 2002:a92:c985:: with SMTP id y5mr14358664iln.50.1591983411056;
        Fri, 12 Jun 2020 10:36:51 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:35f5:8651:479a:b9eb])
        by smtp.gmail.com with ESMTPSA id y19sm3281059iod.41.2020.06.12.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:36:50 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] sstatesig: Account for all dataCaches being passed
Date: Fri, 12 Jun 2020 12:36:47 -0500
Message-Id: <20200612173647.7527-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bitbake now passes all the dataCaches to the taskhash API, so use this
to correctly filter mcdepends.

[YOCTO #13724]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 79 +++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index d24e3738ae..21ae0a7657 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -2,9 +2,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 import bb.siggen
+import bb.runqueue
 import oe
 
-def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
+def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCaches):
     # Return True if we should keep the dependency, False to drop it
     def isNative(x):
         return x.endswith("-native")
@@ -12,23 +13,26 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return "-cross-" in x
     def isNativeSDK(x):
         return x.startswith("nativesdk-")
-    def isKernel(fn):
-        inherits = " ".join(dataCache.inherits[fn])
+    def isKernel(mc, fn):
+        inherits = " ".join(dataCaches[mc].inherits[fn])
         return inherits.find("/module-base.bbclass") != -1 or inherits.find("/linux-kernel-base.bbclass") != -1
-    def isPackageGroup(fn):
-        inherits = " ".join(dataCache.inherits[fn])
+    def isPackageGroup(mc, fn):
+        inherits = " ".join(dataCaches[mc].inherits[fn])
         return "/packagegroup.bbclass" in inherits
-    def isAllArch(fn):
-        inherits = " ".join(dataCache.inherits[fn])
+    def isAllArch(mc, fn):
+        inherits = " ".join(dataCaches[mc].inherits[fn])
         return "/allarch.bbclass" in inherits
-    def isImage(fn):
-        return "/image.bbclass" in " ".join(dataCache.inherits[fn])
-
-    # (Almost) always include our own inter-task dependencies.
-    # The exception is the special do_kernel_configme->do_unpack_and_patch
-    # dependency from archiver.bbclass.
-    if recipename == depname:
-        if task == "do_kernel_configme" and dep.endswith(".do_unpack_and_patch"):
+    def isImage(mc, fn):
+        return "/image.bbclass" in " ".join(dataCaches[mc].inherits[fn])
+
+    depmc, _, deptaskname, depmcfn = bb.runqueue.split_tid_mcfn(dep)
+    mc, _ = bb.runqueue.split_mc(fn)
+
+    # (Almost) always include our own inter-task dependencies (unless it comes
+    # from a mcdepends). The exception is the special
+    # do_kernel_configme->do_unpack_and_patch dependency from archiver.bbclass.
+    if recipename == depname and depmc == mc:
+        if task == "do_kernel_configme" and deptaskname == "do_unpack_and_patch":
             return False
         return True
 
@@ -47,11 +51,11 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # Only target packages beyond here
 
     # allarch packagegroups are assumed to have well behaved names which don't change between architecures/tunes
-    if isPackageGroup(fn) and isAllArch(fn) and not isNative(depname):
+    if isPackageGroup(mc, fn) and isAllArch(mc, fn) and not isNative(depname):
         return False
 
     # Exclude well defined machine specific configurations which don't change ABI
-    if depname in siggen.abisaferecipes and not isImage(fn):
+    if depname in siggen.abisaferecipes and not isImage(mc, fn):
         return False
 
     # Kernel modules are well namespaced. We don't want to depend on the kernel's checksum
@@ -59,10 +63,9 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     # is machine specific.
     # Therefore if we're not a kernel or a module recipe (inheriting the kernel classes)
     # and we reccomend a kernel-module, we exclude the dependency.
-    depfn = dep.rsplit(":", 1)[0]
-    if dataCache and isKernel(depfn) and not isKernel(fn):
-        for pkg in dataCache.runrecs[fn]:
-            if " ".join(dataCache.runrecs[fn][pkg]).find("kernel-module-") != -1:
+    if dataCaches and isKernel(depmc, depmcfn) and not isKernel(mc, fn):
+        for pkg in dataCaches[mc].runrecs[fn]:
+            if " ".join(dataCaches[mc].runrecs[fn][pkg]).find("kernel-module-") != -1:
                 return False
 
     # Default to keep dependencies
@@ -87,10 +90,12 @@ class SignatureGeneratorOEBasic(bb.siggen.SignatureGeneratorBasic):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
         pass
-    def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
-        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
+    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches = None):
+        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
 
 class SignatureGeneratorOEBasicHashMixIn(object):
+    supports_multiconfig_datacaches = True
+
     def init_rundepcheck(self, data):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
@@ -126,8 +131,8 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             newsafedeps.append(a1 + "->" + a2)
         self.saferecipedeps = newsafedeps
 
-    def rundep_check(self, fn, recipename, task, dep, depname, dataCache = None):
-        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCache)
+    def rundep_check(self, fn, recipename, task, dep, depname, dataCaches = None):
+        return sstate_rundepfilter(self, fn, recipename, task, dep, depname, dataCaches)
 
     def get_taskdata(self):
         return (self.lockedpnmap, self.lockedhashfn, self.lockedhashes) + super().get_taskdata()
@@ -142,41 +147,41 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.dump_lockedsigs(sigfile)
         return super(bb.siggen.SignatureGeneratorBasicHash, self).dump_sigs(dataCache, options)
 
-    def prep_taskhash(self, tid, deps, dataCache):
-        super().prep_taskhash(tid, deps, dataCache)
+    def prep_taskhash(self, tid, deps, dataCaches):
+        super().prep_taskhash(tid, deps, dataCaches)
         if hasattr(self, "extramethod"):
-            (_, _, _, fn) = bb.runqueue.split_tid_mcfn(tid)
-            inherits = " ".join(dataCache.inherits[fn])    
+            (mc, _, _, fn) = bb.runqueue.split_tid_mcfn(tid)
+            inherits = " ".join(dataCaches[mc].inherits[fn])
             if inherits.find("/native.bbclass") != -1 or inherits.find("/cross.bbclass") != -1:
                 self.extramethod[tid] = ":" + self.buildarch
 
-    def get_taskhash(self, tid, deps, dataCache):
+    def get_taskhash(self, tid, deps, dataCaches):
         if tid in self.lockedhashes:
             if self.lockedhashes[tid]:
                 return self.lockedhashes[tid]
             else:
-                return super().get_taskhash(tid, deps, dataCache)
+                return super().get_taskhash(tid, deps, dataCaches)
 
-        # get_taskhash will call get_unihash internally in the parent class, we 
+        # get_taskhash will call get_unihash internally in the parent class, we
         # need to disable our filter of it whilst this runs else
         # incorrect hashes can be calculated.
         self._internal = True
-        h = super().get_taskhash(tid, deps, dataCache)
+        h = super().get_taskhash(tid, deps, dataCaches)
         self._internal = False
 
         (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
-        recipename = dataCache.pkg_fn[fn]
+        recipename = dataCaches[mc].pkg_fn[fn]
         self.lockedpnmap[fn] = recipename
-        self.lockedhashfn[fn] = dataCache.hashfn[fn]
+        self.lockedhashfn[fn] = dataCaches[mc].hashfn[fn]
 
         unlocked = False
         if recipename in self.unlockedrecipes:
             unlocked = True
         else:
             def recipename_from_dep(dep):
-                fn = bb.runqueue.fn_from_tid(dep)
-                return dataCache.pkg_fn[fn]
+                (depmc, _, _, depfn) = bb.runqueue.split_tid_mcfn(dep)
+                return dataCaches[depmc].pkg_fn[depfn]
 
             # If any unlocked recipe is in the direct dependencies then the
             # current recipe should be unlocked as well.
-- 
2.26.2

