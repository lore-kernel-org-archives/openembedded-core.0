Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B65DB71DDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 21:22:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 17 Feb 2017 13:22:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,173,1484035200"; d="scan'208";a="226714882"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2017 13:22:45 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: yocto@yoctoproject.org
Date: Fri, 17 Feb 2017 15:26:07 -0600
Message-Id: <1487366767-28347-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-compat-layer.py: Add script to YP Compatible Layer validation
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
X-List-Received-Date: Fri, 17 Feb 2017 21:22:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The yocto-compat-layer script serves as a tool to validate the alignament
of a layer with YP Compatible Layers Programme [1], is based on an RFC
sent to the ML to enable automatic testing of layers [2] that wants to
be YP Compatible.

The tool takes an layer (or set of layers) via command line option -l
and detects what kind of layer is distro, machine or software and then
executes a  set of tests against the layer in order to validate the
compatibility.

The tests currently implemented are:

common.test_readme: Test if a README file exists in the layer and isn't
    empty.
common.test_parse: Test for execute bitbake -p without errors.
common.test_show_environment: Test for execute bitbake -e without errors.
common.test_signatures: Test executed in BSP and DISTRO layers to review
    doesn't comes with recipes that changes the signatures.

bsp.test_bsp_defines_machines: Test if a BSP layers has machines
    configurations.
bsp.test_bsp_no_set_machine: Test the BSP layer to doesn't set
    machine at adding layer.

distro.test_distro_defines_distros: Test if a DISTRO layers has distro
    configurations.
distro.test_distro_no_set_distro: Test the DISTRO layer to doesn't set
    distro at adding layer.

Example of usage:

$ source oe-init-build-env
$ yocto-compat-layer.py -l LAYER_DIR

