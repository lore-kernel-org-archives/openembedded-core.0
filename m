Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134BCC47DAF
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 13:59:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.74370.1705931969660714168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 05:59:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SGduewfj;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so541174666b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705931968; x=1706536768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7PlUfy88FjNzANHDrqYCMCgrQGLLMgHZVn/zengsgA=;
        b=SGduewfjbFNPJmkZqYwZxfx06CGVMb7O/CeQQclxftHoY9kJb51G+j8jJnt28OccjV
         loP/cdk9h+NVCJ0CN8cL6d3MWkjk7XGdC9QgIjH0dAuz2lM2viAjedajXMsBbgMoVFdW
         VOPGrJTg8YtYvKbIgy0JA4qrxLCLG3zt1j8Qyu2XHvYIXEGgSnL6ycVGuMvcTdmm5xxZ
         qrxNQ1Jb2DlSiNqLlPpk5p9KbPUKoBa2PKad0DHxR2CJkGHTUGiCnqT58RH1qPyv1PBz
         lJ1S2jDd/M/xVK8QRjfU1EsGMIgiDxekYeJmcnhzhT2L0yBDZj10MTv2LrWN/GQaDaNA
         PahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931968; x=1706536768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7PlUfy88FjNzANHDrqYCMCgrQGLLMgHZVn/zengsgA=;
        b=Kqi5i4RZZwMm5dtiwfCaFEN9beBK3g/FxnUsag7wlppdpssK3ewiqVBNniwlM322M+
         X9pmLTvciD4+TAGFqmB9ERS1Id4fhgX7wEri62PglVk8umZjPFWCrC1IwM1kr9wIaYB1
         t5xr9FkeLlCw2R4XbUJwGOj0meO37kMPpVf4CXVtNlP4HEIt8N6zw1wau93oGKAM++Xf
         4jxuVYzu7GZ4c4RLuWmVyCsFa+WiqB+nmV2QeTmwqMI3D9sivraPvGJoX/ku490V8nhV
         5Ak6vsTiTRWQcCAkXkEdqgo4OXz/6M+YbMSytdDT9F3Pyd7aAfkN9W3yQbivdDMJBPeR
         74jg==
X-Gm-Message-State: AOJu0YzVoS4aX8xU1VPBhOjLKRcU3p45xqbPfqZwqGcWAMjdJk3XykVy
	6ViJROn88csS5O9yxRB81lyqdZc79KgvLGYx9Jrk+XPoNYD9/qZOwAEFivla
X-Google-Smtp-Source: AGHT+IHf7A0RogfaTiJjLqaJ9vZw67xiosqReHUxrUCWHAtOBRZskmRn49zkAgAu/HjfIqizvSnrQw==
X-Received: by 2002:a17:906:30db:b0:a27:5fd1:791f with SMTP id b27-20020a17090630db00b00a275fd1791fmr5576136ejb.0.1705931967954;
        Mon, 22 Jan 2024 05:59:27 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id vw15-20020a170907a70f00b00a2d0595cd0dsm11568513ejc.86.2024.01.22.05.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 05:59:27 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v10 8/9] devtool: ide-sdk make deploy-target quicker
Date: Mon, 22 Jan 2024 14:58:26 +0100
Message-ID: <20240122135901.171596-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122135901.171596-1-adrian.freihofer@siemens.com>
References: <20240122135901.171596-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 13:59:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194157

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 43 ++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 27389026be3..3986dc1436a 100755
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
         cmd_lines = ['#!/bin/bash']
@@ -759,10 +793,9 @@ class RecipeModified:
         cmd_lines.append(
             'bitbake %s -c install --force || { echo "bitbake %s -c install --force failed"; exit 1; }' % (self.bpn, self.bpn))
 
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


