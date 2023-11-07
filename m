Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A380CC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:27:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.13757.1699370860672907499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cje5Shgi;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso911602466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370859; x=1699975659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WHUzNc75luqM+RvtqCwEQPKMNhYLJDM89tc8rVRUPhI=;
        b=Cje5Shgio8ud9pgo9nLiFNKmR90SuNx1YP3viaMkVxSZcmuzQvotnz6shIhS1z91bc
         paSeQTw+bw7crZK25AEWvQA9p9oSVb6WIfXfZKllXlMH/b+7BdJDZpFhFp5cKyXm6xEA
         Z+x18xZRklzL/zLfYNK7AAXwd/IE/z2ccv6Wzwp6qrCg8/fH6A0i4EnkFFc4vU34ihD+
         eu7kABodxRr0BNyCDSuVjuyG8FGPabbn2aQ3pBIuz3ywsbrPzfdb85PvHu1dKr/iiFXw
         qfSGgmZ2EwMqVW5Q2LWyxPV4FYthepuQEdNaUvrb35mg9r2ALJ2SaJCn90n81Cmnk4QE
         r3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370859; x=1699975659;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WHUzNc75luqM+RvtqCwEQPKMNhYLJDM89tc8rVRUPhI=;
        b=U/LLQTSWT9f+gBh4TokzWKasmctaxWg/ucbBRjbScuNgtLWjqhDIJU14nJmcUlnjwK
         2lsiz1V4hDnwJxtC1amdQJGWUQXGzj86BS+TpQqE0owJcX3zzDMDri6MxkIYctrt2IBc
         938fYgYb6o/mMrQLObYe3XJNm+cPh2TLO5mLp9mCK52ZBao+fg3BJJTJtQyj1DkYghrn
         f1rHWba6MAZMJuD48W+dIXQn4a8P/dqgakj2b1afET3ijaRzU2OfE9SfQqQoai9HbOvZ
         +lc3UynI9GUyJuplJtQ1lqQwsGUdFoDvjbFmSsN8hJPhhjDB2vAyiP+27eMie2MNtGvi
         3CxQ==
X-Gm-Message-State: AOJu0YyIzPuN9JF4G8fcIfQBWqVCFm4BAJyFw3mkMR15FeU4TgeIjNbK
	jPgaSyceXncG9UvQ1NgGnIvONAgDg2I=
X-Google-Smtp-Source: AGHT+IH9ohhzgypMxbIB2iiWyqjG8Txp/0cGBJbblhl/k3yO0i3YAwApCXeAYhmjrxMdsykzpC+2Cg==
X-Received: by 2002:a17:907:31ce:b0:9c7:6087:49a7 with SMTP id xf14-20020a17090731ce00b009c7608749a7mr17712264ejb.43.1699370858842;
        Tue, 07 Nov 2023 07:27:38 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:38 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 1/7] scripts/oe-setup-layers: Allow setup using branches instead of fixed revisions
Date: Tue,  7 Nov 2023 16:26:36 +0100
Message-ID: <20231107152641.1043-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190291

From: Jermain Horsman <jermain.horsman@nedap.com>

These changes allow for situations where one or more layers are checked out
using a branch instead of a revision, care is taken to make sure this works
when using multiple remotes.
All changes made are backwards compatible with older setup-layer json files.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 scripts/oe-setup-layers | 91 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 6d49688a32..ac9a9f139b 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -37,6 +37,16 @@ def _is_repo_at_rev(repodir, rev):
         pass
     return False
 
+def _is_repo_at_head(repodir):
+    try:
+        curr_branch = subprocess.check_output('git -C {repodir} for-each-ref --format=\'%(refname:short)\' "$(git -C {repodir} symbolic-ref -q HEAD)"'.format(repodir=repodir),
+                                            shell=True, stderr=subprocess.DEVNULL)
+        if not curr_branch.strip().decode("utf-8"):
+            return True
+    except subprocess.CalledProcessError:
+        pass
+    return False
+
 def _is_repo_at_remote_uri(repodir, remote, uri):
     try:
         curr_uri = subprocess.check_output("git -C %s remote get-url %s" % (repodir, remote), shell=True, stderr=subprocess.DEVNULL)
@@ -46,6 +56,39 @@ def _is_repo_at_remote_uri(repodir, remote, uri):
         pass
     return False
 
