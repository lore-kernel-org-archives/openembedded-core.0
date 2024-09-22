Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BA1CF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 15:58:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17397.1727020708539703122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 08:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=adCLRcrU;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso9330905e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727020707; x=1727625507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZiyxK/AyT5J3chrJALy6KYuEvDgwg7c4JvbAmKYDsI=;
        b=adCLRcrUZygAGCNRl7PFi6gQbkaWFtmIvNqUWyc4vRQxO+02OJe5FYbckY5Ba3HSLm
         lF10odA1UvNfPhCrmG6cIHZO4efyo42qHvVoQ7DM2b1v7uaYUtH2E1aDwS4suQcM8bPm
         dTQ5ZhYnG+g5laRdDb3mCDtuuMPp4A/PSt/BjWPQfe9o6uMDRc33oyLHrUGNEOZNEbf2
         5aNtVGagkgIKAf6n6Owt0rC1MUSePnxVEGeSwxJtUhJ8qHPHNuEHqXHFY7HbfAuKW3m7
         mW3FCavaS4BNp5vY7isQqqGn12S4fCB2R8JNJK6Dtz6j7JilUUxypwVfpCYSvZ2vHPFh
         zlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727020707; x=1727625507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZiyxK/AyT5J3chrJALy6KYuEvDgwg7c4JvbAmKYDsI=;
        b=tGhNIYHO+9U6ncWeD46/vlaFBy5vbXaVtA1g4quxr4dBPF3gRkkUBC5l4LCMy/p3mX
         snZAgl7a6+Hd4jC4WuDXPVM6cV9S3GeI/yWHdZj889dOAijVw5QVZAUKb+PrLJxjP2+g
         AVT5caRYTF3Ce9YGDqvX+hEQvCfBaY18qALiBfDUdbD73G3hnEfO8MMffTWl7Pj6TCZd
         swlav6UYvCfUGxs1No4jv0pesleAQ4ftabCe+ZpQEKG9J+gJ2o/BhYDdX3UmCL6eOAJt
         /PEGPyZygkDmdi5sI+klFEgE6DedVKdOHR2Ou1bwtsp+rRz0r22MfXQPut4vq+/iqdpz
         CKDA==
X-Gm-Message-State: AOJu0YywyfKUE5mTzjlU0y+AthR9+QLgRaWBCYrxgVjS1ONykirIURdp
	urrD7TLYwR2eT3pQgUvG5WM7QtKfu8PE9AU1YLiAyMfO1rHiVVZAgR9L5Q==
X-Google-Smtp-Source: AGHT+IFGNcPmboDzkkY1Kfzafceoo+RQRnqhzsMTZyHSGCTUNfI7Wuou9FoaDJEaErYuU8kv4la6tQ==
X-Received: by 2002:a05:600c:5493:b0:42c:c37b:4d53 with SMTP id 5b1f17b1804b1-42e7ab42a88mr60961495e9.0.1727020706445;
        Sun, 22 Sep 2024 08:58:26 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e429sm104126405e9.3.2024.09.22.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 08:58:26 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/3] devtool: drop S = WORKDIR workaround
Date: Sun, 22 Sep 2024 17:43:14 +0200
Message-ID: <20240922155810.1139539-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
References: <20240922155810.1139539-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 15:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204790

Dropping support for S = WORKDIR allows to drop this ugly workaround.

With S = WORKDIR it was possible to refer to a file via oe-local-files
symlink or via direct file path. Ensuring the pseudo database is
consistent for both paths was extra complicated and required this bad
function. Really nice to drop it now!

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  5 ----
 scripts/lib/devtool/ide_sdk.py          | 38 -------------------------
 2 files changed, 43 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 7d617739809..1739c84853b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2585,11 +2585,6 @@ class DevtoolIdeSdkTests(DevtoolBase):
         i_and_d_script_path = os.path.join(
             self._workspace_scripts_dir(recipe_name), i_and_d_script)
         self.assertExists(i_and_d_script_path)
-        del_script = "delete_package_dirs_" + recipe_id
-        del_script_path = os.path.join(
-            self._workspace_scripts_dir(recipe_name), del_script)
-        self.assertExists(del_script_path)
-        runCmd(del_script_path, cwd=tempdir)
 
     def _devtool_ide_sdk_qemu(self, tempdir, qemu, recipe_name, example_exe):
         """Verify deployment and execution in Qemu system work for one recipe.
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 65873b088d5..350a8b02ca2 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -712,42 +712,6 @@ class RecipeModified:
                     binaries.append(abs_name[d_len:])
         return sorted(binaries)
 
-    def gen_delete_package_dirs(self):
-        """delete folders of package tasks
-
-        This is a workaround for and issue with recipes having their sources
-        downloaded as file://
-        This likely breaks pseudo like:
-        path mismatch [3 links]: ino 79147802 db
-        .../build/tmp/.../cmake-example/1.0/package/usr/src/debug/
-                             cmake-example/1.0-r0/oe-local-files/cpp-example-lib.cpp
-        .../build/workspace/sources/cmake-example/oe-local-files/cpp-example-lib.cpp
-        Since the files are anyway outdated lets deleted them (also from pseudo's db) to workaround this issue.
-        """
-        cmd_lines = ['#!/bin/sh']
-
-        # Set up the appropriate environment
-        newenv = dict(os.environ)
-        for varvalue in self.fakerootenv.split():
-            if '=' in varvalue:
-                splitval = varvalue.split('=', 1)
-                newenv[splitval[0]] = splitval[1]
-
-        # Replicate the environment variables from bitbake
-        for var, val in newenv.items():
-            if not RecipeModified.is_valid_shell_variable(var):
-                continue
-            cmd_lines.append('%s="%s"' % (var, val))
-            cmd_lines.append('export %s' % var)
-
-        # Delete the folders
-        pkg_dirs = ' '.join([os.path.join(self.workdir, d) for d in [
-            "package", "packages-split", "pkgdata", "sstate-install-package", "debugsources.list", "*.spec"]])
-        cmd = "%s rm -rf %s" % (self.fakerootcmd, pkg_dirs)
-        cmd_lines.append('%s || { "%s failed"; exit 1; }' % (cmd, cmd))
-
-        return self.write_script(cmd_lines, 'delete_package_dirs')
-
     def gen_deploy_target_script(self, args):
         """Generate a script which does what devtool deploy-target does
 
@@ -785,8 +749,6 @@ class RecipeModified:
         """Generate a script which does install and deploy"""
         cmd_lines = ['#!/bin/bash']
 
-        cmd_lines.append(self.gen_delete_package_dirs())
-
         # . oe-init-build-env $BUILDDIR
         # Note: Sourcing scripts with arguments requires bash
         cmd_lines.append('cd "%s" || { echo "cd %s failed"; exit 1; }' % (
-- 
2.46.0


