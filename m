Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16FFC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 12:52:51 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web11.51163.1711371162927336890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 05:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOmdpdDP;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: jhatnedap@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3668fd6952bso16228145ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711371162; x=1711975962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RVqgnKsSSi71iY7m2Dwt5pxd9gumP3+PNBTMo9CSqQ0=;
        b=AOmdpdDPH90QfluxJIggff7QPtFun0SJizO2zugFFWlos+3u4ehKnjjN+E/mT5+mL6
         RWElE1hYnp29Kf2lBeV6Lb6XyVflUU4u8UXJhRa4mZymLNNXNUOVrkc2lVPd5mHybRdu
         p7ix2/ej5+GnqOkngPeKY/Qf3UFFAhWhwkdz8WfQFBHUcP5c1K7C96o9hK3l+xd0PN6o
         vaWbeT+olaH6L2Ql2wRtlTT78K6w6SvbBT9Ik1YXw11LOcOtxVEzaEpoQ6FFd2lNPRea
         RU2J6Umf1qW93BhVqyugSoiellh1E3HYeeaPiAfUhTTSEpVRlV3eDsjcxYqqzWCxcpHi
         V1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711371162; x=1711975962;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVqgnKsSSi71iY7m2Dwt5pxd9gumP3+PNBTMo9CSqQ0=;
        b=pOb8jp0zDF1lVXGCh+fJxyixcS81rKYIZohlBtc6uP0qD0PnkfjH8iiQyuvRESBe08
         NJI41xD5kFonzgq2qdaXJZcaHv/bOvmaHb8zbi/Q1orj/oXvCjxxicCdUZte6F4z6dXY
         zrjnXf9Wi7ddDFDZbsrPqFtxGAkQ9TXtTO3zRAfF22lF6nWGeqEyJEQ1cPVdXO2IHxSa
         HvHRtsD7vVC/iGutp2gUGtdbOZWAIOYZ3bjX7Ch2OwTqEbIJjFJxBB63n1mjVcWUfNh/
         gxlLYiAmnjacyyoy7Nwc4aJd05MdcEw0X9DwDiua14nCmU29+NnRZvGGifjLl0zuG3m2
         mfsA==
X-Gm-Message-State: AOJu0Yzg6pLRGnMTWi1TEXFhKb2Lt4FNc0NH+TcI/EgY7ZgA8Cy0B9ib
	I2l8GVrUO5DClK/xBGTYH5USbeJ76uSIeaMvaGovR6ndJRm6wBLH7rLZeI+A
X-Google-Smtp-Source: AGHT+IFg4bBKgN+MOwiB7g+3L7HBSLyyGs6dzj3POrJzWcfDcIjq88uNI9aKBRV8NurOwoR8mbeoMA==
X-Received: by 2002:a05:6e02:96c:b0:364:1b46:607d with SMTP id q12-20020a056e02096c00b003641b46607dmr6620970ilt.5.1711371162006;
        Mon, 25 Mar 2024 05:52:42 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id l15-20020a056e020e4f00b00367d6dbee24sm2369078ilk.20.2024.03.25.05.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 05:52:41 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] bblayers/makesetup.py: Move git utility functions to oe.buildcfg module
Date: Mon, 25 Mar 2024 13:50:38 +0100
Message-ID: <20240325125037.2275-2-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 12:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197486

From: Jermain Horsman <jermain.horsman@nedap.com>

This allows other classes to make use of these as well.

Includes a git describe and git toplevel function and functions
to get info for git remotes.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---

Cc: Martin Jansa <martin.jansa@gmail.com>

 meta/lib/bblayers/makesetup.py | 33 ++++++++++-----------------------
 meta/lib/oe/buildcfg.py        | 29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 23 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 4f27c565eeb..99d59737602 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -9,7 +9,6 @@ import os
 import sys
 
 import bb.utils
-import bb.process
 
 from bblayers.common import LayerPlugin
 
@@ -24,25 +23,12 @@ def plugin_init(plugins):
 
 class MakeSetupPlugin(LayerPlugin):
 
-    def _get_repo_path(self, layer_path):
-        repo_path, _ = bb.process.run('git rev-parse --show-toplevel', cwd=layer_path)
-        return repo_path.strip()
-
-    def _get_remotes(self, repo_path):
+    def _get_remotes_with_url(self, repo_path):
         remotes = {}