+def _is_repo_at_default_remote(repodir, default_remote):
+    try:
+        curr_default_remote = subprocess.check_output('git -C {repodir} config checkout.defaultRemote'.format(repodir=repodir), shell=True, stderr=subprocess.DEVNULL)
+        if curr_default_remote.strip().decode("utf-8") == default_remote:
+            return True
+    except subprocess.CalledProcessError:
+        pass
+    return False
+
+def _is_repo_at_branch(repodir, branch):
+    try:
+        curr_branch = subprocess.check_output('git -C {repodir} for-each-ref --format=\'%(refname:short)\' "$(git -C {repodir} symbolic-ref -q HEAD)"'.format(repodir=repodir),
+                                            shell=True, stderr=subprocess.DEVNULL)
+        if curr_branch.strip().decode("utf-8") == branch:
+            return True
+    except subprocess.CalledProcessError:
+        pass
+    return False
+
+def _is_repo_branch_latest(repodir):
+    try:
+        curr_rev = subprocess.check_output('git -C {repodir} rev-parse HEAD'.format(repodir=repodir),
+                                            shell=True, stderr=subprocess.DEVNULL)
+        upstream_branch = subprocess.check_output('git -C {repodir} for-each-ref --format=\'%(upstream:short)\' "$(git -C {repodir} symbolic-ref -q HEAD)"'.format(repodir=repodir),
+                                            shell=True, stderr=subprocess.DEVNULL)
+        upstream_rev = subprocess.check_output('git -C {repodir} rev-parse {upstream_branch}'.format(repodir=repodir, upstream_branch=upstream_branch.strip().decode("utf-8")),
+                                            shell=True, stderr=subprocess.DEVNULL)
+        if curr_rev.strip().decode("utf-8") == upstream_rev.strip().decode("utf-8"):
+            return True
+    except subprocess.CalledProcessError:
+        pass
+    return False
+
 def _contains_submodules(repodir):
     return os.path.exists(os.path.join(repodir,".gitmodules"))
 
@@ -63,10 +106,17 @@ def _do_checkout(args, json):
         r_remote = r_data['git-remote']
         rev = r_remote['rev']
         desc = r_remote['describe']
-        if not desc:
-            desc = rev[:10]
         branch = r_remote['branch']
         remotes = r_remote['remotes']
+        default_remote = None
+        if not rev:
+            # note: default-remote is required if rev is not set, this key might not exist in older json files though
+            default_remote = r_remote['default-remote']
+            if not desc:
+                desc = '{}/{}'.format(default_remote, branch)
+        else:
+            if not desc:
+                desc = rev[:10]
 
         print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
         if not _is_repo_git_repo(repodir):
@@ -84,16 +134,43 @@ def _do_checkout(args, json):
                 print("Running '{}' in {}".format(cmd, repodir))
                 subprocess.check_output(cmd, shell=True, cwd=repodir)
 
-        if not _is_repo_at_rev(repodir, rev):
+        if rev:
+            if not _is_repo_at_rev(repodir, rev) or not _is_repo_at_head(repodir):
+                cmd = "git fetch -q --all || true"
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
+
+                cmd = 'git checkout -q {}'.format(rev)
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
+
+                if _contains_submodules(repodir):
+                    print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(repodir))
+        else:
+            check_submodule = False
+
             cmd = "git fetch -q --all || true"
             print("Running '{}' in {}".format(cmd, repodir))
             subprocess.check_output(cmd, shell=True, cwd=repodir)
 
-            cmd = 'git checkout -q {}'.format(rev)
-            print("Running '{}' in {}".format(cmd, repodir))
-            subprocess.check_output(cmd, shell=True, cwd=repodir)
+            if not _is_repo_at_default_remote(repodir, default_remote):
+                cmd = 'git config checkout.defaultRemote {}'.format(default_remote)
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
+
+            if not _is_repo_at_branch(repodir, branch):
+                cmd = 'git checkout -q {}'.format(branch)
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
+                check_submodule = True
+
+            if not _is_repo_branch_latest(repodir):
+                cmd = 'git pull'
+                print("Running '{}' in {}".format(cmd, repodir))
+                subprocess.check_output(cmd, shell=True, cwd=repodir)
+                check_submodule = True
 
-            if _contains_submodules(repodir):
+            if check_submodule and _contains_submodules(repodir):
                 print("Repo {} contains submodules, use 'git submodule update' to ensure they are up to date".format(repodir))
 
 parser = argparse.ArgumentParser(description="A self contained python script that fetches all the needed layers and sets them to correct revisions using data in a json format from a separate file. The json data can be created from an active build directory with 'bitbake-layers create-layers-setup destdir' and there's a sample file and a schema in meta/files/")
-- 
2.42.0.windows.2


