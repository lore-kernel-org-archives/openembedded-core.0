Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8957C624D6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:27 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17142.1788126560348019166
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=LGyphoJw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-202608302149187405234422000207c2-lo3c5i@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202608302149187405234422000207c2
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=fafpM09JOMQpRxZuW1R5dZrBHdOOsqqeOjchKViAKGI=;
 b=LGyphoJwxJNM1CSMsGJ4QxNaKJsWRJ8E1hyr4NTX4nz7zCSF1D+MPVJq1YU0xSCfaKGMi3
 6/IsdUzQIc/WXVhEOxasJVn1X04DOmHGiBGVJiNub1+SRoHH4/cL/mKuz1BGQgpxjSoxz+IK
 mTM83W5GK5Zsk6GxvhJx46RAw8c0qq2chCvYDCZ1hamKnp2qIcFfCncDYuEaYU1lpILF7Siv
 KiZcAR3D4kZkO3l4ZRN0yCiWvv5ddeECHjy/ZB5pf/WFMAwlJKy/wNIQUDQziwgRkUzG2lWt
 F3rrqgUk5sFAse1bbuqgXTSuSKi/4K8soghlM/5eVHKCR1N3uO2QzozQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 12/25] oe-selftest: devtool deploy-target: test --package/--file-glob filters
Date: Sun, 30 Aug 2026 23:48:34 +0200
Message-ID: <20260830214912.1346063-13-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244699

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend test_devtool_deploy_target to validate --package/--file-glob
filter behavior for both default deploy and --strip deploy.

The test now covers package-only, glob-only, and combined filtering,
plus recipe-scoped "RECIPE:" forms and shorthand expansion.

Examples covered by the test:
- devtool deploy-target -c mdadm root@<ip> --package mdadm
- devtool deploy-target -c mdadm root@<ip> --package mdadm-doc
- devtool deploy-target -c mdadm root@<ip> --package mdadm,mdadm-doc
- devtool deploy-target -c mdadm root@<ip> --file-glob /usr/sbin/mdadm
- devtool deploy-target -c mdadm root@<ip> --package mdadm --file-glob /usr/sbin/mdadm
- devtool deploy-target -c mdadm root@<ip> --package mdadm:-doc
- devtool deploy-target -c mdadm root@<ip> --package mdadm:,-doc
- devtool deploy-target -c mdadm root@<ip> --file-glob mdadm:/usr/sbin/mdadm

This also verifies that non-matching "other-recipe:" prefixes are
ignored for the current recipe.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 135 +++++++++++++++++-------
 scripts/lib/devtool/deploy.py           |  10 +-
 2 files changed, 108 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c18b94ab5a..b3eb3c28fb 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2038,8 +2038,14 @@ class DevtoolDeployTargetTests(DevtoolBase):
         # Definitions
         testrecipe = 'mdadm'
         testfile = '/sbin/mdadm'
+        # mdmon is installed by the same do_install, used to check --package/--file-glob filtering
+        otherfile = '/sbin/mdmon'
         if "usrmerge" in get_bb_var('DISTRO_FEATURES'):
             testfile = '/usr/sbin/mdadm'
+            otherfile = '/usr/sbin/mdmon'
+        # Use the mdadm-doc package for testing --package and --file-glob filtering
+        mandir = get_bb_var('mandir', testrecipe)
+        docfile = os.path.join(mandir, 'man8', '%s.8' % testrecipe)
         testimage = 'oe-selftest-image'
         testcommand = '/sbin/mdadm --help'
         # Build an image to run
@@ -2066,48 +2072,105 @@ class DevtoolDeployTargetTests(DevtoolBase):
         self.assertIn('  %s' % testfile, result.output)
         # Boot the image
         with runqemu(testimage) as qemu:
