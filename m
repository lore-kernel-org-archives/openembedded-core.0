Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738BCC982DD
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 18:38:48 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.621.1789670320924562694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 11:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=gBHZAZPe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1329275-20260917183837ec83644e9e000207b8-1rgbpa@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260917183837ec83644e9e000207b8
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Sep 2026 20:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=S9cWwnc4DAHQzAhdNpQs9IHDgMxOCfrYjfv3MuRO0zc=;
 b=gBHZAZPeT8qCyILFfjXkH6769VbufuVRH6JZesdqnvCpG7BVS6v62BHpiOo+XjxcLQiZgV
 eMJq/wQfzI8/PxSsDlisN1pICkaaAnBKfeKPCiUHp0z4XgCZWFQK7O/HUOk4rGKBAHZrb2Qc
 Ra3TOZpXG58fMeAMyqc4SoyJk+hTSXwZ2jAKR/QSNcWHQI5oDONtcG6l/J6o/n8EdviQaGFY
 XrOzX438HemzVyrOnJnkKPBjey4T2RxuyGM+l4MKjAKymTokNjerjO2NutWYF1nin751nru0
 I1qiXNjKCA3ogbHl6zL4H2MIu9ZES2oMp6owrVznQB3HN8LDcz30Bw6Q==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/7] devtool: ide-sdk: allow --ide to be given multiple times, add "all"
Date: Thu, 17 Sep 2026 20:37:53 +0200
Message-ID: <20260917183832.998361-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260917183832.998361-1-adrian.freihofer@siemens.com>
References: <20260917183832.998361-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 18:38:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246082

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Replace the comma-separated --ide value (--ide code,none) with the
--package/--file-glob style: --ide can now be given multiple times
(-i code -i none) to set up several IDEs in one invocation. Also add
an "all" choice that expands to every registered IDE plugin, so all
supported configurations can be generated without listing them
individually.

Updated oe-selftest to use repeated --ide instead of the comma-separated
form.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 10 +++++-----
 scripts/lib/devtool/ide_sdk.py          | 25 ++++++++++---------------
 2 files changed, 15 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 84e020cd3d..0cede11d67 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3565,7 +3565,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self._verify_nfs_launch_json(tempdir, nfs_rootfs)
 
     def _test_devtool_ide_sdk_code_and_none_qemu(self, nfs=False, slirp=False):
-        """Verify devtool ide-sdk --ide=code,none for cmake, meson and the target toolchain.
+        """Verify devtool ide-sdk --ide=code --ide=none for cmake, meson and the target toolchain.
 
         Generating the VS Code (ide=code) and generic (ide=none) IDE
         configurations from a SINGLE devtool ide-sdk invocation and check
@@ -3607,7 +3607,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             self._meson_recipe_name, "meson.build", testimage)
         package_opts = self._ide_sdk_package_opts()
         nfs_opts = ' --nfs=%s' % nfs_export if nfs else ''
-        runCmd('devtool ide-sdk %s -c --ide=code,none %s%s' % (testimage, package_opts, nfs_opts),
+        runCmd('devtool ide-sdk %s -c --ide=code --ide=none %s%s' % (testimage, package_opts, nfs_opts),
                output_log=self._cmd_logger)
 
         if slirp:
@@ -3649,7 +3649,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
             # not known at the time of the initial ide-sdk invocation.
             # --skip-bitbake also skips the NFS rootfs (re-)extraction, which
             # would otherwise wipe the directory the target has mounted.
-            bitbake_sdk_cmd = 'devtool ide-sdk %s %s --skip-bitbake --ide=code,none %s%s' % (
+            bitbake_sdk_cmd = 'devtool ide-sdk %s %s --skip-bitbake --ide=code --ide=none %s%s' % (
                 testimage, target_options, package_opts, nfs_opts)
             runCmd(bitbake_sdk_cmd, output_log=self._cmd_logger)
 
@@ -4231,7 +4231,7 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_and_none_qemu(self):
-        """Verify devtool ide-sdk --ide=code,none for cmake-example/meson-example with GCC and GDB."""
+        """Verify devtool ide-sdk --ide=code --ide=none for cmake-example/meson-example with GCC and GDB."""
         self._test_devtool_ide_sdk_code_and_none_qemu()
 
     @OETestTag("runqemu")
@@ -5051,7 +5051,7 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
 
     @OETestTag("runqemu")
     def test_devtool_ide_sdk_code_and_none_qemu(self):
-        """Verify devtool ide-sdk --ide=code,none for cmake/meson-example-clang with Clang and LLDB.
+        """Verify devtool ide-sdk --ide=code --ide=none for cmake/meson-example-clang with Clang and LLDB.
 
         See DevtoolIdeSdkTests._test_devtool_ide_sdk_code_and_none_qemu for
         the shared workflow. Clang-specific here: the generated configs
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 8f2e768a62..20b03b2d40 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1714,7 +1714,10 @@ def ide_setup(args, config, basepath, workspace):
         config, args.recipenames)
     orig_recipe_bbappend_contents = RecipeModified.strip_bbappend_sections(
         config, args.recipenames)
-    ides = [ide_plugins[name]() for name in args.ide]
+    ide_names = args.ide or [list(ide_plugins.keys())[0]]
+    if 'all' in ide_names:
+        ide_names = list(ide_plugins.keys())
+    ides = [ide_plugins[name]() for name in ide_names]
     tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
     try:
         # define mode depending on recipes which need to be processed
@@ -2014,21 +2017,13 @@ def register_commands(subparsers, context):
         '  To use this tool-chain the environment-* file found in the deploy..image folder needs to be sourced into a shell.\n'
         '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit')
     default_ide = list(ide_plugins.keys())[0]
-
-    def ide_list(value):
-        """argparse type: comma separated list of IDE plugin names"""
-        names = value.split(',')
-        for name in names:
-            if name not in ide_plugins:
-                raise ValueError(
-                    "invalid choice: %r (choose from %s)" % (
-                        name, ', '.join(sorted(ide_plugins.keys()))))
-        return names
+    ide_choices = list(ide_plugins.keys()) + ['all']
     parser_ide_sdk.add_argument(
-        '-i', '--ide', type=ide_list, default=[default_ide],
-        metavar='{%s}' % ','.join(ide_plugins.keys()),
-        help='Comma separated list of IDEs to setup the configuration for '
-        '(choices: %s, default: %s)' % (', '.join(ide_plugins.keys()), default_ide))
+        '-i', '--ide', action='append', choices=ide_choices,
+        metavar='{%s}' % ','.join(ide_choices),
+        help='IDE to setup the configuration for. May be specified multiple times '
+        'to set up more than one IDE. "all" sets up every supported IDE '
+        '(choices: %s, default: %s)' % (', '.join(ide_choices), default_ide))
     parser_ide_sdk.add_argument(
         '-t', '--target', default='root@192.168.7.2',
         help='Live target machine running an ssh server: user@hostname.')
-- 
2.55.0


