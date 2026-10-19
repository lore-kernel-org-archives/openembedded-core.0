Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D825CCCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 14:39:51 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36171.1792420784771859431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 07:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: otavio.salvador@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so3522835eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420784; x=1793025584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dt1guIKB4Ofh5tRDUncqBUYGkXcGxTD/JRznKNGVq10=;
        b=HEYcpt9yfPSqYUZrxK2h/LKU7I3bW9tKvOklTpchTtEQdks+LZNnqDmlIZA11JoEoG
         6NJlzK9lM4GNU1rW7Fh2JVtBkrIR2u5YOWq5U+vrnSJnr+BCc5TP7kJtB8HGAJRIiNdO
         Vg0ncefS7rLSeDEKk8Eht/uN76i6UmbAok46zsnTPTouvh1AuAXVN7Hu7MtnrSq+kzvR
         iogbkqz1YNurLHi4+2CG3VwvE9vNCyvoRxKroYAVdng9ee+2a9jTWccxzwJkag2GeWy5
         zYnmpfrYxJKDgUkNcVrgGCFQ4g7ge+s14JkxelzFdOHhi0xsmC6qQE6TH1jgtg1pqA1Y
         FE9Q==
X-Gm-Message-State: AFq9FYJXOrRcDkD/JnaLxcZkfDzCGPxSYJJ9zihJ+j5HZjBFqTruE9eM
	BDaG/0vdr3mIdpRjxaTRt0K9uJi/RfA/r1aZPVCYV1hdy7nvhwqqh3kKJAF/drAQ
X-Gm-Gg: AYBFou2FbZpEspEHn50XN7dgamqXVIbIcTMoLAgDlqYjyM3T8PuT4fxPF1fy3T92qif
	b3CXeOI8bEPhscaWnLyhbMi3Bl1q3ZnrSkOx1N/HNyHFnP2Kif/XFYkKxWQ8U+ijGTcrSnhrQIB
	FYD01LnN8ZaRLnhMHa10yGomj3Xc7ZX6/Fi18B1eh4CenTVZsADregTEjHVpC6b0zUr/9taVc/Y
	RJ495OtWC5Hjvynv6zVUkPBq+g6NufPjhrli0rVwsjFTB2JeZ5DKKOkqG0V8r2d/KMFcmHLHH5M
	p/PWFCdQ5cW2x+E+pfwo7inYI9MgjIPkBcpDtE3LmPyQv/Mb7c/S1rFhPPFaHiwjvIcobOFqgoW
	/jlLI6rVUyOEDfkm+JUGCuziE6hHl1k0iTjijSd4Zj5WURawGL2YOD0YWo0nhZgkle/KUET8dme
	YJD5NjO5r30ZVnzCh5EvbHy2KGUyvNdsa7PqaT8Go/N3xptO1HVWj+lNhBPdQnVxFcFHkHoru3A
	yp69HfJ0L2wIpyS787fp+6lPuarRJBGqstLU30mH79xJDMuY23IUlCjs6iPJEEzcI33k4D5CVJ7
	z8J8AlQ7XRz7iJJjpIYC+NPppBU5ulzYZJ8cDClCeaYBkrRcHifsp36e3wYAMrY5TuQY3Xmg3xO
	7lIX4RheV7fM=
X-Received: by 2002:a05:7301:6447:b0:358:eccb:af7c with SMTP id 5a478bee46e88-361a312cb5emr15309987eec.33.1792420782372;
        Mon, 19 Oct 2026 07:39:42 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6791sm37384569eec.6.2026.10.19.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:41 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH v2 3/3] checklayer: Share each world signature dump between the tests needing it
Date: Mon, 19 Oct 2026 11:39:24 -0300
Message-ID: <20261019143924.1521981-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019143924.1521981-1-otavio@ossystems.com.br>
References: <20261017225656.680168-1-otavio@ossystems.com.br>
 <20261019143924.1521981-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 14:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248178

