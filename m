Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5F58A77A41
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:36:27 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id y18so8508793itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Apr 2017 06:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3b480fSWTyeyRLHLV/lCBTPDZvUMeVQslPtSNQOIICs=;
	b=q/9n7n5xaWlk/mJF0vJ95BvPaMYGgoKOFK56ZPDlyv+N97lJlka2d/cdWS/mfTlvnl
	zMlpqE4RLWg1JE9oMkTtpm6PT4suyFg8CFUttXc416tIWhBM429d6Vp9P5dFpy7nxS8H
	XhgzIh8ajOjxBQKNsiTMZqzVGIH3m/gIusxBuhdRDo63JyLmIQT8xYMij2jr+fKyzRNo
	bfeorV3l2mA1XU+ZAssa3TiRpjYH6dxLslRTt+pcfHkS/oG7BNxMEMJcOJ+sbXlxiOY0
	V0X+d04iNZDiq4TrN7gF16jI1ez63DRGVWwqcD5yQaLkVfSoORtNkbRpgdV+DWg4Ffbh
	yu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3b480fSWTyeyRLHLV/lCBTPDZvUMeVQslPtSNQOIICs=;
	b=Xnn/XkBfXK+3xD46hZq5oSQxBFRQAFZUh8fSddqkW+LoXXS1VI8/7vU+I3Gg8eNgG9
	q5X9HD71joF5WF7PAlz5FYvrx7ZpnOrbv6SgADd7NaZxwfSR4Los3OnzSC/VhZVMyOc3
	vgaAeGHAQQTe13BXqKm18AKVNgp72oBtu2+pQEfztRjh7YBPdnPCgkrrjdYh+zcfaAXS
	7pUhRDsS33lS0W/OdvNAxJgWoIv6Ts5wEhD76wSXycYH+PkYcIU5M+ps52BcAqbszLst
	PVy/vNpoZNGH3uJGj/i9WdyXr+yddTSG9/TREsRxuhMkhFxOLhRCIDG28RrDeHqeUWY0
	HkxA==
X-Gm-Message-State: AFeK/H3IGrGjOemd4ALmBW7aTOEwZv+LwsxBSBNBmHMjIMEszqfNj2gX
	2bYY9Kfe/ouJNHwd
X-Received: by 10.36.190.76 with SMTP id i73mr20063080itf.111.1491399388728;
	Wed, 05 Apr 2017 06:36:28 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E12B.dip0.t-ipconnect.de.
	[93.232.225.43]) by smtp.gmail.com with ESMTPSA id
	l129sm13211911ite.1.2017.04.05.06.36.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Apr 2017 06:36:27 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Apr 2017 15:36:05 +0200
Message-Id: <ddd6caf52e347f925286bfe9e37b894996037679.1491399200.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/3] yocto-compat-layer: limit report of signature changes
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
X-List-Received-Date: Wed, 05 Apr 2017 13:36:27 -0000

Typically a single change cascades through the entire task dependency
chain. Developers had to figure that out themselves, based on hard to
read and interpret output (not sorted, no indention, no explanations):

   $ yocto-compat-layer.py -n meta-xxxx
   ...
   AssertionError: True is not false : Layer meta-xxxx changed signatures.
   webkitgtk:do_install changed fe2edc9082bc0da98f9cb1391c52f565 -> b3a44684c5cd9aacd3f7c6ed88eefab5
   gstreamer1.0-plugins-good:do_configure changed 3b2f8211be3fe08422bf6087f3af16d1 -> 7d80e42fa1f4f01ff4dfe2ea4477d382
   pulseaudio:do_package_qa changed 5d0a58ada66ff17f5576555302ac319a -> 0e13bcb96143d1ae54c451bc3de0aa30
   epiphany:do_prepare_recipe_sysroot changed 29e1b277dbcb005bd54950594c50d91b -> d3c45527b37677a0668ce483c6db3052
   ...
   gst-player:do_packagedata changed 9ce6efdd357dd74919bc4957458b1e95 -> d0c083ce629f37adfc9c4ba9eff81f83
   gstreamer1.0-plugins-base:do_install changed 1161cd867d15bea63e5dd5d9abf0519c -> 5bf2b652a2d77fee3eedb35af2f201a0
   gstreamer1.0-rtsp-server:do_packagedata changed 6781dc3070f80b843ed1970d74dd323e -> 454620c2e3b9fea87e525d14b6ed0344
   alsa-plugins:do_packagedata changed 1808c3f737cb805b169d004e948ea19c -> 480124b7fa5eab1f73bf96440d725231

Now the tool automates the problem analysis: it retrieves the depgraph
using the tinfoil API and only reports those tasks with modified
signatures whose dependencies have not changed, i.e. those tasks which
definitely introduce a change.

From the previous example, that just leaves two tasks that need to be
checked:

   AssertionError: False is not true : Layer meta-xxxx changed 120 signatures, initial differences (first hash without, second with layer):
      gstreamer1.0-plugins-base:do_fetch: 76973f19f2e30d282152bdd7e4efe5bb -> e6e7c6fa9f2bd59d7d8d107f7c6ca1ac
      pulseaudio:do_install: 668eb1e30af129df9806b0aa0d7c10cd -> 1196bdb88eef56eeee4613bb06b9387e

