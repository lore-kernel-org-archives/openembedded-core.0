Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BADFC47DAF
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 22:14:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.52021.1705270490474785856
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 14:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBoq55A6;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e7c09f0fcso687585e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 14:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705270489; x=1705875289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8VEseN/IW3LjI0L9LLd+eKLJ2pFK4iV91KX/GdvnF0=;
        b=OBoq55A6fjsv9m2JG1NfPH85ijkpKPXm4h8Jc8zy3Uq8w4rYa6ksoFpEfU5aeOPigu
         27MgVnoXcuqpAG533vw8UnFymFJW8CeXaODbXR7yOnDY5POetes6jINu+MMsRaBAGF98
         YcFDXdK0G04AmcjUw+9tynEOK7mMBCAutPnnxRomwSmZlvd560udu0PAL2QT5KwCyEmy
         I4prNBvvNmmCkJA5LftkJueLuhh4a9efQb+LShRzevlgqFhf5EXywrbqWnVH+uBlTtbQ
         Iee6SU48dvKE5lJZ9VMl4Qlk/DP7J+D+JpE66i97oDTvieWmA6QJgTJb1gsrunZgehLV
         P4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705270489; x=1705875289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8VEseN/IW3LjI0L9LLd+eKLJ2pFK4iV91KX/GdvnF0=;
        b=wUZT54yN8T7hw+WPxajnpBfbf4mnF1sRm0vooGIIS6sPOcZ+69Rhut/Qyj5YrKvGGT
         8HyFL5BKMjYTeuhas224txA79vGOr6LnhZzrq5XejXokQGo1CEFKMiPuxciVbH0x1PT2
         6MTmTN8VzSjzxujV2vPLVC/H2Nk29+aHfC3DsLpkl4646I0z1w26af7O/8sCQJ9yhdXL
         5uD6VgqJlL3SNi6PAsMv5HavZ83aEviLF2MIoaCWHDWnkSOJCDVy73TtUIDj1mKY5KRP
         f8CXPsiSJ2ImiLEjHEMNpXH2H2WDwjBCZyK6jxE7kUkJl0tV3EEvatj0/Pu0FMcFqH8w
         XkgA==
X-Gm-Message-State: AOJu0YwtyaLUjxzVNOfSJkKIBILHK/ij9iOebCGQRjlD03lmkjtnHvwX
	4yHjGMlGEHCcvUMOwVjZdMGbNnJBUSU=
X-Google-Smtp-Source: AGHT+IEFaOKgrShbgNU8iFjSj2NUUARZEOpSxeRpaa/MAP/fjovSYytuG6tJlNKmoDcZIg71ioerCw==
X-Received: by 2002:a05:600c:81b:b0:40e:44a9:5664 with SMTP id k27-20020a05600c081b00b0040e44a95664mr2300412wmp.231.1705270488540;
        Sun, 14 Jan 2024 14:14:48 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id t21-20020a05600c451500b0040e3ac9f4c8sm17451943wmo.28.2024.01.14.14.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 14:14:47 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v9 8/9] devtool: ide-sdk make deploy-target quicker
Date: Sun, 14 Jan 2024 23:14:20 +0100
Message-ID: <20240114221437.1255866-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
References: <20240114221437.1255866-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193626

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 43 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 8c9ed3a2217..5eea039395c 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -13,6 +13,7 @@ import re
 import shutil
 import stat
 import subprocess
+import sys
 from argparse import RawTextHelpFormatter
 from enum import Enum
 
@@ -20,7 +21,7 @@ import scriptutils
 import bb
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError, parse_recipe
 from devtool.standard import get_real_srctree
-from devtool.ide_plugins import BuildTool, get_devtool_deploy_opts
+from devtool.ide_plugins import BuildTool
 
 
 logger = logging.getLogger('devtool')
@@ -742,6 +743,39 @@ class RecipeModified:
 
         return self.write_script(cmd_lines, 'delete_package_dirs')
 
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
+        cmd_lines.append('from devtool.deploy import deploy_no_d')
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
+        cmd_lines.append('deploy_no_d("%s", "%s", "%s", "%s", "%s", "%s", %d, "%s", "%s", filtered_args)' %
+                         (self.d, self.workdir, self.path, self.strip_cmd,
+                          self.libdir, self.base_libdir, self.max_process,
+                          self.fakerootcmd, self.fakerootenv))
+        return self.write_script(cmd_lines, 'deploy_target')
+
     def gen_install_deploy_script(self, args):
         """Generate a script which does install and deploy"""
         cmd_lines = ['#!/bin/sh -e']
@@ -757,10 +791,9 @@ class RecipeModified:
         # bitbake -c install
         cmd_lines.append("bitbake %s -c install" % self.bpn)
 
-        # devtool deploy-target
-        deploy_opts = ' '.join(get_devtool_deploy_opts(args))
-        cmd_lines.append("devtool deploy-target %s %s" %
-                         (self.bpn, deploy_opts))
+        # Self contained devtool deploy-target
+        cmd_lines.append(self.gen_deploy_target_script(args))
+
         return self.write_script(cmd_lines, 'install_and_deploy')
 
     def write_script(self, cmd_lines, script_name):
-- 
2.43.0