-        remotes_list,_ = bb.process.run('git remote', cwd=repo_path)
-        for r in remotes_list.split():
-            uri,_ = bb.process.run('git remote get-url {r}'.format(r=r), cwd=repo_path)
-            remotes[r] = {'uri':uri.strip()}
+        for r in oe.buildcfg.get_metadata_git_remotes(repo_path):
+            remotes[r] = {'uri':oe.buildcfg.get_metadata_git_remote_url(repo_path, r)}
         return remotes
 
-    def _get_describe(self, repo_path):
-        try:
-            describe,_ = bb.process.run('git describe --tags', cwd=repo_path)
-        except bb.process.ExecutionError:
-            return ""
-        return describe.strip()
-
     def _is_submodule(self, repo_path):
         # This is slightly brittle: git does not offer a way to tell whether
         # a given repo dir is a submodule checkout, so we need to rely on .git
@@ -56,10 +42,7 @@ class MakeSetupPlugin(LayerPlugin):
         available here. """
         repos = {}
         layers = oe.buildcfg.get_layer_revisions(self.tinfoil.config_data)
-        try:
-            destdir_repo = self._get_repo_path(destdir)
-        except bb.process.ExecutionError:
-            destdir_repo = None
+        destdir_repo = oe.buildcfg.get_metadata_git_toplevel(destdir)
 
         for (l_path, l_name, l_branch, l_rev, l_ismodified) in layers:
             if l_name == 'workspace':
@@ -67,12 +50,16 @@ class MakeSetupPlugin(LayerPlugin):
             if l_ismodified:
                 logger.error("Layer {name} in {path} has uncommitted modifications or is not in a git repository.".format(name=l_name,path=l_path))
                 return
-            repo_path = self._get_repo_path(l_path)
+            repo_path = oe.buildcfg.get_metadata_git_toplevel(l_path)
 
             if self._is_submodule(repo_path):
                 continue
             if repo_path not in repos.keys():
-                repos[repo_path] = {'path':os.path.basename(repo_path),'git-remote':{'rev':l_rev, 'branch':l_branch, 'remotes':self._get_remotes(repo_path), 'describe':self._get_describe(repo_path)}}
+                repos[repo_path] = {'path':os.path.basename(repo_path),'git-remote':{
+                        'rev':l_rev,
+                        'branch':l_branch,
+                        'remotes':self._get_remotes_with_url(repo_path),
+                        'describe':oe.buildcfg.get_metadata_git_describe(repo_path)}}
                 if repo_path == destdir_repo:
                     repos[repo_path]['contains_this_file'] = True
                 if not repos[repo_path]['git-remote']['remotes'] and not repos[repo_path]['contains_this_file']:
diff --git a/meta/lib/oe/buildcfg.py b/meta/lib/oe/buildcfg.py
index b3fe510309c..27b059b8343 100644
--- a/meta/lib/oe/buildcfg.py
+++ b/meta/lib/oe/buildcfg.py
@@ -28,6 +28,35 @@ def get_metadata_git_revision(path):
         rev = '<unknown>'
     return rev.strip()
 
+def get_metadata_git_toplevel(path):
+    try:
+        toplevel, _ = bb.process.run('git rev-parse --show-toplevel', cwd=path)
+    except bb.process.ExecutionError:
+        return ""
+    return toplevel.strip()
+
+def get_metadata_git_remotes(path):
+    try:
+        remotes_list, _ = bb.process.run('git remote', cwd=path)
+        remotes = remotes_list.split()
+    except bb.process.ExecutionError:
+        remotes = []
+    return remotes
+
+def get_metadata_git_remote_url(path, remote):
+    try:
+        uri, _ = bb.process.run('git remote get-url {remote}'.format(remote=remote), cwd=path)
+    except bb.process.ExecutionError:
+        return ""
+    return uri.strip()
+
+def get_metadata_git_describe(path):
+    try:
+        describe, _ = bb.process.run('git describe --tags', cwd=path)
+    except bb.process.ExecutionError:
+        return ""
+    return describe.strip()
+
 def is_layer_modified(path):
     try:
         subprocess.check_output("""cd %s; export PSEUDO_UNLOAD=1; set -e;
-- 
2.43.0.windows.1


