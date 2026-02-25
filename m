Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E10F55432
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:12:45 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53096.1772046760229811974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jg+LxRmQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65f73225f45so195378a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046758; x=1772651558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0ypQGXrkZ6+++ic6mXCq19Fvm3wZdzGrKBa1bElTNA=;
        b=jg+LxRmQTapnK1CqCEJ081RwdUHGbtIseJ86vY/Wq0jUhO/2cW8WR1Ib5+pIaml4jW
         8Y5LOsAp+dIpm+2nTZXx42a+B3hsONOTvotX7e8+pPdejn8mSTtsXcNtgBkvrlmvS3EC
         4Ynn4X2HXWcwi6RkJ9/1OKPSGjtRSSCQkVHBT3O9Shaus1hZ/MoGlq5JvASunRdKSB8A
         O51KpM+HXs3fx0w9NGYFKkXphu3AHnFL7sHdfBIs2+F309a10SB5wyYakpx0Di1rw9qe
         KY2tEKBQA56Py2eqHkULbon44FIi9Z1G/kQEsOLNL6IZxWGrJUouQ0KbD5LSovXl4dUd
         11eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046758; x=1772651558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0ypQGXrkZ6+++ic6mXCq19Fvm3wZdzGrKBa1bElTNA=;
        b=i9+BK2ekHKddhsgNMeSRh6Pga+OSYXXzckFTVlxNz7TXW7noA2syS8FvywRl0yRdTK
         4F9HioAkpoAIhBbYIf7cg9wXPKWjQCPxK0YkjiikpO2iZ4UMmGVm3lvdvWZp9HwgUNgg
         6iTyo2IB0mPwaLxdNyKMzq7Pr5xpntqUH5ye8yvd0qvA7nCJQGDjb4UrXr1h+abINUfM
         T8VMOsLmriWjPngZozOlGABBSgia1DK9gpi7zzUxKQf7d/ql6/JbS9ba7DQjW+uTf5be
         FRsjhMiopTEQvYA5IJ1LKtTNEa7pnJ9XQVr2U6C0/e/rgtkwKWnZlhNj0Lw1RCwfpJGt
         Y0dQ==
X-Gm-Message-State: AOJu0YzjImGeAmRiPPNhxZkhOJaos01Qd4rhnTIenqkbfSk5Ddc5lK96
	a85D4raEUQ/wwDI7ZBlenh8xoTuh3TyLkLi8IzwHAstAg3EfaaBQcUNNxhFWKw==
X-Gm-Gg: ATEYQzwcwUFMlkFZVEZrjjpIb5TGRV8IXOzgnVKV9CTxHXqjwWLt4XhtdL+AmxHIc/y
	U5K7tH3MvIdKILdfeindsfOXzMKtguKF5xvb6rcxXXxrTvK2hZdGSHOpJ9YLVhli8nDAiJn28Dm
	LBDtzl2v/Wxd7WlcgkbJWLZzaNeNk6ptgO+bvF/na1kh+C/TqvwTHVr+9l1eEAH3nLd1ysWxn2p
	GdlKX7vIL7+ABg+9lE9Tl1TiDTsHtij4kZ1yDoGADQXnF3VaXgUeU7soaRwv64ptbPNMUFaLtVf
	H81NcdqxqqogsEvwe31LnddUiuXZwDKzXxbxomFXO2+SQZvF16lkhTkc0gdWj6raAb8CrdKmD+b
	4Wi0F2GmsrIhXUFw5jSLf2zmu4PjFItDaJrJqOsd2ZXeNF31BL6EE1ntUPQwtWhMfTZZJN5t+tv
	LHA82imZ/JHsQYfNWvQCZ/BjvbBBItHbEKNfHXHEOUMqm7/bPd6W3o9tKypkpCFXafBEPM7uRR+
	LvW
X-Received: by 2002:a17:906:fe0b:b0:b73:8639:cd96 with SMTP id a640c23a62f3a-b9081a2977dmr1056305366b.24.1772046757773;
        Wed, 25 Feb 2026 11:12:37 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084e4ba0csm550553966b.38.2026.02.25.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:12:37 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH V02] devtool: Add test-image plugin for testing packages via devtool via images.
Date: Wed, 25 Feb 2026 20:11:51 +0100
Message-ID: <20260225191151.1646214-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 19:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231977

Based of a feature of AUH this is a plugin to run a testimage directly with packages installed that you are working on via devtool.