-            # Now really test deploy-target
-            for extra_opt in ['', '--strip']:
-                deploy_cmd= 'devtool deploy-target -c %s root@%s %s' % (testrecipe, qemu.ip, extra_opt)
-                self.logger.debug(deploy_cmd)
+            def _deploy_and_check(extra_args, check_full_filelist, expected_files):
+                """Deploy with extra_args, verify the result, then undeploy and verify removal.
+
+                check_full_filelist is only meaningful for an unfiltered deploy: it
+                compares every file installed by do_install against what actually
+                landed on the target. For a --package/--file-glob filtered deploy,
+                expected_files instead maps a handful of representative paths
+                (testfile, otherfile, docfile) to whether they should have been
+                deployed by this particular filter.
+                """
+                deploy_cmd = 'devtool deploy-target -c %s root@%s %s' % (testrecipe, qemu.ip, extra_args)
+                if self.logger.isEnabledFor(logging.DEBUG):
+                    deploy_cmd += ' -s'
                 result = runCmd(deploy_cmd)
-                # Run a test command to see if it was installed properly
-                status, _ = qemu.run(testcommand)
-                self.assertEqual(status, 0)
-                # Check if it deployed all of the files with the right ownership/perms
-                # First look on the host - need to do this under pseudo to get the correct ownership/perms
-                bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD', 'PATH'], testrecipe)
-                installdir = bb_vars['D']
-                fakerootenv = bb_vars['FAKEROOTENV']
-                fakerootcmd = bb_vars['FAKEROOTCMD']
-                path = bb_vars['PATH']
-                result = runCmd('PATH="%s" %s %s find . -type f -exec ls -l {} \\;' % (path, fakerootenv, fakerootcmd), cwd=installdir)
-                filelist1 = self._process_ls_output(result.output)
+                self.logger.debug('%s\n%s' % (deploy_cmd, result.output))
+
+                if check_full_filelist:
+                    # Run a test command to see if it was installed properly
+                    status, _ = qemu.run(testcommand)
+                    self.assertEqual(status, 0, '%s: %s was not deployed' % (extra_args, testfile))
+
+                    # Check if it deployed all of the files with the right ownership/perms
+                    # First look on the host - need to do this under pseudo to get the correct ownership/perms
+                    bb_vars = get_bb_vars(['D', 'FAKEROOTENV', 'FAKEROOTCMD', 'PATH'], testrecipe)
+                    installdir = bb_vars['D']
+                    fakerootenv = bb_vars['FAKEROOTENV']
+                    fakerootcmd = bb_vars['FAKEROOTCMD']
+                    path = bb_vars['PATH']
+                    result = runCmd('PATH="%s" %s %s find . -type f -exec ls -l {} \\;' % (path, fakerootenv, fakerootcmd), cwd=installdir)
+                    filelist1 = self._process_ls_output(result.output)
+
+                    # Now look on the target
+                    tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
+                    self.track_for_cleanup(tempdir2)
+                    tmpfilelist = os.path.join(tempdir2, 'files.txt')
+                    with open(tmpfilelist, 'w') as f:
+                        for line in filelist1:
+                            splitline = line.split()
+                            f.write(splitline[-1] + '\n')
+                    remotefilelist = '/tmp/%s' % os.path.basename(tmpfilelist)
+                    status, _ = qemu.copy_to(tmpfilelist, remotefilelist)
+                    self.assertEqual(status, 0)
+                    status, output = qemu.run(
+                        'xargs ls -l < %s; status=$?; rm -f %s; exit $status' % (
+                            remotefilelist, remotefilelist))
+                    self.assertEqual(status, 0)
+                    filelist2 = self._process_ls_output(output)
+                    filelist1.sort(key=lambda item: item.split()[-1])
+                    filelist2.sort(key=lambda item: item.split()[-1])
+                    self.assertEqual(filelist1, filelist2)
+                else:
+                    for path, expected in expected_files.items():
+                        status, _ = qemu.run('test -e %s' % path)
+                        if expected:
+                            self.assertEqual(status, 0, '%s: %s should have been deployed' % (extra_args, path))
+                        else:
+                            self.assertNotEqual(status, 0, '%s: %s should not have been deployed' % (extra_args, path))
 
