Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F57C4708E
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 11:01:49 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.4374.1698836505421611699
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 04:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RrdvhHLM;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9be02fcf268so971772366b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698836503; x=1699441303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJgCE14AbHFJfYnRAyFxMlLmgKJRn+K4Xqj91p/0cyU=;
        b=RrdvhHLMMXqUP1kTCLZTlBvUHbpGqyY+Deuq4Xye/GQmbvaoq+tiWQ+KO3ZSKB9B8V
         PeWIyi7E7f63wWMbsFPuh/41xtGDaryFzKjl8GNjjw5sfBYrK2b2JHVEutDiqlNb2yvp
         jFuE3ornug7qpceIK8i2eljEkabOmuvkbUFbIYAyUEXxNpmEsZ/jg9vkUhfFq5XBp1q9
         Rre2lARImQXq4Gwsh9LbCc9E+H3mLIC4tBZdiMSqLrq20RTYA22jkUCnXCs0FejrLmCT
         Y8YzswwQDZPudR+J60nwweVQkcm8e2Ylb9baeKxJwPPathUzgc+oTEKuh01fhcU1EowK
         lZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836503; x=1699441303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJgCE14AbHFJfYnRAyFxMlLmgKJRn+K4Xqj91p/0cyU=;
        b=qDDf0eSBHTcoBSMxVYqTVuv3ZvE8E/0czrtqD9cw95s9nYIx1ctuwg1kS5O3ny9nlE
         QJpIfjMXKnnLUjpmlNVqJEcHFiyBkczvNQJdQYmhadB8RYZN7RSqUVldqoJ5397SoVdh
         tJcaeECWHYETvSK/stRE/JZlYvm00e5L7zeOtoiNIxdv0K/e0InkfHMLw8J9xq5swQSn
         geFRWwd4SrCrQRE7LtSpfvRmH18k6VuLML3jdR8JpS6KcS9iv6HPRGMFvNKc/jzNFX8r
         ZUqTNO4t97Vjqe0ZsjsjMyUWprUMwcBG8skOWCx/Njgj8kXA8V7hfYobdfUasWdE2fv8
         GEog==
X-Gm-Message-State: AOJu0Yx0YC7EbdFf4c4M04SI7hypRmxvJPD9IkaX/BHi7v+HtBBKuEvI
	/hP9vqtgFr+l9U8C3USQHigotk4u+LM=
X-Google-Smtp-Source: AGHT+IFNCjnjfswxIOeGcSf7H8cM+maV++pNjnXKONV3cwJXRjwAH1T/wlVvx0vvt5Gv0fm0ihhjgQ==
X-Received: by 2002:a17:906:ce4a:b0:9d7:1388:e554 with SMTP id se10-20020a170906ce4a00b009d71388e554mr1202295ejb.17.1698836502816;
        Wed, 01 Nov 2023 04:01:42 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090607cc00b009c7608eb499sm2262426ejc.94.2023.11.01.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 04:01:42 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v8 6/8] devtool: new ide plugin
Date: Wed,  1 Nov 2023 12:01:27 +0100
Message-ID: <20231101110129.647878-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101110129.647878-1-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189906

The new devtool ide plugin configures an IDE to work with the eSDK.

With this initial implementation VSCode is the default IDE.
The plugin works for recipes inheriting the cmake or the meson bbclass.
Support for more programming languages and build tools may be added in
the future.

Using the plugin in recipe modes:
$ devtool modify a-recipe
$ devtool ide a-recipe a-image
$ code "$BUILDDIR/workspace/sources/a-recipe"
Work in VSCode, after installing the proposed plugins

Using the plugin without a recipe
$ devtool ide none a-image
vscode where/the/sources/are
Use the cross tool-chain which is provided as a cmake-kit.

The goal of this implementation is to create a configuration for VSCode
(or other IDEs) that allows to work on the code of a recipe completely
independent from bitbake. bitbake is only called if the configuration or
the whole SDK has to be regenerated. But bitbake should not need to be
called while working in the IDE. This has two major advantages over
calling devtool build from the IDE:
- The IDE provides plugins for integration with cmake, for example.
  These features are usable, which would not be the case if bitbake or
  devtool are called from within the IDE.
- It is much faster.

Many thanks to Enguerrand de Ribaucourt for testing and bug fixing.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide.py                   | 1095 ++++++++++++++++++
 scripts/lib/devtool/ide_handlers/__init__.py |   23 +
 scripts/lib/devtool/ide_handlers/ide_base.py |   46 +
 scripts/lib/devtool/ide_handlers/ide_code.py |  420 +++++++
 scripts/lib/devtool/ide_handlers/ide_none.py |   91 ++
 5 files changed, 1675 insertions(+)
 create mode 100755 scripts/lib/devtool/ide.py
 create mode 100644 scripts/lib/devtool/ide_handlers/__init__.py
 create mode 100644 scripts/lib/devtool/ide_handlers/ide_base.py
 create mode 100644 scripts/lib/devtool/ide_handlers/ide_code.py
 create mode 100644 scripts/lib/devtool/ide_handlers/ide_none.py

