Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFF6C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.3837.1676835066214117063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bP5uQqMW;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id t6so1030417wrz.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zlq7tl5jwShvQecRYqFcl2y43fNPALmq8kP/al0kU6Y=;
        b=bP5uQqMWxEkJuqTDUAlE873nMjWbCtHITpHlCNNYgXzgvnIKtCkiIdp1SehwmnFdvQ
         N+21cdx5Mw0Td6/llvuDqYMQxMYYyxmC4ZX4mb+nPesthDfl4Mz69Hr57VGxmYOYOAKC
         WYqJwaL29c2aEPdFB/gAUOvrFwnhlvwdYtt7pPUTrIrX5iDpwzHG0xKr1SU75uNwx66M
         kRlvMM3RcfUdrZuM0f60kdsf15odMwLN57tkcfAEvldx8iQdpCyRMWgL6FyBujD3/1KF
         ofuJFDD1TUkOay2wqGd4ZRbeRKctbR14t1nctM76SsnFK8tQ2ccg/kYPn1/uTDLqP64O
         ZlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlq7tl5jwShvQecRYqFcl2y43fNPALmq8kP/al0kU6Y=;
        b=uULyEMVOuF8imqhPO+qjTy7cfUcxQf8s04dqJXwafXexpwOdztr3tw8UTEaQZQXVwc
         VdmD1WyrFBGxCjIQzHyeNSAAly0jVQBMnkQ1+oQ2uugz2Svdr0l8SEM4p16ZiRbOQI5H
         mukGES1NKQ82Kjvhy5ZrllKecovxdPwbLFZ7o+dr3FAOiVvMG/PMIAiXYfpu71gWvR9p
         wmEr+aWIbftlPW6QPBTebDsJYqHmMRMJZTlWUe0TzBfmOWFUOi/o8s4K7mH375srAGsp
         67d2QDKFmFdsJLVkJAcO2U22fmyd1Ld0unlTFAJpbmMlgErcqqqfbA47pV8vHU2zjaXm
         YwgA==
X-Gm-Message-State: AO0yUKWea2OH+lZAr2MEymLyjXeK3Jqm38UvebIVoTF+7mU+cqaspR/h
	TaWj8BkCUXE6e/KCqsa2i01DAS+IMy8=
X-Google-Smtp-Source: AK7set9sjkgM5DdjWgMYRsHYFPyfftFdRxLRCAXhKksNLzf3tCisH/gaV7aplSLZR/7dU9CiJtASbg==
X-Received: by 2002:adf:ed48:0:b0:2c5:60bb:ddd7 with SMTP id u8-20020adfed48000000b002c560bbddd7mr1334388wro.65.1676835064525;
        Sun, 19 Feb 2023 11:31:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/39] scripts/oe-setup-layers: correct variable names - layers should be called repos
Date: Sun, 19 Feb 2023 20:30:23 +0100
Message-Id: <20230219193101.338397-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177344

The script is operating on layer repositories, which can and do sometimes contain
several layers. This distinction is important as the script will be tweaked
to write a record of actual layer locations.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/oe-setup-layers | 68 ++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 461560de9f..6c02262663 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -19,8 +19,8 @@ import json
 import os
 import subprocess
 
-def _is_layer_git_repo(layerdir):
-    git_dir = os.path.join(layerdir, ".git")
+def _is_repo_git_repo(repodir):
+    git_dir = os.path.join(repodir, ".git")
     if not os.access(git_dir, os.R_OK):
         return False
     try:
@@ -28,73 +28,73 @@ def _is_layer_git_repo(layerdir):
     except subprocess.CalledProcessError:
         return False
 
-def _is_layer_at_rev(layerdir, rev):
+def _is_repo_at_rev(repodir, rev):
     try:
-        curr_rev = subprocess.check_output("git -C %s rev-parse HEAD" % layerdir, shell=True, stderr=subprocess.DEVNULL)
+        curr_rev = subprocess.check_output("git -C %s rev-parse HEAD" % repodir, shell=True, stderr=subprocess.DEVNULL)
         if curr_rev.strip().decode("utf-8") == rev:
             return True
     except subprocess.CalledProcessError:
         pass
     return False
 