This pruning might be a bit too aggressive in the sense that tasks
which inherit a change and then add more changes themselves won't be
reported initially. They will be found when fixing the reported tasks
and re-running the check.

For a developer it seems better to have something listed which
definitely is a problem and needs fixing instead of everything,
including the tasks which don't need fixes.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py     | 32 +++++++++++++++-
 scripts/lib/compatlayer/cases/common.py | 54 +++++++++++++++++++-------
 2 files changed, 73 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 9eb862d..b46527a 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -7,6 +7,8 @@ import os
 import subprocess
 from enum import Enum
 
+import bb.tinfoil
+
 class LayerType(Enum):
     BSP = 0
     DISTRO = 1
@@ -252,3 +254,33 @@ def get_signatures(builddir, failsafe=False):
         raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
 
     return sigs
+
+def get_depgraph(targets=['world']):
+    '''
+    Returns the dependency graph for the given target(s).
+    The dependency graph is taken directly from DepTreeEvent.
+    '''
+    depgraph = None
+    with bb.tinfoil.Tinfoil() as tinfoil:
+        tinfoil.prepare(config_only=False)
+        tinfoil.set_event_mask(['bb.event.NoProvider', 'bb.event.DepTreeGenerated', 'bb.command.CommandCompleted'])
+        if not tinfoil.run_command('generateDepTreeEvent', targets, 'do_build'):
+            raise RuntimeError('starting generateDepTreeEvent failed')
+        while True:
+            event = tinfoil.wait_event(timeout=1000)
+            if event:
+                if isinstance(event, bb.command.CommandFailed):
+                    raise RuntimeError('Generating dependency information failed: %s' % event.error)
+                elif isinstance(event, bb.command.CommandCompleted):
+                    break
+                elif isinstance(event, bb.event.NoProvider):
+                    if event._reasons:
+                        raise RuntimeError('Nothing provides %s: %s' % (event._item, event._reasons))
+                    else:
+                        raise RuntimeError('Nothing provides %s.' % (event._item))
+                elif isinstance(event, bb.event.DepTreeGenerated):
+                    depgraph = event._depgraph
+
+    if depgraph is None:
+        raise RuntimeError('Could not retrieve the depgraph.')
+    return depgraph
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index 9cc682e..b91da9b 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -3,7 +3,7 @@
 
 import os
 import unittest
-from compatlayer import get_signatures, LayerType, check_command
+from compatlayer import get_signatures, LayerType, check_command, get_depgraph
 from compatlayer.case import OECompatLayerTestCase
 
 class CommonCompatLayer(OECompatLayerTestCase):
@@ -31,21 +31,49 @@ class CommonCompatLayer(OECompatLayerTestCase):
             raise unittest.SkipTest("Layer %s isn't BSP or DISTRO one." \
                      % self.tc.layer['name'])
 
+        # task -> (old signature, new signature)
         sig_diff = {}
-
         curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
         for task in self.td['sigs']:
-            if task not in curr_sigs:
-                continue
-
-            if self.td['sigs'][task] != curr_sigs[task]:
-                sig_diff[task] = '%s -> %s' % \
-                        (self.td['sigs'][task], curr_sigs[task])
+            if task in curr_sigs and \
+               self.td['sigs'][task] != curr_sigs[task]:
+                sig_diff[task] = (self.td['sigs'][task], curr_sigs[task])
 
-        detail = ''
         if sig_diff:
-            for task in sig_diff:
-                detail += "%s changed %s\n" % (task, sig_diff[task])
-        self.assertFalse(bool(sig_diff), "Layer %s changed signatures.\n%s" % \
-                (self.tc.layer['name'], detail))
+            # Beware, depgraph uses task=<pn>.<taskname> whereas get_signatures()
+            # uses <pn>:<taskname>. Need to convert sometimes. The output follows
+            # the convention from get_signatures() because that seems closer to
+            # normal bitbake output.
+            def sig2graph(task):
+                pn, taskname = task.rsplit(':', 1)
+                return pn + '.' + taskname
+            def graph2sig(task):
+                pn, taskname = task.rsplit('.', 1)
+                return pn + ':' + taskname
+            depgraph = get_depgraph()
+            depends = depgraph['tdepends']
+
+            # If a task A has a changed signature, but none of its
+            # dependencies, then we need to report it because it is
+            # the one which introduces a change. Any task depending on
+            # A (directly or indirectly) will also have a changed
+            # signature, but we don't need to report it. It might have
+            # its own changes, which will become apparent once the
+            # issues that we do report are fixed and the test gets run
+            # again.
+            sig_diff_filtered = []
+            for task, (old_sig, new_sig) in sig_diff.items():
+                deps_tainted = False
+                for dep in depends.get(sig2graph(task), ()):
+                    if graph2sig(dep) in sig_diff:
+                        deps_tainted = True
+                        break
+                if not deps_tainted:
+                    sig_diff_filtered.append((task, old_sig, new_sig))
 
+            msg = []
+            msg.append('Layer %s changed %d signatures, initial differences (first hash without, second with layer):' %
+                       (self.tc.layer['name'], len(sig_diff)))
+            for diff in sorted(sig_diff_filtered):
+                msg.append('   %s: %s -> %s' % diff)
+            self.assertTrue(False, '\n'.join(msg))
-- 
git-series 0.9.1

