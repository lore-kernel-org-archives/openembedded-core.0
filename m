Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3586177DED
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 16:38:41 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z13so52973807iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 09:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iV7IDnZMSYSySUPzXzj17ICjrxL8VS3/iAGarNP5ZT4=;
	b=X3mpmNBIHYubx/2U0tr/05Cd0GbLQ2pgJbjAZ9X1RXUjhhzXK5XZXoXwosDJ4o4TaD
	5DvjgeI6wqIqUVbjHmHoQ5uCo0VLKg4fXh2e2il5+iR7ZSe4FqfdETSEq6Y+Tns3EfOC
	T06p68JWCvW/9eK9MlQ5U8AD8lzo0EPFijrs5kI4e0sn9OyyW6csjWtliP/4wGiBD7Lx
	b3yykeBkcRysvAsE2z+nu3+eLJqW01X5sOCdUDSuC3XiKZS10YLG+XZ+XbOxepzMiQc6
	/wEWkcwQ4gEp2/lAvRtn5ieKYJXol25oyMKrGwBBTxDU9P38oD6pJyoY2P09gBlSlL0v
	VsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iV7IDnZMSYSySUPzXzj17ICjrxL8VS3/iAGarNP5ZT4=;
	b=iZrY0u6sLhAL/PjbLTRpFVfdeHiZdM9lx7RkwNxzXvGBwKmhHrVBCf0Z7ToW/4ZX80
	dyV4vI+doY33ryAsiC1f8cgK/lR/SZYq8wRS1A0eP4k8AYRIL1GWtpe+qjKfjOyIPAO1
	3+DzSi4hr8w4B+igi1pA6pTE1tUI4saLsla/spCOXpMK4TjtW/61QP94hZelM9aiX2Nv
	FrZlaqK4CywE87SBRA/FuIeZsJ7/O46wKlV9ItyZmwZQz0HQm8LhPtxAqOOTQN10Mppm
	ZDzv4I+e18OUjE3hbozZ0pebrbCALDBxFpka85OxPbxet2a/Yae9djyeDlu3r8jigRVg
	HwCA==
X-Gm-Message-State: AFeK/H21uaGSa5vfnm/8EuiSFtmzofBPrA9RGtRTcEnGxDoMcMFHe3V1wYIXUq4qM/vRyf89
X-Received: by 10.107.31.11 with SMTP id f11mr45816088iof.183.1491583122526;
	Fri, 07 Apr 2017 09:38:42 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EAD9.dip0.t-ipconnect.de.
	[93.232.234.217]) by smtp.gmail.com with ESMTPSA id
	n10sm11907916itg.8.2017.04.07.09.38.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 09:38:41 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 18:38:20 +0200
Message-Id: <ad9558050d220e86e62faabc3439132d272b5ac1.1491583077.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
References: <cover.d48bda0d5a83909c959650e8872315be6a4162a7.1491583077.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 5/5] yocto-compat-layer: test signature differences when setting MACHINE
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
X-List-Received-Date: Fri, 07 Apr 2017 16:38:41 -0000

Selecting a machine may only affect the signature of tasks that are specific
to that machine. In other words, when MACHINE=A and MACHINE=B share a recipe
foo and the output of foo, then both machine configurations must build foo
in exactly the same way. Otherwise it is not possible to use both machines
in the same distribution.

This criteria can only be tested by testing different machines in combination,
i.e. one main layer, potentially several additional BSP layers and an explicit
choice of machines:
yocto-compat-layer --additional-layers .../meta-intel --machines intel-corei7-64 imx6slevk -- .../meta-freescale

This is work in progress.

Right now it finds do_build differences in all-arch ca-certificates
because of RDEPENDS_${PN} += "openssl". This causes do_build to run
more often then necessary, but probably needs to be ignored by the
test because fixing it in bitbake would be too hard and is harmless in
practice.

There is also a difference for gdb-cross-x86_64:

$ yocto-compat-layer.py -n --machines intel-corei7-64 intel-core2-32 qemux86 qemux86-64 -- /fast/work/meta-intel
INFO: Detected layers:
INFO: meta-intel: LayerType.BSP, /fast/work/meta-intel
INFO:
INFO: Setting up for meta-intel(LayerType.BSP), /fast/work/meta-intel
INFO: Getting initial bitbake variables ...
INFO: Getting initial signatures ...
INFO: Adding layer meta-intel
INFO: Adding layer meta-intel
INFO: Starting to analyze: meta-intel
INFO: ----------------------------------------------------------------------
...
INFO: ======================================================================
INFO: FAIL: test_machine_signatures (bsp.BSPCompatLayer)
INFO: ----------------------------------------------------------------------
INFO: Traceback (most recent call last):
  File "/fast/work/openembedded-core/scripts/lib/compatlayer/cases/bsp.py", line 78, in test_machine_signatures
    self.fail('\n'.join(msg))
