Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688A0C47E49
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.74259.1705931965920853794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EpWDc70H;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso3245078e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931964; x=1706536764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7XTgybMWftqedAh5FAuFqlAgW8OImiM4FYuZj/PsUI=;
        b=EpWDc70Hbhzxk+4EJX2ohzxSS/qeYPE7BMHhwE1aeKYavubmrI53dmzYkt3OMg3Yxo
         eUC58gJpNSDnmIIIBcNp7ZZ5b24hU+wkNb7LOx9joU5Wh/fHEtmHsDo1D4Yxs87cCPLH
         DPc00TDOHZe8h56+LoIHShvqgh/Jds3OBhxFB+bOxTMrlg4Cwu+TEmU/Fbl6DsXdoLa6
         PK4LmthVUCo4086C8jBvxMLEocdhkksp7QqI+IHsL5OEoBZQhlXpFrqDYSaAFG6/5zvY
         YNEf/2MndSFsfcG146l66mYKACRmKc0TUEmhjdR7XdCxuqXg5n9z2u9wPjWBsQMc554a
         /OKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931964; x=1706536764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7XTgybMWftqedAh5FAuFqlAgW8OImiM4FYuZj/PsUI=;
        b=RLzBoWFJw5Z4fSwJXU/jtDpxl2Og5pzYtcz1d2jXoEpFTksJZJyZb2yw7p9fNNxAvw
         oykR5OPkAZqT0pCtHVrnHlWmrAm/Se7tVaCkgENDL3YkAqs2+S3VGj4SN2lstuBlYkQR
         UArC2/nVF6OJLEI0WTotve6gppeP3Dgb7yZz+ifCLzw7/zX+aq60xi9aqmdtVTwCFOHP
         8OkcmsS03RR4sFlYTvLT7AHjVBGHzFa5orwWRXCvyZf3xljo2r7VIvUytdbc0AUM9MPB
         aaZ/JrnGjL3gk7gaMjLCFmHjBEhUMO+IZpKcwrM2xmOQpdiF2iVgBFbXbqVoQfk3pwJl
         7Zog==
X-Gm-Message-State: AOJu0YwMAnP5F+xqyf3rqOBwguz8yQcEpRvKzKVb3uIsbPxOFTyQQVn6
	HvS4VV57LTpiMtskwYGNnImxq+koaxtx/kmaIk0K5TlW8LfjUd1WLU6th/18
X-Google-Smtp-Source: AGHT+IEpNjltTHuXHqgQSkIg7KOmada0NXm2aeyp1reNxQzRuI8QyXuYBEBELPoweb6SgEo0JqM6aw==
X-Received: by 2002:a05:6512:3095:b0:50e:74f0:810d with SMTP id z21-20020a056512309500b0050e74f0810dmr1919151lfd.101.1705931963058;
        Mon, 22 Jan 2024 05:59:23 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:22 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 3/9] devtool: new ide-sdk plugin
Date: Mon, 22 Jan 2024 14:58:21 +0100
Message-ID: <20240122135901.171596-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194153

The new devtool ide plugin provides the eSDK and configures an IDE to
work with the eSDK. In doing so, bitbake should be used to generate the
IDE configuration and update the SDK, but it should no longer play a
role when working on the source code. The work on the source code should
take place exclusively with the IDE, which, for example, calls cmake
directly to compile the code and execute the unit tests from the IDE.

The plugin works for recipes inheriting the cmake or the meson bbclass.
Support for more programming languages and build tools may be added in
the future.

There are various IDEs that can be used for the development of embedded
Linux applications. Therefore, devtool ide-sdk, like devtool itself,
supports plugins to support IDEs.
VSCode is the default IDE for this first implementation. Additionally,
some generic helper scripts can be generated with --ide none instead of
a specific IDE configuration. This can be used for any IDE that
supports calling some scripts.

There are two different modes supported:

- devtool modify mode (default):
  devtool ide-sdk configures the IDE to manage the build-tool used by the
  recipe (e.g. cmake or meson). The workflow looks like:
    $ devtool modify a-recipe
    $ devtool ide-sdk a-recipe a-image
    $ code "$BUILDDIR/workspace/sources/a-recipe"
    Work in VSCode, after installing the proposed plugins

  Deploying the artifacts to the target device and running a remote
  debugging session is supported as well.
  This first implementation still calls bitbake and devtool to copy the
  binary artifacts to the target device. In contrast to compiling,
  installation and copying must be performed with the file rights of the
  target device. The pseudo tool must be used for this. Therefore
  bitbake -c install a-recipe && devtool deploy-target a-recipe
  are called by the IDE for the deployment. This might be improved later
  on.

  Executing the unit tests out of the IDE is supported via Qemu user if
  the build tool supports that. CMake (if cmake-qemu.bbclass is
  inherited) and Meson support Qemu usermode.

- Shared sysroots mode: bootstraps the eSDK with shared sysroots for
  all the recipes passed to devtool ide-sdk. This is basically a wrapper
  for bitbake meta-ide-support && bitbake build-sysroots. The workflow
  looks like:
    $ devtool ide-sdk --share-sysroots a-recipe another-recipe
    vscode where/the/sources/are
  If the IDE and the build tool support it, the IDE gets configured to
  offer the cross tool-chain provided by the eSDK. In case of VSCode and
  cmake a cmake-kit is generated. This offers to use the cross
  tool-chain from the UI of the IDE.

Many thanks to Enguerrand de Ribaucourt for testing and bug fixing.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_plugins/__init__.py |  267 +++++
 scripts/lib/devtool/ide_plugins/ide_code.py |  438 ++++++++
 scripts/lib/devtool/ide_plugins/ide_none.py |   53 +
 scripts/lib/devtool/ide_sdk.py              | 1032 +++++++++++++++++++
 4 files changed, 1790 insertions(+)
 create mode 100644 scripts/lib/devtool/ide_plugins/__init__.py
 create mode 100644 scripts/lib/devtool/ide_plugins/ide_code.py
 create mode 100644 scripts/lib/devtool/ide_plugins/ide_none.py
 create mode 100755 scripts/lib/devtool/ide_sdk.py

