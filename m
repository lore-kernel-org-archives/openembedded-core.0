Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8578EEE49AC
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 16:11:57 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1052.1692634312720545660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 09:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nYWq6D+i;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5259cf39154so4470346a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692634311; x=1693239111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtK+g2G2EC9P2eSmH3IzPAwBYrV1YOaey925naodtdQ=;
        b=nYWq6D+i15WfjKIae3qSaN2okcfAICmSSiyOrULXjl0eqxxAUB+ntmXWY9MggLEZcf
         w9xAsltFN2KeQRcz8pPmrpE+bEwA9RoDz9Y+ns9vZsYH6zsaiD+oqz89vel/UZ+nMFwm
         pII0jgecT+Eco4AuTtbl/KKl6s+f/Y+/CvZSc1iOlqsUCzjxu/hU4DOpiz38NnoI6DFD
         xsm6RaNGvcQOh43beds8KsKLKBPwCvJvl9hCxd5xOZhDylcq+PbS4b2kJu56SRVo2NDF
         97OH54Kgfqpy6aH7ukkts0xCQ4y1mDU3w35WZ8AqLO9YnJ7P+/DoP7QNv9cC4OJvFDSG
         MF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692634311; x=1693239111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtK+g2G2EC9P2eSmH3IzPAwBYrV1YOaey925naodtdQ=;
        b=WslfZJt/HfjlAvzMgqbLO6J9CFnZkfemIueteB3T/lMUfDC2bCHWjpKYquhIoRXB4+
         9ZWVYoDC/fPyG70vHT47sk/qQUXQiLXEsrq92lorZaYSBe5IiNAg7CdWqz2cDcf7atQ5
         IgOl/smdpMh11UXEYCHw8o4B1khm01D/dKvuUOMSsxie8WPkyhhTnpQHfUFVUeEp/0PP
         RWaNC1Y8xDNAujkP7YnsefH7QNuL01T8mkZVBXdA/hHn10RqwqtMaZPqOtED11/AFF9H
         +A7Qruj9HxENopPHMnWlxfqtGhUynQFlPgl4znw3GdKswRdWgWOjev7ydqaj2j4D7E3i
         XOSg==
X-Gm-Message-State: AOJu0Ywt0SUhuM94efDeFdo2SpFam6LVnT+tQ2akuyksuBqKZjbZ6x2+
	ViyqwrlMT9S24VRtvNOAft6KbkVyhOo=
X-Google-Smtp-Source: AGHT+IEfMv1gj2aQqM9aFYUYPg0EnFw8AVl4j5TS14QOAdwUrXub0t8mM0zc9nz2t56AXCMS8kEdVw==
X-Received: by 2002:aa7:c84b:0:b0:529:f97d:8870 with SMTP id g11-20020aa7c84b000000b00529f97d8870mr5015320edt.40.1692634310882;
        Mon, 21 Aug 2023 09:11:50 -0700 (PDT)
Received: from t14s-af._sites.dc._msdcs.ad007.siemens.net ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id x21-20020aa7dad5000000b0052284228e3bsm6175579eds.8.2023.08.21.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:11:50 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 12/14] devtool: ide make deploy-target quicker
Date: Mon, 21 Aug 2023 18:07:15 +0200
Message-ID: <20230821161120.171956-13-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821161120.171956-1-adrian.freihofer@siemens.com>
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 16:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186475

---
 scripts/lib/devtool/ide.py | 115 ++++++++++++++++++-------------------
 1 file changed, 55 insertions(+), 60 deletions(-)

diff --git a/scripts/lib/devtool/ide.py b/scripts/lib/devtool/ide.py
index 7c7040232c4..9c724509d48 100755
--- a/scripts/lib/devtool/ide.py
+++ b/scripts/lib/devtool/ide.py
@@ -9,6 +9,7 @@
 
 import os
 import stat
+import sys
 import logging
 import json
 import re
@@ -360,15 +361,19 @@ class RecipeModified:
         self.bbappend = None
         # recipe variables from d.getVar
         self.b = None
