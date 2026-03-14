Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0163D58B0A
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 09:13:25 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19610.1773528771532506420
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 15:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaxVu/Ys;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: mehmet.fide@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97a06d7629so56563266b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528770; x=1774133570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tq5sVTuxHb1p8CtL0uJ7WozbhKU6GQb3TbF3N1b8Kkc=;
        b=ZaxVu/YsyiCCHL8XGjLu7eHYMehNbB4WeDufyWsFtep6oFr4cL+RnWUnmKBfiylJao
         v8Ae8ivoLKfH/b5f4kuHUBP02K2YxlU2MRRlC7nI3dFWyz4cgPKJ+yw3/tiuJHUjIoi1
         icLKfgro2Oye3RBoa2EFfI8YGn040TiHHUcf2vcMxyS6n160VU+Y/PGE9Y6WhSQMuPLh
         a+Xz9WRhtrawdyJxO37UuvYOLhSd5Oc7/xVkamye1I0cLpx7jBUxpqQhm5pxARiUGBVR
         edD5Sj3ZQ1o4j8d2vyi6isXpHGqByd3WOuKgzSRfjLf6Dlmj/0fc0kwGacCeodtRe+gV
         ko6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528770; x=1774133570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tq5sVTuxHb1p8CtL0uJ7WozbhKU6GQb3TbF3N1b8Kkc=;
        b=aMdV4bkBUPCGwPBGhN+8gb3ac2bXO7A6lIWebssFiSHYwqvDB/Pxd0nS8lxNnmw61T
         FoyHI7n8xNFiVhxGVqdpb6z1vBLkyY1oLvRiFFhe26o/vJghlQVY1mH74zTWyv/BxK3X
         j95mJLuHWh7DK+1Y+KyMUMta6QV3IB7a2OqraC0v5awegUzYVfHyenoe2iH4BL9Et92I
         s59WIPBW5Iq/qhr0aXhddzze5/r2hx8082lt1ZCSmCg2YDecL9v+OPpBwKAHhRq8q6zR
         k+4Eic3q42V8iIjZysp0cLGZ3kIJpc6PvuexpTxdQOC2/Hk0u/mruc1YsvHCwjfmidje
         seHg==
X-Gm-Message-State: AOJu0YzNrYaOvkkDned7JRB+x5/wZ/ugyawiTF0nLdqZSoAaFfHpngpB
	a4ukyDK4qCHRG0a1T0qOvj+xxNOg/ca9r3iFURNnEYtudARZcMRMqqzXob5vpQ==
X-Gm-Gg: ATEYQzys4ZCdkic6QAsYbJIKD4qKVbGIRPao5ZNtMmksuUEgWDF9VIDaYHAnkb8JJU3
	PLCUD+zC1q0ZKJs/YI8urkz2hLm72KTrsBm8hckaA4NF+Vd68aLiTqJ/+4nDsrOiUN2wF0LJZTA
	43SZqYwJfMXFOTx271bLQ586FwmFscTgRBKWgBOQZWHwTTW8oN2FCrudhFBmzsLsv4Sbu7ZA95b
	5qe86t55/XxSJJwbu9ui6HvvVznocTj7avwvErrL8g57QKbW7Aul3yPhFD96MJbd9tkFqdveFAl
	hKauXFjybBqjoOP/lv028slEU6mTAxmMpKn7+m1spd5mCaWzgYCjihfB1AICBk412kniomdIb49
	WBEuaN3JGPo3dJCi3ZejJGC/Cz6kCyVKFdrmbTmVNqZ6RlgVs2Hr7orXJCeS91X5Az9/zVPtzG1
	bxzV4SmktXazUHHAHM/L1R+n70qSpt8A==
X-Received: by 2002:a05:600c:1f8b:b0:485:3d3e:167b with SMTP id 5b1f17b1804b1-485566cdc46mr138147825e9.5.1773528419134;
        Sat, 14 Mar 2026 15:46:59 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm305282285e9.0.2026.03.14.15.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:46:58 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Mehmet Fide <mehmet.fide@gmail.com>
Subject: [PATCH] eSDK: fix locked signature handling for multiconfig builds
Date: Sat, 14 Mar 2026 23:46:21 +0100
Message-ID: <20260314224621.3507823-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 09:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233105

Building an extensible SDK with populate_sdk_ext fails for machines
that use BBMULTICONFIG.  Three separate issues contribute to the
failure:

