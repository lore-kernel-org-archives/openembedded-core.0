Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D726EE49B5
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 19:23:56 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.5240.1692732228514222542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 12:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dFWA6LJy;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99df431d4bfso626968166b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 12:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692732227; x=1693337027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1SnTuAhFxDpsGGX8wM7sKL+0XZkEv7Dw30w3L3RU5E=;
        b=dFWA6LJyRh1Swe13UqpenlzqCGRAEHmP11wW+HeOjzihvhANR4hnQsvlsPW42BawOH
         hHLYPltQ1Knf4wiYgyrowTiPqhEiEyDFwzea+cnpowyNYFOYzsKBA2zdko2MOTm1DUh5
         EJ2I/KsH/pn2YHBhHQby6ZCtCOcGn8otnCs1Y/jw2XR0ABBO4Oslw8p2XMyh+S58o3na
         1Wql4zo4nY9NjjVETZSc8C+fOmoTKQj7ezj7s9KyTWAIH9rCQRCKER14D3R741aK+bXv
         G6i+DvNtXZQx0sxCguQRcCWCHwkWAcQI/95tQ9AOmDZiiRxBdlX410uSr+e4FSuw6Qgy
         W+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732227; x=1693337027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1SnTuAhFxDpsGGX8wM7sKL+0XZkEv7Dw30w3L3RU5E=;
        b=csHY4OSZHihLZh1e5WoSrcLtiVHXWz1AaOvaFgZzZ6n6wFQsIgWmQCwECPhhCU//7X
         fS2LLcr9TC4/z2npdRI5JXcPwL6Z4v8hTslprrvJ0gRQMGNs+mZMXwJfHKmPJrrQymb/
         yOqMhL1XagXf3vnarUDkLV9kQ7UgjHOfDsOJYLlzyIsVc59P6xYAUl7GgIMA3S6WDGgq
         x7mGiX4Y8W13817Hm+Ysw/RscsS4R3E7mmTDCpXzJjpcMq15NoBkDmMtcdnji62+lLCd
         6VaJxXUoA3drthi64zWFMGvNDGQfzhTNJ+6nS1UWvby2Zj84oG4x17EfnktQXJ9d+373
         WckQ==
X-Gm-Message-State: AOJu0Yyq1UXZRhMuK2D0vbgUFj3sBE6iEsjKI/F+9gbZ/pAPWJkuyo2I
	BQI0znkZd5X0Wx3fNcY4oN7y9pCL8iQ=
X-Google-Smtp-Source: AGHT+IHgCKe/RLJRqvgiHyJifex9I9AjbLZRDxqfusaOQD6ViMHn+ikP86/WAXfcr4Fu2LibSyrGeA==
X-Received: by 2002:a17:906:295:b0:993:e809:b9ff with SMTP id 21-20020a170906029500b00993e809b9ffmr8717608ejf.21.1692732226654;
        Tue, 22 Aug 2023 12:23:46 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0098f99048053sm8744041ejf.148.2023.08.22.12.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 12:23:46 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 11/13] devtool: ide make deploy-target quicker
Date: Tue, 22 Aug 2023 21:20:17 +0200
Message-ID: <20230822192300.3235896-12-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
References: <20230822192300.3235896-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 19:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186534

Instead of calling devtool deploy-target which starts a bitbake server
to get some variables the previous refactoring allows to generate a
simple script which does no longer depend on variables from bitbake.
This is much faster.
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


