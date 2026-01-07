Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EAEBD0D17D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 23:12:39 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19859.1767827555281890790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 15:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJSwRV+U;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b73161849e1so450809466b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767827553; x=1768432353; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tp34Cg/T/aQoK3cfRSBsfkcCVX8ucFoyrre6JeSZdZI=;
        b=eJSwRV+UZKzRmrgZ0wo3Pn1xtF+1jDNmTT3u35CQmbBCEas/q2KcOge3BOjkr0YJ42
         mZN1CyixjLMSr7c11AcACoXfhZyUt0PXN35L9+bEMUgMaaTEOxQHOMGeqrr1pNyuOQnZ
         O4m5O/rMZBAU6ImrkXGV+4ceyVeMp+ae/CIoXniRPJX/J5qgisw+Nl4HxjnchpnZDYDy
         XwabBuRvYxNvyaMmJx1Y1QNnCScq6BIiQlv+I7PDobS+mBo3msWAJbOtvsVZuzfgHxlS
         Ps/FvNTw4cnlUezXHtXXAhpZg9kKLKkks5mIoTJ8u82QsZI0Szk/5DH5p9g8uWyTnvXH
         a3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767827553; x=1768432353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tp34Cg/T/aQoK3cfRSBsfkcCVX8ucFoyrre6JeSZdZI=;
        b=KCXlrC2ZxgEF2tU1DZt3D2tFPeGZH1UBXJ7RQ2MwMDKLie5KPELltTaXSZwwz4lTj6
         EPTxHw3KtdzcXN2OeQXKgli2iykmDNuU9uJSw9bLC0m/o9gDviHYgORsQs6gbV8r05Z7
         X/eneHy/uKZgw/W2IiUb5xvVQuGGA77aLjDFGlTGuJ4fAOyqxotlVtU2sgw6pGEbIe+B
         MclLVU1U+LvO7SE7Fs5p5nTWVOUQLxke/0g8XBbApsLrli3MrUD1J8cbScNrrC97f/d5
         l5sO08WLMXhjR5CJqaKpkUXOdjmY9aYH+5LXi+l456emUOipFYbEDxDJ/4EyEdWi5enQ
         d3lA==
X-Gm-Message-State: AOJu0YzWRIVAqZAHJs9LGE62rWjvWAH8IYPM8md5A50FfYYGZjjOrwdp
	0x0gLAL4FFvP9vCkLc7B2eZbXNLjGES6+8A6WrMub6JYPQN0b70mFasC1HGOTbd6
X-Gm-Gg: AY/fxX49Zu511negXmEBoQX+utN6TxXmOVHQpmiCofNPKOLK3iIcrXvtP8eBJAZctg9
	zPqOHLBz4DsOAqU/q/PDtC8umk1s8baceEBJ/H1IsKb+1RMQA4i9t4Oh9WNLNERHcEMWyhx/QF4
	0rX7NtvIN6kKWkN5m53jaSZDie0YY1OoUqgLDREYzQvPa8iqZJ9jEPeWtAf6X7ZAmSL4Cbb+LJf
	3NQ9qWX+YBm04LYGckv/tnUuuEyAIXW0L59/nggBCbfbwPHzSmWuguZfIUiLIK+XiI/fSbHPQTL
	JCAUzqz2xs1g3Mx60u8T96gBCJp7hWSOo7V9jmjIev8VAqltWgN+Lj65Mi9LGZvmS8eoIxG1+CI
	AAqoyZhMsLN3BsMArSKqYLfQZmqLOw+c7TdGEJ60KIKipJiepb9Yb9KHLgYDO+Tab/9YR8h/huV
	zkR9/k8w2K8FXI7MTffVYvrwVi5D2ZOYwf4+k3/ZquVzewDCAugm0JMQaQG/lrV5pj