test_signatures and test_world dump the same world signatures, with and
without -k, and so do test_machine_signatures and test_machine_world for
each machine; when the dump succeeds, the second only repeats a world
parse. Make get_signatures() always run bitbake with -k and return the
error along with the signatures, and dump once in setUpClass(): for the
common tests, and per machine for the BSP ones. test_world and
test_machine_world check the stored error, the signature tests use the
stored signatures.

Tested on meta-freescale with two machines: 5 world dumps instead of 8,
same results; a recipe breaking world on one machine fails
test_machine_world for that machine only, now listing all its errors.

Suggested-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Suggested-by: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- Replace the cache in get_signatures(), keyed on bblayers.conf, MACHINE
  and the extra variables, with one dump in setUpClass(): once for the
  common tests and once per machine for the BSP tests (Paul Barker).
- get_signatures() always runs with -k and returns the error, or None,
  with the signatures, instead of taking failsafe. A failed dump is no
  longer run a second time without -k.

 scripts/lib/checklayer/__init__.py     | 28 +++++++++++++-------------
 scripts/lib/checklayer/cases/bsp.py    | 15 +++++++++-----
 scripts/lib/checklayer/cases/common.py | 20 +++++++++++-------
 scripts/yocto-check-layer              |  4 +++-
 4 files changed, 40 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index aa19a8e2ae..9d79ae9cd0 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -287,7 +287,12 @@ def check_command(error_msg, cmd, cwd=None):
         raise RuntimeError(msg)
     return output
 
-def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
+def get_signatures(builddir, machine=None, extravars=None):
+    '''
+    Returns the world signatures, the tasks of each tune and None, or the
+    error when some recipes failed, with the signatures of the others
+    (None when none were written).
+    '''
     import re
 
     # some recipes needs to be excluded like meta-world-pkgdata
@@ -304,25 +309,20 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
         cmd += ' '
     if machine:
         cmd += 'MACHINE=%s ' % machine
-    cmd += 'bitbake '
-    if failsafe:
-        cmd += '-k '
-    cmd += '-S lockedsigs world'
+    cmd += 'bitbake -k -S lockedsigs world'
     sigs_file = os.path.join(builddir, 'locked-sigs.inc')
     if os.path.exists(sigs_file):
         os.unlink(sigs_file)
+    error = None
     try:
         check_command('Generating signatures failed. This might be due to some parse error and/or general layer incompatibilities.',
                       cmd, builddir)
     except RuntimeError as ex:
-        if failsafe and os.path.exists(sigs_file):
-            # Ignore the error here. Most likely some recipes active
-            # in a world build lack some dependencies. There is a
-            # separate test_machine_world_build which exposes the
-            # failure.
-            pass
-        else:
-            raise
+        # Most likely some recipes active in a world build lack some
+        # dependencies: the caller decides whether that is fatal.
+        error = str(ex)
+        if not os.path.exists(sigs_file):
+            return (None, None, error)
 
     sig_regex = re.compile(r"^(?P<task>[^:]*:[^:]*):(?P<hash>[^:]*) .$")
     assignment_regex = re.compile(r"^\s*(?P<var>\S+)\s*\+?=")
@@ -362,7 +362,7 @@ def get_signatures(builddir, failsafe=False, machine=None, extravars=None):
     if not sigs:
         raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
 