+        self.base_libdir = None
         self.bpn = None
         self.d = None
         self.fakerootcmd = None
         self.fakerootenv = None
+        self.libdir = None
+        self.max_process = None
         self.package_arch = None
         self.path = None
         self.recipe_sysroot = None
         self.recipe_sysroot_native = None
         self.staging_incdir = None
+        self.strip_cmd = None
         self.target_arch = None
         self.workdir = None
         # replicate bitbake build environment
@@ -387,11 +392,6 @@ class RecipeModified:
         self.meson_cross_file = None
         # vscode
         self.dot_code_dir = None
-        # TODO: remove calling devtool
-        self.bb_env_passthrough_additions = None
-        self.bbpath = None
-        self.bitbakepath = None
-        self.topdir = None
 
     def initialize(self, config, workspace, tinfoil):
         recipe_d = parse_recipe(
@@ -413,10 +413,14 @@ class RecipeModified:
             shutil.rmtree(self.temp_dir)
 
         self.b = recipe_d.getVar('B')
+        self.base_libdir = recipe_d.getVar('base_libdir')
         self.bpn = recipe_d.getVar('BPN')
         self.d = recipe_d.getVar('D')
         self.fakerootcmd = recipe_d.getVar('FAKEROOTCMD')
         self.fakerootenv = recipe_d.getVar('FAKEROOTENV')
+        self.libdir = recipe_d.getVar('libdir'),
+        self.max_process = int(recipe_d.getVar(
+            "BB_NUMBER_THREADS") or os.cpu_count() or 1)
         self.package_arch = recipe_d.getVar('PACKAGE_ARCH')
         self.path = recipe_d.getVar('PATH')
         self.recipe_sysroot = os.path.realpath(
@@ -425,15 +429,10 @@ class RecipeModified:
             recipe_d.getVar('RECIPE_SYSROOT_NATIVE'))
         self.staging_incdir = os.path.realpath(
             recipe_d.getVar('STAGING_INCDIR'))
+        self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
-        self.bb_env_passthrough_additions = recipe_d.getVar(
-            'BB_ENV_PASSTHROUGH_ADDITIONS')
-        self.bbpath = recipe_d.getVar('BBPATH')
-        self.bitbakepath = recipe_d.getVar('BITBAKEPATH')
-        self.topdir = recipe_d.getVar('TOPDIR')
-
         self.__init_exported_variables(recipe_d)
 
         if bb.data.inherits_class('cmake', recipe_d):
@@ -971,6 +970,38 @@ class RecipeModified:
         cmd_lines.append(install_cmd)
         return self.write_script(cmd_lines, 'bb_run_do_install')
 
+    def gen_deploy_target_script(self, args):
+        """Generate a quicker (works without tinfoil) variant of devtool target-deploy"""
+        cmd_lines = ['#!/usr/bin/env python3']
+        cmd_lines.append('import sys')
+        cmd_lines.append('devtool_sys_path = %s' % str(sys.path))
+        cmd_lines.append('devtool_sys_path.reverse()')
+        cmd_lines.append('for p in devtool_sys_path:')
+        cmd_lines.append('    if p not in sys.path:')
+        cmd_lines.append('        sys.path.insert(0, p)')
+        cmd_lines.append('from devtool.deploy import deploy_cached')
+        args_filter = ['debug', 'dry_run', 'key', 'no_check_space', 'no_host_check',
+                       'no_preserve', 'port', 'recipename', 'show_status', 'ssh_exec', 'strip', 'target']
+        filtered_args_dict = {key: value for key, value in vars(
+            args).items() if key in args_filter}
+        cmd_lines.append('filtered_args_dict = %s' % str(filtered_args_dict))
+        cmd_lines.append('class Dict2Class(object):')
+        cmd_lines.append('    def __init__(self, my_dict):')
+        cmd_lines.append('        for key in my_dict:')
+        cmd_lines.append('            setattr(self, key, my_dict[key])')
+        cmd_lines.append('filtered_args = Dict2Class(filtered_args_dict)')
+        cmd_lines.append('deploy_cached("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
+                         (self.d, self.workdir, self.path, self.strip_cmd,
+                          self.libdir, self.base_libdir, self.max_process,
+                          self.fakerootcmd, self.fakerootenv))
+        return self.write_script(cmd_lines, 'deploy_target')
+
+    def gen_install_deploy_script(self, args):
+        cmd_lines = ['#!/bin/sh']
+        cmd_lines.append(self.gen_fakeroot_install_script())
+        cmd_lines.append(self.gen_deploy_target_script(args))
+        return self.write_script(cmd_lines, 'install_and_deploy')
+
     def write_script(self, cmd_lines, script_name):
         bb.utils.mkdirhier(self.temp_dir)
         script_file = os.path.join(self.temp_dir, script_name)
@@ -981,61 +1012,15 @@ class RecipeModified:
         return script_file
 
     def vscode_tasks(self, args, gdb_cross):
-        run_do_install = self.gen_fakeroot_install_script()
-        pythonpath_new = os.path.realpath(
-            os.path.join(self.bitbakepath, '../lib'))
-        try:
-            pythonpath = os.environ['PYTONPATH'].split(':')
-            if pythonpath_new not in pythonpath:
-                pythonpath = pythonpath_new + ":" + pythonpath
-        except KeyError:
-            pythonpath = pythonpath_new
-        install_label = "do_install %s" % self.bpn
-        deploy_label = "devtool deploy-target %s" % self.bpn
-        bb_env = {
-            # "BBPATH": self.bbpath,
-            "PYTHONPATH": pythonpath,
-            "BUILDDIR": self.topdir,
-            # Use e.g. Python from host, not python-native
-            "PATH": os.environ['PATH'],
-            "BB_ENV_PASSTHROUGH_ADDITIONS": self.bb_env_passthrough_additions
-        }
-        bb_options = {
-            "cwd": self.topdir
-        }
+        run_install_deploy = self.gen_install_deploy_script(args)
         tasks_dict = {
             "version": "2.0.0",
             "tasks": [
                 {
-                    "label": install_label,
-                    "type": "shell",
-                    "command": run_do_install,
-                    "problemMatcher": []
-                },
-                {
-                    "label": deploy_label,
+                    "label": "install && deploy-target %s" % self.bpn,
                     "type": "shell",
-                    "command": "devtool",  # TODO: Generate a self contained script which does what devtool target-deploy does but without connection to the bitbake server
-                    "args": ["--bbpath", self.bbpath, "deploy-target", self.bpn, args.target, "--strip", "--no-host-check"],
-                    "linux": {
-                        "options": {
-                            "env": bb_env
-                        }},
-                    "options": bb_options,
+                    "command": run_install_deploy,
                     "problemMatcher": []
-                },
-                {
-                    "label": "install && deploy-target %s" % self.bpn,
-                    "dependsOrder": "sequence",
-                    "dependsOn": [
-                        install_label,
-                        deploy_label
-                    ],
-                    "problemMatcher": [],
-                    "group": {
-                        "kind": "build",
-                        "isDefault": True
-                    }
                 }
             ]
         }
@@ -1183,6 +1168,16 @@ def register_commands(subparsers, context):
         '--skip-bitbake', help='Generate IDE configuration but skip calling bibtake to update the SDK.', action='store_true')
     parser_ide.add_argument(
         '-k', '--bitbake-k', help='Pass -k parameter to bitbake', action='store_true')
+    parser_ide.add_argument(
+        '--no-strip', help='Do not strip executables prior to deploy', dest='strip', action='store_false')
+    parser_ide.add_argument(
+        '-n', '--dry-run', help='List files to be undeployed only', action='store_true')
+    parser_ide.add_argument(
+        '-s', '--show-status', help='Show progress/status output', action='store_true')
+    parser_ide.add_argument(
+        '-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
+    parser_ide.add_argument(
+        '--no-check-space', help='Do not check for available space before deploying', action='store_true')
     parser_ide.add_argument(
         '--debug-build-config', help='Use debug build flags, for example set CMAKE_BUILD_TYPE=Debug', action='store_true')
     parser_ide.set_defaults(func=ide_setup)
-- 
2.41.0