diff --git a/scripts/lib/devtool/ide_plugins/__init__.py b/scripts/lib/devtool/ide_plugins/__init__.py
new file mode 100644
index 00000000000..3371b242640
--- /dev/null
+++ b/scripts/lib/devtool/ide_plugins/__init__.py
@@ -0,0 +1,267 @@
+#
+# Copyright (C) 2023-2024 Siemens AG
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+"""Devtool ide-sdk IDE plugin interface definition and helper functions"""
+
+import errno
+import json
+import logging
+import os
+import stat
+from enum import Enum, auto
+from devtool import DevtoolError
+from bb.utils import mkdirhier
+
+logger = logging.getLogger('devtool')
+
+
+class BuildTool(Enum):
+    UNDEFINED = auto()
+    CMAKE = auto()
+    MESON = auto()
+
+    @property
+    def is_c_ccp(self):
+        if self is BuildTool.CMAKE:
+            return True
+        if self is BuildTool.MESON:
+            return True
+        return False
+
+
+class GdbCrossConfig:
+    """Base class defining the GDB configuration generator interface
+
+    Generate a GDB configuration for a binary on the target device.
+    Only one instance per binary is allowed. This allows to assign unique port
+    numbers for all gdbserver instances.
+    """
+    _gdbserver_port_next = 1234
+    _binaries = []
+
+    def __init__(self, image_recipe, modified_recipe, binary, gdbserver_multi=True):
+        self.image_recipe = image_recipe
+        self.modified_recipe = modified_recipe
+        self.gdb_cross = modified_recipe.gdb_cross
+        self.binary = binary
+        if binary in GdbCrossConfig._binaries:
+            raise DevtoolError(
+                "gdbserver config for binary %s is already generated" % binary)
+        GdbCrossConfig._binaries.append(binary)
+        self.script_dir = modified_recipe.ide_sdk_scripts_dir
+        self.gdbinit_dir = os.path.join(self.script_dir, 'gdbinit')
+        self.gdbserver_multi = gdbserver_multi
+        self.binary_pretty = self.binary.replace(os.sep, '-').lstrip('-')
+        self.gdbserver_port = GdbCrossConfig._gdbserver_port_next
+        GdbCrossConfig._gdbserver_port_next += 1
+        self.id_pretty = "%d_%s" % (self.gdbserver_port, self.binary_pretty)
+        # gdbserver start script
+        gdbserver_script_file = 'gdbserver_' + self.id_pretty
+        if self.gdbserver_multi:
+            gdbserver_script_file += "_m"
+        self.gdbserver_script = os.path.join(
+            self.script_dir, gdbserver_script_file)
+        # gdbinit file
+        self.gdbinit = os.path.join(
+            self.gdbinit_dir, 'gdbinit_' + self.id_pretty)
+        # gdb start script
+        self.gdb_script = os.path.join(
+            self.script_dir, 'gdb_' + self.id_pretty)
+
+    def _gen_gdbserver_start_script(self):
+        """Generate a shell command starting the gdbserver on the remote device via ssh
+
+        GDB supports two modes:
+        multi: gdbserver remains running over several debug sessions
+        once: gdbserver terminates after the debugged process terminates
+        """
+        cmd_lines = ['#!/bin/sh']
+        if self.gdbserver_multi:
+            temp_dir = "TEMP_DIR=/tmp/gdbserver_%s; " % self.id_pretty
+            gdbserver_cmd_start = temp_dir
+            gdbserver_cmd_start += "test -f \$TEMP_DIR/pid && exit 0; "
+            gdbserver_cmd_start += "mkdir -p \$TEMP_DIR; "
+            gdbserver_cmd_start += "%s --multi :%s > \$TEMP_DIR/log 2>&1 & " % (
+                self.gdb_cross.gdbserver_path, self.gdbserver_port)
+            gdbserver_cmd_start += "echo \$! > \$TEMP_DIR/pid;"
+
+            gdbserver_cmd_stop = temp_dir
+            gdbserver_cmd_stop += "test -f \$TEMP_DIR/pid && kill \$(cat \$TEMP_DIR/pid); "
+            gdbserver_cmd_stop += "rm -rf \$TEMP_DIR; "
+
+            gdbserver_cmd_l = []
+            gdbserver_cmd_l.append('if [ "$1" = "stop" ]; then')
+            gdbserver_cmd_l.append('  shift')
+            gdbserver_cmd_l.append("  %s %s %s %s 'sh -c \"%s\"'" % (
+                self.gdb_cross.target_device.ssh_sshexec, self.gdb_cross.target_device.ssh_port, self.gdb_cross.target_device.extraoptions, self.gdb_cross.target_device.target, gdbserver_cmd_stop))
+            gdbserver_cmd_l.append('else')
+            gdbserver_cmd_l.append("  %s %s %s %s 'sh -c \"%s\"'" % (
+                self.gdb_cross.target_device.ssh_sshexec, self.gdb_cross.target_device.ssh_port, self.gdb_cross.target_device.extraoptions, self.gdb_cross.target_device.target, gdbserver_cmd_start))
+            gdbserver_cmd_l.append('fi')
+            gdbserver_cmd = os.linesep.join(gdbserver_cmd_l)
+        else:
+            gdbserver_cmd_start = "%s --once :%s %s" % (
+                self.gdb_cross.gdbserver_path, self.gdbserver_port, self.binary)
+            gdbserver_cmd = "%s %s %s %s 'sh -c \"%s\"'" % (
+                self.gdb_cross.target_device.ssh_sshexec, self.gdb_cross.target_device.ssh_port, self.gdb_cross.target_device.extraoptions, self.gdb_cross.target_device.target, gdbserver_cmd_start)
+        cmd_lines.append(gdbserver_cmd)
+        GdbCrossConfig.write_file(self.gdbserver_script, cmd_lines, True)
+
+    def _gen_gdbinit_config(self):
+        """Generate a gdbinit file for this binary and the corresponding gdbserver configuration"""
+        gdbinit_lines = ['# This file is generated by devtool ide-sdk']
+        if self.gdbserver_multi:
+            target_help = '#   gdbserver --multi :%d' % self.gdbserver_port
+            remote_cmd = 'target extended-remote'
+        else:
+            target_help = '#   gdbserver :%d %s' % (
+                self.gdbserver_port, self.binary)
+            remote_cmd = 'target remote'
+        gdbinit_lines.append('# On the remote target:')
+        gdbinit_lines.append(target_help)
+        gdbinit_lines.append('# On the build machine:')
+        gdbinit_lines.append('#   cd ' + self.modified_recipe.real_srctree)
+        gdbinit_lines.append(
+            '#   ' + self.gdb_cross.gdb + ' -ix ' + self.gdbinit)
+
+        gdbinit_lines.append('set sysroot ' + self.modified_recipe.d)
+        gdbinit_lines.append('set substitute-path "/usr/include" "' +
+                             os.path.join(self.modified_recipe.recipe_sysroot, 'usr', 'include') + '"')
+        # Disable debuginfod for now, the IDE configuration uses rootfs-dbg from the image workdir.
+        gdbinit_lines.append('set debuginfod enabled off')
+        if self.image_recipe.rootfs_dbg:
+            gdbinit_lines.append(
+                'set solib-search-path "' + self.modified_recipe.solib_search_path_str(self.image_recipe) + '"')
+            gdbinit_lines.append('set substitute-path "/usr/src/debug" "' + os.path.join(
+                self.image_recipe.rootfs_dbg, 'usr', 'src', 'debug') + '"')
+        gdbinit_lines.append(
+            '%s %s:%d' % (remote_cmd, self.gdb_cross.host, self.gdbserver_port))
+        gdbinit_lines.append('set remote exec-file ' + self.binary)
+        gdbinit_lines.append(
+            'run ' + os.path.join(self.modified_recipe.d, self.binary))
+
+        GdbCrossConfig.write_file(self.gdbinit, gdbinit_lines)
+
+    def _gen_gdb_start_script(self):
+        """Generate a script starting GDB with the corresponding gdbinit configuration."""
+        cmd_lines = ['#!/bin/sh']
+        cmd_lines.append('cd ' + self.modified_recipe.real_srctree)
+        cmd_lines.append(self.gdb_cross.gdb + ' -ix ' +
+                         self.gdbinit + ' "$@"')
+        GdbCrossConfig.write_file(self.gdb_script, cmd_lines, True)
+
+    def initialize(self):
+        self._gen_gdbserver_start_script()
+        self._gen_gdbinit_config()
+        self._gen_gdb_start_script()
+
+    @staticmethod
+    def write_file(script_file, cmd_lines, executable=False):
+        script_dir = os.path.dirname(script_file)
+        mkdirhier(script_dir)
+        with open(script_file, 'w') as script_f:
+            script_f.write(os.linesep.join(cmd_lines))
+            script_f.write(os.linesep)
+        if executable:
+            st = os.stat(script_file)
+            os.chmod(script_file, st.st_mode | stat.S_IEXEC)
+        logger.info("Created: %s" % script_file)
+
+
+class IdeBase:
+    """Base class defining the interface for IDE plugins"""
+
+    def __init__(self):
+        self.ide_name = 'undefined'
+        self.gdb_cross_configs = []
+
+    @classmethod
+    def ide_plugin_priority(cls):
+        """Used to find the default ide handler if --ide is not passed"""
+        return 10
+
+    def setup_shared_sysroots(self, shared_env):
+        logger.warn("Shared sysroot mode is not supported for IDE %s" %
+                    self.ide_name)
+
+    def setup_modified_recipe(self, args, image_recipe, modified_recipe):
+        logger.warn("Modified recipe mode is not supported for IDE %s" %
+                    self.ide_name)
+
+    def initialize_gdb_cross_configs(self, image_recipe, modified_recipe, gdb_cross_config_class=GdbCrossConfig):
+        binaries = modified_recipe.find_installed_binaries()
+        for binary in binaries:
+            gdb_cross_config = gdb_cross_config_class(
+                image_recipe, modified_recipe, binary)
+            gdb_cross_config.initialize()
+            self.gdb_cross_configs.append(gdb_cross_config)
+
+    @staticmethod
+    def gen_oe_scrtips_sym_link(modified_recipe):
+        # create a sym-link from sources to the scripts directory
+        if os.path.isdir(modified_recipe.ide_sdk_scripts_dir):
+            IdeBase.symlink_force(modified_recipe.ide_sdk_scripts_dir,
+                                  os.path.join(modified_recipe.real_srctree, 'oe-scripts'))
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
+
+    @staticmethod
+    def symlink_force(tgt, dst):
+        try:
+            os.symlink(tgt, dst)
+        except OSError as err:
+            if err.errno == errno.EEXIST:
+                if os.readlink(dst) != tgt:
+                    os.remove(dst)
+                    os.symlink(tgt, dst)
+            else:
+                raise err
+
+
+def get_devtool_deploy_opts(args):
+    """Filter args for devtool deploy-target args"""
+    if not args.target:
+        return None
+    devtool_deploy_opts = [args.target]
+    if args.no_host_check:
+        devtool_deploy_opts += ["-c"]
+    if args.show_status:
+        devtool_deploy_opts += ["-s"]
+    if args.no_preserve:
+        devtool_deploy_opts += ["-p"]
+    if args.no_check_space:
+        devtool_deploy_opts += ["--no-check-space"]
+    if args.ssh_exec:
+        devtool_deploy_opts += ["-e", args.ssh.exec]
+    if args.port:
+        devtool_deploy_opts += ["-P", args.port]
+    if args.key:
+        devtool_deploy_opts += ["-I", args.key]
+    if args.strip is False:
+        devtool_deploy_opts += ["--no-strip"]
+    return devtool_deploy_opts
diff --git a/scripts/lib/devtool/ide_plugins/ide_code.py b/scripts/lib/devtool/ide_plugins/ide_code.py
new file mode 100644
index 00000000000..b2193130d2e
--- /dev/null
+++ b/scripts/lib/devtool/ide_plugins/ide_code.py
@@ -0,0 +1,438 @@
+#
+# Copyright (C) 2023-2024 Siemens AG
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+"""Devtool ide-sdk IDE plugin for VSCode and VSCodium"""
+
+import json
+import logging
+import os
+import shutil
+from devtool.ide_plugins import BuildTool, IdeBase, GdbCrossConfig, get_devtool_deploy_opts
+
+logger = logging.getLogger('devtool')
+
+
+class GdbCrossConfigVSCode(GdbCrossConfig):
+    def __init__(self, image_recipe, modified_recipe, binary):
+        super().__init__(image_recipe, modified_recipe, binary, False)
+
+    def initialize(self):
+        self._gen_gdbserver_start_script()
+
+
+class IdeVSCode(IdeBase):
+    """Manage IDE configurations for VSCode
+
+    Modified recipe mode:
+    - cmake: use the cmake-preset generated by devtool ide-sdk
+    - meson: meson is called via a wrapper script generated by devtool ide-sdk
+
+    Shared sysroot mode:
+    In shared sysroot mode, the cross tool-chain is exported to the user's global configuration.
+    A workspace cannot be created because there is no recipe that defines how a workspace could
+    be set up.
+    - cmake: adds a cmake-kit to .local/share/CMakeTools/cmake-tools-kits.json
+             The cmake-kit uses the environment script and the tool-chain file
+             generated by meta-ide-support.
+    - meson: Meson needs manual workspace configuration.
+    """
+
+    @classmethod
+    def ide_plugin_priority(cls):
+        """If --ide is not passed this is the default plugin"""
+        if shutil.which('code'):
+            return 100
+        return 0
+
+    def setup_shared_sysroots(self, shared_env):
+        """Expose the toolchain of the shared sysroots SDK"""
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
+        if modified_recipe.build_tool is not BuildTool.MESON:
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
+        if modified_recipe.build_tool is not BuildTool.CMAKE:
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
+        if modified_recipe.build_tool is not BuildTool.CMAKE:
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
+        if modified_recipe.build_tool is not BuildTool.MESON:
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
+        if modified_recipe.build_tool is BuildTool.CMAKE:
+            properties_dict["configurationProvider"] = "ms-vscode.cmake-tools"
+        elif modified_recipe.build_tool is BuildTool.MESON:
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
+    def vscode_launch_bin_dbg(self, gdb_cross_config):
+        modified_recipe = gdb_cross_config.modified_recipe
+
+        launch_config = {
+            "name": gdb_cross_config.id_pretty,
+            "type": "cppdbg",
+            "request": "launch",
+            "program": os.path.join(modified_recipe.d, gdb_cross_config.binary.lstrip('/')),
+            "stopAtEntry": True,
+            "cwd": "${workspaceFolder}",
+            "environment": [],
+            "externalConsole": False,
+            "MIMode": "gdb",
+            "preLaunchTask": gdb_cross_config.id_pretty,
+            "miDebuggerPath": modified_recipe.gdb_cross.gdb,
+            "miDebuggerServerAddress": "%s:%d" % (modified_recipe.gdb_cross.host, gdb_cross_config.gdbserver_port)
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
+        if gdb_cross_config.image_recipe.rootfs_dbg:
+            launch_config['additionalSOLibSearchPath'] = modified_recipe.solib_search_path_str(
+                gdb_cross_config.image_recipe)
+            src_file_map["/usr/src/debug"] = os.path.join(
+                gdb_cross_config.image_recipe.rootfs_dbg, "usr", "src", "debug")
+        else:
+            logger.warning(
+                "Cannot setup debug symbols configuration for GDB. IMAGE_GEN_DEBUGFS is not enabled.")
+
+        launch_config['sourceFileMap'] = src_file_map
+        launch_config['setupCommands'] = setup_commands
+        return launch_config
+
+    def vscode_launch(self, modified_recipe):
+        """GDB Launch configuration for binaries (elf files)"""
+
+        configurations = [self.vscode_launch_bin_dbg(
+            gdb_cross_config) for gdb_cross_config in self.gdb_cross_configs]
+        launch_dict = {
+            "version": "0.2.0",
+            "configurations": configurations
+        }
+        launch_file = 'launch.json'
+        IdeBase.update_json_file(
+            self.dot_code_dir(modified_recipe), launch_file, launch_dict)
+
+    def vscode_tasks_cpp(self, args, modified_recipe):
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
+        for gdb_cross_config in self.gdb_cross_configs:
+            tasks_dict['tasks'].append(
+                {
+                    "label": gdb_cross_config.id_pretty,
+                    "type": "shell",
+                    "isBackground": True,
+                    "dependsOn": [
+                        install_task_name
+                    ],
+                    "command": gdb_cross_config.gdbserver_script,
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
+    def vscode_tasks_fallback(self, args, modified_recipe):
+        oe_init_dir = modified_recipe.oe_init_dir
+        oe_init = ". %s %s > /dev/null && " % (modified_recipe.oe_init_build_env, modified_recipe.topdir)
+        dt_build = "devtool build "
+        dt_build_label = dt_build + modified_recipe.recipe_id_pretty
+        dt_build_cmd = dt_build + modified_recipe.bpn
+        clean_opt = " --clean"
+        dt_build_clean_label = dt_build + modified_recipe.recipe_id_pretty + clean_opt
+        dt_build_clean_cmd = dt_build + modified_recipe.bpn + clean_opt
+        dt_deploy = "devtool deploy-target "
+        dt_deploy_label = dt_deploy + modified_recipe.recipe_id_pretty
+        dt_deploy_cmd = dt_deploy + modified_recipe.bpn
+        dt_build_deploy_label = "devtool build & deploy-target %s" % modified_recipe.recipe_id_pretty
+        deploy_opts = ' '.join(get_devtool_deploy_opts(args))
+        tasks_dict = {
+            "version": "2.0.0",
+            "tasks": [
+                {
+                    "label": dt_build_label,
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
+                        "%s%s" % (oe_init, dt_build_cmd)
+                    ],
+                    "problemMatcher": []
+                },
+                {
+                    "label": dt_deploy_label,
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
+                            oe_init, dt_deploy_cmd, deploy_opts)
+                    ],
+                    "problemMatcher": []
+                },
+                {
+                    "label": dt_build_deploy_label,
+                    "dependsOrder": "sequence",
+                    "dependsOn": [
+                        dt_build_label,
+                        dt_deploy_label
+                    ],
+                    "problemMatcher": [],
+                    "group": {
+                        "kind": "build",
+                        "isDefault": True
+                    }
+                },
+                {
+                    "label": dt_build_clean_label,
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
+                        "%s%s" % (oe_init, dt_build_clean_cmd)
+                    ],
+                    "problemMatcher": []
+                }
+            ]
+        }
+        if modified_recipe.gdb_cross:
+            for gdb_cross_config in self.gdb_cross_configs:
+                tasks_dict['tasks'].append(
+                    {
+                        "label": gdb_cross_config.id_pretty,
+                        "type": "shell",
+                        "isBackground": True,
+                        "dependsOn": [
+                            dt_build_deploy_label
+                        ],
+                        "command": gdb_cross_config.gdbserver_script,
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
+    def vscode_tasks(self, args, modified_recipe):
+        if modified_recipe.build_tool.is_c_ccp:
+            self.vscode_tasks_cpp(args, modified_recipe)
+        else:
+            self.vscode_tasks_fallback(args, modified_recipe)
+
+    def setup_modified_recipe(self, args, image_recipe, modified_recipe):
+        self.vscode_settings(modified_recipe)
+        self.vscode_extensions(modified_recipe)
+        self.vscode_c_cpp_properties(modified_recipe)
+        if args.target:
+            self.initialize_gdb_cross_configs(
+                image_recipe, modified_recipe, gdb_cross_config_class=GdbCrossConfigVSCode)
+            self.vscode_launch(modified_recipe)
+            self.vscode_tasks(args, modified_recipe)
+
+
+def register_ide_plugin(ide_plugins):
+    ide_plugins['code'] = IdeVSCode
diff --git a/scripts/lib/devtool/ide_plugins/ide_none.py b/scripts/lib/devtool/ide_plugins/ide_none.py
new file mode 100644
index 00000000000..f106c5a0269
--- /dev/null
+++ b/scripts/lib/devtool/ide_plugins/ide_none.py
@@ -0,0 +1,53 @@
+#
+# Copyright (C) 2023-2024 Siemens AG
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+"""Devtool ide-sdk generic IDE plugin"""
+
+import os
+import logging
+from devtool.ide_plugins import IdeBase, GdbCrossConfig
+
+logger = logging.getLogger('devtool')
+
+
+class IdeNone(IdeBase):
+    """Generate some generic helpers for other IDEs
+
+    Modified recipe mode:
+    Generate some helper scripts for remote debugging with GDB
+
+    Shared sysroot mode:
+    A wrapper for bitbake meta-ide-support and bitbake build-sysroots
+    """
+
+    def __init__(self):
+        super().__init__()
+
+    def setup_shared_sysroots(self, shared_env):
+        real_multimach_target_sys = shared_env.ide_support.real_multimach_target_sys
+        deploy_dir_image = shared_env.ide_support.deploy_dir_image
+        env_script = os.path.join(
+            deploy_dir_image, 'environment-setup-' + real_multimach_target_sys)
+        logger.info(
+            "To use this SDK please source this: %s" % env_script)
+
+    def setup_modified_recipe(self, args, image_recipe, modified_recipe):
+        """generate some helper scripts and config files
+
+        - Execute the do_install task
+        - Execute devtool deploy-target
+        - Generate a gdbinit file per executable
+        - Generate the oe-scripts sym-link
+        """
+        script_path = modified_recipe.gen_install_deploy_script(args)
+        logger.info("Created: %s" % script_path)
+
+        self.initialize_gdb_cross_configs(image_recipe, modified_recipe)
+
+        IdeBase.gen_oe_scrtips_sym_link(modified_recipe)
+
+
+def register_ide_plugin(ide_plugins):
+    ide_plugins['none'] = IdeNone
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
new file mode 100755
index 00000000000..27389026be3
--- /dev/null
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -0,0 +1,1032 @@
+# Development tool - ide-sdk command plugin
+#
+# Copyright (C) 2023-2024 Siemens AG
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+"""Devtool ide-sdk plugin"""
+
+import json
+import logging
+import os
+import re
+import shutil
+import stat
+import subprocess
+from argparse import RawTextHelpFormatter
+from enum import Enum
+
+import scriptutils
+import bb
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
+from devtool.standard import get_real_srctree
+from devtool.ide_plugins import BuildTool, get_devtool_deploy_opts
+
+
+logger = logging.getLogger('devtool')
+
+# dict of classes derived from IdeBase
+ide_plugins = {}
+
+
+class DevtoolIdeMode(Enum):
+    """Different modes are supported by the ide-sdk plugin.
+
+    The enum might be extended by more advanced modes in the future. Some ideas:
+    - auto: modified if all recipes are modified, shared if none of the recipes is modified.
+    - mixed: modified mode for modified recipes, shared mode for all other recipes.
+    """
+
+    modified = 'modified'
+    shared = 'shared'
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
+    def __init__(self, args, target_arch, target_device):
+        super().__init__('gdb-cross-' + target_arch, target_arch)
+        self.target_device = target_device
+        self.gdb = None
+        self.gdbserver_port_next = int(args.gdbserver_port_start)
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
+        self.combine_dbg_image = False
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
+        self.combine_dbg_image = bb.data.inherits_class(
+            'image-combined-dbg', image_d)
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
+    no recipe is used, devtool ide-sdk abstracts calling bitbake meta-ide-support
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
+class RecipeNotModified:
+    """Handling of recipes added to the Direct DSK shared sysroots."""
+
+    def __init__(self, name):
+        self.name = name
+        self.bootstrap_tasks = [name + ':do_populate_sysroot']
+
+
+class RecipeModified:
+    """Handling of recipes in the workspace created by devtool modify"""
+    OE_INIT_BUILD_ENV = 'oe-init-build-env'
+
+    VALID_BASH_ENV_NAME_CHARS = re.compile(r"^[a-zA-Z0-9_]*$")
+
+    def __init__(self, name):
+        self.name = name
+        self.bootstrap_tasks = [name + ':do_install']
+        self.gdb_cross = None
+        # workspace
+        self.real_srctree = None
+        self.srctree = None
+        self.ide_sdk_dir = None
+        self.ide_sdk_scripts_dir = None
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
+        self.topdir = None
+        self.workdir = None
+        self.recipe_id = None
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
+        self.ide_sdk_dir = os.path.join(
+            config.workspace_path, 'ide-sdk', self.name)
+        if os.path.exists(self.ide_sdk_dir):
+            shutil.rmtree(self.ide_sdk_dir)
+        self.ide_sdk_scripts_dir = os.path.join(self.ide_sdk_dir, 'scripts')
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
+        self.topdir = recipe_d.getVar('TOPDIR')
+        self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
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
+    @staticmethod
+    def is_valid_shell_variable(var):
+        """Skip strange shell variables like systemd
+
+        prevent from strange bugs because of strange variables which
+        are not used in this context but break various tools.
+        """
+        if RecipeModified.VALID_BASH_ENV_NAME_CHARS.match(var):
+            bb.debug(1, "ignoring variable: %s" % var)
+            return True
+        return False
+
+    def debug_build_config(self, args):
+        """Explicitely set for example CMAKE_BUILD_TYPE to Debug if not defined otherwise"""
+        if self.build_tool is BuildTool.CMAKE:
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
+        elif self.build_tool is BuildTool.MESON:
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
+        """Search for debug symbols in the rootfs and rootfs-dbg
+
+        The debug symbols of shared libraries which are provided by other packages
+        are grabbed from the -dbg packages in the rootfs-dbg.
+
+        But most cross debugging tools like gdb, perf, and systemtap need to find
+        executable/library first and through it debuglink note find corresponding
+        symbols file. Therefore the library paths from the rootfs are added as well.
+
+        Note: For the devtool modified recipe compiled from the IDE, the debug
+        symbols are taken from the unstripped binaries in the image folder.
+        Also, devtool deploy-target takes the files from the image folder.
+        debug symbols in the image folder refer to the corresponding source files
+        with absolute paths of the build machine. Debug symbols found in the
+        rootfs-dbg are relocated and contain paths which refer to the source files
+        installed on the target device e.g. /usr/src/...
+        """
+        base_libdir = self.base_libdir.lstrip('/')
+        libdir = self.libdir.lstrip('/')
+        so_paths = [
+            # debug symbols for package_debug_split_style: debug-with-srcpkg or .debug
+            os.path.join(image.rootfs_dbg, base_libdir, ".debug"),
+            os.path.join(image.rootfs_dbg, libdir, ".debug"),
+            # debug symbols for package_debug_split_style: debug-file-directory
+            os.path.join(image.rootfs_dbg, "usr", "lib", "debug"),
+
+            # The binaries are required as well, the debug packages are not enough
+            # With image-combined-dbg.bbclass the binaries are copied into rootfs-dbg
+            os.path.join(image.rootfs_dbg, base_libdir),
+            os.path.join(image.rootfs_dbg, libdir),
+            # Without image-combined-dbg.bbclass the binaries are only in rootfs.
+            # Note: Stepping into source files located in rootfs-dbg does not
+            #       work without image-combined-dbg.bbclass yet.
+            os.path.join(image.rootfs, base_libdir),
+            os.path.join(image.rootfs, libdir)
+        ]
+        return so_paths
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
+            if not RecipeModified.is_valid_shell_variable(varExpanded):
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
+        bb.utils.mkdirhier(self.ide_sdk_scripts_dir)
+        meson_wrapper = os.path.join(self.ide_sdk_scripts_dir, 'meson')
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
+        return sorted(binaries)
+
+    def gen_delete_package_dirs(self):
+        """delete folders of package tasks
+
+        This is a workaround for and issue with recipes having their sources
+        downloaded as file://
+        This likely breaks pseudo like:
+        path mismatch [3 links]: ino 79147802 db
+        .../build/tmp/.../cmake-example/1.0/package/usr/src/debug/
+                             cmake-example/1.0-r0/oe-local-files/cpp-example-lib.cpp
+        .../build/workspace/sources/cmake-example/oe-local-files/cpp-example-lib.cpp
+        Since the files are anyway outdated lets deleted them (also from pseudo's db) to workaround this issue.
+        """
+        cmd_lines = ['#!/bin/sh']
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
+            if not RecipeModified.is_valid_shell_variable(var):
+                continue
+            cmd_lines.append('%s="%s"' % (var, val))
+            cmd_lines.append('export %s' % var)
+
+        # Delete the folders
+        pkg_dirs = ' '.join([os.path.join(self.workdir, d) for d in [
+            "package", "packages-split", "pkgdata", "sstate-install-package", "debugsources.list", "*.spec"]])
+        cmd = "%s rm -rf %s" % (self.fakerootcmd, pkg_dirs)
+        cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
+
+        return self.write_script(cmd_lines, 'delete_package_dirs')
+
+    def gen_install_deploy_script(self, args):
+        """Generate a script which does install and deploy"""
+        cmd_lines = ['#!/bin/bash']
+
+        cmd_lines.append(self.gen_delete_package_dirs())
+
+        # . oe-init-build-env $BUILDDIR
+        # Note: Sourcing scripts with arguments requires bash
+        cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
+            self.oe_init_dir, self.oe_init_dir))
+        cmd_lines.append('. "%s" "%s" || { echo ". %s %s failed"; exit 1; }' % (
+            self.oe_init_build_env, self.topdir, self.oe_init_build_env, self.topdir))
+
+        # bitbake -c install
+        cmd_lines.append(
+            'bitbake %s -c install --force || { echo "bitbake %s -c install --force failed"; exit 1; }' % (self.bpn, self.bpn))
+
+        # devtool deploy-target
+        deploy_opts = ' '.join(get_devtool_deploy_opts(args))
+        cmd_lines.append("devtool deploy-target %s %s" %
+                         (self.bpn, deploy_opts))
+        return self.write_script(cmd_lines, 'install_and_deploy')
+
+    def write_script(self, cmd_lines, script_name):
+        bb.utils.mkdirhier(self.ide_sdk_scripts_dir)
+        script_name_arch = script_name + '_' + self.recipe_id
+        script_file = os.path.join(self.ide_sdk_scripts_dir, script_name_arch)
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
+
+    # Explicitely passing some special recipes does not make sense
+    for recipe in args.recipenames:
+        if recipe in ['meta-ide-support', 'build-sysroots']:
+            raise DevtoolError("Invalid recipe: %s." % recipe)
+
+    # Collect information about tasks which need to be bitbaked
+    bootstrap_tasks = []
+    bootstrap_tasks_late = []
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        # define mode depending on recipes which need to be processed
+        recipes_image_names = []
+        recipes_modified_names = []
+        recipes_other_names = []
+        for recipe in args.recipenames:
+            try:
+                check_workspace_recipe(
+                    workspace, recipe, bbclassextend=True)
+                recipes_modified_names.append(recipe)
+            except DevtoolError:
+                recipe_d = parse_recipe(
+                    config, tinfoil, recipe, appends=True, filter_workspace=False)
+                if not recipe_d:
+                    raise DevtoolError("Parsing recipe %s failed" % recipe)
+                if bb.data.inherits_class('image', recipe_d):
+                    recipes_image_names.append(recipe)
+                else:
+                    recipes_other_names.append(recipe)
+
+        invalid_params = False
+        if args.mode == DevtoolIdeMode.shared:
+            if len(recipes_modified_names):
+                logger.error("In shared sysroots mode modified recipes %s cannot be handled." % str(
+                    recipes_modified_names))
+                invalid_params = True
+        if args.mode == DevtoolIdeMode.modified:
+            if len(recipes_other_names):
+                logger.error("Only in shared sysroots mode not modified recipes %s can be handled." % str(
+                    recipes_other_names))
+                invalid_params = True
+            if len(recipes_image_names) != 1:
+                logger.error(
+                    "One image recipe is required as the rootfs for the remote development.")
+                invalid_params = True
+            for modified_recipe_name in recipes_modified_names:
+                if modified_recipe_name.startswith('nativesdk-') or modified_recipe_name.endswith('-native'):
+                    logger.error(
+                        "Only cross compiled recipes are support. %s is not cross." % modified_recipe_name)
+                    invalid_params = True
+
+        if invalid_params:
+            raise DevtoolError("Invalid parameters are passed.")
+
+        # For the shared sysroots mode, add all dependencies of all the images to the sysroots
+        # For the modified mode provide one rootfs and the corresponding debug symbols via rootfs-dbg
+        recipes_images = []
+        for recipes_image_name in recipes_image_names:
+            logger.info("Using image: %s" % recipes_image_name)
+            recipe_image = RecipeImage(recipes_image_name)
+            recipe_image.initialize(config, tinfoil)
+            bootstrap_tasks += recipe_image.bootstrap_tasks
+            recipes_images.append(recipe_image)
+
+        # Provide a Direct SDK with shared sysroots
+        recipes_not_modified = []
+        if args.mode == DevtoolIdeMode.shared:
+            ide_support = RecipeMetaIdeSupport()
+            ide_support.initialize(config, tinfoil)
+            bootstrap_tasks += ide_support.bootstrap_tasks
+
+            logger.info("Adding %s to the Direct SDK sysroots." %
+                        str(recipes_other_names))
+            for recipe_name in recipes_other_names:
+                recipe_not_modified = RecipeNotModified(recipe_name)
+                bootstrap_tasks += recipe_not_modified.bootstrap_tasks
+                recipes_not_modified.append(recipe_not_modified)
+
+            build_sysroots = RecipeBuildSysroots()
+            build_sysroots.initialize(config, tinfoil)
+            bootstrap_tasks_late += build_sysroots.bootstrap_tasks
+            shared_env = SharedSysrootsEnv()
+            shared_env.initialize(ide_support, build_sysroots)
+
+        recipes_modified = []
+        if args.mode == DevtoolIdeMode.modified:
+            logger.info("Setting up workspaces for modified recipe: %s" %
+                        str(recipes_modified_names))
+            gdbs_cross = {}
+            for recipe_name in recipes_modified_names:
+                recipe_modified = RecipeModified(recipe_name)
+                recipe_modified.initialize(config, workspace, tinfoil)
+                bootstrap_tasks += recipe_modified.bootstrap_tasks
+                recipes_modified.append(recipe_modified)
+
+                if recipe_modified.target_arch not in gdbs_cross:
+                    target_device = TargetDevice(args)
+                    gdb_cross = RecipeGdbCross(
+                        args, recipe_modified.target_arch, target_device)
+                    gdb_cross.initialize(config, workspace, tinfoil)
+                    bootstrap_tasks += gdb_cross.bootstrap_tasks
+                    gdbs_cross[recipe_modified.target_arch] = gdb_cross
+                recipe_modified.gdb_cross = gdbs_cross[recipe_modified.target_arch]
+
+    finally:
+        tinfoil.shutdown()
+
+    if not args.skip_bitbake:
+        bb_cmd = 'bitbake '
+        if args.bitbake_k:
+            bb_cmd += "-k "
+        bb_cmd_early = bb_cmd + ' '.join(bootstrap_tasks)
+        exec_build_env_command(
+            config.init_path, basepath, bb_cmd_early, watch=True)
+        if bootstrap_tasks_late:
+            bb_cmd_late = bb_cmd + ' '.join(bootstrap_tasks_late)
+            exec_build_env_command(
+                config.init_path, basepath, bb_cmd_late, watch=True)
+
+    for recipe_image in recipes_images:
+        if (recipe_image.gdbserver_missing):
+            logger.warning(
+                "gdbserver not installed in image %s. Remote debugging will not be available" % recipe_image)
+
+        if recipe_image.combine_dbg_image is False:
+            logger.warning(
+                'IMAGE_CLASSES += "image-combined-dbg" is missing for image %s. Remote debugging will not find debug symbols from rootfs-dbg.' % recipe_image)
+
+    # Instantiate the active IDE plugin
+    ide = ide_plugins[args.ide]()
+    if args.mode == DevtoolIdeMode.shared:
+        ide.setup_shared_sysroots(shared_env)
+    elif args.mode == DevtoolIdeMode.modified:
+        for recipe_modified in recipes_modified:
+            if recipe_modified.build_tool is BuildTool.CMAKE:
+                recipe_modified.cmake_preset()
+            if recipe_modified.build_tool is BuildTool.MESON:
+                recipe_modified.gen_meson_wrapper()
+            ide.setup_modified_recipe(
+                args, recipe_image, recipe_modified)
+    else:
+        raise DevtoolError("Must not end up here.")
+
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+
+    global ide_plugins
+
+    # Search for IDE plugins in all sub-folders named ide_plugins where devtool seraches for plugins.
+    pluginpaths = [os.path.join(path, 'ide_plugins')
+                   for path in context.pluginpaths]
+    ide_plugin_modules = []
+    for pluginpath in pluginpaths:
+        scriptutils.load_plugins(logger, ide_plugin_modules, pluginpath)
+
+    for ide_plugin_module in ide_plugin_modules:
+        if hasattr(ide_plugin_module, 'register_ide_plugin'):
+            ide_plugin_module.register_ide_plugin(ide_plugins)
+    # Sort plugins according to their priority. The first entry is the default IDE plugin.
+    ide_plugins = dict(sorted(ide_plugins.items(),
+                       key=lambda p: p[1].ide_plugin_priority(), reverse=True))
+
+    parser_ide_sdk = subparsers.add_parser('ide-sdk', group='working', order=50, formatter_class=RawTextHelpFormatter,
+                                           help='Setup the SDK and configure the IDE')
+    parser_ide_sdk.add_argument(
+        'recipenames', nargs='+', help='Generate an IDE configuration suitable to work on the given recipes.\n'
+        'Depending on the --mode paramter different types of SDKs and IDE configurations are generated.')
+    parser_ide_sdk.add_argument(
+        '-m', '--mode', type=DevtoolIdeMode, default=DevtoolIdeMode.modified,
+        help='Different SDK types are supported:\n'
+        '- "' + DevtoolIdeMode.modified.name + '" (default):\n'
+        '  devtool modify creates a workspace to work on the source code of a recipe.\n'
+        '  devtool ide-sdk builds the SDK and generates the IDE configuration(s) in the workspace directorie(s)\n'
+        '  Usage example:\n'
+        '    devtool modify cmake-example\n'
+        '    devtool ide-sdk cmake-example core-image-minimal\n'
+        '    Start the IDE in the workspace folder\n'
+        '  At least one devtool modified recipe plus one image recipe are required:\n'
+        '  The image recipe is used to generate the target image and the remote debug configuration.\n'
+        '- "' + DevtoolIdeMode.shared.name + '":\n'
+        '  Usage example:\n'
+        '    devtool ide-sdk -m ' + DevtoolIdeMode.shared.name + ' recipe(s)\n'
+        '  This command generates a cross-toolchain as well as the corresponding shared sysroot directories.\n'
+        '  To use this tool-chain the environment-* file found in the deploy..image folder needs to be sourced into a shell.\n'
+        '  In case of VSCode and cmake the tool-chain is also exposed as a cmake-kit')
+    default_ide = list(ide_plugins.keys())[0]
+    parser_ide_sdk.add_argument(
+        '-i', '--ide', choices=ide_plugins.keys(), default=default_ide,
+        help='Setup the configuration for this IDE (default: %s)' % default_ide)
+    parser_ide_sdk.add_argument(
+        '-t', '--target', default='root@192.168.7.2',
+        help='Live target machine running an ssh server: user@hostname.')
+    parser_ide_sdk.add_argument(
+        '-G', '--gdbserver-port-start', default="1234", help='port where gdbserver is listening.')
+    parser_ide_sdk.add_argument(
+        '-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
+    parser_ide_sdk.add_argument(
+        '-e', '--ssh-exec', help='Executable to use in place of ssh')
+    parser_ide_sdk.add_argument(
+        '-P', '--port', help='Specify ssh port to use for connection to the target')
+    parser_ide_sdk.add_argument(
+        '-I', '--key', help='Specify ssh private key for connection to the target')
+    parser_ide_sdk.add_argument(
+        '--skip-bitbake', help='Generate IDE configuration but skip calling bibtake to update the SDK.', action='store_true')
+    parser_ide_sdk.add_argument(
+        '-k', '--bitbake-k', help='Pass -k parameter to bitbake', action='store_true')
+    parser_ide_sdk.add_argument(
+        '--no-strip', help='Do not strip executables prior to deploy', dest='strip', action='store_false')
+    parser_ide_sdk.add_argument(
+        '-n', '--dry-run', help='List files to be undeployed only', action='store_true')
+    parser_ide_sdk.add_argument(
+        '-s', '--show-status', help='Show progress/status output', action='store_true')
+    parser_ide_sdk.add_argument(
+        '-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
+    parser_ide_sdk.add_argument(
+        '--no-check-space', help='Do not check for available space before deploying', action='store_true')
+    parser_ide_sdk.add_argument(
+        '--debug-build-config', help='Use debug build flags, for example set CMAKE_BUILD_TYPE=Debug', action='store_true')
+    parser_ide_sdk.set_defaults(func=ide_setup)
-- 
2.43.0