X-Google-Smtp-Source: AGHT+IEl3YjZxHLMJhg3ic9bPCzSRorATYwzPXj/STsuGJACjlF3ixsNQZ+O3Lijx1V4yz6M95+DgQ==
X-Received: by 2002:a17:907:3c8e:b0:b83:972c:77fb with SMTP id a640c23a62f3a-b84453a5172mr456519966b.46.1767827552980;
        Wed, 07 Jan 2026 15:12:32 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5e0sm5846270a12.31.2026.01.07.15.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:12:32 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kanavin <alex.kanavin@gmail.com>,
	Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [RFC] devtool: Add test-image plugin for testing packages via devtool via images.
Date: Thu,  8 Jan 2026 00:11:05 +0100
Message-ID: <20260107231104.3104004-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 23:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229034

Based of a feature of AUH this is a plugin to run a testimage directly with one packages installed that you are working on via devtool.

Inputs would be a:
- target image
- target packages

The tool will take care to make sure it also installs the minimal necessary dependencies to be able to run ptest on the target image.
Logs will be captured and stored in the devtool workspace for easy access.

Minimal example to test:
- modify a package via devtool
- call this new method with said package and for instance core-image-minimal

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 scripts/lib/devtool/testimage.py | 122 +++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 scripts/lib/devtool/testimage.py

diff --git a/scripts/lib/devtool/testimage.py b/scripts/lib/devtool/testimage.py
new file mode 100644
index 0000000000..809bd4bfb2
--- /dev/null
+++ b/scripts/lib/devtool/testimage.py
@@ -0,0 +1,122 @@
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
+from devtool import setup_tinfoil, parse_recipe, DevtoolError
+from devtool.build_image import build_image_task
+
+logger = logging.getLogger('devtool')
+
+
+def _collect_install_packages(tinfoil, config, package_names):
+    """Return list of packages to install, including -ptest when available.
+
+    package_names: list of PN values (typically recipe names).
+    """
+    install = []
+    for pn in package_names:
+        rd = parse_recipe(config, tinfoil, pn, True)
+        if not rd:
+            # parse_recipe already logs errors
+            raise DevtoolError(f'Unable to find or parse recipe for package {pn}')
+
+        install.append(pn)
+        packages_var = rd.getVar('PACKAGES') or ''
+        packages = packages_var.split()
+        ptest_pkg = f'{pn}-ptest'
+        if ptest_pkg in packages:
+            install.append(ptest_pkg)
+            logger.info('Including ptest package %s', ptest_pkg)
+        else:
+            logger.debug('No ptest package found for %s', pn)
+    return install
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
+    # Prepare a bbappend with IMAGE_INSTALL and testimage variables
+    tinfoil = setup_tinfoil(basepath=basepath)
+    try:
+        install_pkgs = _collect_install_packages(tinfoil, config, package_names)
+    finally:
+        tinfoil.shutdown()
+
+    logdir = os.path.join(config.workspace_path, 'testimage-logs')
+    try:
+        os.makedirs(logdir, exist_ok=True)
+    except Exception as exc:
+        raise DevtoolError(f'Failed to create test logs directory {logdir}: {exc}')
+
+    pkg_append = ' '.join(sorted(set(install_pkgs)))
+    extra_append = [
+        f'TEST_LOG_DIR = "{logdir}"',
+        # Ensure changes to these vars retrigger testimage and are visible
+        'TESTIMAGE_UPDATE_VARS:append = " TEST_LOG_DIR IMAGE_CLASSES TEST_SUITES DISTRO_FEATURES"',
+        # Ensure runtime test framework is enabled even if image/distro omitted it
+        'IMAGE_CLASSES:append = " testimage"',
+        'TEST_SUITES = "ping ssh ptest"',
+        'DISTRO_FEATURES:append = " ptest"',
+        'TEST_RUNQEMUPARAMS = "slirp"',
+        # Ensure requested packages (and -ptest where available) are installed
+        f'IMAGE_INSTALL:append = " {pkg_append}"',
+    ]
+
+    logger.info('Building and testing image %s with packages: %s',
+                args.imagename, ' '.join(install_pkgs))
+
+    # Reuse build_image_task to run -c testimage with our bbappend
+    result, _outputdir = build_image_task(
+        config,
+        basepath,
+        workspace,
+        args.imagename,
+        add_packages=install_pkgs,
+        task='testimage',
+        extra_append=extra_append,
+    )
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