-def _is_layer_at_remote_uri(layerdir, remote, uri):
+def _is_repo_at_remote_uri(repodir, remote, uri):
     try:
-        curr_uri = subprocess.check_output("git -C %s remote get-url %s" % (layerdir, remote), shell=True, stderr=subprocess.DEVNULL)
+        curr_uri = subprocess.check_output("git -C %s remote get-url %s" % (repodir, remote), shell=True, stderr=subprocess.DEVNULL)
         if curr_uri.strip().decode("utf-8") == uri:
             return True
     except subprocess.CalledProcessError:
         pass
     return False
 
-def _contains_submodules(layerdir):
-    return os.path.exists(os.path.join(layerdir,".gitmodules"))
+def _contains_submodules(repodir):
+    return os.path.exists(os.path.join(repodir,".gitmodules"))
 
 def _do_checkout(args, json):
-    layers = json['sources']
-    for l_name in layers:
-        l_data = layers[l_name]
-        layerdir = os.path.abspath(os.path.join(args['destdir'], l_data['path']))
+    repos = json['sources']
+    for r_name in repos:
+        r_data = repos[r_name]
+        repodir = os.path.abspath(os.path.join(args['destdir'], r_data['path']))
 
-        if 'contains_this_file' in l_data.keys():
+        if 'contains_this_file' in r_data.keys():
             force_arg = 'force_bootstraplayer_checkout'
             if not args[force_arg]:
-                print('Note: not checking out source {layer}, use {layerflag} to override.'.format(layer=l_name, layerflag='--force-bootstraplayer-checkout'))
+                print('Note: not checking out source {repo}, use {repoflag} to override.'.format(repo=r_name, repoflag='--force-bootstraplayer-checkout'))
                 continue
-        l_remote = l_data['git-remote']
-        rev = l_remote['rev']
-        desc = l_remote['describe']
+        r_remote = r_data['git-remote']
+        rev = r_remote['rev']
+        desc = r_remote['describe']
         if not desc:
             desc = rev[:10]
-        branch = l_remote['branch']
-        remotes = l_remote['remotes']
+        branch = r_remote['branch']
+        remotes = r_remote['remotes']
 
-        print('\nSetting up source {}, revision {}, branch {}'.format(l_name, desc, branch))
-        if not _is_layer_git_repo(layerdir):
-            cmd = 'git init -q {}'.format(layerdir)
+        print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
+        if not _is_repo_git_repo(repodir):
+            cmd = 'git init -q {}'.format(repodir)
             print("Running '{}'".format(cmd))
             subprocess.check_output(cmd, shell=True)
 
         for remote in remotes:
-            if not _is_layer_at_remote_uri(layerdir, remote, remotes[remote]['uri']):
+            if not _is_repo_at_remote_uri(repodir, remote, remotes[remote]['uri']):
                 cmd = "git remote remove {} > /dev/null 2>&1; git remote add {} {}".format(remote, remote, remotes[remote]['uri'])
-                print("Running '{}' in {}".format(cmd, layerdir))
-                subprocess.check_output(cmd, shell=True, cwd=layerdir)
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
 
                 cmd = "git fetch -q {} || true".format(remote)
-                print("Running '{}' in {}".format(cmd, layerdir))
-                subprocess.check_output(cmd, shell=True, cwd=layerdir)
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
 
-        if not _is_layer_at_rev(layerdir, rev):
+        if not _is_repo_at_rev(repodir, rev):
             cmd = "git fetch -q --all || true"
-            print("Running '{}' in {}".format(cmd, layerdir))
-            subprocess.check_output(cmd, shell=True, cwd=layerdir)
+            print("Running '{}' in {}".format(cmd, repodir))
+            subprocess.check_output(cmd, shell=True, cwd=repodir)
 
             cmd = 'git checkout -q {}'.format(rev)
-            print("Running '{}' in {}".format(cmd, layerdir))
-            subprocess.check_output(cmd, shell=True, cwd=layerdir)
+            print("Running '{}' in {}".format(cmd, repodir))
+            subprocess.check_output(cmd, shell=True, cwd=repodir)
 
-            if _contains_submodules(layerdir):
-                print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(layerdir))
+            if _contains_submodules(repodir):
+                print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(repodir))
 
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
 
-- 
2.30.2


