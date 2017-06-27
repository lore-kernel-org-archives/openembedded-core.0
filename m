Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 683E077F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:34:08 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id h134so19794712iof.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tQ+W4m58gDKKHIid5lys4QLZDltxoi4cRw3HU7l781s=;
	b=myJmd2EuooxtTjmlbcsJmMmxTd26hKF87aGpFpdAklPBid3uHzc0Is19cBIxp21iXI
	QN2OchDFtgu8JNZSiWLZCOxxWPgQU+/oFeIXgvWRG9oiUCrmhMqSQaLc9PN3z2u7xfha
	N5XRUU3BBaeu3rH0N/taQrVCMvD+ZRO6I1zrW8a9vxIioObleIzc74VyteAig7Jc9Ksu
	8yZgOZsMbhyZ+ACvlpwAFozwIDHb/v/X2Tgc3fep8TpdC2hWqzyVWRn3x3gqSxIQutdA
	OJ/5yuCLYTTxYNcZ+R2YM20hEjauFAHyVRM+zrYaVjRqs1RexJ+VKuQA0/DuB2qK1kha
	FCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tQ+W4m58gDKKHIid5lys4QLZDltxoi4cRw3HU7l781s=;
	b=J2FfwcW0YtfooLt3xig96gBE9Ysd45CvwMzKumDKT7bbFmzdxX7uGb4A6hHoBebi5O
	obBvu13bW9DfjwegmUk7fFPdITBnrzgZQ6mL88GC3Yx4eI0wWsNQJWsQA1r/FpvEd3hw
	eYEk3ljOvqm/x1gmd4Bgc9hw6dhJOqC8IZCjX/s6Dgs/985y2ClpqnZrWTMkv7rK7SV2
	fbXk/DOozjQvYCzO34hRjiyEm/wDf6+teVLkr5Ub2pTdab/W7vaILrARbmxtIPTd0aqT
	sdLHDMuuB9yOfCaqQlnKrAiZBb0neujsPoasOkN/23gQ9WQZsIIH9cJfJgxX8a5TnOl3
	EjAA==
X-Gm-Message-State: AKS2vOywz3zI4kr2pGzRYJ/t3pvpG7uBG84GI+6g6Ij/sghAld2htdSn
	86BqEOM8AYuQGqs3flE=
X-Received: by 10.107.133.213 with SMTP id p82mr7571117ioi.111.1498577649966; 
	Tue, 27 Jun 2017 08:34:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.34.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:34:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:43 +0200
Message-Id: <df860a7fd7d7d2eeb3a6948be3e8e449376cc6ab.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 6/6] yocto-compat-layer.py: make signature check code reusable
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
X-List-Received-Date: Tue, 27 Jun 2017 15:34:09 -0000

This moves the main content of test_signature into a helper
function. It can be reused by arbitrary tests that need to do
a before/after signature comparison. Long-term this might even
be useful in oeqa itself.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py     | 66 ++++++++++++++++++++++++++-
 scripts/lib/compatlayer/cases/common.py | 62 +-----------------------
 2 files changed, 70 insertions(+), 58 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 451e1de..7197e85 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -324,3 +324,69 @@ def get_depgraph(targets=['world'], failsafe=False):
     if depgraph is None:
         raise RuntimeError('Could not retrieve the depgraph.')
     return depgraph
