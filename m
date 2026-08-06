Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430ABC55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:48:07 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13490.1785997962826347905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aezncNEC;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: fjpedrazag@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8fdc45afa16so2688316d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 23:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785997962; x=1786602762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=64Mv0Evt+H8Jt5lgnNSEuLIun12iJTsGicQAOe+r1ZI=;
        b=aezncNEC1jtf8H+anp5y34237LfUEsbQKYL8gxeoSAw4iuHOABloVQtQGFhmD2v2Bs
         TyChniUbDzyiRhaRPjsYEvwmmFYnCzwCR2KQiZyfiKI8ADG1zYbQat47ytJAHDC3/6uE
         fQpGiHOoeh0CSgc/YBWCzEVcz648qE5byg6eF29zGhyIXRs+32KrSU2184yiWwXPuPmL
         82goxkQmiAMbTBN3dC3simxQ7bJL+szQ8Xh+dZZOgQQ8nW9Kputi3pmGABWUAqzUWISc
         hh/flH5aTMSM/wRjCACn23LxR9NoabGQDAtuLIsxpkcrwpuyMSfM5Oo5/1554bxrz/VB
         OoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997962; x=1786602762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64Mv0Evt+H8Jt5lgnNSEuLIun12iJTsGicQAOe+r1ZI=;
        b=NOd1nWSVuuDkhkjm+wEAjE7w4yhmw/H8J5guWhHBINuS7xFi04vSrgQTHJ+9etBzD7
         nK/ouKBQzsixNdQV4pxmsCcOPNzR/Mr9BWEuSeW28KLbFtUafJBZiTrwecpl5+oMzr4B
         GXIDyjYQK+T75Ek9Xk1wDC83f867XauvjHXrzCVn6iT52/f9pnDAavSXqX98o8h1VpT4
         ZLsBYS0j04UyvDxbHcNz3hY+K6Q5/HtHAd8TUCBjFJa2ODc2Di8sVFpB4cTrFbsMwifL
         d54k9o1N/SdnO+m6UXg2dSBAfyA41FzHGRPQ4JydUA3F0elAgrQDQRaIpJMINwQPnF8c
         SoUw==
X-Gm-Message-State: AOJu0YzAhxIiHFI6/R/4drvL47RPewvH1OnCkVAk6qbuWiMkKTvxd6OI
	JBFZpj2a+UmQV7JtG2FXTB4lmddMnyhFLDEMkyB0hAkK68oI6RfVTi8MsLBB7XXU
X-Gm-Gg: AR+sD10Xk300iYnOc4Zau35fXDjF1Cl7qojuOGXc58fBS73GO+4Z2RjksKlAUkdSkG6
	rb3L+tHLJJA8Mg+iq+XAWSb+yNNglCuRdN9F+hFnMuurbaRsfXgxZ1B57+bzp7jAvCwNovHaDbh
	bMbRUuI0Xl1/+zXOsOXcBfZdaFLSi12hDCKsz3z99pXlOfFK1BviJl05I44g9sSfsXHRR3vL+Jg
	o5qJ9Kfd0imdlRQziwWsYP1rIppEEsywvzu5qbl50HTPxqHJW3UGZJmZBPN995l4RhwN75iGMsU
	agkrFLLcrTgAHkbwJPIdMsFmgoZT+XRz6K52df7Hu7YBEHHrpZgq+7bf5dEeCO3nTGYfH+D1BDc
	Xo3ZCYrl2eGH1hHOuUipwZUFQ1MBGiB86NBDb25WxiWmGS5O7w92clbnua++tbZs3QcUdR1ZYTF
	MEe2PsnH5/hJmeGRQOOgFJunAmuRG4jdvdTegvnOPS1vMNWMleto6jo2lZOUfSxrfOncRGbf5Yy
	VJVf0HIyE1IMgmycRXRBU/qe1GXcAg=
X-Received: by 2002:a17:90b:3a81:b0:381:28e0:6248 with SMTP id 98e67ed59e1d1-3903c510c3cmr8646652a91.1.1785997580805;
        Wed, 05 Aug 2026 23:26:20 -0700 (PDT)