Inputs would be a:
- target image
- target packages

The tool will take care to make sure it also installs the minimal necessary dependencies to be able to run ptest on the target image.
Logs will be captured and stored in the devtool workspace for easy access.

An oe-selftest is added to test the plugin.

V2: Dropped the hard dependency on using ext4 as a filesystem for the test image, now it can be used with any filesystem supported by the testimage plugin.
Furthermore now the correct test suite is installed.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  61 +++++++++++
 scripts/lib/devtool/test_image.py       | 130 ++++++++++++++++++++++++
 2 files changed, 191 insertions(+)
 create mode 100644 scripts/lib/devtool/test_image.py

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d1209dd94e..c27934a3ca 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1932,6 +1932,67 @@ class DevtoolBuildImageTests(DevtoolBase):
         if reqpkgs:
             self.fail('The following packages were not present in the image as expected: %s' % ', '.join(reqpkgs))
 
+
+class DevtoolTestImageTests(DevtoolBase):
+
+    @OETestTag("runqemu")
+    def test_devtool_test_image(self):
+        """Test devtool test-image plugin."""
+
+        machine = get_bb_var('MACHINE')
+        if not machine or not machine.startswith('qemu'):
+            self.skipTest('This test only works with qemu machines')
+
+        self.assertTrue(not os.path.exists(self.workspacedir),
+                        'This test cannot be run with a workspace directory under the build directory')
+
+        image = 'oe-selftest-image'
+        recipe = 'python3-atomicwrites'
+
+        # Ensure selected test package is ptest-capable.
+        ptest_path = get_bb_var('PTEST_PATH', recipe)
+        self.assertTrue(ptest_path,
+                'Selected package %s does not appear to inherit ptest' % recipe)
+
+        self.track_for_cleanup(self.workspacedir)
+        # self.add_command_to_tearDown('bitbake -c clean %s' % image)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+
+        # Ensure we're starting from a clean state
+        bitbake('%s -c clean' % image)
+
+        result = runCmd('devtool test-image %s -p %s' % (image, recipe), ignore_status=True)
+        if result.status != 0 and 'runqemu - ERROR - Unknown path arg' in result.output:
+            self.skipTest('runqemu in this environment does not accept testimage rootfs path args')
+        self.assertEqual(result.status, 0,
+                         'devtool test-image failed unexpectedly:\n%s' % result.output)
+
+        # Check that requested package and its ptest package were installed
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        self.assertTrue(deploy_dir_image, 'Unable to get DEPLOY_DIR_IMAGE')
+
+        manifests = sorted(glob.glob(os.path.join(deploy_dir_image, '%s*.manifest' % image)))
+        self.assertTrue(manifests, 'Image manifest not found for %s in %s' % (image, deploy_dir_image))
+        manifest = manifests[-1]
+        self.assertExists(manifest, 'Image manifest not found: %s' % manifest)
+
+        pkgs = set()
+        with open(manifest, 'r') as f:
+            for line in f:
+                splitval = line.split()
+                if splitval:
+                    pkgs.add(splitval[0])
+
+        self.assertIn(recipe, pkgs)
+        self.assertIn(recipe + '-ptest', pkgs)
+
+        match = re.search(r'Logs are in (\S+)', result.output)
+        if match:
+            logdir = match.group(1)
+        else:
+            logdir = os.path.join(self.workspacedir, 'testimage-logs')
+        self.assertTrue(os.path.isdir(logdir), 'Expected logs directory not found: %s' % logdir)
+
 class DevtoolUpgradeTests(DevtoolBase):
 
     def setUp(self):