+
+def compare_signatures(old_sigs, curr_sigs):
+    '''
+    Compares the result of two get_signatures() calls. Returns None if no
+    problems found, otherwise a string that can be used as additional
+    explanation in self.fail().
+    '''
+    # task -> (old signature, new signature)
+    sig_diff = {}
+    for task in old_sigs:
+        if task in curr_sigs and \
+           old_sigs[task] != curr_sigs[task]:
+            sig_diff[task] = (old_sigs[task], curr_sigs[task])
+
+    if not sig_diff:
+        return None
+
+    # Beware, depgraph uses task=<pn>.<taskname> whereas get_signatures()
+    # uses <pn>:<taskname>. Need to convert sometimes. The output follows
+    # the convention from get_signatures() because that seems closer to
+    # normal bitbake output.
+    def sig2graph(task):
+        pn, taskname = task.rsplit(':', 1)
+        return pn + '.' + taskname
+    def graph2sig(task):
+        pn, taskname = task.rsplit('.', 1)
+        return pn + ':' + taskname
+    depgraph = get_depgraph(failsafe=True)
+    depends = depgraph['tdepends']
+
+    # If a task A has a changed signature, but none of its
+    # dependencies, then we need to report it because it is
+    # the one which introduces a change. Any task depending on
+    # A (directly or indirectly) will also have a changed
+    # signature, but we don't need to report it. It might have
+    # its own changes, which will become apparent once the
+    # issues that we do report are fixed and the test gets run
+    # again.
+    sig_diff_filtered = []
+    for task, (old_sig, new_sig) in sig_diff.items():
+        deps_tainted = False
+        for dep in depends.get(sig2graph(task), ()):
+            if graph2sig(dep) in sig_diff:
+                deps_tainted = True
+                break
+        if not deps_tainted:
+            sig_diff_filtered.append((task, old_sig, new_sig))
+
+    msg = []
+    msg.append('%d signatures changed, initial differences (first hash before, second after):' %
+               len(sig_diff))
+    for diff in sorted(sig_diff_filtered):
+        recipe, taskname = diff[0].rsplit(':', 1)
+        cmd = 'bitbake-diffsigs --task %s %s --signature %s %s' % \
+              (recipe, taskname, diff[1], diff[2])
+        msg.append('   %s: %s -> %s' % diff)
+        msg.append('      %s' % cmd)
+        try:
+            output = check_command('Determining signature difference failed.',
+                                   cmd).decode('utf-8')
+        except RuntimeError as error:
+            output = str(error)
+        if output:
+            msg.extend(['      ' + line for line in output.splitlines()])
+            msg.append('')
+    return '\n'.join(msg)
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index 4c8a543..55e8ba4 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -4,7 +4,7 @@
 import glob
 import os
 import unittest
-from compatlayer import get_signatures, LayerType, check_command, get_depgraph
+from compatlayer import get_signatures, LayerType, check_command, get_depgraph, compare_signatures
 from compatlayer.case import OECompatLayerTestCase
 
 class CommonCompatLayer(OECompatLayerTestCase):
@@ -47,61 +47,7 @@ class CommonCompatLayer(OECompatLayerTestCase):
             raise unittest.SkipTest("Not testing for signature changes in a software layer %s." \
                      % self.tc.layer['name'])
 
-        # task -> (old signature, new signature)
-        sig_diff = {}
         curr_sigs, _ = get_signatures(self.td['builddir'], failsafe=True)
-        for task in self.td['sigs']:
-            if task in curr_sigs and \
-               self.td['sigs'][task] != curr_sigs[task]:
-                sig_diff[task] = (self.td['sigs'][task], curr_sigs[task])
-
-        if sig_diff:
-            # Beware, depgraph uses task=<pn>.<taskname> whereas get_signatures()
-            # uses <pn>:<taskname>. Need to convert sometimes. The output follows
-            # the convention from get_signatures() because that seems closer to
-            # normal bitbake output.
-            def sig2graph(task):
-                pn, taskname = task.rsplit(':', 1)
-                return pn + '.' + taskname
-            def graph2sig(task):
-                pn, taskname = task.rsplit('.', 1)
-                return pn + ':' + taskname
-            depgraph = get_depgraph(failsafe=True)
-            depends = depgraph['tdepends']
-
-            # If a task A has a changed signature, but none of its
-            # dependencies, then we need to report it because it is
-            # the one which introduces a change. Any task depending on
-            # A (directly or indirectly) will also have a changed
-            # signature, but we don't need to report it. It might have
-            # its own changes, which will become apparent once the
-            # issues that we do report are fixed and the test gets run
-            # again.
-            sig_diff_filtered = []
-            for task, (old_sig, new_sig) in sig_diff.items():
-                deps_tainted = False
-                for dep in depends.get(sig2graph(task), ()):
-                    if graph2sig(dep) in sig_diff:
-                        deps_tainted = True
-                        break
-                if not deps_tainted:
-                    sig_diff_filtered.append((task, old_sig, new_sig))
-
-            msg = []
-            msg.append('Layer %s changed %d signatures, initial differences (first hash without, second with layer):' %
-                       (self.tc.layer['name'], len(sig_diff)))
-            for diff in sorted(sig_diff_filtered):
-                recipe, taskname = diff[0].rsplit(':', 1)
-                cmd = 'bitbake-diffsigs --task %s %s --signature %s %s' % \
-                      (recipe, taskname, diff[1], diff[2])
-                msg.append('   %s: %s -> %s' % diff)
-                msg.append('      %s' % cmd)
-                try:
-                    output = check_command('Determining signature difference failed.',
-                                           cmd).decode('utf-8')
-                except RuntimeError as error:
-                    output = str(error)
-                if output:
-                    msg.extend(['      ' + line for line in output.splitlines()])
-                    msg.append('')
-            self.fail('\n'.join(msg))
+        msg = compare_signatures(self.td['sigs'], curr_sigs)
+        if msg is not None:
+            self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
-- 
git-series 0.9.1