AssertionError: The machines have conflicting signatures for some shared tasks:
   allarch ca-certificates:do_build: 0e3027d1bdab8f84c6db04eedf3daa1d (intel-core2-32) != 95083aeb6a3a8179ffe49fa2459d1ef9 (intel-corei7-64) != a3234da44f5203dd7fcd96bb79b6b164 (qemux86) != f6d4810f5faad32491c4f1a6f28fc900 (qemux86-64)
   allarch cantarell-fonts:do_build: 8b3ed1c153b2bfb49ce2e03814a0075e (intel-core2-32) != d37c32facfc8aae57044cdab3aa7e1b6 (intel-corei7-64) != 1e348f57ef18743d1329ab0b2dc51bd5 (qemux86) != de6cb47d25cae6204067d949bcc47d23 (qemux86-64)
...
   allarch xuser-account:do_build: 81cd497e08b84846f0b70d0f6877b1ff (intel-core2-32) != f038a12c4ac671c286783171bf7a8e8c (intel-corei7-64) != 7fb6d3e9a830959095aebc12df6d3d1e (qemux86) != c3bd05c580cacc6ba06fc909bf6e7656 (qemux86-64)
   x86-64-x86-64 gdb-cross-x86_64:do_build: 68a82197720db0f0dbad8955635bc1c0 (intel-corei7-64) != 5631f484d848541bdbf6a4c1f8117f79 (qemux86-64)
   ...
   x86-64-x86-64 gdb-cross-x86_64:do_configure: 16a264dadaca2897b52871d0c884d564 (intel-corei7-64) != 9345d347d27f735ef441aad853370acb (qemux86-64)
   ...
   x86-64-x86-64 go-cross-x86_64:do_compile: a297977ab6362dc875643a50f597cd44 (intel-corei7-64) != 2a7f9da09ac83e2ff2ef2be21b29c19a (qemux86-64)
   ...

$ bitbake-diffsigs -d -t gdb-cross-x86_64 do_configure -s 16a264dadaca2897b52871d0c884d564 9345d347d27f735ef441aad853370acb
DEBUG: Signature file (previous): /fast/build/nodistro/x86/tmp-glibc/stamps/x86_64-linux/gdb-cross-x86_64/7.12.1-r0.do_configure.sigdata.16a264dadaca2897b52871d0c884d564
DEBUG: Signature file (latest): /fast/build/nodistro/x86/tmp-glibc/stamps/x86_64-linux/gdb-cross-x86_64/7.12.1-r0.do_configure.sigdata.9345d347d27f735ef441aad853370acb
Task dependencies changed from:
...
List of dependencies for variable TUNE_PKGARCH changed from '{'DEFAULTTUNE', 'TUNE_PKGARCH_tune-corei7-64'}' to '{'TUNE_PKGARCH_tune-core2-64', 'DEFAULTTUNE'}'
changed items: {'TUNE_PKGARCH_tune-core2-64', 'TUNE_PKGARCH_tune-corei7-64'}
Dependency on variable TUNE_PKGARCH_tune-core2-64 was added
Dependency on Variable TUNE_PKGARCH_tune-corei7-64 was removed
Variable DEFAULTTUNE value changed from 'corei7-64' to 'core2-64'

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py  |  7 ++--
 scripts/lib/compatlayer/cases/bsp.py | 54 ++++++++++++++++++++++++++++-
 scripts/yocto-compat-layer.py        | 20 +++++++++--
 3 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 6130b85..0d6f4e9 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -215,7 +215,7 @@ def check_command(error_msg, cmd):
         raise RuntimeError(msg)
     return output
 
-def get_signatures(builddir, failsafe=False):
+def get_signatures(builddir, failsafe=False, machine=None):
     import re
 
     # some recipes needs to be excluded like meta-world-pkgdata
@@ -226,7 +226,10 @@ def get_signatures(builddir, failsafe=False):
     sigs = {}
     tune2tasks = {}
 
-    cmd = 'bitbake '
+    cmd = ''
+    if machine:
+        cmd += 'MACHINE=%s ' % machine
+    cmd += 'bitbake '
     if failsafe:
         cmd += '-k '
     cmd += '-S none world'
diff --git a/scripts/lib/compatlayer/cases/bsp.py b/scripts/lib/compatlayer/cases/bsp.py
index 5d9bf93..636367f 100644
--- a/scripts/lib/compatlayer/cases/bsp.py
+++ b/scripts/lib/compatlayer/cases/bsp.py
@@ -3,7 +3,7 @@
 
 import unittest
 