diff --git a/scripts/lib/devtool/ide.py b/scripts/lib/devtool/ide.py
new file mode 100755
index 00000000000..77615ac30e5
--- /dev/null
+++ b/scripts/lib/devtool/ide.py
@@ -0,0 +1,1095 @@
+#! /usr/bin/env python3
+#
+# Copyright (C) 2023 Siemens AG
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+"""Devtool ide plugin"""
+
+import os
+import stat
+import sys
+import logging
+import json
+import re
+import shutil
+import subprocess
+from argparse import RawTextHelpFormatter
+from enum import IntEnum, auto
+
+import bb
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
+from devtool.standard import get_real_srctree
+import devtool.ide_handlers
+
+SHARED_SYSROOT_RECIPES = ['shared', 'none',
+                          'meta-ide-support', 'build-sysroots']
+
+logger = logging.getLogger('devtool')
+
+
+class DevtoolIdeMode(IntEnum):
+    UNDEFINED = auto()
+    DEVTOOL_MODIFY = auto()
+    SHARED_SYSROOT = auto()
+
+
+class TargetDevice:
+    """SSH remote login parameters"""
+
+    def __init__(self, args):
+        self.extraoptions = ''
+        if args.no_host_check:
+            self.extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
+        self.ssh_sshexec = 'ssh'
+        if args.ssh_exec:
+            self.ssh_sshexec = args.ssh_exec
+        self.ssh_port = ''
+        if args.port:
+            self.ssh_port = "-p %s" % args.port
+        if args.key:
+            self.extraoptions += ' -i %s' % args.key
+
+        self.target = args.target
+        target_sp = args.target.split('@')
+        if len(target_sp) == 1:
+            self.login = ""
+            self.host = target_sp[0]
+        elif len(target_sp) == 2:
+            self.login = target_sp[0]
+            self.host = target_sp[1]
+        else:
+            logger.error("Invalid target argument: %s" % args.target)
+
+    @staticmethod
+    def get_devtool_deploy_opts(args):
+        """Filter args for devtool deploy-target args"""
+        if not args.target:
+            return None
+        devtool_deploy_opts = [args.target]
+        if args.no_host_check:
+            devtool_deploy_opts += ["-c"]
+        if args.show_status:
+            devtool_deploy_opts += ["-s"]
+        if args.no_preserve:
+            devtool_deploy_opts += ["-p"]
+        if args.no_check_space:
+            devtool_deploy_opts += ["--no-check-space"]
+        if args.ssh_exec:
+            devtool_deploy_opts += ["-e", args.ssh.exec]
+        if args.port:
+            devtool_deploy_opts += ["-P", args.port]
+        if args.key:
+            devtool_deploy_opts += ["-I", args.key]
+        if args.strip is False:
+            devtool_deploy_opts += ["--no-strip"]
+        return devtool_deploy_opts
+
+
+class RecipeNative:
+    """Base class for calling bitbake to provide a -native recipe"""
+
+    def __init__(self, name, target_arch=None):
+        self.name = name
+        self.target_arch = target_arch
+        self.bootstrap_tasks = [self.name + ':do_addto_recipe_sysroot']
+        self.staging_bindir_native = None
+        self.target_sys = None
+        self.__native_bin = None
+
+    def _initialize(self, config, workspace, tinfoil):
+        """Get the parsed recipe"""
+        recipe_d = parse_recipe(
+            config, tinfoil, self.name, appends=True, filter_workspace=False)
+        if not recipe_d:
+            raise DevtoolError("Parsing %s recipe failed" % self.name)
+        self.staging_bindir_native = os.path.realpath(
+            recipe_d.getVar('STAGING_BINDIR_NATIVE'))
+        self.target_sys = recipe_d.getVar('TARGET_SYS')
+        return recipe_d
+
+    def initialize(self, config, workspace, tinfoil):
+        """Basic initialization that can be overridden by a derived class"""
+        self._initialize(config, workspace, tinfoil)
+
+    @property
+    def native_bin(self):
+        if not self.__native_bin:
+            raise DevtoolError("native binary name is not defined.")
+        return self.__native_bin
+
+
+class RecipeGdbCross(RecipeNative):
+    """Handle handle gdb-cross on the host and the gdbserver on the target device"""
+
+    def __init__(self, args, target_arch, target_device, gdbserver_multi=True):
+        super().__init__('gdb-cross-' + target_arch, target_arch)
+        self.target_device = target_device
+        self.gdb = None
+        self.gdbserver_port_next = int(args.gdbserver_port_start)
+        self.gdbserver_multi = gdbserver_multi
+        self.config_db = {}
+
+    def __find_gdbserver(self, config, tinfoil):
+        """Absolute path of the gdbserver"""
+        recipe_d_gdb = parse_recipe(
+            config, tinfoil, 'gdb', appends=True, filter_workspace=False)
+        if not recipe_d_gdb:
+            raise DevtoolError("Parsing gdb recipe failed")
+        return os.path.join(recipe_d_gdb.getVar('bindir'), 'gdbserver')
+
+    def initialize(self, config, workspace, tinfoil):
+        super()._initialize(config, workspace, tinfoil)
+        gdb_bin = self.target_sys + '-gdb'
+        gdb_path = os.path.join(
+            self.staging_bindir_native, self.target_sys, gdb_bin)
+        self.gdb = gdb_path
+        self.gdbserver_path = self.__find_gdbserver(config, tinfoil)
+
+    @property
+    def host(self):
+        return self.target_device.host
+
+    def __gdbserver_start_cmd(self, binary, port):
+        """Returns a shell command starting the gdbserver on the remote device
+
+        GDB supports two modes:
+        multi: gdbserver remains running over several debug sessions
+        once: gdbserver terminates after the debugged process terminates
+        """
+        if self.gdbserver_multi:
+            gdbserver_cmd = "%s --multi :%s" % (
+                self.gdbserver_path, port)
+        else:
+            gdbserver_cmd = "%s --once :%s %s" % (
+                self.gdbserver_path, port, binary)
+        return "%s %s %s %s 'sh -c \"%s\"'" % (
+            self.target_device.ssh_sshexec, self.target_device.ssh_port, self.target_device.extraoptions, self.target_device.target, gdbserver_cmd)
+
+    def setup_gdbserver_config(self, binary, script_dir):
+        """Generate a GDB configuration for a binary on the target device
+
+        This function adds a GDB configuration for the binary to the internal config_db.
+        This allows to allocate a TCP port per binary.
+        Optionally a shell script is generated which starts the gedbserver on the
+        target device as well as the gdb-cross on the host.
+        """
+        if binary in self.config_db:
+            raise DevtoolError(
+                "gdbserver config for binary %s is already generated" % binary)
+
+        port = self.gdbserver_port_next
+        self.gdbserver_port_next += 1
+        config_entry = {
+            "port": port,
+        }
+        if script_dir:
+            cmd_lines = ['#!/bin/sh']
+            cmd_lines.append(self.__gdbserver_start_cmd(binary, port))
+            binary_name_pretty = binary.replace(os.sep, '-')
+            start_script_name = 'gdbserver_start_%d_%s' % (
+                port, binary_name_pretty)
+            if self.gdbserver_multi:
+                start_script_name += "_m"
+            start_script_file = os.path.join(script_dir, start_script_name)
+            config_entry['gdbserver_start_script'] = start_script_file
+            config_entry['pretty_id'] = 'gdbserver start %d %s' % (
+                port, binary)
+
+            bb.utils.mkdirhier(script_dir)
+            with open(start_script_file, 'w') as script_f:
+                script_f.write(os.linesep.join(cmd_lines))
+                script_f.write(os.linesep)
+            st = os.stat(start_script_file)
+            os.chmod(start_script_file, st.st_mode | stat.S_IEXEC)
+
+        self.config_db[binary] = config_entry
+        return config_entry
+
+    def get_gdbserver_pretty_id(self, binary):
+        """Unique ID for the GDB configuration"""
+        return self.config_db[binary]['pretty_id']
+
+    def get_gdbserver_port(self, binary):
+        """TCP port used by gdbserver"""
+        return self.config_db[binary]['port']
+
+    def get_gdbserver_start_script(self, binary):
+        """Path to the script starting the debug session"""
+        return self.config_db[binary]['gdbserver_start_script']
+
+    def get_gdbserver_start_scripts(self):
+        """Get the paths of all debug session start scripts"""
+        for conf in self.config_db.values():
+            yield (conf['pretty_id'], conf['gdbserver_start_script'])
+
+
+class RecipeImage:
+    """Handle some image recipe related properties
+
+    Most workflows require firmware that runs on the target device.
+    This firmware must be consistent with the setup of the host system.
+    In particular, the debug symbols must be compatible. For this, the
+    rootfs must be created as part of the SDK.
+    """
+
+    def __init__(self, name):
+        self.gdbserver_missing = False
+        self.name = name
+        self.rootfs = None
+        self.__rootfs_dbg = None
+        self.bootstrap_tasks = [self.name + ':do_build']
+
+    def initialize(self, config, tinfoil):
+        image_d = parse_recipe(
+            config, tinfoil, self.name, appends=True, filter_workspace=False)
+        if not image_d:
+            raise DevtoolError(
+                "Parsing image recipe %s failed" % self.name)
+
+        workdir = image_d.getVar('WORKDIR')
+        self.rootfs = os.path.join(workdir, 'rootfs')
+        if image_d.getVar('IMAGE_GEN_DEBUGFS') == "1":
+            self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
+
+        self.gdbserver_missing = 'gdbserver' not in image_d.getVar(
+            'IMAGE_INSTALL')
+
+    @property
+    def debug_support(self):
+        return bool(self.rootfs_dbg)
+
+    @property
+    def rootfs_dbg(self):
+        if self.__rootfs_dbg and os.path.isdir(self.__rootfs_dbg):
+            return self.__rootfs_dbg
+        return None
+
+
+class RecipeMetaIdeSupport:
+    """For the shared sysroots mode meta-ide-support is needed
+
+    For use cases where just a cross tool-chain is required but
+    no recipe is used, devtool ide abstracts calling bitbake meta-ide-support
+    and bitbake build-sysroots. This also allows to expose the cross-toolchains
+    to IDEs. For example VSCode support different tool-chains with e.g. cmake-kits.
+    """
+
+    def __init__(self):
+        self.bootstrap_tasks = ['meta-ide-support:do_build']
+        self.topdir = None
+        self.datadir = None
+        self.deploy_dir_image = None
+        self.build_sys = None
+        # From toolchain-scripts
+        self.real_multimach_target_sys = None
+
+    def initialize(self, config, tinfoil):
+        meta_ide_support_d = parse_recipe(
+            config, tinfoil, 'meta-ide-support', appends=True, filter_workspace=False)
+        if not meta_ide_support_d:
+            raise DevtoolError("Parsing meta-ide-support recipe failed")
+
+        self.topdir = meta_ide_support_d.getVar('TOPDIR')
+        self.datadir = meta_ide_support_d.getVar('datadir')
+        self.deploy_dir_image = meta_ide_support_d.getVar(
+            'DEPLOY_DIR_IMAGE')
+        self.build_sys = meta_ide_support_d.getVar('BUILD_SYS')
+        self.real_multimach_target_sys = meta_ide_support_d.getVar(
+            'REAL_MULTIMACH_TARGET_SYS')
+
+
+class RecipeBuildSysroots:
+    """For the shared sysroots mode build-sysroots is needed"""
+
+    def __init__(self):
+        self.standalone_sysroot = None
+        self.standalone_sysroot_native = None
+        self.bootstrap_tasks = [
+            'build-sysroots:do_build_target_sysroot',
+            'build-sysroots:do_build_native_sysroot'
+        ]
+
+    def initialize(self, config, tinfoil):
+        build_sysroots_d = parse_recipe(
+            config, tinfoil, 'build-sysroots', appends=True, filter_workspace=False)
+        if not build_sysroots_d:
+            raise DevtoolError("Parsing build-sysroots recipe failed")
+        self.standalone_sysroot = build_sysroots_d.getVar(
+            'STANDALONE_SYSROOT')
+        self.standalone_sysroot_native = build_sysroots_d.getVar(
+            'STANDALONE_SYSROOT_NATIVE')
+
+
+class SharedSysrootsEnv:
+    """Handle the shared sysroots based workflow
+
+    Support the workflow with just a tool-chain without a recipe.
+    It's basically like:
+      bitbake some-dependencies
+      bitbake meta-ide-support
+      bitbake build-sysroots
+      Use the environment-* file found in the deploy folder
+    """
+
+    def __init__(self):
+        self.ide_support = None
+        self.build_sysroots = None
+
+    def initialize(self, ide_support, build_sysroots):
+        self.ide_support = ide_support
+        self.build_sysroots = build_sysroots
+
+    def setup_ide(self, ide):
+        ide.setup(self)
+
+
+class BuildTool(IntEnum):
+    UNDEFINED = auto()
+    CMAKE = auto()
+    MESON = auto()
+
+
+class RecipeModified:
+    """Handling af recipes in the workspace created by devtool modify"""
+    OE_INIT_BUILD_ENV = 'oe-init-build-env'
+
+    def __init__(self, name):
+        self.name = name
+        self.bootstrap_tasks = [name + ':do_install']
+        # workspace
+        self.real_srctree = None
+        self.srctree = None
+        self.temp_dir = None
+        self.bbappend = None
+        # recipe variables from d.getVar
+        self.b = None
+        self.base_libdir = None
+        self.bblayers = None
+        self.bpn = None
+        self.d = None
+        self.fakerootcmd = None
+        self.fakerootenv = None
+        self.libdir = None
+        self.max_process = None
+        self.package_arch = None
+        self.package_debug_split_style = None
+        self.path = None
+        self.pn = None
+        self.recipe_sysroot = None
+        self.recipe_sysroot_native = None
+        self.staging_incdir = None
+        self.strip_cmd = None
+        self.target_arch = None
+        self.workdir = None
+        self.recipe_id = None
+        # recipe variables from d.getVarFlags
+        self.f_do_install_cleandirs = None
+        self.f_do_install_dirs = None
+        # replicate bitbake build environment
+        self.exported_vars = None
+        self.cmd_compile = None
+        self.__oe_init_dir = None
+        # main build tool used by this recipe
+        self.build_tool = BuildTool.UNDEFINED
+        # build_tool = cmake
+        self.oecmake_generator = None
+        self.cmake_cache_vars = None
+        # build_tool = meson
+        self.meson_buildtype = None
+        self.meson_wrapper = None
+        self.mesonopts = None
+        self.extra_oemeson = None
+        self.meson_cross_file = None
+
+    def initialize(self, config, workspace, tinfoil):
+        recipe_d = parse_recipe(
+            config, tinfoil, self.name, appends=True, filter_workspace=False)
+        if not recipe_d:
+            raise DevtoolError("Parsing %s recipe failed" % self.name)
+
+        # Verify this recipe is built as externalsrc setup by devtool modify
+        workspacepn = check_workspace_recipe(
+            workspace, self.name, bbclassextend=True)
+        self.srctree = workspace[workspacepn]['srctree']
+        # Need to grab this here in case the source is within a subdirectory
+        self.real_srctree = get_real_srctree(
+            self.srctree, recipe_d.getVar('S'), recipe_d.getVar('WORKDIR'))
+        self.bbappend = workspace[workspacepn]['bbappend']
+
+        self.temp_dir = os.path.join(config.workspace_path, 'temp', self.name)
+        if os.path.exists(self.temp_dir):
+            shutil.rmtree(self.temp_dir)
+
+        self.b = recipe_d.getVar('B')
+        self.base_libdir = recipe_d.getVar('base_libdir')
+        self.bblayers = recipe_d.getVar('BBLAYERS').split()
+        self.bpn = recipe_d.getVar('BPN')
+        self.d = recipe_d.getVar('D')
+        self.fakerootcmd = recipe_d.getVar('FAKEROOTCMD')
+        self.fakerootenv = recipe_d.getVar('FAKEROOTENV')
+        self.libdir = recipe_d.getVar('libdir')
+        self.max_process = int(recipe_d.getVar(
+            "BB_NUMBER_THREADS") or os.cpu_count() or 1)
+        self.package_arch = recipe_d.getVar('PACKAGE_ARCH')
+        self.package_debug_split_style = recipe_d.getVar(
+            'PACKAGE_DEBUG_SPLIT_STYLE')
+        self.path = recipe_d.getVar('PATH')
+        self.pn = recipe_d.getVar('PN')
+        self.recipe_sysroot = os.path.realpath(
+            recipe_d.getVar('RECIPE_SYSROOT'))
+        self.recipe_sysroot_native = os.path.realpath(
+            recipe_d.getVar('RECIPE_SYSROOT_NATIVE'))
+        self.staging_incdir = os.path.realpath(
+            recipe_d.getVar('STAGING_INCDIR'))
+        self.strip_cmd = recipe_d.getVar('STRIP')
+        self.target_arch = recipe_d.getVar('TARGET_ARCH')
+        self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
+
+        self.f_do_install_cleandirs = recipe_d.getVarFlag(
+            'do_install', 'cleandirs').split()
+        self.f_do_install_dirs = recipe_d.getVarFlag(
+            'do_install', 'dirs').split()
+
+        self.__init_exported_variables(recipe_d)
+
+        if bb.data.inherits_class('cmake', recipe_d):
+            self.oecmake_generator = recipe_d.getVar('OECMAKE_GENERATOR')
+            self.__init_cmake_preset_cache(recipe_d)
+            self.build_tool = BuildTool.CMAKE
+        elif bb.data.inherits_class('meson', recipe_d):
+            self.meson_buildtype = recipe_d.getVar('MESON_BUILDTYPE')
+            self.mesonopts = recipe_d.getVar('MESONOPTS')
+            self.extra_oemeson = recipe_d.getVar('EXTRA_OEMESON')
+            self.meson_cross_file = recipe_d.getVar('MESON_CROSS_FILE')
+            self.build_tool = BuildTool.MESON
+
+        # Recipe ID is the identifier for IDE config sections
+        self.recipe_id = self.bpn + "-" + self.package_arch
+        self.recipe_id_pretty = self.bpn + ": " + self.package_arch
+
+    def is_recipe_cross(self):
+        if self.pn.startswith('nativesdk-') or self.pn.endswith('-native'):
+            return False
+        return True
+
+    def append_to_bbappend(self, append_text):
+        with open(self.bbappend, 'a') as bbap:
+            bbap.write(append_text)
+
+    def remove_from_bbappend(self, append_text):
+        with open(self.bbappend, 'r') as bbap:
+            text = bbap.read()
+        new_text = text.replace(append_text, '')
+        with open(self.bbappend, 'w') as bbap:
+            bbap.write(new_text)
+
+    def debug_build_config(self, args):
+        """Explicitely set for example CMAKE_BUILD_TYPE to Debug if not defined otherwise"""
+        if self.build_tool == BuildTool.CMAKE:
+            append_text = os.linesep + \
+                'OECMAKE_ARGS:append = " -DCMAKE_BUILD_TYPE:STRING=Debug"' + os.linesep
+            if args.debug_build_config and not 'CMAKE_BUILD_TYPE' in self.cmake_cache_vars:
+                self.cmake_cache_vars['CMAKE_BUILD_TYPE'] = {
+                    "type": "STRING",
+                    "value": "Debug",
+                }
+                self.append_to_bbappend(append_text)
+            elif 'CMAKE_BUILD_TYPE' in self.cmake_cache_vars:
+                del self.cmake_cache_vars['CMAKE_BUILD_TYPE']
+                self.remove_from_bbappend(append_text)
+        elif self.build_tool == BuildTool.MESON:
+            append_text = os.linesep + 'MESON_BUILDTYPE = "debug"' + os.linesep
+            if args.debug_build_config and self.meson_buildtype != "debug":
+                self.mesonopts.replace(
+                    '--buildtype ' + self.meson_buildtype, '--buildtype debug')
+                self.append_to_bbappend(append_text)
+            elif self.meson_buildtype == "debug":
+                self.mesonopts.replace(
+                    '--buildtype debug', '--buildtype plain')
+                self.remove_from_bbappend(append_text)
+        elif args.debug_build_config:
+            logger.warn(
+                "--debug-build-config is not implemented for this build tool yet.")
+
+    def solib_search_path(self, image):
+        """Search for debug symbols in the rootfs-dbg
+
+        The debug symbols of shared libraries which are provided by other packages
+        are grabbed from the -dbg packages in the rootfs-dbg.
+
+        Note: For the devtool modified recipe compiled from the IDE, the debug
+        symbols are taken from the unstripped binaries in the image folder.
+        The image folder is created by the do_install task.
+        Also, devtool deploy-target takes the files from the image folder.
+        Running the do_package task is not required when working with the IDE.
+        """
+        so_paths = []
+        if self.package_debug_split_style in ['debug-with-srcpkg', '.debug']:
+            so_paths = [
+                self.base_libdir, os.path.join(self.base_libdir, ".debug"),
+                self.libdir, os.path.join(self.libdir, ".debug")
+            ]
+        elif self.package_debug_split_style == 'debug-file-directory':
+            so_paths = ["/usr/lib/debug"]
+        else:
+            logger.warning(
+                "Cannot find solib search path for a rootfs built with PACKAGE_DEBUG_SPLIT_STYLE=%s." % self.package_debug_split_style)
+        return [os.path.join(image.rootfs_dbg, dbgdir.lstrip('/')) for dbgdir in so_paths]
+
+    def solib_search_path_str(self, image):
+        """Return a : separated list of paths usable by GDB's set solib-search-path"""
+        return ':'.join(self.solib_search_path(image))
+
+    def __init_exported_variables(self, d):
+        """Find all variables with export flag set.
+
+        This allows to generate IDE configurations which compile with the same
+        environment as bitbake does. That's at least a reasonable default behavior.
+        """
+        exported_vars = {}
+
+        vars = (key for key in d.keys() if not key.startswith(
+            "__") and not d.getVarFlag(key, "func", False))
+        for var in vars:
+            func = d.getVarFlag(var, "func", False)
+            if d.getVarFlag(var, 'python', False) and func:
+                continue
+            export = d.getVarFlag(var, "export", False)
+            unexport = d.getVarFlag(var, "unexport", False)
+            if not export and not unexport and not func:
+                continue
+            if unexport:
+                continue
+
+            val = d.getVar(var)
+            if val is None:
+                continue
+            if set(var) & set("-.{}+"):
+                logger.warn(
+                    "Warning: Found invalid character in variable name %s", str(var))
+                continue
+            varExpanded = d.expand(var)
+            val = str(val)
+
+            if varExpanded.startswith("BASH_FUNC_"):
+                varExpanded = varExpanded[10:-2]
+                val = val[3:]  # Strip off "() "
+                logger.warn("Warning: BASH_FUNC_ is not exported to cmake presets (%s() %s)" % (
+                    varExpanded, val))
+                continue
+
+            if func:
+                code_line = "line: {0}, file: {1}\n".format(
+                    d.getVarFlag(var, "lineno", False),
+                    d.getVarFlag(var, "filename", False))
+                val = val.rstrip('\n')
+                logger.warn("Warning: exported shell function %s() is not exported (%s)" %
+                            (varExpanded, code_line))
+                continue
+
+            if export:
+                exported_vars[varExpanded] = val.strip()
+                continue
+
+        self.exported_vars = exported_vars
+
+    def __init_cmake_preset_cache(self, d):
+        """Get the arguments passed to cmake
+
+        Replicate the cmake configure arguments with all details to
+        share on build folder between bitbake and SDK.
+        """
+        site_file = os.path.join(self.workdir, 'site-file.cmake')
+        if os.path.exists(site_file):
+            print("Warning: site-file.cmake is not supported")
+
+        cache_vars = {}
+        oecmake_args = d.getVar('OECMAKE_ARGS').split()
+        extra_oecmake = d.getVar('EXTRA_OECMAKE').split()
+        for param in oecmake_args + extra_oecmake:
+            d_pref = "-D"
+            if param.startswith(d_pref):
+                param = param[len(d_pref):]
+            else:
+                print("Error: expected a -D")
+            param_s = param.split('=', 1)
+            param_nt = param_s[0].split(':', 1)
+
+            def handle_undefined_variable(var):
+                if var.startswith('${') and var.endswith('}'):
+                    return ''
+                else:
+                    return var
+            # Example: FOO=ON
+            if len(param_nt) == 1:
+                cache_vars[param_s[0]] = handle_undefined_variable(param_s[1])
+            # Example: FOO:PATH=/tmp
+            elif len(param_nt) == 2:
+                cache_vars[param_nt[0]] = {
+                    "type": param_nt[1],
+                    "value": handle_undefined_variable(param_s[1]),
+                }
+            else:
+                print("Error: cannot parse %s" % param)
+        self.cmake_cache_vars = cache_vars
+
+    def cmake_preset(self):
+        """Create a preset for cmake that mimics how bitbake calls cmake"""
+        toolchain_file = os.path.join(self.workdir, 'toolchain.cmake')
+        cmake_executable = os.path.join(
+            self.recipe_sysroot_native, 'usr', 'bin', 'cmake')
+        self.cmd_compile = cmake_executable + " --build --preset " + self.recipe_id
+
+        preset_dict_configure = {
+            "name": self.recipe_id,
+            "displayName": self.recipe_id_pretty,
+            "description": "Bitbake build environment for the recipe %s compiled for %s" % (self.bpn, self.package_arch),
+            "binaryDir": self.b,
+            "generator": self.oecmake_generator,
+            "toolchainFile": toolchain_file,
+            "cacheVariables": self.cmake_cache_vars,
+            "environment": self.exported_vars,
+            "cmakeExecutable": cmake_executable
+        }
+
+        preset_dict_build = {
+            "name": self.recipe_id,
+            "displayName": self.recipe_id_pretty,
+            "description": "Bitbake build environment for the recipe %s compiled for %s" % (self.bpn, self.package_arch),
+            "configurePreset": self.recipe_id,
+            "inheritConfigureEnvironment": True
+        }
+
+        preset_dict_test = {
+            "name": self.recipe_id,
+            "displayName": self.recipe_id_pretty,
+            "description": "Bitbake build environment for the recipe %s compiled for %s" % (self.bpn, self.package_arch),
+            "configurePreset": self.recipe_id,
+            "inheritConfigureEnvironment": True
+        }
+
+        preset_dict = {
+            "version": 3,  # cmake 3.21, backward compatible with kirkstone
+            "configurePresets": [preset_dict_configure],
+            "buildPresets": [preset_dict_build],
+            "testPresets": [preset_dict_test]
+        }
+
+        logger.info("generating cmake preset for recipe %s" % self.bpn)
+
+        # Finally write the json file
+        json_file = 'CMakeUserPresets.json'
+        json_path = os.path.join(self.real_srctree, json_file)
+        logger.info("Updating CMake preset: %s (%s)" % (json_file, json_path))
+        if not os.path.exists(self.real_srctree):
+            os.makedirs(self.real_srctree)
+        try:
+            with open(json_path) as f:
+                orig_dict = json.load(f)
+        except json.decoder.JSONDecodeError:
+            logger.info(
+                "Decoding %s failed. Probably because of comments in the json file" % json_path)
+            orig_dict = {}
+        except FileNotFoundError:
+            orig_dict = {}
+
+        # Add or update the presets for the recipe and keep other presets
+        for k, v in preset_dict.items():
+            if isinstance(v, list):
+                update_preset = v[0]
+                preset_added = False
+                if k in orig_dict:
+                    for index, orig_preset in enumerate(orig_dict[k]):
+                        if 'name' in orig_preset:
+                            if orig_preset['name'] == update_preset['name']:
+                                logger.debug("Updating preset: %s" %
+                                             orig_preset['name'])
+                                orig_dict[k][index] = update_preset
+                                preset_added = True
+                                break
+                            else:
+                                logger.debug("keeping preset: %s" %
+                                             orig_preset['name'])
+                        else:
+                            logger.warn("preset without a name found")
+                if not preset_added:
+                    if not k in orig_dict:
+                        orig_dict[k] = []
+                    orig_dict[k].append(update_preset)
+                    logger.debug("Added preset: %s" %
+                                 update_preset['name'])
+            else:
+                orig_dict[k] = v
+
+        with open(json_path, 'w') as f:
+            json.dump(orig_dict, f, indent=4)
+
+    def gen_meson_wrapper(self):
+        """Generate a wrapper script to call meson with the cross environment"""
+        bb.utils.mkdirhier(self.temp_dir)
+        meson_wrapper = os.path.join(self.temp_dir, 'meson')
+        meson_real = os.path.join(
+            self.recipe_sysroot_native, 'usr', 'bin', 'meson.real')
+        with open(meson_wrapper, 'w') as mwrap:
+            mwrap.write("#!/bin/sh" + os.linesep)
+            for var, val in self.exported_vars.items():
+                mwrap.write('export %s="%s"' % (var, val) + os.linesep)
+            mwrap.write("unset CC CXX CPP LD AR NM STRIP" + os.linesep)
+            private_temp = os.path.join(self.b, "meson-private", "tmp")
+            mwrap.write('mkdir -p "%s"' % private_temp + os.linesep)
+            mwrap.write('export TMPDIR="%s"' % private_temp + os.linesep)
+            mwrap.write('exec "%s" "$@"' % meson_real + os.linesep)
+        st = os.stat(meson_wrapper)
+        os.chmod(meson_wrapper, st.st_mode | stat.S_IEXEC)
+        self.meson_wrapper = meson_wrapper
+        self.cmd_compile = meson_wrapper + " compile -C " + self.b
+
+    def which(self, executable):
+        bin_path = shutil.which(executable, path=self.path)
+        if not bin_path:
+            raise DevtoolError(
+                'Cannot find %s. Probably the recipe %s is not built yet.' % (executable, self.bpn))
+        return bin_path
+
+    @staticmethod
+    def is_elf_file(file_path):
+        with open(file_path, "rb") as f:
+            data = f.read(4)
+        if data == b'\x7fELF':
+            return True
+        return False
+
+    def find_installed_binaries(self):
+        """find all executable elf files in the image directory"""
+        binaries = []
+        d_len = len(self.d)
+        re_so = re.compile('.*\.so[.0-9]*$')
+        for root, _, files in os.walk(self.d, followlinks=False):
+            for file in files:
+                if os.path.islink(file):
+                    continue
+                if re_so.match(file):
+                    continue
+                abs_name = os.path.join(root, file)
+                if os.access(abs_name, os.X_OK) and RecipeModified.is_elf_file(abs_name):
+                    binaries.append(abs_name[d_len:])
+        return binaries
+
+    def gen_fakeroot_install_script(self):
+        """Generate a helper script to execute make install with pseudo
+
+        For the deployment to the target device the do_install task must be
+        executed out of the IDE as well. This function generates a script which
+        runs the run.do_install script from bitbake under pseudo so that it picks
+        up the appropriate file permissions. Generating a self-contained script
+        is much quicker than calling bitbake or devtool build from an IDE.
+        """
+        cmd_lines = ['#!/bin/sh']
+        # Ensure the do compile step gets always executed without pseuso before do install
+        # Running do_compile always without pseudo is probably better than trying to have
+        # all the paths referred by compiling added to PSEUDO_IGNORE_PATHS.
+        if self.cmd_compile:
+            cmd_compile = "( cd %s && %s)" % (
+                self.real_srctree, self.cmd_compile)
+            cmd_lines.append(cmd_compile)
+        if not os.access(self.fakerootcmd, os.X_OK):
+            raise DevtoolError(
+                "pseudo executable %s could not be found" % self.fakerootcmd)
+        run_do_install = os.path.join(self.workdir, 'temp', 'run.do_install')
+
+        if not os.access(run_do_install, os.X_OK):
+            raise DevtoolError(
+                "run script does not exists: %s" % run_do_install)
+
+        # Set up the appropriate environment
+        newenv = dict(os.environ)
+        for varvalue in self.fakerootenv.split():
+            if '=' in varvalue:
+                splitval = varvalue.split('=', 1)
+                newenv[splitval[0]] = splitval[1]
+
+        # Replicate the environment variables from bitbake
+        for var, val in newenv.items():
+            cmd_lines.append('export %s="%s"' % (var, val))
+
+        # Setup the task environment as bitbake would do it based on the varFlags
+        for d in self.f_do_install_cleandirs:
+            cmd_lines.append('%s rm -rf %s' % (self.fakerootcmd, d))
+        for d in self.f_do_install_dirs:
+            cmd_lines.append('%s mkdir -p %s' % (self.fakerootcmd, d))
+        if len(self.f_do_install_dirs) > 0:
+            cmd = "cd %s" % self.f_do_install_dirs[-1]
+            cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
+
+        # Remove the package* folders from TMPDIR. These folders might contain the sources for the -src packages.
+        # This likely breaks pseudo like:
+        # path mismatch [3 links]: ino 79147802 db
+        # .../build/tmp/.../cmake-example/1.0/package/usr/src/debug/cmake-example/1.0-r0/oe-local-files/cpp-example-lib.cpp
+        # .../build/workspace/sources/cmake-example/oe-local-files/cpp-example-lib.cpp
+        # Since the files are anyway outdated lets deleted them (also from pseudo's db) to workaround this issue.
+        pkg_dirs = ' '.join([os.path.join(self.workdir, d) for d in [
+            "package", "packages-split", "pkgdata", "sstate-install-package", "debugsources.list", "*.spec"]])
+        cmd = "%s rm -rf %s" % (self.fakerootcmd, pkg_dirs)
+        cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
+
+        # Finally call run.do_install on pseudo
+        cmd = "%s %s" % (self.fakerootcmd, run_do_install)
+        cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
+
+        return self.write_script(cmd_lines, 'bb_run_do_install')
+
+    def gen_deploy_target_script(self, args):
+        """Generate a script which does what devtool deploy-target does
+
+        This script is much quicker than devtool target-deploy. Because it
+        does not need to start a bitbake server. All information from tinfoil
+        is hard-coded in the generated script.
+        """
+        cmd_lines = ['#!/usr/bin/env python3']
+        cmd_lines.append('import sys')
+        cmd_lines.append('devtool_sys_path = %s' % str(sys.path))
+        cmd_lines.append('devtool_sys_path.reverse()')
+        cmd_lines.append('for p in devtool_sys_path:')
+        cmd_lines.append('    if p not in sys.path:')
+        cmd_lines.append('        sys.path.insert(0, p)')
+        cmd_lines.append('from devtool.deploy import deploy_cached')
+        args_filter = ['debug', 'dry_run', 'key', 'no_check_space', 'no_host_check',
+                       'no_preserve', 'port', 'show_status', 'ssh_exec', 'strip', 'target']
+        filtered_args_dict = {key: value for key, value in vars(
+            args).items() if key in args_filter}
+        cmd_lines.append('filtered_args_dict = %s' % str(filtered_args_dict))
+        cmd_lines.append('class Dict2Class(object):')
+        cmd_lines.append('    def __init__(self, my_dict):')
+        cmd_lines.append('        for key in my_dict:')
+        cmd_lines.append('            setattr(self, key, my_dict[key])')
+        cmd_lines.append('filtered_args = Dict2Class(filtered_args_dict)')
+        cmd_lines.append(
+            'setattr(filtered_args, "recipename", "%s")' % self.bpn)
+        cmd_lines.append('deploy_cached("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
+                         (self.d, self.workdir, self.path, self.strip_cmd,
+                          self.libdir, self.base_libdir, self.max_process,
+                          self.fakerootcmd, self.fakerootenv))
+        return self.write_script(cmd_lines, 'deploy_target')
+
+    def gen_install_deploy_script(self, args):
+        """Generate a script which does install and deploy"""
+        cmd_lines = ['#!/bin/sh -e']
+        cmd_lines.append(self.gen_fakeroot_install_script())
+        cmd_lines.append(self.gen_deploy_target_script(args))
+        return self.write_script(cmd_lines, 'install_and_deploy')
+
+    def write_script(self, cmd_lines, script_name):
+        bb.utils.mkdirhier(self.temp_dir)
+        script_name_arch = script_name + '_' + self.recipe_id
+        script_file = os.path.join(self.temp_dir, script_name_arch)
+        with open(script_file, 'w') as script_f:
+            script_f.write(os.linesep.join(cmd_lines))
+        st = os.stat(script_file)
+        os.chmod(script_file, st.st_mode | stat.S_IEXEC)
+        return script_file
+
+    @property
+    def oe_init_build_env(self):
+        """Find the oe-init-build-env used for this setup"""
+        oe_init_dir = self.oe_init_dir
+        if oe_init_dir:
+            return os.path.join(oe_init_dir, RecipeModified.OE_INIT_BUILD_ENV)
+        return None
+
+    @property
+    def oe_init_dir(self):
+        """Find the directory where the oe-init-build-env is located
+
+        Assumption: There might be a layer with higher priority than poky
+        which provides to oe-init-build-env in the layer's toplevel folder.
+        """
+        if not self.__oe_init_dir:
+            for layer in reversed(self.bblayers):
+                result = subprocess.run(
+                    ['git', 'rev-parse', '--show-toplevel'], cwd=layer, capture_output=True)
+                if result.returncode == 0:
+                    oe_init_dir = result.stdout.decode('utf-8').strip()
+                    oe_init_path = os.path.join(
+                        oe_init_dir, RecipeModified.OE_INIT_BUILD_ENV)
+                    if os.path.exists(oe_init_path):
+                        logger.debug("Using %s from: %s" % (
+                            RecipeModified.OE_INIT_BUILD_ENV, oe_init_path))
+                        self.__oe_init_dir = oe_init_dir
+                        break
+            if not self.__oe_init_dir:
+                logger.error("Cannot find the bitbake top level folder")
+        return self.__oe_init_dir
+
+
+def ide_setup(args, config, basepath, workspace):
+    """Generate the IDE configuration for the workspace"""
+    bootstrap_tasks = []
+    bootstrap_tasks_late = []
+    devtool_ide_mode = DevtoolIdeMode.UNDEFINED
+    ide = devtool.ide_handlers.create_ide(args)
+
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        # define mode depending on recipes which need to be processed
+        recipes_shared_names = []
+        recipes_image_names = []
+        recipes_modified_names = []
+        for recipe in args.recipenames:
+            if recipe in SHARED_SYSROOT_RECIPES:
+                recipes_shared_names.append(recipe)
+            else:
+                try:
+                    check_workspace_recipe(
+                        workspace, recipe, bbclassextend=True)
+                    recipes_modified_names.append(recipe)
+                except DevtoolError:
+                    recipe_d = parse_recipe(
+                        config, tinfoil, recipe, appends=True, filter_workspace=False)
+                    if not recipe_d:
+                        raise DevtoolError("Parsing recipe %s failed" % recipe)
+                    if bb.data.inherits_class('image', recipe_d):
+                        recipes_image_names.append(recipe)
+                    else:
+                        raise DevtoolError(
+                            "Recipe is not an image and not a recipe in the workspace.")
+
+        if len(recipes_image_names) > 1:
+            raise DevtoolError("Max one image recipe must be passed.")
+        if recipes_image_names and recipes_modified_names:
+            devtool_ide_mode = DevtoolIdeMode.DEVTOOL_MODIFY
+            if recipes_shared_names:
+                raise DevtoolError("Mixing modified recipes (%s) and shared recipes (%s) is not possible."
+                                   % (str(recipes_modified_names), str(recipes_shared_names)))
+            logger.info("Mode: devtool modify")
+        elif recipes_image_names and recipes_shared_names:
+            devtool_ide_mode = DevtoolIdeMode.SHARED_SYSROOT
+        else:
+            raise DevtoolError("Invalid recipes passed.")
+
+        # Provide a rootfs and the corresponding debug symbols via rootfs-dbg
+        if devtool_ide_mode == DevtoolIdeMode.DEVTOOL_MODIFY or devtool_ide_mode == DevtoolIdeMode.SHARED_SYSROOT:
+            logger.info("Using image: %s" % recipes_image_names[0])
+            image_config = RecipeImage(recipes_image_names[0])
+            image_config.initialize(config, tinfoil)
+            bootstrap_tasks += image_config.bootstrap_tasks
+
+        if devtool_ide_mode == DevtoolIdeMode.SHARED_SYSROOT:
+            logger.info("Generating a shared sysroot SDK.")
+            ide_support = RecipeMetaIdeSupport()
+            ide_support.initialize(config, tinfoil)
+            bootstrap_tasks += ide_support.bootstrap_tasks
+
+            build_sysroots = RecipeBuildSysroots()
+            build_sysroots.initialize(config, tinfoil)
+            bootstrap_tasks_late += build_sysroots.bootstrap_tasks
+            shared_env = SharedSysrootsEnv()
+            shared_env.initialize(ide_support, build_sysroots)
+
+        recipes_modified = []
+        if devtool_ide_mode == DevtoolIdeMode.DEVTOOL_MODIFY:
+            logger.info("Using modified recipe: %s" %
+                        recipes_modified_names[0])
+            for modified_recipe_name in recipes_modified_names:
+                recipe_modified = RecipeModified(modified_recipe_name)
+                recipe_modified.initialize(config, workspace, tinfoil)
+                bootstrap_tasks += recipe_modified.bootstrap_tasks
+                recipes_modified.append(recipe_modified)
+
+            target_device = TargetDevice(args)
+            gdb_cross = RecipeGdbCross(
+                args, recipes_modified[0].target_arch, target_device, ide.gdb_multi_mode)
+            gdb_cross.initialize(config, workspace, tinfoil)
+            bootstrap_tasks += gdb_cross.bootstrap_tasks
+    finally:
+        tinfoil.shutdown()
+
+    if devtool_ide_mode == DevtoolIdeMode.DEVTOOL_MODIFY:
+        for recipe_modified in recipes_modified:
+            if not recipe_modified.is_recipe_cross():
+                raise DevtoolError(
+                    "Only cross compiled recipes are currently supported.")
+            recipe_modified.debug_build_config(args)
+
+    if devtool_ide_mode == DevtoolIdeMode.DEVTOOL_MODIFY or devtool_ide_mode == DevtoolIdeMode.SHARED_SYSROOT:
+        if not args.skip_bitbake:
+            bb_cmd = 'bitbake '
+            if args.bitbake_k:
+                bb_cmd += "-k "
+            bb_cmd_early = bb_cmd + ' '.join(bootstrap_tasks)
+            exec_build_env_command(
+                config.init_path, basepath, bb_cmd_early, watch=True)
+            if bootstrap_tasks_late:
+                bb_cmd_late = bb_cmd + ' '.join(bootstrap_tasks_late)
+                exec_build_env_command(
+                    config.init_path, basepath, bb_cmd_late, watch=True)
+
+    if (image_config.gdbserver_missing):
+        logger.warning(
+            "gdbserver not installed in image. Remote debugging will not be available")
+
+    if devtool_ide_mode == DevtoolIdeMode.SHARED_SYSROOT:
+        ide.setup_shared_sysroots(shared_env)
+    elif devtool_ide_mode == DevtoolIdeMode.DEVTOOL_MODIFY:
+        for recipe_modified in recipes_modified:
+            ide.setup_modified_recipe(
+                args, image_config, gdb_cross, recipe_modified)
+    else:
+        raise DevtoolError("Must not end up here.")
+
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    parser_ide = subparsers.add_parser('ide', help='Setup the IDE (VSCode)',
+                                       description='Configure the IDE to work with the source code of a recipe.',
+                                       group='working', order=50, formatter_class=RawTextHelpFormatter)
+    parser_ide.add_argument(
+        'recipenames', nargs='+', help='Generate an IDE configuration suitable to work on the given recipes.\n'
+        'Different types of recipes lead to different types of IDE configurations.\n'
+        '- devtool modify mode:\n'
+        '  At least one devtool modified recipe + one image recipe are required:\n'
+        '  Usage example:\n'
+        '    devtool modify cmake-example\n'
+        '    devtool ide cmake-example core-image-minimal\n'
+        '  The workspace for all package recipes gets configured to use the corresponding per recipe sysroot(s).\n'
+        '  The image recipes is used to generate the target image, the corresponding remote debug configuration as well as the corresponding SDK.\n'
+        '- Shared sysroot mode:\n'
+        '  Usage example:\n'
+        '    devtool ide ' + SHARED_SYSROOT_RECIPES[0] + '\n'
+        '  This command generates a bare cross-toolchain as well as the corresponding shared sysroot directories.\n'
+        '  To use this tool-chain the environment-* file found in the deploy..image folder needs to be sourced into a shell.\n'
+        '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit')
+    parser_ide.add_argument(
+        '-i', '--ide', choices=devtool.ide_handlers.SUPPORTED_IDES, default=devtool.ide_handlers.get_default_ide(),
+        help='Setup the configuration for this IDE')
+    parser_ide.add_argument(
+        '-t', '--target', default='root@192.168.7.2',
+        help='Live target machine running an ssh server: user@hostname.')
+    parser_ide.add_argument(
+        '-G', '--gdbserver-port-start', default="1234", help='port where gdbserver is listening.')
+    parser_ide.add_argument(
+        '-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
+    parser_ide.add_argument(
+        '-e', '--ssh-exec', help='Executable to use in place of ssh')
+    parser_ide.add_argument(
+        '-P', '--port', help='Specify ssh port to use for connection to the target')
+    parser_ide.add_argument(
+        '-I', '--key', help='Specify ssh private key for connection to the target')
+    parser_ide.add_argument(
+        '--skip-bitbake', help='Generate IDE configuration but skip calling bibtake to update the SDK.', action='store_true')
+    parser_ide.add_argument(
+        '-k', '--bitbake-k', help='Pass -k parameter to bitbake', action='store_true')
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
+    parser_ide.add_argument(
+        '--debug-build-config', help='Use debug build flags, for example set CMAKE_BUILD_TYPE=Debug', action='store_true')
+    parser_ide.set_defaults(func=ide_setup)
diff --git a/scripts/lib/devtool/ide_handlers/__init__.py b/scripts/lib/devtool/ide_handlers/__init__.py
new file mode 100644
index 00000000000..9fcc96837ad
--- /dev/null
+++ b/scripts/lib/devtool/ide_handlers/__init__.py
@@ -0,0 +1,23 @@
+
+import shutil
+from devtool.ide_handlers.ide_none import IdeNone
+from devtool.ide_handlers.ide_code import IdeVSCode
+
+SUPPORTED_IDES = ['code', 'none']
+
+def get_default_ide():
+    """Check which IDEs are installed and return a reasonable default setting"""
+    for an_ide in SUPPORTED_IDES[:-1]:
+        if shutil.which(an_ide):
+            return an_ide
+    return SUPPORTED_IDES[-1]
+
+
+def create_ide(args):
+    """Simple factory for the IDE"""
+    if args.ide == 'code':
+        return IdeVSCode(args.ide)
+    elif args.ide == 'none':
+        return IdeNone(args.ide)
+    else:
+        raise ValueError("ide must be in %s" % str(SUPPORTED_IDES))
diff --git a/scripts/lib/devtool/ide_handlers/ide_base.py b/scripts/lib/devtool/ide_handlers/ide_base.py
new file mode 100644
index 00000000000..b9563166e42
--- /dev/null
+++ b/scripts/lib/devtool/ide_handlers/ide_base.py
@@ -0,0 +1,46 @@
+import os
+import json
+import logging
+
+logger = logging.getLogger('devtool')
+
+
+class IdeBase:
+    """Base class defining an interface for IDE plugins"""
+
+    def __init__(self, ide_name):
+        self.ide_name = ide_name
+        self.gdb_multi_mode = True
+
+    def setup_shared_sysroots(self, shared_env):
+        logger.warn("Shared sysroot mode is not supported for IDE %s" %
+                    self.ide_name)
+
+    def setup_modified_recipe(self, args, image_config, gdb_cross, modified_recipe):
+        logger.warn("Modified recipe mode is not supported for IDE %s" %
+                    self.ide_name)
+
+    @staticmethod
+    def update_json_file(json_dir, json_file, update_dict):
+        """Update a json file
+
+        By default it uses the dict.update function. If this is not sutiable
+        the update function might be passed via update_func parameter.
+        """
+        json_path = os.path.join(json_dir, json_file)
+        logger.info("Updating IDE config file: %s (%s)" %
+                    (json_file, json_path))
+        if not os.path.exists(json_dir):
+            os.makedirs(json_dir)
+        try:
+            with open(json_path) as f:
+                orig_dict = json.load(f)
+        except json.decoder.JSONDecodeError:
+            logger.info(
+                "Decoding %s failed. Probably because of comments in the json file" % json_path)
+            orig_dict = {}
+        except FileNotFoundError:
+            orig_dict = {}
+        orig_dict.update(update_dict)
+        with open(json_path, 'w') as f:
+            json.dump(orig_dict, f, indent=4)
diff --git a/scripts/lib/devtool/ide_handlers/ide_code.py b/scripts/lib/devtool/ide_handlers/ide_code.py
new file mode 100644
index 00000000000..8496f0a5ce5
--- /dev/null
+++ b/scripts/lib/devtool/ide_handlers/ide_code.py
@@ -0,0 +1,420 @@
+import os
+import json
+import logging
+from devtool.ide_handlers.ide_base import IdeBase
+from devtool.ide import BuildTool
+
+logger = logging.getLogger('devtool')
+
+
+class IdeVSCode(IdeBase):
+    """Manage IDE configurations for VSCode
+
+    Recipe mode:
+    - cmake: generates a cmake-preset
+    - meson: workspace settings callin the cross meson are gernerated.
+
+    Shared sysroot mode:
+    In shared sysroot mode, the cross tool-chain is exported to the user's global configuration.
+    A workspace cannot be created because there is no recipe that defines how a workspace could be set up.
+    - cmake: adds a cmake-kit to .local/share/CMakeTools/cmake-tools-kits.json
+             The cmake-kit uses the environment script and the tool-chain file
+             generated by meta-ide-support.
+    - meson: Meson needs manual workspace configuration.
+    """
+
+    def __init__(self, ide_name):
+        self.gdb_multi_mode = False
+
+    def setup_shared_sysroots(self, shared_env):
+        """Expose the toolchain of the dSDK"""
+        datadir = shared_env.ide_support.datadir
+        deploy_dir_image = shared_env.ide_support.deploy_dir_image
+        real_multimach_target_sys = shared_env.ide_support.real_multimach_target_sys
+        standalone_sysroot_native = shared_env.build_sysroots.standalone_sysroot_native
+        vscode_ws_path = os.path.join(
+            os.environ['HOME'], '.local', 'share', 'CMakeTools')
+        cmake_kits_path = os.path.join(vscode_ws_path, 'cmake-tools-kits.json')
+        oecmake_generator = "Ninja"
+        env_script = os.path.join(
+            deploy_dir_image, 'environment-setup-' + real_multimach_target_sys)
+
+        if not os.path.isdir(vscode_ws_path):
+            os.makedirs(vscode_ws_path)
+        cmake_kits_old = []
+        if os.path.exists(cmake_kits_path):
+            with open(cmake_kits_path, 'r', encoding='utf-8') as cmake_kits_file:
+                cmake_kits_old = json.load(cmake_kits_file)
+        cmake_kits = cmake_kits_old.copy()
+
+        cmake_kit_new = {
+            "name": "OE " + real_multimach_target_sys,
+            "environmentSetupScript": env_script,
+            "toolchainFile": standalone_sysroot_native + datadir + "/cmake/OEToolchainConfig.cmake",
+            "preferredGenerator": {
+                "name": oecmake_generator
+            }
+        }
+
+        def merge_kit(cmake_kits, cmake_kit_new):
+            i = 0
+            while i < len(cmake_kits):
+                if 'environmentSetupScript' in cmake_kits[i] and \
+                        cmake_kits[i]['environmentSetupScript'] == cmake_kit_new['environmentSetupScript']:
+                    cmake_kits[i] = cmake_kit_new
+                    return
+                i += 1
+            cmake_kits.append(cmake_kit_new)
+        merge_kit(cmake_kits, cmake_kit_new)
+
+        if cmake_kits != cmake_kits_old:
+            logger.info("Updating: %s" % cmake_kits_path)
+            with open(cmake_kits_path, 'w', encoding='utf-8') as cmake_kits_file:
+                json.dump(cmake_kits, cmake_kits_file, indent=4)
+        else:
+            logger.info("Already up to date: %s" % cmake_kits_path)
+
+        cmake_native = os.path.join(
+            shared_env.build_sysroots.standalone_sysroot_native, 'usr', 'bin', 'cmake')
+        if os.path.isfile(cmake_native):
+            logger.info('cmake-kits call cmake by default. If the cmake provided by this SDK should be used, please add the following line to ".vscode/settings.json" file: "cmake.cmakePath": "%s"' % cmake_native)
+        else:
+            logger.error("Cannot find cmake native at: %s" % cmake_native)
+
+    def dot_code_dir(self, modified_recipe):
+        return os.path.join(modified_recipe.srctree, '.vscode')
+
+    def __vscode_settings_meson(self, settings_dict, modified_recipe):
+        if modified_recipe.build_tool != BuildTool.MESON:
+            return
+        settings_dict["mesonbuild.mesonPath"] = modified_recipe.meson_wrapper
+
+        confopts = modified_recipe.mesonopts.split()
+        confopts += modified_recipe.meson_cross_file.split()
+        confopts += modified_recipe.extra_oemeson.split()
+        settings_dict["mesonbuild.configureOptions"] = confopts
+        settings_dict["mesonbuild.buildFolder"] = modified_recipe.b
+
+    def __vscode_settings_cmake(self, settings_dict, modified_recipe):
+        """Add cmake specific settings to settings.json.
+
+        Note: most settings are passed to the cmake preset.
+        """
+        if modified_recipe.build_tool != BuildTool.CMAKE:
+            return
+        settings_dict["cmake.configureOnOpen"] = True
+        settings_dict["cmake.sourceDirectory"] = modified_recipe.real_srctree
+
+    def vscode_settings(self, modified_recipe):
+        files_excludes = {
+            "**/.git/**": True,
+            "**/oe-logs/**": True,
+            "**/oe-workdir/**": True,
+            "**/source-date-epoch/**": True
+        }
+        python_exclude = [
+            "**/.git/**",
+            "**/oe-logs/**",
+            "**/oe-workdir/**",
+            "**/source-date-epoch/**"
+        ]
+        settings_dict = {
+            "files.watcherExclude": files_excludes,
+            "files.exclude": files_excludes,
+            "python.analysis.exclude": python_exclude
+        }
+        self.__vscode_settings_cmake(settings_dict, modified_recipe)
+        self.__vscode_settings_meson(settings_dict, modified_recipe)
+
+        settings_file = 'settings.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), settings_file, settings_dict)
+
+    def __vscode_extensions_cmake(self, modified_recipe, recommendations):
+        if modified_recipe.build_tool != BuildTool.CMAKE:
+            return
+        recommendations += [
+            "twxs.cmake",
+            "ms-vscode.cmake-tools",
+            "ms-vscode.cpptools",
+            "ms-vscode.cpptools-extension-pack",
+            "ms-vscode.cpptools-themes"
+        ]
+
+    def __vscode_extensions_meson(self, modified_recipe, recommendations):
+        if modified_recipe.build_tool != BuildTool.MESON:
+            return
+        recommendations += [
+            'mesonbuild.mesonbuild',
+            "ms-vscode.cpptools",
+            "ms-vscode.cpptools-extension-pack",
+            "ms-vscode.cpptools-themes"
+        ]
+
+    def vscode_extensions(self, modified_recipe):
+        recommendations = []
+        self.__vscode_extensions_cmake(modified_recipe, recommendations)
+        self.__vscode_extensions_meson(modified_recipe, recommendations)
+        extensions_file = 'extensions.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), extensions_file, {"recommendations": recommendations})
+
+    def vscode_c_cpp_properties(self, modified_recipe):
+        properties_dict = {
+            "name": modified_recipe.recipe_id_pretty,
+        }
+        if modified_recipe.build_tool == BuildTool.CMAKE:
+            properties_dict["configurationProvider"] = "ms-vscode.cmake-tools"
+        elif modified_recipe.build_tool == BuildTool.MESON:
+            properties_dict["configurationProvider"] = "mesonbuild.mesonbuild"
+        else:  # no C/C++ build
+            return
+
+        properties_dicts = {
+            "configurations": [
+                properties_dict
+            ],
+            "version": 4
+        }
+        prop_file = 'c_cpp_properties.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), prop_file, properties_dicts)
+
+    def vscode_launch_bin_dbg(self, modified_recipe, image, gdb_cross, binary):
+        gdb_cross.setup_gdbserver_config(binary, modified_recipe.temp_dir)
+        pretty_id = gdb_cross.get_gdbserver_pretty_id(binary)
+        gdbserver_port = gdb_cross.get_gdbserver_port(binary)
+
+        launch_config = {
+            "name": pretty_id,
+            "type": "cppdbg",
+            "request": "launch",
+            "program": os.path.join(modified_recipe.d, binary.lstrip('/')),
+            "stopAtEntry": True,
+            "cwd": "${workspaceFolder}",
+            "environment": [],
+            "externalConsole": False,
+            "MIMode": "gdb",
+            "preLaunchTask": pretty_id,
+            "miDebuggerPath": gdb_cross.gdb,
+            "miDebuggerServerAddress": "%s:%d" % (gdb_cross.host, gdbserver_port)
+        }
+
+        # Search for header files in recipe-sysroot.
+        src_file_map = {
+            "/usr/include": os.path.join(modified_recipe.recipe_sysroot, "usr", "include")
+        }
+        # First of all search for not stripped binaries in the image folder.
+        # These binaries are copied (and optionally stripped) by deploy-target
+        setup_commands = [
+            {
+                "description": "sysroot",
+                "text": "set sysroot " + modified_recipe.d
+            }
+        ]
+
+        if image.rootfs_dbg:
+            launch_config['additionalSOLibSearchPath'] = modified_recipe.solib_search_path_str(
+                image)
+            src_file_map["/usr/src/debug"] = os.path.join(
+                image.rootfs_dbg, "usr", "src", "debug")
+        else:
+            logger.warning(
+                "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
+
+        launch_config['sourceFileMap'] = src_file_map
+        launch_config['setupCommands'] = setup_commands
+        return launch_config
+
+    def vscode_launch_bin(self, modified_recipe, image, gdb_cross):
+        """GDB Launch configuration for binaries (elf files)"""
+        binaries = modified_recipe.find_installed_binaries()
+        configurations = [self.vscode_launch_bin_dbg(modified_recipe,
+                                                     image, gdb_cross, binary) for binary in binaries]
+        launch_dict = {
+            "version": "0.2.0",
+            "configurations": configurations
+        }
+        launch_file = 'launch.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), launch_file, launch_dict)
+
+    def vscode_launch(self, modified_recipe, image, gdb_cross):
+        if modified_recipe.build_tool in [BuildTool.CMAKE, BuildTool.MESON, BuildTool.UNDEFINED]:
+            self.vscode_launch_bin(modified_recipe, image, gdb_cross)
+        else:
+            logger.info(
+                "Generating a launch configuration for this recipe is not yet suported")
+
+    def vscode_tasks_cpp(self, args, modified_recipe, gdb_cross):
+        run_install_deploy = modified_recipe.gen_install_deploy_script(args)
+        install_task_name = "install && deploy-target %s" % modified_recipe.recipe_id_pretty
+        tasks_dict = {
+            "version": "2.0.0",
+            "tasks": [
+                {
+                    "label": install_task_name,
+                    "type": "shell",
+                    "command": run_install_deploy,
+                    "problemMatcher": []
+                }
+            ]
+        }
+        for pretty_id, start_script in gdb_cross.get_gdbserver_start_scripts():
+            tasks_dict['tasks'].append(
+                {
+                    "label": pretty_id,
+                    "type": "shell",
+                    "isBackground": True,
+                    "dependsOn": [
+                        install_task_name
+                    ],
+                    "command": start_script,
+                    "problemMatcher": [
+                        {
+                            "pattern": [
+                                {
+                                    "regexp": ".",
+                                    "file": 1,
+                                    "location": 2,
+                                    "message": 3
+                                }
+                            ],
+                            "background": {
+                                "activeOnStart": True,
+                                "beginsPattern": ".",
+                                "endsPattern": ".",
+                            }
+                        }
+                    ]
+                })
+        tasks_file = 'tasks.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
+
+    def vscode_tasks_fallback(self, args, modified_recipe, gdb_cross=None):
+        oe_init_dir = modified_recipe.oe_init_dir
+        oe_init = ". %s > /dev/null && " % modified_recipe.oe_init_build_env
+        task_devtool_build = "devtool build %s" % modified_recipe.recipe_id_pretty
+        task_devtool_build_clean = "devtool build %s --clean" % modified_recipe.recipe_id_pretty
+        task_devtool_deploy = "devtool deploy-target %s" % modified_recipe.recipe_id_pretty
+        task_devtool_build_deploy = "devtool build & deploy-target %s" % modified_recipe.recipe_id_pretty
+        deploy_opts = ' '.join(TargetDevice.get_devtool_deploy_opts(args))
+        tasks_dict = {
+            "version": "2.0.0",
+            "tasks": [
+                {
+                    "label": task_devtool_build,
+                    "type": "shell",
+                    "command": "bash",
+                    "linux": {
+                        "options": {
+                            "cwd": oe_init_dir
+                        }
+                    },
+                    "args": [
+                        "--login",
+                        "-c",
+                        "%s%s" % (oe_init, task_devtool_build)
+                    ],
+                    "problemMatcher": []
+                },
+                {
+                    "label": task_devtool_deploy,
+                    "type": "shell",
+                    "command": "bash",
+                    "linux": {
+                        "options": {
+                            "cwd": oe_init_dir
+                        }
+                    },
+                    "args": [
+                        "--login",
+                        "-c",
+                        "%s%s %s" % (
+                            oe_init, task_devtool_deploy, deploy_opts)
+                    ],
+                    "problemMatcher": []
+                },
+                {
+                    "label": task_devtool_build_deploy,
+                    "dependsOrder": "sequence",
+                    "dependsOn": [
+                        task_devtool_build,
+                        task_devtool_deploy
+                    ],
+                    "problemMatcher": [],
+                    "group": {
+                        "kind": "build",
+                        "isDefault": True
+                    }
+                },
+                {
+                    "label": task_devtool_build_clean,
+                    "type": "shell",
+                    "command": "bash",
+                    "linux": {
+                        "options": {
+                            "cwd": oe_init_dir
+                        }
+                    },
+                    "args": [
+                        "--login",
+                        "-c",
+                        "%s%s" % (oe_init, task_devtool_build_clean)
+                    ],
+                    "problemMatcher": []
+                }
+            ]
+        }
+        if gdb_cross:
+            for pretty_id, start_script in gdb_cross.get_gdbserver_start_scripts():
+                tasks_dict['tasks'].append(
+                    {
+                        "label": pretty_id,
+                        "type": "shell",
+                        "isBackground": True,
+                        "dependsOn": [
+                            task_devtool_build_deploy
+                        ],
+                        "command": start_script,
+                        "problemMatcher": [
+                            {
+                                "pattern": [
+                                    {
+                                        "regexp": ".",
+                                        "file": 1,
+                                        "location": 2,
+                                        "message": 3
+                                    }
+                                ],
+                                "background": {
+                                    "activeOnStart": True,
+                                    "beginsPattern": ".",
+                                    "endsPattern": ".",
+                                }
+                            }
+                        ]
+                    })
+        tasks_file = 'tasks.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), tasks_file, tasks_dict)
+
+    def vscode_tasks(self, args, modified_recipe, gdb_cross):
+        if modified_recipe.build_tool in [BuildTool.CMAKE, BuildTool.MESON]:
+            self.vscode_tasks_cpp(args, modified_recipe, gdb_cross)
+        else:
+            self.vscode_tasks_fallback(args, modified_recipe, gdb_cross)
+
+    def setup_modified_recipe(self, args, image_config, gdb_cross, modified_recipe):
+        if modified_recipe.build_tool == BuildTool.CMAKE:
+            modified_recipe.cmake_preset()
+        if modified_recipe.build_tool == BuildTool.MESON:
+            modified_recipe.gen_meson_wrapper()
+
+        self.vscode_settings(modified_recipe)
+        self.vscode_extensions(modified_recipe)
+        self.vscode_c_cpp_properties(modified_recipe)
+        if args.target:
+            self.vscode_launch(modified_recipe, image_config, gdb_cross)
+            self.vscode_tasks(args, modified_recipe, gdb_cross)
diff --git a/scripts/lib/devtool/ide_handlers/ide_none.py b/scripts/lib/devtool/ide_handlers/ide_none.py
new file mode 100644
index 00000000000..6a2e9d4a655
--- /dev/null
+++ b/scripts/lib/devtool/ide_handlers/ide_none.py
@@ -0,0 +1,91 @@
+
+import os
+import logging
+from devtool.ide_handlers.ide_base import IdeBase
+from devtool.ide import BuildTool
+
+logger = logging.getLogger('devtool')
+
+
+class IdeNone(IdeBase):
+    """Generate some generic helpers for other IDEs
+
+    Recipe mode:
+    Generate some helper scripts for femote debugging with GDB
+
+    Shared sysroot mode:
+    A wrapper for bitbake meta-ide-support and bitbake build-sysroots
+    """
+
+    def setup_shared_sysroots(self, shared_env):
+        real_multimach_target_sys = shared_env.ide_support.real_multimach_target_sys
+        deploy_dir_image = shared_env.ide_support.deploy_dir_image
+        env_script = os.path.join(
+            deploy_dir_image, 'environment-setup-' + real_multimach_target_sys)
+        logger.info(
+            "To use this SDK please source this: %s" % env_script)
+
+    @staticmethod
+    def get_unique_gdbinit_name(binary):
+        return 'gdbinit' + binary.replace(os.sep, '-')
+
+    def none_launch(self, args, modified_recipe, image, gdb_cross):
+        """generate some helper scripts
+
+        - an install (running on pseudo) and deploy script
+        - a gdbinit file per executable
+        """
+        # install and deploy helper scripts
+        script_path = modified_recipe.gen_install_deploy_script(args)
+        logger.info("Created helper script: %s" % script_path)
+
+        # gdbinit
+        binaries = modified_recipe.find_installed_binaries()
+        for binary in binaries:
+            gdb_cross.setup_gdbserver_config(binary, modified_recipe.temp_dir)
+            gdbserver_port = str(gdb_cross.get_gdbserver_port(binary))
+            if gdb_cross.gdbserver_multi:
+                target_help = '#   gdbserver --multi :' + gdbserver_port
+                remote_cmd = 'target extended-remote '
+            else:
+                target_help = '#   gdbserver :' + gdbserver_port + ' ' + binary
+                remote_cmd = 'target remote '
+            gdbinit_path = os.path.join(
+                modified_recipe.real_srctree, IdeNone.get_unique_gdbinit_name(binary))
+
+            gdbinit_lines = ['# This file is generated by devtool ide']
+            gdbinit_lines.append('# On the remote target:')
+            gdbinit_lines.append(target_help)
+            gdbinit_lines.append('# On the build machine:')
+            gdbinit_lines.append('#   cd ' + modified_recipe.real_srctree)
+            gdbinit_lines.append(
+                '#   ' + gdb_cross.gdb + ' -ix ' + gdbinit_path)
+
+            gdbinit_lines.append('set sysroot ' + modified_recipe.d)
+            gdbinit_lines.append('set substitute-path "/usr/include" "' +
+                                 os.path.join(modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
+            # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
+            gdbinit_lines.append('set debuginfod enabled off')
+            if image.rootfs_dbg:
+                gdbinit_lines.append(
+                    'set solib-search-path "' + modified_recipe.solib_search_path_str(image) + '"')
+                gdbinit_lines.append('set substitute-path "/usr/src/debug" "' + os.path.join(
+                    image.rootfs_dbg, 'usr', 'src', 'debug') + '"')
+            gdbinit_lines.append(
+                remote_cmd + gdb_cross.host + ':' + gdbserver_port)
+            gdbinit_lines.append('set remote exec-file ' + binary)
+            gdbinit_lines.append(
+                'run ' + os.path.join(modified_recipe.d, binary))
+
+            with open(gdbinit_path, 'w') as gdbinit_file:
+                gdbinit_file.write('\n'.join(gdbinit_lines))
+            logger.info("Created .gdbinit: %s" % gdbinit_path)
+
+    def setup_modified_recipe(self, args, image_config, gdb_cross, modified_recipe):
+        if modified_recipe.build_tool == BuildTool.CMAKE:
+            modified_recipe.cmake_preset()
+        if modified_recipe.build_tool == BuildTool.MESON:
+            modified_recipe.gen_meson_wrapper()
+
+        if modified_recipe.build_tool == BuildTool.CMAKE or modified_recipe.build_tool == BuildTool.MESON:
+            self.none_launch(args, modified_recipe, image_config, gdb_cross)
-- 
2.41.0