[YOCTO #10596]

[1] https://www.yoctoproject.org/webform/yocto-project-compatible-registration
[2] https://lists.yoctoproject.org/pipermail/yocto-ab/2016-October/001801.html

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py       | 160 ++++++++++++++++++++++++++++++
 scripts/lib/compatlayer/case.py           |   7 ++
 scripts/lib/compatlayer/cases/__init__.py |   0
 scripts/lib/compatlayer/cases/bsp.py      |  26 +++++
 scripts/lib/compatlayer/cases/common.py   |  66 ++++++++++++
 scripts/lib/compatlayer/cases/distro.py   |  26 +++++
 scripts/lib/compatlayer/context.py        |  14 +++
 scripts/yocto-compat-layer.py             | 160 ++++++++++++++++++++++++++++++
 8 files changed, 459 insertions(+)
 create mode 100644 scripts/lib/compatlayer/__init__.py
 create mode 100644 scripts/lib/compatlayer/case.py
 create mode 100644 scripts/lib/compatlayer/cases/__init__.py
 create mode 100644 scripts/lib/compatlayer/cases/bsp.py
 create mode 100644 scripts/lib/compatlayer/cases/common.py
 create mode 100644 scripts/lib/compatlayer/cases/distro.py
 create mode 100644 scripts/lib/compatlayer/context.py
 create mode 100755 scripts/yocto-compat-layer.py

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
new file mode 100644
index 0000000..21b1b87
--- /dev/null
+++ b/scripts/lib/compatlayer/__init__.py
@@ -0,0 +1,160 @@
+# Yocto Project compatibility layer tool
+#
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+from enum import Enum
+
+class LayerType(Enum):
+    BSP = 0
+    DISTRO = 1
+    SOFTWARE = 2
+    ERROR_NO_LAYER_CONF = 98
+    ERROR_BSP_DISTRO = 99
+
+def _get_configurations(path):
+    configs = []
+
+    for f in os.listdir(path):
+        file_path = os.path.join(path, f)
+        if os.path.isfile(file_path) and f.endswith('.conf'):
+            configs.append(f[:-5]) # strip .conf
+    return configs
+
+def _get_layer_collections(layer_path, lconf=None, data=None):
+    import bb.parse
+    import bb.data
+
+    if lconf is None:
+        lconf = os.path.join(layer_path, 'conf', 'layer.conf')
+
+    if data is None:
+        ldata = bb.data.init()
+        bb.parse.init_parser(ldata)
+    else:
+        ldata = data.createCopy()
+
+    ldata.setVar('LAYERDIR', layer_path)
+    try:
+        ldata = bb.parse.handle(lconf, ldata, include=True)
+    except BaseException as exc:
+        raise LayerError(exc)
+    ldata.expandVarref('LAYERDIR')
+
+    collections = (ldata.getVar('BBFILE_COLLECTIONS', True) or '').split()
+    if not collections:
+        name = os.path.basename(layer_path)
+        collections = [name]
+
+    collections = {c: {} for c in collections}
+    for name in collections:
+        priority = ldata.getVar('BBFILE_PRIORITY_%s' % name, True)
+        pattern = ldata.getVar('BBFILE_PATTERN_%s' % name, True)
+        depends = ldata.getVar('LAYERDEPENDS_%s' % name, True)
+        collections[name]['priority'] = priority
+        collections[name]['pattern'] = pattern
+        collections[name]['depends'] = depends
+
+    return collections
+
+def _detect_layer(layer_path):
+    """
+        Scans layer directory to detect what type of layer
+        is BSP, Distro or Software.
+
+        Returns a dictionary with layer name, type and path.
+    """
+
+    layer = {}
+    layer_name = os.path.basename(layer_path)
+
+    layer['name'] = layer_name
+    layer['path'] = layer_path
+    layer['conf'] = {}
+
+    if not os.path.isfile(os.path.join(layer_path, 'conf', 'layer.conf')):
+        layer['type'] = LayerType.ERROR_NO_LAYER_CONF
+        return layer
+
+    machine_conf = os.path.join(layer_path, 'conf', 'machine')
+    distro_conf = os.path.join(layer_path, 'conf', 'distro')
+
+    is_bsp = False
+    is_distro = False
+
+    if os.path.isdir(machine_conf):
+        machines = _get_configurations(machine_conf)
+        if machines:
+            is_bsp = True
+
+    if os.path.isdir(distro_conf):
+        distros = _get_configurations(distro_conf)
+        if distros:
+            is_distro = True
+
+    if is_bsp and is_distro:
+        layer['type'] = LayerType.ERROR_BSP_DISTRO
+    elif is_bsp:
+        layer['type'] = LayerType.BSP
+        layer['conf']['machines'] = machines
+    elif is_distro:
+        layer['type'] = LayerType.DISTRO
+        layer['conf']['distros'] = distros
+    else:
+        layer['type'] = LayerType.SOFTWARE
+
+    layer['collections'] = _get_layer_collections(layer['path'])
+
+    return layer
+
+def detect_layers(directory):
+    layers = []
+
+    for root, dirs, files in os.walk(directory):
+        dir_name = os.path.basename(root)
+
+        conf_dir = os.path.join(root, 'conf')
+        if dir_name.startswith('meta-') and os.path.isdir(conf_dir):
+            layer = _detect_layer(root)
+            if layer:
+                layers.append(layer)
+
+    return layers
+
+def add_layer(bblayersconf, layer):
+    with open(bblayersconf, 'a+') as f:
+        f.write("\nBBLAYERS += \"%s\"\n" % layer['path'])
+
+def get_signatures(builddir, failsafe=False):
+    import subprocess
+    import re
+
+    sigs = {}
+
+    try:
+        cmd = 'bitbake '
+        if failsafe:
+            cmd += '-k '
+        cmd += '-S none world'
+        output = subprocess.check_output(cmd, shell=True,
+                stderr=subprocess.PIPE)
+    except subprocess.CalledProcessError as e:
+        import traceback
+        exc = traceback.format_exc()
+        msg = '%s\n%s\n' % (exc, e.output.decode('utf-8'))
+        raise RuntimeError(msg)
+    sigs_file = os.path.join(builddir, 'locked-sigs.inc')
+
+    sig_regex = re.compile("^(?P<task>.*:.*):(?P<hash>.*) .$")
+    with open(sigs_file, 'r') as f:
+        for line in f.readlines():
+            line = line.strip()
+            s = sig_regex.match(line)
+            if s:
+                sigs[s.group('task')] = s.group('hash')
+
+    if not sigs:
+        raise RuntimeError('Can\'t load signatures from %s' % sigs_file)
+
+    return sigs
diff --git a/scripts/lib/compatlayer/case.py b/scripts/lib/compatlayer/case.py
new file mode 100644
index 0000000..54ce78a
--- /dev/null
+++ b/scripts/lib/compatlayer/case.py
@@ -0,0 +1,7 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class OECompatLayerTestCase(OETestCase):
+    pass
diff --git a/scripts/lib/compatlayer/cases/__init__.py b/scripts/lib/compatlayer/cases/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/scripts/lib/compatlayer/cases/bsp.py b/scripts/lib/compatlayer/cases/bsp.py
new file mode 100644
index 0000000..5d9bf93
--- /dev/null
+++ b/scripts/lib/compatlayer/cases/bsp.py
@@ -0,0 +1,26 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import unittest
+
+from compatlayer import LayerType
+from compatlayer.case import OECompatLayerTestCase
+
+class BSPCompatLayer(OECompatLayerTestCase):
+    @classmethod
+    def setUpClass(self):
+        if self.tc.layer['type'] != LayerType.BSP:
+            raise unittest.SkipTest("BSPCompatLayer: Layer %s isn't BSP one." %\
+                self.tc.layer['name'])
+
+    def test_bsp_defines_machines(self):
+        self.assertTrue(self.tc.layer['conf']['machines'], 
+                "Layer is BSP but doesn't defines machines.")
+
+    def test_bsp_no_set_machine(self):
+        from oeqa.utils.commands import get_bb_var
+
+        machine = get_bb_var('MACHINE')
+        self.assertEqual(self.td['bbvars']['MACHINE'], machine,
+                msg="Layer %s modified machine %s -> %s" % \
+                    (self.tc.layer['name'], self.td['bbvars']['MACHINE'], machine))
diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
new file mode 100644
index 0000000..4d328ec
--- /dev/null
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -0,0 +1,66 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import subprocess
+import unittest
+from compatlayer import get_signatures, LayerType
+from compatlayer.case import OECompatLayerTestCase
+
+class CommonCompatLayer(OECompatLayerTestCase):
+    def test_readme(self):
+        readme_file = os.path.join(self.tc.layer['path'], 'README')
+        self.assertTrue(os.path.isfile(readme_file),
+                msg="Layer doesn't contains README file.")
+
+        data = ''
+        with open(readme_file, 'r') as f:
+            data = f.read()
+        self.assertTrue(data,
+                msg="Layer contains README file but is empty.")
+
+    def test_parse(self):
+        try:
+            output = subprocess.check_output('bitbake -p', shell=True,
+                    stderr=subprocess.PIPE)
+        except subprocess.CalledProcessError as e:
+            import traceback
+            exc = traceback.format_exc()
+            msg = 'Layer %s failed to parse.\n%s\n%s\n' % (self.tc.layer['name'],
+                    exc, e.output.decode('utf-8'))
+            raise RuntimeError(msg)
+
+    def test_show_environment(self):
+        try:
+            output = subprocess.check_output('bitbake -e', shell=True,
+                    stderr=subprocess.PIPE)
+        except subprocess.CalledProcessError as e:
+            import traceback
+            exc = traceback.format_exc()
+            msg = 'Layer %s failed to show environment.\n%s\n%s\n' % \
+                    (self.tc.layer['name'], exc, e.output.decode('utf-8'))
+            raise RuntimeError(msg)
+
+    def test_signatures(self):
+        if self.tc.layer['type'] == LayerType.SOFTWARE:
+            raise unittest.SkipTest("Layer %s isn't BSP or DISTRO one." \
+                     % self.tc.layer['name'])
+
+        sig_diff = {}
+
+        curr_sigs = get_signatures(self.td['builddir'], failsafe=True)
+        for task in self.td['sigs']:
+            if task not in curr_sigs:
+                continue
+
+            if self.td['sigs'][task] != curr_sigs[task]:
+                sig_diff[task] = '%s -> %s' % \
+                        (self.td['sigs'][task], curr_sigs[task])
+
+        detail = ''
+        if sig_diff:
+            for task in sig_diff:
+                detail += "%s changed %s\n" % (task, sig_diff[task])
+        self.assertFalse(bool(sig_diff), "Layer %s changed signatures.\n%s" % \
+                (self.tc.layer['name'], detail))
+
diff --git a/scripts/lib/compatlayer/cases/distro.py b/scripts/lib/compatlayer/cases/distro.py
new file mode 100644
index 0000000..523acc1
--- /dev/null
+++ b/scripts/lib/compatlayer/cases/distro.py
@@ -0,0 +1,26 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import unittest
+
+from compatlayer import LayerType
+from compatlayer.case import OECompatLayerTestCase
+
+class DistroCompatLayer(OECompatLayerTestCase):
+    @classmethod
+    def setUpClass(self):
+        if self.tc.layer['type'] != LayerType.DISTRO:
+            raise unittest.SkipTest("DistroCompatLayer: Layer %s isn't Distro one." %\
+                self.tc.layer['name'])
+
+    def test_distro_defines_distros(self):
+        self.assertTrue(self.tc.layer['conf']['distros'], 
+                "Layer is BSP but doesn't defines machines.")
+
+    def test_distro_no_set_distros(self):
+        from oeqa.utils.commands import get_bb_var
+
+        distro = get_bb_var('DISTRO')
+        self.assertEqual(self.td['bbvars']['DISTRO'], distro,
+                msg="Layer %s modified distro %s -> %s" % \
+                    (self.tc.layer['name'], self.td['bbvars']['DISTRO'], distro))
diff --git a/scripts/lib/compatlayer/context.py b/scripts/lib/compatlayer/context.py
new file mode 100644
index 0000000..4932238
--- /dev/null
+++ b/scripts/lib/compatlayer/context.py
@@ -0,0 +1,14 @@
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import glob
+import re
+
+from oeqa.core.context import OETestContext
+
+class CompatLayerTestContext(OETestContext):
+    def __init__(self, td=None, logger=None, layer=None):
+        super(CompatLayerTestContext, self).__init__(td, logger)
+        self.layer = layer
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
new file mode 100755
index 0000000..b335630
--- /dev/null
+++ b/scripts/yocto-compat-layer.py
@@ -0,0 +1,160 @@
+#!/usr/bin/env python3
+
+# Yocto Project compatibility layer tool
+#
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import argparse
+import logging
+import time
+import signal
+import shutil
+import collections
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptutils
+import scriptpath
+scriptpath.add_oe_lib_path()
+scriptpath.add_bitbake_lib_path()
+
+from compatlayer import LayerType, detect_layers, add_layer, get_signatures
+from oeqa.utils.commands import get_bb_vars
+
+PROGNAME = 'yocto-compat-layer'
+DEFAULT_OUTPUT_LOG = '%s-%s.log' % (PROGNAME,
+        time.strftime("%Y%m%d%H%M%S"))
+OUTPUT_LOG_LINK = "%s.log" % PROGNAME
+CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
+                'lib', 'compatlayer', 'cases')]
+logger = scriptutils.logger_create(PROGNAME)
+
+def test_layer_compatibility(td, layer):
+    from compatlayer.context import CompatLayerTestContext
+    logger.info("Starting to analyze: %s" % layer['name'])
+    logger.info("----------------------------------------------------------------------")
+
+    tc = CompatLayerTestContext(td=td, logger=logger, layer=layer)
+    tc.loadTests(CASES_PATHS)
+    return tc.runTests()
+
+def main():
+    parser = argparse.ArgumentParser(
+            description="Yocto Project compatibility layer tool",
+            add_help=False)
+    parser.add_argument('-l', '--layer', metavar='LAYER_DIR',
+            help='Layer to test compatibility with Yocto Project',
+            action='store', required=True)
+    parser.add_argument('-o', '--output-log',
+            help='Output log default: %s' % DEFAULT_OUTPUT_LOG,
+            action='store', default=DEFAULT_OUTPUT_LOG)
+
+    parser.add_argument('-d', '--debug', help='Enable debug output',
+            action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors',
+            action='store_true')
+
+    parser.add_argument('-h', '--help', action='help',
+            default=argparse.SUPPRESS,
+            help='show this help message and exit')
+
+    args = parser.parse_args()
+
+    fh = logging.FileHandler(args.output_log)
+    fh.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+    logger.addHandler(fh)
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+    if os.path.exists(OUTPUT_LOG_LINK):
+        os.unlink(OUTPUT_LOG_LINK)
+    os.symlink(args.output_log, OUTPUT_LOG_LINK)
+
+    if not 'BUILDDIR' in os.environ:
+        logger.error("You must source the environment before run this script.")
+        logger.error("$ source oe-init-build-env")
+        return 1
+    builddir = os.environ['BUILDDIR']
+    bblayersconf = os.path.join(builddir, 'conf', 'bblayers.conf')
+
+    if args.layer[-1] == '/':
+        args.layer = args.layer[0:-1]
+    if not os.path.isdir(args.layer):
+        logger.error("Layer: %s isn't a directory" % args.layer)
+        return 1
+
+    layers = detect_layers(args.layer)
+    if not layers:
+        logger.error("Fail to detect layers")
+        return 1
+
+    logger.info("Detected layers:")
+    for layer in layers:
+        if layer['type'] == LayerType.ERROR_BSP_DISTRO:
+            logger.error("%s: Can't be DISTRO and BSP type at the same time."\
+                     " The conf/distro and conf/machine folders was found."\
+                     % layer['name'])
+            layers.remove(layer)
+        elif layer['type'] == LayerType.ERROR_NO_LAYER_CONF:
+            logger.error("%s: Don't have conf/layer.conf file."\
+                     % layer['name'])
+            layers.remove(layer)
+        else:
+            logger.info("%s: %s, %s" % (layer['name'], layer['type'],
+                layer['path']))
+    if not layers:
+        return 1
+
+    shutil.copyfile(bblayersconf, bblayersconf + '.backup')
+    def cleanup_bblayers(signum, frame):
+        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
+        os.unlink(bblayersconf + '.backup')
+    signal.signal(signal.SIGTERM, cleanup_bblayers)
+    signal.signal(signal.SIGINT, cleanup_bblayers)
+
+    td = {}
+    results = collections.OrderedDict()
+
+    logger.info('')
+    logger.info('Getting initial bitbake variables ...')
+    td['bbvars'] = get_bb_vars()
+    logger.info('Getting initial signatures ...')
+    td['builddir'] = builddir
+    td['sigs'] = get_signatures(td['builddir'])
+    logger.info('')
+
+    for layer in layers:
+        if layer['type'] == LayerType.ERROR_NO_LAYER_CONF or \
+                layer['type'] == LayerType.ERROR_BSP_DISTRO:
+            continue
+
+        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
+
+        add_layer(bblayersconf, layer)
+        result = test_layer_compatibility(td, layer)
+        results[layer['name']] = result
+
+    logger.info('')
+    logger.info('Summary of results:')
+    logger.info('')
+    for layer_name in results:
+        logger.info('%s ... %s' % (layer_name, 'PASS' if \
+                results[layer_name].wasSuccessful() else 'FAIL'))
+
+    cleanup_bblayers(None, None)
+
+    return 0
+
+if __name__ == '__main__':
+    try:
+        ret =  main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
-- 
2.1.4


