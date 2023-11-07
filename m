Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B28C4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:28:04 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.13572.1699370874267993966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zrt6DWwN;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so876847066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370873; x=1699975673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0MzlrWhoEy88S2X7kCj/GVUa6prl8cejg2XsuMDScj8=;
        b=Zrt6DWwN6DKjnZlBlbpb4szR248Nd5X5GrkAWf3dh/hTuKr9nLgBUU1SiBjRJ9Yf34
         bWyvn+yiNz9ST0WWT6e4rPBtXoQeBIxG2jah4yKXxKAQ0NYsxsPNjC2PdCcEp+GtLSGK
         1u5KZYqFDRdq4cMYEGeber0EtZ6vB7w0w7UvmGDltYjKN+5mHgVpxs2boqulKeII1Uy9
         9u7ICz2WvdirDMVcLVgW0uI/spSExKqupGuy8RM+8YnB0XYb69SQcOT8AjBv6eukEQ+s
         UZtEXUpfNukIc9q4UrpoCkf0WdnrCjhdYwlLpYn9dc45o0TTWQd4ZcuVfbKhiSWGsZYr
         b/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370873; x=1699975673;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0MzlrWhoEy88S2X7kCj/GVUa6prl8cejg2XsuMDScj8=;
        b=cuOiC8ishXQJkiNPm/vxjK7rP+6ODvWgVkltTs6AqXVUb2keXg99TKWj/vDSi5wiQU
         dJ92eQUrTL6dydEbVa/TXSkK+5w45FRFzHN0Aq4qCTnUUufcr7aWJI6y6I4QTdrwXe3y
         7T0N9UGVor87cGYPPqa22+gdDu0QkRBR1k5JQwKxnJt9BSG3ssNAq9VQWxszDTddZWrl
         mUp/pwRqinvYUgBnaHilSHxT1P8xsjEc0Oc4v5aFV48AJqf+qwFItRVmTn+3bNpCHQoa
         fH6lBlPq01Y/vK+6Z/Rj5rPtBm5eo6zyHHJlLMKo+eIHGinlRdyZBQPAlwkDbr0YXbHK
         75SQ==
X-Gm-Message-State: AOJu0YwB/mALvvlUbVXOmzy66tn6YWSUh4yKHGR0saBYphtUrkqn08HW
	TTUxhBMHs1hfaJkIv8Yv5R2ClwfvgzU=
X-Google-Smtp-Source: AGHT+IFmM2QwKCKI7tC/Tg4mAEFL0q0fAROJbCSDqhxCX4+6D2vt+zpQZG6r0QnK2QVmP7bvbOEl8A==
X-Received: by 2002:a17:907:1c86:b0:9df:bc50:2508 with SMTP id nb6-20020a1709071c8600b009dfbc502508mr6662457ejc.57.1699370872728;
        Tue, 07 Nov 2023 07:27:52 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:52 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 4/7] bblayers/makesetup.py: Use new functions from oe.buildcfg
Date: Tue,  7 Nov 2023 16:26:39 +0100
Message-ID: <20231107152641.1043-6-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190294

From: Jermain Horsman <jermain.horsman@nedap.com>

Refactor to use git functions from library.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/bblayers/makesetup.py | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 5fb6f1469e..d24470dc83 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -26,25 +26,12 @@ def plugin_init(plugins):
 
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
@@ -58,10 +45,7 @@ class MakeSetupPlugin(LayerPlugin):
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
@@ -69,12 +53,16 @@ class MakeSetupPlugin(LayerPlugin):
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
-- 
2.42.0.windows.2