1. generate_locked_sigs() in copy_buildsystem.py builds the task
   filter from BB_TASKDEPDATA which does not include multiconfig
   tasks.  The resulting locked-sigs.inc lacks entries for mc builds,
   so the eSDK internal build cannot find sstate for those tasks and
   fails with setscene enforcement errors.

   Fix by also collecting mc task IDs from siggen.runtaskdeps.

2. sstate_lockedsigs() in sstatesig.py stores a single hash per
   pn:task pair.  When the same PN appears in multiple tune-specific
   type sections with different hashes (as happens with multiconfig),
   the last type overwrites earlier entries.  get_taskhash() then
   returns the wrong locked hash for one of the multiconfigs.

   Fix by storing a list of entries per pn:task and selecting the
   entry whose hash matches the computed hash in get_taskhash().

3. translate_virtualfns() in oe-check-sstate crashes with a KeyError
   when multiconfig tasks reference recipe files not present in the
   recipe cache for that mc context.

   Fix by skipping unresolvable tasks gracefully.

Signed-off-by: Mehmet Fide <mehmet.fide@gmail.com>
---
 meta/lib/oe/copy_buildsystem.py | 10 +++++++++-
 meta/lib/oe/sstatesig.py        | 17 ++++++++++++++---
 scripts/oe-check-sstate         |  4 ++++
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 81abfbf9e2..c62fbd3fbb 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -172,7 +172,15 @@ class BuildSystem(object):
 def generate_locked_sigs(sigfile, d):
     bb.utils.mkdirhier(os.path.dirname(sigfile))
     depd = d.getVar('BB_TASKDEPDATA', False)
-    tasks = ['%s:%s' % (v[2], v[1]) for v in depd.values()]
+    tasks = set(['%s:%s' % (v[2], v[1]) for v in depd.values()])
+    # BB_TASKDEPDATA does not include multiconfig tasks, so the eSDK
+    # locked-sigs.inc would lack entries for mc builds causing setscene
+    # enforcement failures.  Add any mc tasks tracked by siggen.
+    for tid in bb.parse.siggen.runtaskdeps:
+        if isinstance(tid, tuple):
+            tid = tid[1]
+        if tid.startswith('mc:'):
+            tasks.add(tid)
     bb.parse.siggen.dump_lockedsigs(sigfile, tasks)
 
 def prune_lockedsigs(excluded_tasks, excluded_targets, lockedsigs, onlynative, pruned_output):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index d818fce8f1..9736e0b4e6 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -90,7 +90,9 @@ def sstate_lockedsigs(d):
             pn, task, h = ls.split(":", 2)
             if pn not in sigs:
                 sigs[pn] = {}
-            sigs[pn][task] = [h, siggen_lockedsigs_var]
+            if task not in sigs[pn]:
+                sigs[pn][task] = []
+            sigs[pn][task].append([h, siggen_lockedsigs_var])
     return sigs
 
 class SignatureGeneratorOEBasicHashMixIn(object):
@@ -182,8 +184,17 @@ class SignatureGeneratorOEBasicHashMixIn(object):
 
         if not unlocked and recipename in self.lockedsigs:
             if task in self.lockedsigs[recipename]:
-                h_locked = self.lockedsigs[recipename][task][0]
-                var = self.lockedsigs[recipename][task][1]
+                entries = self.lockedsigs[recipename][task]
+                # When multiple locked hashes exist for the same pn:task
+                # (e.g. from multiconfig builds), pick the one matching
+                # the computed hash.  Fall back to the first entry.
+                h_locked = entries[0][0]
+                var = entries[0][1]
+                for entry in entries:
+                    if entry[0] == h:
+                        h_locked = entry[0]
+                        var = entry[1]
+                        break
                 self.lockedhashes[tid] = h_locked
                 self._internal = True
                 unihash = self.get_unihash(tid)
diff --git a/scripts/oe-check-sstate b/scripts/oe-check-sstate
index 0d171c4463..239aff0a97 100755
--- a/scripts/oe-check-sstate
+++ b/scripts/oe-check-sstate
@@ -35,6 +35,10 @@ def translate_virtualfns(tasks):
             (mc, fn, taskname) = bb.runqueue.split_tid(task)
             if taskname.endswith('_setscene'):
                 taskname = taskname[:-9]
+            if mc not in recipecaches or fn not in recipecaches[mc].pkg_fn:
+                # Multiconfig tasks may reference fns not in the recipe
+                # cache for this mc context.  Skip them quietly.
+                continue
             outtasks.append('%s:%s' % (recipecaches[mc].pkg_fn[fn], taskname))
     finally:
         tinfoil.shutdown()
-- 
2.43.0