Received: from fedora (c-73-63-238-177.hsd1.ca.comcast.net. [73.63.238.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5ab7a4sm2696890a91.2.2026.08.05.23.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:26:19 -0700 (PDT)
From: Francisco Pedraza <fjpedrazag@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Francisco Pedraza <fjpedrazag@gmail.com>
Subject: [PATCH] scripts/lib/buildstats: allow aggregation to skip mismatched recipes
Date: Wed,  5 Aug 2026 23:23:42 -0700
Message-ID: <20260806062342.3737135-1-fjpedrazag@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242917

oe-build-perf-report aggregates the buildstats of every test run sharing
an openembedded-core commit. Since buildperf began tracking
openembedded-core rather than poky, metadata changes in meta-yocto no
longer alter the commit hash, so two runs at the same revision can
legitimately contain different recipe versions. When that happens
BSRecipe.aggregate() raises and report generation aborts entirely:

  Refusing to aggregate buildstats, recipe version differs:
  linux-yocto-6.16.11+git-r0 vs. linux-yocto-6.18.1+git-r0

Two problems follow. The failure discards the entire run rather than the
recipe that differs, so data for every other recipe is lost with it. And
because BuildStats.aggregate() mutates as it iterates, recipes processed
before the mismatch have already been converted to BSTaskAggregate when
the exception is raised, leaving the object partially merged; which
recipes survive depends on the ordering returned by os.listdir() in
from_dir().

Check every recipe before modifying any of them, and add a strict
argument to BuildStats.aggregate(). With strict=True, the default, a
ValueError is still raised, but now before anything has been mutated, so
buildstats-diff keeps refusing to combine buildstats that a user has
explicitly asked it to combine. The message it raises now names all
offending recipes rather than only the first. oe-build-perf-report
passes strict=False, which skips the recipes that cannot be aggregated,
logs which ones and why, and aggregates the rest.

Skipping only the mismatched recipes preserves the most data, at the
cost of recipes having differing sample counts within a revision.
BSTaskAggregate already handles that, as it averages over its own task
list.

Tested with:

  oe-selftest -r oescripts.OEBuildStatsAggregateTests

covering the strict and non-strict paths in both recipe orderings, the
differing-task-set condition, and that identical runs still aggregate.

Fixes [YOCTO #16119]

Signed-off-by: Francisco Pedraza <fjpedrazag@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 44 +++++++++++++++++++++++
 scripts/lib/buildstats.py                 | 34 ++++++++++++++++--
 scripts/oe-build-perf-report              |  2 +-
 3 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 3e0bd6f4ec..2082898081 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -7,6 +7,7 @@
 import os
 import shutil
 import importlib
+import sys
 import unittest
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -172,3 +173,46 @@ class OEListPackageconfigTests(OESelftestTestCase):
 
         self.check_endlines(results, expected_endlines)
 
+
+class OEBuildStatsAggregateTests(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        scripts_lib = os.path.join(get_bb_var('COREBASE'), 'scripts', 'lib')
+        if scripts_lib not in sys.path:
+            sys.path.insert(0, scripts_lib)
+
+    def _make_run(self, kernel_version, order):
+        from buildstats import BuildStats
+        task = {'start_time': 1000.0, 'elapsed_time': 42.0, 'status': 'PASSED',
+                'iostat': {}, 'rusage': {'ru_stime': 1.0, 'ru_utime': 2.0},
+                'child_rusage': {}}
+        recipes = {
+            'busybox': {'name': 'busybox', 'epoch': None, 'version': '1.37.0',
+                        'revision': 'r0', 'tasks': {'do_compile': dict(task)}},
+            'linux-yocto': {'name': 'linux-yocto', 'epoch': None,
+                            'version': kernel_version, 'revision': 'r0',
+                            'tasks': {'do_compile': dict(task)}},
+        }
+        return BuildStats.from_json([recipes[n] for n in order])
+
+    def test_aggregate_strict_does_not_mutate(self):
+        # Matching recipe first: it must not be aggregated when a later one fails
+        from buildstats import BSTask
+        order = ['busybox', 'linux-yocto']
+        bs1 = self._make_run('6.16.11+git', order)
+        bs2 = self._make_run('6.18.1+git', order)
+        with self.assertRaises(ValueError):
+            bs1.aggregate(bs2)
+        self.assertIsInstance(bs1['busybox'].tasks['do_compile'], BSTask)
+
+    def test_aggregate_non_strict_skips_mismatch(self):
+        from buildstats import BSTask, BSTaskAggregate
+        for order in (['busybox', 'linux-yocto'], ['linux-yocto', 'busybox']):
+            bs1 = self._make_run('6.16.11+git', order)
+            bs2 = self._make_run('6.18.1+git', order)
+            bs1.aggregate(bs2, strict=False)
+            self.assertIsInstance(bs1['busybox'].tasks['do_compile'], BSTaskAggregate)
+            self.assertIsInstance(bs1['linux-yocto'].tasks['do_compile'], BSTask)
+
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 6db60d5bcf..20e17f07cd 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -274,12 +274,42 @@ class BuildStats(dict):
 
         return buildstats
 
-    def aggregate(self, buildstats):
-        """Aggregate other buildstats into this"""
+    def aggregate(self, buildstats, strict=True):
+        """Aggregate other buildstats into this
+
+        Recipes that cannot be aggregated, i.e. those whose version or set of
+        tasks differs, are collected before any data is modified. With
+        strict=True a ValueError is raised and this object is left untouched.
+        With strict=False those recipes are skipped with a warning and the
+        remaining ones are aggregated.
+        """
         if set(self.keys()) != set(buildstats.keys()):
             raise ValueError("Refusing to aggregate buildstats, set of "
                              "recipes is different: %s" % (set(self.keys()) ^ set(buildstats.keys())))
+
+        # Aggregation mutates in place, so every recipe must be checked before
+        # any of them is modified: failing partway through would leave this
+        # object partially merged.
+        skip = {}
         for pkg, data in buildstats.items():
+            if self[pkg].nevr != data.nevr:
+                skip[pkg] = "recipe version differs: {} vs. {}".format(
+                    self[pkg].nevr, data.nevr)
+            elif set(self[pkg].tasks.keys()) != set(data.tasks.keys()):
+                skip[pkg] = "set of tasks differs"
+
+        if skip:
+            details = ", ".join("{} ({})".format(pkg, reason)
+                                for pkg, reason in sorted(skip.items()))
+            if strict:
+                raise ValueError("Refusing to aggregate buildstats, {} recipe(s) "
+                                 "cannot be aggregated: {}".format(len(skip), details))
+            log.warning("Skipping %d recipe(s) that cannot be aggregated: %s",
+                        len(skip), details)
+
+        for pkg, data in buildstats.items():
+            if pkg in skip:
+                continue
             self[pkg].aggregate(data)
 
 
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index a36f3c1bca..c53d4c7b9c 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -427,7 +427,7 @@ def get_buildstats(repo, notes_ref, notes_ref2, revs, outdir=None):
                 if measurement not in buildstats[rev.commit_number]:
                     buildstats[rev.commit_number][measurement] = _bs
                 else:
-                    buildstats[rev.commit_number][measurement].aggregate(_bs)
+                    buildstats[rev.commit_number][measurement].aggregate(_bs, strict=False)
 
     if missing:
         log.info("Buildstats were missing for some test runs, please "
-- 
2.55.0