-                # Now look on the target
-                tempdir2 = tempfile.mkdtemp(prefix='devtoolqa')
-                self.track_for_cleanup(tempdir2)
-                tmpfilelist = os.path.join(tempdir2, 'files.txt')
-                with open(tmpfilelist, 'w') as f:
-                    for line in filelist1:
-                        splitline = line.split()
-                        f.write(splitline[-1] + '\n')
-                remotefilelist = '/tmp/%s' % os.path.basename(tmpfilelist)
-                status, _ = qemu.copy_to(tmpfilelist, remotefilelist)
-                self.assertEqual(status, 0)
-                status, output = qemu.run(
-                    'xargs ls -l < %s; status=$?; rm -f %s; exit $status' % (
-                        remotefilelist, remotefilelist))
-                self.assertEqual(status, 0)
-                filelist2 = self._process_ls_output(output)
-                filelist1.sort(key=lambda item: item.split()[-1])
-                filelist2.sort(key=lambda item: item.split()[-1])
-                self.assertEqual(filelist1, filelist2)
                 # Test undeploy-target
-                result = runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
+                runCmd('devtool undeploy-target -c %s root@%s' % (testrecipe, qemu.ip))
                 status, _ = qemu.run(testcommand)
                 self.assertNotEqual(status, 0, 'undeploy-target did not remove command as it should have')
 
+            filter_cases = [
+                ('', {}),
+                ('--package %s' % testrecipe,
+                 {testfile: True, otherfile: True, docfile: False}),
+                ('--package %s-doc' % testrecipe,
+                 {testfile: False, otherfile: False, docfile: True}),
+                ('--package %s,%s-doc' % (testrecipe, testrecipe),
+                 {testfile: True, otherfile: True, docfile: True}),
+                ('--file-glob %s' % testfile,
+                 {testfile: True, otherfile: False, docfile: False}),
+                ('--package %s --file-glob %s' % (testrecipe, testfile),
+                 {testfile: True, otherfile: True, docfile: False}),
+                # "RECIPE:" prefix (needed so a single 'devtool ide-sdk' invocation
+                # can scope --package/--file-glob entries to one of several recipes)
+                ('--package %s:%s' % (testrecipe, testrecipe),
+                 {testfile: True, otherfile: True, docfile: False}),
+                # shorthand: "RECIPE:-suffix" expands to "RECIPE-suffix"
+                ('--package %s:-doc' % testrecipe,
+                 {testfile: False, otherfile: False, docfile: True}),
+                # shorthand: empty item + "-suffix" combined in one entry
+                ('--package %s:,-doc' % testrecipe,
+                 {testfile: True, otherfile: True, docfile: True}),
+                # a "RECIPE:" prefix that doesn't match this recipe is skipped,
+                # leaving no package filter applied (same as passing none at all)
+                ('--package other-recipe:%s' % testrecipe,
+                 {testfile: True, otherfile: True, docfile: True}),
+                ('--file-glob %s:%s' % (testrecipe, testfile),
+                 {testfile: True, otherfile: False, docfile: False}),
+                ('--file-glob other-recipe:%s' % testfile,
+                 {testfile: True, otherfile: True, docfile: True}),
+            ]
+            for strip_opt in ['', '--strip']:
+                for filter_args, expected_files in filter_cases:
+                    extra_args = ' '.join(a for a in (strip_opt, filter_args) if a)
+                    _deploy_and_check(extra_args, check_full_filelist=not filter_args, expected_files=expected_files)
+
 class DevtoolBuildImageTests(DevtoolBase):
 
     def test_devtool_build_image(self):
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 267d124415..d11b04aea2 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -500,7 +500,15 @@ def register_commands(subparsers, context):
 
     parser_deploy = subparsers.add_parser('deploy-target',
                                           help='Deploy recipe output files to live target machine',
-                                          description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand. Use --package/--file-glob to deploy only a subset of the recipe\'s installed files.',
+                                          description='Deploys a recipe\'s build output (i.e. the output of '
+                                                       'the do_install task) to a live target machine over ssh. '
+                                                       'By default, any existing files will be preserved instead '
+                                                       'of being overwritten and will be restored if you run '
+                                                       'devtool undeploy-target. Note: this only deploys the '
+                                                       'recipe itself and not any runtime dependencies, so it is '
+                                                       'assumed that those have been installed on the target '
+                                                       'beforehand. Use --package/--file-glob to deploy only a '
+                                                       'subset of the recipe\'s installed files.',
                                           group='testbuild')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
-- 
2.55.0