diff --git a/scripts/lib/devtool/test_image.py b/scripts/lib/devtool/test_image.py
new file mode 100644
index 0000000000..0f1fe3c11e
--- /dev/null
+++ b/scripts/lib/devtool/test_image.py
@@ -0,0 +1,130 @@
+# Development tool - test-image plugin
+#
+# Copyright (C) 2026 Authors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+"""Devtool plugin containing the test-image subcommand.
+
+Builds a target image, installs specified package(s) from the workspace or
+layer, and runs the image's test suite via the BitBake `testimage` task.
+"""
+
+import os
+import logging
+
+from devtool import DevtoolError
+from devtool.build_image import build_image_task
+
+logger = logging.getLogger('devtool')
+
+
+def _create_ptest_recipe_appends(config, package_names):
+    """Create temporary per-package appends forcing PTEST_ENABLED=1.
+
+    Returns list of created file paths for cleanup.
+    """
+    created = []
+    appends_dir = os.path.join(config.workspace_path, 'appends')
+    os.makedirs(appends_dir, exist_ok=True)
+
+    for pn in sorted(set(package_names)):
+        appendfile = os.path.join(appends_dir, f'{pn}_%.bbappend')
+        if os.path.exists(appendfile):
+            logger.debug('Using existing append %s', appendfile)
+            continue
+        with open(appendfile, 'w') as afile:
+            afile.write('PTEST_ENABLED = "1"\n')
+        created.append(appendfile)
+
+    return created
+
+
+def test_image(args, config, basepath, workspace):
+    """Entry point for the devtool 'test-image' subcommand."""
+
+    if not args.imagename:
+        raise DevtoolError('Image recipe to test must be specified')
+    if not args.package:
+        raise DevtoolError('Package(s) to install must be specified via -p/--package')
+
+    package_names = [p.strip() for p in args.package.split(',') if p.strip()]
+    if not package_names:
+        raise DevtoolError('No valid package name(s) provided')
+
+    install_pkgs = package_names
+
+    logdir = os.path.join(config.workspace_path, 'testimage-logs')
+    try:
+        os.makedirs(logdir, exist_ok=True)
+    except Exception as exc:
+        raise DevtoolError(f'Failed to create test logs directory {logdir}: {exc}')
+
+    pkg_append = ' '.join(sorted(set(install_pkgs)))
+    ptest_pkg_append = ' '.join(f'{pn}-ptest' for pn in sorted(set(install_pkgs)))
+    extra_append = [
+        f'TEST_LOG_DIR = "{logdir}"',
+        # Ensure runtime test framework is enabled even if image/distro omitted it
+        'IMAGE_CLASSES += " testimage"',
+        # Ensure the testimage task has the correct IMAGE_FEATURES set in case the TEST_TARGET is qemu
+        'IMAGE_FEATURES += "allow-empty-password empty-root-password allow-root-login"',
+        'TEST_SUITES = " ping ssh ptest"',
+        'TEST_RUNQEMUPARAMS += "slirp"',
+        # Ensure image artifacts are built before do_testimage reads them.
+        'do_testimage[depends] += " ${PN}:do_image_complete virtual/kernel:do_deploy"',
+        # Ensure rootfs link naming is runqemu-compatible for image names that
+        # otherwise end with '-image' (without a trailing '-').
+        'IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"',
+        # Ensure a qemu-supported rootfs type is built/selected
+        'IMAGE_FSTYPES:append = " ext4"',
+        # Enable ptests
+        'DISTRO_FEATURES:append = " ptest"',
+        'IMAGE_INSTALL:append = " ptest-runner dropbear"',
+        # Ensure requested packages (and -ptest where available) are installed
+        f'IMAGE_INSTALL:append = " {pkg_append}"',
+        f'IMAGE_INSTALL:append = " {ptest_pkg_append}"',
+    ]
+
+    temp_ptest_appends = _create_ptest_recipe_appends(config, package_names)
+
+    logger.info('Running testimage for %s with packages: %s',
+                args.imagename, ' '.join(install_pkgs))
+    try:
+        result, _outputdir = build_image_task(
+            config,
+            basepath,
+            workspace,
+            args.imagename,
+            add_packages=None,
+            task='testimage',
+            extra_append=extra_append,
+        )
+    finally:
+        for appendfile in temp_ptest_appends:
+            if os.path.exists(appendfile):
+                os.unlink(appendfile)
+
+    if result == 0:
+        logger.info('Testimage completed. Logs are in %s', logdir)
+    return result
+
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from the test-image plugin"""
+    parser = subparsers.add_parser(
+        'test-image',
+        help='Build image, install package(s), and run testimage',
+        description=(
+            'Builds an image, installs specified package(s), and runs the\n'
+            'BitBake testimage task to validate on-target functionality.'
+        ),
+        group='testbuild',
+        order=-9,
+    )
+    parser.add_argument('imagename', help='Image recipe to test')
+    parser.add_argument(
+        '-p', '--package', '--packages',
+        help='Package(s) to install into the image (comma-separated)',
+        metavar='PACKAGES',
+    )
+    parser.set_defaults(func=test_image)
-- 
2.43.0


