Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8D86E77D26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:39:13 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id l7so12819141ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WqEgO+oqwDnG0iBYop0ajbuMV/ud8SBSCshLHa1NH+w=;
	b=xdz9zIAz+53E8vAFwCiGK0GAAdI2vyKj66wBrRxz9Q8OlJN0GMva5UemsT81PYgGul
	T2ORP01fkbAJ7SBD3rWNvKzmaxc6INEQ5KKKSWhWRUgxhnJSoCUT2k7gxiHj7m3zuEGg
	gXjtOSgrMClMOTwVtoiGuO1MLkyIdHsfkKRR+8+ZvY5KyRlO+oPrysQ+i86xHyglHYY2
	swqX1OjtfIyxOGH68JmsWOr/WPFlTQ5NuQKBaWIhcnHUVMVxw15+SYLxdFeAm+dEjZ6a
	Ju9c+3g4uZ/BKrvox4/5YO35XBAboH6fxzeLi1tnKT9kDm/1CXkL3B9oN539++pqd023
	ELpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WqEgO+oqwDnG0iBYop0ajbuMV/ud8SBSCshLHa1NH+w=;
	b=WS9GnIC6ymfuqEg54xew8O93VzsX5jlWFiSsmPjkI/MFhxohN3PUGKQzoeKpjk36It
	wsxsAFVQ0Rgw/SKzCswywSlxjpelRONDjNj3nGHwRs8WniHjXZBhraa2txM478NYUQB2
	k5a+0RTePKxAXKeye1gr3jkJGOtC4Fzkme1s9dREi/LJVlPfx2qhYYWYG2wBur6DurwP
	thNnk75HUIBOi0BoBOmszoySyFDK+y348eBnjEJsii6AuWUX/lefiYHH7dJiKL2Udca+
	hFo0bKiedVVhc7kDUFqchvQBh9SNCAQ0L4Wsu2DD2afK2bhbXsKZCxrGbzuFy5LpiFHp
	xjjA==
X-Gm-Message-State: AN3rC/4QEdweM3ivPS0muAmQ24bj2xfTRZMRUahs/sWT0RMIksLZOPvSxF/xROfkEdD7Rmeh
X-Received: by 10.107.164.36 with SMTP id n36mr7851843ioe.157.1491935954657;
	Tue, 11 Apr 2017 11:39:14 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.39.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:39:13 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:42 +0200
Message-Id: <438603642d72051617c624620e287a443d733807.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 7/8] yocto-compat-layer: test signature differences when setting MACHINE
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
X-List-Received-Date: Tue, 11 Apr 2017 18:39:13 -0000

Selecting a machine is only allowed to affect the signature of tasks
that are specific to that machine. In other words, when MACHINE=A and
MACHINE=B share a recipe foo and the output of foo, then both machine
configurations must build foo in exactly the same way. Otherwise it is
not possible to use both machines in the same distribution.

This criteria can only be tested by testing different machines in combination,
i.e. one main layer, potentially several additional BSP layers and an explicit
choice of machines:
yocto-compat-layer --additional-layers .../meta-intel --machines intel-corei7-64 imx6slevk -- .../meta-freescale

The test has already found issues in go-cross (depended on
tune-specific libgcc) and gdb-cross (had a tune-specific path
unnecessarily), so it is also useful to uncover issues that are not
caused by the BSP layer itself.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/__init__.py  |   7 +-
 scripts/lib/compatlayer/cases/bsp.py | 178 +++++++++++++++++++++++++++-
 scripts/yocto-compat-layer.py        |   3 +-
 3 files changed, 185 insertions(+), 3 deletions(-)

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
index 5d9bf93..b205568 100644
--- a/scripts/lib/compatlayer/cases/bsp.py
+++ b/scripts/lib/compatlayer/cases/bsp.py
@@ -3,7 +3,7 @@
 
 import unittest
 
-from compatlayer import LayerType
+from compatlayer import LayerType, get_signatures, check_command
 from compatlayer.case import OECompatLayerTestCase
 
 class BSPCompatLayer(OECompatLayerTestCase):
