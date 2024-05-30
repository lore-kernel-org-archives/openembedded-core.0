Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7190C41513
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 14:27:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.10348.1717079221678524983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 07:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VHlCSNSU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-421208c97a2so9616845e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 07:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717079220; x=1717684020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PDucm0Qg1lrhNbRVUy+bUhpX0ShVWltYfmEgLGd9fIs=;
        b=VHlCSNSUXKrE6vR6gozU5W4muwldDLwjS0gCVNBjYBKhsQqc0xzzlDOlLDAlS2plHE
         KFEW7o6z3+opqiK9wwyH0xQB4cKStlIj277oUI59EZ0fjmiGCuuUfDuROQhDTjp+2o5Y
         rsPh943tkBzbEqp/NOoBDDF57v+KmWwLG2Th8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079220; x=1717684020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDucm0Qg1lrhNbRVUy+bUhpX0ShVWltYfmEgLGd9fIs=;
        b=V1+IMIkN5k9B9vxKT2t0HqPbc4P7h+7WXvsnZ+2xkksgQE/EYE+NIRoGBpXBySW1C6
         eNDxyX8H/euGT9R+8xkkiV3Jfc7lphcmNd2/dDZ7Jl1FQYMEnc7cgwfAolNH9wfMA5Xk
         1YXd5ZQTfZ4K7yYLSu0Ml3mm5+C9SKjhYBeh9dvS9wLHyADmLZ72+3c6YRlPJ0LBjG4h
         hW3HyGiA7hHXF+XOVRw6AAqxLlptpeIDZVIz4cIqRZKLchYJ9UWfT2sfdFVHE8S3RpED
         agJnOrEr53Dsj4iB3yDnVxRWTiVIFdDo45SoD3u2LUHkd1fUfIMqa7/q2iYxjw+PAUFi
         GdFQ==
X-Gm-Message-State: AOJu0Yyjc59Ze8vBT53Cwjkf30h1LWO6b30gwn1MxS67o9GsiDEpIzAs
	cCOJk2CgSKQFAqmsNmq80dpSSt5mOjGs2dLuNB71kL4hYKCbXAOjI/POC69Q00U6F+bBtqG4FMu
	v
X-Google-Smtp-Source: AGHT+IEgPvyl7/H6fAyeULi3yI2Xg5+iiyAPhWnELNWTRVmAW98haVmMIWWJ9OxcezwYbjbNFW0ujg==
X-Received: by 2002:a05:600c:1d9a:b0:421:2065:3799 with SMTP id 5b1f17b1804b1-42127929560mr22016495e9.29.1717079219849;
        Thu, 30 May 2024 07:26:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2db:3695:26f3:1f11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127065ba7sm27081395e9.12.2024.05.30.07.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:26:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sstatesig/populate_sdk_ext: Improve unihash cache handling
Date: Thu, 30 May 2024 15:26:57 +0100
Message-Id: <20240530142658.3095832-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 14:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200023

Copying in the bb_unihashes cache file was at best a hack and creates a number of
challenges. One is staying in sync with bitbake since it may not have saved the
most recent version of the file. A second is a determinism problem since there may
be more entries in the file than the SDK should have had access to.

To improve the situation, add code to write the data into the locked-sigs.inc file
such that even when locked-sigs aren't used, the right hash mappings are injected
by the get_cached_unihash call.

The functions in copy_buildsystem need to be updated to preserve data they're not
editting.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/populate_sdk_ext.bbclass |  8 -----
 meta/lib/oe/copy_buildsystem.py              | 10 +++++-
 meta/lib/oe/sstatesig.py                     | 32 ++++++++++++++++++--
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 09d5e2aeb66..019330e3ef7 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -413,10 +413,6 @@ def write_local_conf(d, baseoutpath, derivative, core_meta_subdir, uninative_che
             if os.path.exists(builddir + dest_stub):
                 shutil.copyfile(builddir + dest_stub, baseoutpath + dest_stub)
 
-    cachedir = os.path.join(baseoutpath, 'cache')
-    bb.utils.mkdirhier(cachedir)
-    bb.parse.siggen.copy_unitaskhashes(cachedir)
-
     # If PR Service is in use, we need to export this as well
     bb.note('Do we have a pr database?')
     if d.getVar("PRSERV_HOST"):
@@ -507,10 +503,6 @@ def prepare_locked_cache(d, baseoutpath, derivative, conf_initpath):
     else:
         tasklistfn = None
 
-    cachedir = os.path.join(baseoutpath, 'cache')
-    bb.utils.mkdirhier(cachedir)
-    bb.parse.siggen.copy_unitaskhashes(cachedir)
-
     # Add packagedata if enabled
     if d.getVar('SDK_INCLUDE_PKGDATA') == '1':
         lockedsigs_base = d.getVar('WORKDIR') + '/locked-sigs-base.inc'
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 81abfbf9e23..ced751b8356 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -193,13 +193,17 @@ def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynative, p
                     else:
                         f.write(line)
                         invalue = False
-                elif line.startswith('SIGGEN_LOCKEDSIGS'):
+                elif line.startswith('SIGGEN_LOCKEDSIGS_t'):
                     invalue = True
                     f.write(line)
+                else:
+                    invalue = False
+                    f.write(line)
 
 def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_output, copy_output=None):
     merged = {}
     arch_order = []
