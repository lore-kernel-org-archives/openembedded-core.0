Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 507307809E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:33:04 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id r63so28483479itc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gHnvKq76vfYd4/ntQG2DOZZGtdaICBa/Lrot1EMn/E8=;
	b=DB5H9qr56PuY8Q0RNiXHdyxCfhDAqlWtnanN0xu8pJOcTtOtqdPxpxTzyjhTC0j7UR
	pgs3Isd9P0qsZwLAFJJoWo43oZgAMsSQbQRZvNYmpJOPi5JRoBC4h+zKeEpemhlpfnDa
	8wf4vNYuYPmMSkJbkyd6K6TqUMsSp01tJoBN0C35cIuA1DcsOIDF/FbhVoKW4DJ1Z2yR
	LfnouzgeQr5xnWDlbk3AHUC1fBY7XfzTREe7D0hAnu6RtuEkchhkZxS19tCH1ELoofQT
	4vJA9of0c31AEXURtKl6jNX27i1AoV4ofHffEW5PNNaM5L4Ia/sa1q0Gy+rOMUfd5F+M
	b76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gHnvKq76vfYd4/ntQG2DOZZGtdaICBa/Lrot1EMn/E8=;
	b=BZk3Vghm/AQFQ5ELYQ1cwc/zIm/mbA16ul94sw5ULlQAuRRgJ+98ZlttJXVoktJosl
	z58sMGaBEI+3Xw8vkGkJtihr++rX3RaHVABQYLn3+lFValksnm9WrvFrtZJAIBKRhWAY
	E8FCbLLedqniipiFq8X3FN0UxneRQSgQ5K3iWBz5W8sjrqa3sh3hERL8XK65qJKPzOtK
	IF5GGg7xoDnHddmKRb7b/ZQLkt91x0gKs4kYzYUNqGNjlJ/jyyCkCIjrERQTs74NCRjn
	PDTRt4dlBmfUTMJeubvml/5YOG1Lg8DqVU+0rlakJZAjoPP6hSMe42WvsH+vgYdoS089
	5vEw==
X-Gm-Message-State: AODbwcC1vSU30yrQDRVh+zWFi2/N7vsyqrherts4bUpAgvEru1sa1k+G
	DsmULlg//INmGyAAIw8=
X-Received: by 10.36.50.66 with SMTP id j63mr16818566ita.42.1496071985522;
	Mon, 29 May 2017 08:33:05 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:33:04 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:40 +0200
Message-Id: <92ecb93db66764927468f29d39a1d9c55ba11c15.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH 6/6] yocto-compat-layer.py: make signature check code reusable
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
X-List-Received-Date: Mon, 29 May 2017 15:33:05 -0000

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
index 284d1cc..b8d7c3a 100644
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
@@ -42,61 +42,7 @@ class CommonCompatLayer(OECompatLayerTestCase):
         get_signatures(self.td['builddir'], failsafe=False)
 
     def test_signatures(self):
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