@@ -24,3 +24,179 @@ class BSPCompatLayer(OECompatLayerTestCase):
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
+        pruned = 0
+        last_line_key = None
+        # task order as determined by completion scheduler ("merged task list"),
+        # edited a bit to add tasks not active in the build config that was used
+        taskname_list = ( 'do_fetch',
+                          'do_unpack',
+                          'do_kernel_checkout',
+                          'do_validate_branches',
+                          'do_kernel_metadata',
+                          'do_patch',
+                          'do_preconfigure',
+                          'do_kernel_configme',
+                          'do_generate_toolchain_file',
+                          'do_pam_sanity',
+                          'do_prepare_recipe_sysroot',
+                          'do_configure',
+                          'do_kernel_configcheck',
+                          'do_kernel_version_sanity_check',
+                          'do_configure_ptest_base',
+                          'do_compile',
+                          'do_shared_workdir',
+                          'do_kernel_link_images',
+                          'do_compile_kernelmodules',
+                          'do_strip',
+                          'do_sizecheck',
+                          'do_uboot_mkimage',
+                          'do_gcc_stash_builddir',
+                          'do_compile_ptest_base',
+                          'do_install',
+                          'do_multilib_install',
+                          'do_extra_symlinks',
+                          'do_stash_locale',
+                          'do_poststash_install_cleanup',
+                          'do_install_ptest_base',
+                          'do_package',
+                          'do_packagedata',
+                          'do_populate_sysroot',
+                          'do_bundle_initramfs',
+                          'do_populate_lic',
+                          'do_generate_rmc_db',
+                          'do_deploy',
+                          'do_package_write_ipk',
+                          'do_package_write_rpm',
+                          'do_package_write_deb',
+                          'do_rootfs',
+                          'do_write_qemuboot_conf',
+                          'do_image',
+                          'do_image_cpio',
+                          'do_write_wks_template',
+                          'do_rootfs_wicenv',
+                          'do_image_wic',
+                          'do_image_complete',
+                          'do_image_qa',
+                          'do_deploy_files',
+                          'do_package_qa',
+                          'do_rm_work',
+                          'do_rm_work_all',
+                          'do_build_sysroot',
+                          'do_build')
+        taskname_order = dict([(task, index) for index, task in enumerate(taskname_list) ])
+        def task_key(task):
+            pn, taskname = task.rsplit(':', 1)
+            return (pn, taskname_order.get(taskname, 0), taskname)
+
+        for tune in sorted(tunes.keys()):
+            tasks = tunes[tune]
+            # As for test_signatures it would be nicer to sort tasks
+            # by dependencies here, but that is harder because we have
+            # to report on tasks from different machines, which might
+            # have different dependencies. We resort to pruning the
+            # output by reporting only one task per recipe if the set
+            # of machines matches.
+            #
+            # "bitbake-diffsigs -t -s" is intelligent enough to print
+            # diffs recursively, so often it does not matter that much
+            # if we don't pick the underlying difference
+            # here. However, sometimes recursion fails
+            # (https://bugzilla.yoctoproject.org/show_bug.cgi?id=6428).
+            #
+            # To mitigate that a bit, we use a hard-coded ordering of
+            # tasks that represents how they normally run and prefer
+            # to print the ones that run first.
+            for task in sorted(tasks.keys(), key=task_key):
+                signatures = tasks[task]
+                # do_build can be ignored: it is know to have
+                # different signatures in some cases, for example in
+                # the allarch ca-certificates due to RDEPENDS=openssl.
+                # That particular dependency is whitelisted via
+                # SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, but still shows up
+                # in the sstate signature hash because filtering it
+                # out would be hard and running do_build multiple
+                # times doesn't really matter.
+                if len(signatures.keys()) > 1 and \
+                   not task.endswith(':do_build'):
+                    # Error!
+                    #
+                    # Sort signatures by machines, because the hex values don't mean anything.
+                    # => all-arch adwaita-icon-theme:do_build: 1234... (beaglebone, qemux86) != abcdf... (qemux86-64)
+                    #
+                    # Skip the line if it is covered already by the predecessor (same pn, same sets of machines).
+                    pn, taskname = task.rsplit(':', 1)
+                    next_line_key = (pn, sorted(signatures.values()))
+                    if next_line_key != last_line_key:
+                        line = '   %s %s: ' % (tune, task)
+                        line += ' != '.join(['%s (%s)' % (signature, ', '.join([m for m in signatures[signature]])) for
+                                             signature in sorted(signatures.keys(), key=lambda s: signatures[s])])
+                        last_line_key = next_line_key
+                        msg.append(line)
+                        # Randomly pick two mismatched signatures and remember how to invoke
+                        # bitbake-diffsigs for them.
+                        iterator = iter(signatures.items())
+                        a = next(iterator)
+                        b = next(iterator)
+                        diffsig_machines = '(%s) != (%s)' % (', '.join(a[1]), ', '.join(b[1]))
+                        diffsig_params = '-t %s %s -s %s %s' % (pn, taskname, a[0], b[0])
+                    else:
+                        pruned += 1
+
+        if msg:
+            msg.insert(0, 'The machines have conflicting signatures for some shared tasks:')
+            if pruned > 0:
+                msg.append('')
+                msg.append('%d tasks where not listed because some other task of the recipe already differed.' % pruned)
+                msg.append('It is likely that differences from different recipes also have the same root cause.')
+            msg.append('')
+            # Explain how to investigate...
+            msg.append('To investigate, run bitbake-diffsigs -t recipename taskname -s fromsig tosig.')
+            cmd = 'bitbake-diffsigs %s' % diffsig_params
+            msg.append('Example: %s in the last line' % diffsig_machines)
+            msg.append('Command: %s' % cmd)
+            # ... and actually do it automatically for that example, but without aborting
+            # when that fails.
+            try:
+                output = check_command('Comparing signatures failed.', cmd).decode('utf-8')
+            except RuntimeError as ex:
+                output = str(ex)
+            msg.extend(['   ' + line for line in output.splitlines()])
+            self.fail('\n'.join(msg))
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index daf3a6a..0d5700b 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -49,6 +49,8 @@ def main():
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
             help='Layers to process for dependencies', action='store')
+    parser.add_argument('--machines', nargs="+",
+            help='List of MACHINEs to be used during testing', action='store')
     parser.add_argument('--additional-layers', nargs="+",
             help='List of additional layers to add during testing', action='store')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
@@ -162,6 +164,7 @@ def main():
         logger.info('Getting initial signatures ...')
         td['builddir'] = builddir
         td['sigs'], td['tunetasks'] = get_signatures(td['builddir'])
+        td['machines'] = args.machines
 
         if not add_layer(bblayersconf, layer, dep_layers, logger):
             logger.info('Skipping %s ???.' % layer['name'])
-- 
git-series 0.9.1