-from compatlayer import LayerType
+from compatlayer import LayerType, get_signatures
 from compatlayer.case import OECompatLayerTestCase
 
 class BSPCompatLayer(OECompatLayerTestCase):
@@ -24,3 +24,55 @@ class BSPCompatLayer(OECompatLayerTestCase):
         self.assertEqual(self.td['bbvars']['MACHINE'], machine,
                 msg="Layer %s modified machine %s -> %s" % \
                     (self.tc.layer['name'], self.td['bbvars']['MACHINE'], machine))
+
+    def test_machine_signatures(self):
+        '''
+        Selecting a machine may only affect the signature of tasks that are specific
+        to that machine. In other words, when MACHINE=A and MACHINE=B share a recipe
+        foo and the output of foo, then both machine configurations must build foo
+        in exactly the same way. Otherwise it is not possible to use both machines
+        in the same distribution.
+
+        This criteria can only be tested by testing different machines in combination,
+        i.e. one main layer, potentially several additional BSP layers and an explicit
+        choice of machines:
+        yocto-compat-layer --additional-layers .../meta-intel --machines intel-corei7-64 imx6slevk -- .../meta-freescale
+        '''
+
+        if not self.td['machines']:
+            self.skipTest('No machines set with --machines.')
+
+        # Collect signatures for all machines that we are testing
+        # and merge that into a hash:
+        # tune -> task -> signature -> list of machines with that combination
+        #
+        # It is an error if any tune/task pair has more than one signature,
+        # because that implies that the machines that caused those different
+        # signatures do not agree on how to execute the task.
+        tunes = {}
+        # Preserve ordering of machines as chosen by the user.
+        for machine in self.td['machines']:
+            curr_sigs, tune2tasks = get_signatures(self.td['builddir'], failsafe=True, machine=machine)
+            # Invert the tune -> [tasks] mapping.
+            tasks2tune = {}
+            for tune, tasks in tune2tasks.items():
+                for task in tasks:
+                    tasks2tune[task] = tune
+            for task, sighash in curr_sigs.items():
+                tunes.setdefault(tasks2tune[task], {}).setdefault(task, {}).setdefault(sighash, []).append(machine)
+
+        msg = []
+        for tune in sorted(tunes.keys()):
+            tasks = tunes[tune]
+            for task in sorted(tasks.keys()):
+                signatures = tasks[task]
+                if len(signatures.keys()) > 1:
+                    # Error! Sort signatures by machines, because the hex values don't mean anything.
+                    # => all-arch adwaita-icon-theme:do_build: 1234... (beaglebone, qemux86) != abcdf... (qemux86-64)
+                    line = '   %s %s: ' % (tune, task)
+                    line += ' != '.join(['%s (%s)' % (signature, ', '.join([machine for machine in signatures[signature]])) for
+                                         signature in sorted(signatures.keys(), key=lambda signature: signatures[signature])])
+                    msg.append(line)
+        if msg:
+            msg.insert(0, 'The machines have conflicting signatures for some shared tasks:')
+            self.fail('\n'.join(msg))
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 2ebddb6..d4fb435 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -49,6 +49,10 @@ def main():
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
             help='Layers to process for dependencies', action='store')
+    parser.add_argument('--machines', nargs="+",
+            help='List of MACHINEs to be used during testing', action='store')
+    parser.add_argument('--additional-layers', nargs="+",
+            help='List of additional layers to add during testing', action='store')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
@@ -82,6 +86,7 @@ def main():
     if not layers:
         logger.error("Fail to detect layers")
         return 1
+    additional_layers = detect_layers(args.additional_layers, args.no_auto)
     if args.dependency:
         dep_layers = detect_layers(args.dependency, args.no_auto)
         dep_layers = dep_layers + layers
@@ -128,7 +133,15 @@ def main():
 
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger):
+        missing_dependencies = not add_layer_dependencies(bblayersconf, layer, dep_layers, logger)
+        if not missing_dependencies:
+            for additional_layer in additional_layers:
+                if not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger):
+                    missing_dependencies = True
+                    break
+        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger) or \
+           any(map(lambda additional_layer: not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger),
+                   additional_layers)):
             logger.info('Skipping %s due to missing dependencies.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
@@ -140,8 +153,11 @@ def main():
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
         td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+        td['machines'] = args.machines
 
-        if not add_layer(bblayersconf, layer, dep_layers, logger):
+        if not add_layer(bblayersconf, layer, dep_layers, logger) or \
+           any(map(lambda additional_layer: not add_layer(bblayersconf, additional_layer, dep_layers, logger),
+                   additional_layers)):
             logger.info('Skipping %s ???.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Unknown)'
-- 
git-series 0.9.1