-    return (sigs, tune2tasks)
+    return (sigs, tune2tasks, error)
 
 def get_depgraph(targets=['world'], failsafe=False):
     '''
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index b76163fb56..6bf04b5b00 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -14,6 +14,10 @@ class BSPCheckLayer(OECheckLayerTestCase):
         if self.tc.layer['type'] not in (LayerType.BSP, LayerType.CORE):
             raise unittest.SkipTest("BSPCheckLayer: Layer %s isn't BSP one." %\
                 self.tc.layer['name'])
+        # test_machine_world and test_machine_signatures share one world
+        # dump per machine
+        self.machine_sigs = {machine: get_signatures(self.td['builddir'], machine=machine)
+                             for machine in self.td['machines'] or []}
 
     def test_bsp_defines_machines(self):
         self.assertTrue(self.tc.layer['conf']['machines'], 
@@ -45,10 +49,9 @@ class BSPCheckLayer(OECheckLayerTestCase):
         msg = []
         for machine in self.td['machines']:
             # In contrast to test_machine_signatures() below, errors are fatal here.
-            try:
-                get_signatures(self.td['builddir'], failsafe=False, machine=machine)
-            except RuntimeError as ex:
-                msg.append(str(ex))
+            error = self.machine_sigs[machine][2]
+            if error:
+                msg.append(error)
         if msg:
             msg.insert(0, 'The following machines broke a world build:')
             self.fail('\n'.join(msg))
@@ -80,7 +83,9 @@ class BSPCheckLayer(OECheckLayerTestCase):
         tunes = {}
         # Preserve ordering of machines as chosen by the user.
         for machine in self.td['machines']:
-            curr_sigs, tune2tasks = get_signatures(self.td['builddir'], failsafe=True, machine=machine)
+            curr_sigs, tune2tasks, error = self.machine_sigs[machine]
+            if curr_sigs is None:
+                raise RuntimeError(error)
             # Invert the tune -> [tasks] mapping.
             tasks2tune = {}
             for tune, tasks in tune2tasks.items():
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index d20559e163..812bb6e637 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -11,6 +11,11 @@ from checklayer import get_signatures, LayerType, check_command, compare_signatu
 from checklayer.case import OECheckLayerTestCase
 
 class CommonCheckLayer(OECheckLayerTestCase):
+    @classmethod
+    def setUpClass(cls):
+        # test_world and test_signatures share one world dump
+        cls.world_sigs, _, cls.world_error = get_signatures(cls.td['builddir'])
+
     def test_readme(self):
         """
         Test that the layer contains a valid README file and that is meets
@@ -98,7 +103,8 @@ class CommonCheckLayer(OECheckLayerTestCase):
         are not actually buildable, so here we fail when "bitbake -S none world"
         fails.
         '''
-        get_signatures(self.td['builddir'], failsafe=False)
+        if self.world_error:
+            raise RuntimeError(self.world_error)
 
     def test_world_inherit_class(self):
         '''
@@ -106,10 +112,9 @@ class CommonCheckLayer(OECheckLayerTestCase):
         class, which can do additional per-recipe test cases.
         '''
         msg = []
-        try:
-            get_signatures(self.td['builddir'], failsafe=False, machine=None, extravars='BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS INHERIT" INHERIT="yocto-check-layer"')
-        except RuntimeError as ex:
-            msg.append(str(ex))
+        _, _, error = get_signatures(self.td['builddir'], machine=None, extravars='BB_ENV_PASSTHROUGH_ADDITIONS="$BB_ENV_PASSTHROUGH_ADDITIONS INHERIT" INHERIT="yocto-check-layer"')
+        if error:
+            msg.append(error)
         if msg:
             msg.insert(0, 'Layer %s failed additional checks from yocto-check-layer.bbclass\nSee below log for specific recipe parsing errors:\n' % \
                 self.tc.layer['name'])
@@ -135,8 +140,9 @@ class CommonCheckLayer(OECheckLayerTestCase):
             raise unittest.SkipTest("Not testing for signature changes in a software layer %s." \
                      % self.tc.layer['name'])
 
-        curr_sigs, _ = get_signatures(self.td['builddir'], failsafe=True)
-        msg = compare_signatures(self.td['sigs'], curr_sigs)
+        if self.world_sigs is None:
+            raise RuntimeError(self.world_error)
+        msg = compare_signatures(self.td['sigs'], self.world_sigs)
         if msg is not None:
             self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
 
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 2fcb90acdc..ed8841d1f3 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -216,7 +216,9 @@ def main():
         try:
             # Only test_signatures, a common test, compares against them
             if not args.run_tests or 'common' in [t.split('.')[0] for t in args.run_tests]:
-                td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+                td['sigs'], td['tunetasks'], error = get_signatures(td['builddir'])
+                if error:
+                    raise RuntimeError(error)
         except RuntimeError as e:
             logger.info(str(e))
             results[layer['name']] = None
-- 
2.54.0