+    otherdata = []
     with open(lockedsigs_main, 'r') as f:
         invalue = None
         for line in f:
@@ -212,6 +216,9 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
                 invalue = line[18:].split('=', 1)[0].rstrip()
                 merged[invalue] = []
                 arch_order.append(invalue)
+            else:
+                invalue = None
+                otherdata.append(line)
 
     with open(lockedsigs_extra, 'r') as f:
         invalue = None
@@ -246,6 +253,7 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
                     f.write('    "\n')
                     fulltypes.append(typename)
             f.write('SIGGEN_LOCKEDSIGS_TYPES = "%s"\n' % ' '.join(fulltypes))
+            f.write('\n' + ''.join(otherdata))
 
     if copy_output:
         write_sigs_file(copy_output, list(tocopy.keys()), tocopy)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5950b3e0e63..ce5006781f9 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -93,6 +93,14 @@ def sstate_lockedsigs(d):
             sigs[pn][task] = [h, siggen_lockedsigs_var]
     return sigs
 
+def lockedsigs_unihashmap(d):
+    unihashmap = {}
+    data = (d.getVar("SIGGEN_UNIHASHMAP") or "").split()
+    for entry in data:
+        pn, task, taskhash, unihash = entry.split(":")
+        unihashmap[(pn, task)] = (taskhash, unihash)
+    return unihashmap
+
 class SignatureGeneratorOEBasicHashMixIn(object):
     supports_multiconfig_datacaches = True
 
@@ -100,6 +108,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
         self.abisaferecipes = (data.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
         self.saferecipedeps = (data.getVar("SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS") or "").split()
         self.lockedsigs = sstate_lockedsigs(data)
+        self.unihashmap = lockedsigs_unihashmap(data)
         self.lockedhashes = {}
         self.lockedpnmap = {}
         self.lockedhashfn = {}
@@ -209,6 +218,14 @@ class SignatureGeneratorOEBasicHashMixIn(object):
     def get_cached_unihash(self, tid):
         if tid in self.lockedhashes and self.lockedhashes[tid] and not self._internal:
             return self.lockedhashes[tid]
+
+        (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
+        recipename = self.lockedpnmap[fn]
+
+        if (recipename, task) in self.unihashmap:
+            taskhash, unihash = self.unihashmap[(recipename, task)]
+            return unihash
+
         return super().get_cached_unihash(tid)
 
     def dump_sigtask(self, fn, task, stampbase, runtime):
@@ -219,6 +236,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
 
     def dump_lockedsigs(self, sigfile, taskfilter=None):
         types = {}
+        unihashmap = {}
         for tid in self.runtaskdeps:
             # Bitbake changed this to a tuple in newer versions
             if isinstance(tid, tuple):
@@ -226,13 +244,18 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             if taskfilter:
                 if not tid in taskfilter:
                     continue
-            fn = bb.runqueue.fn_from_tid(tid)
+            (_, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
             t = self.lockedhashfn[fn].split(" ")[1].split(":")[5]
             t = 't-' + t.replace('_', '-')
             if t not in types:
                 types[t] = []
             types[t].append(tid)
 
+            taskhash = self.taskhash[tid]
+            unihash = self.get_unihash(tid)
+            if taskhash != unihash:
+                unihashmap[tid] = "    " + self.lockedpnmap[fn] + ":" + task + ":" + taskhash + ":" + unihash
+
         with open(sigfile, "w") as f:
             l = sorted(types)
             for t in l:
@@ -245,7 +268,12 @@ class SignatureGeneratorOEBasicHashMixIn(object):
                         continue
                     f.write("    " + self.lockedpnmap[fn] + ":" + task + ":" + self.get_unihash(tid) + " \\\n")
                 f.write('    "\n')
-            f.write('SIGGEN_LOCKEDSIGS_TYPES:%s = "%s"' % (self.machine, " ".join(l)))
+            f.write('SIGGEN_LOCKEDSIGS_TYPES:%s = "%s"\n' % (self.machine, " ".join(l)))
+            f.write('SIGGEN_UNIHASHMAP += "\\\n')
+            sortedtid = sorted(unihashmap, key=lambda tid: self.lockedpnmap[bb.runqueue.fn_from_tid(tid)])
+            for tid in sortedtid:
+                f.write(unihashmap[tid] + " \\\n")
+            f.write('    "\n')
 
     def dump_siglist(self, sigfile, path_prefix_strip=None):
         def strip_fn(fn):

