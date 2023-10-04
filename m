Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F3CE7C4C7
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 14:41:23 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.20265.1696430478276502888
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 07:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e9ndnBJw;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso415478266b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 07:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696430477; x=1697035277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkLEh0yJhasb+GtiHuglVth/iDg/h7a4n9k4oschV24=;
        b=e9ndnBJwpYX5CU3lKmhj0poVQYz3IQdnZ/+jD4EilPTp7gRlP/un7Z0XC05Qs7U+7R
         Rg1tSF6GwHc8e1VxbRHSvHvFzCppIgOlDA8tbrbUNK9MMOH+/0iKvDkegaq+xIxsByLQ
         CR8unRlxGrMeIwCQl89gH2FS3NOWRv11Pbop87Pyjv00ZtFrjYDVjEQTkqku1V025eJI
         LRymoKhOhMQCu+omeNo0qxBvSTyVZ5Uu0YDFeefbKHsclFC3On3AuhanMs+pArVXK9lK
         1JEpaGMYa2oNGNvZicW1n2XMfCN42ey64oDspOSR+5HUZ+EKQvZMVtjngSA+ScsXZ0Tc
         GFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430477; x=1697035277;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkLEh0yJhasb+GtiHuglVth/iDg/h7a4n9k4oschV24=;
        b=N4/nV71AqPAxwNWJ5jRKv4JhiGffy5+vMNwbukLO8TXlcRvMpe578xUqYj/w/7LaJF
         A3QZquRpWvLliM7KVIvY1AKneKwMMUXZPhkHaO5m8Wknztuz26mdK39MhUb+DZSrHz19
         fASZ2mT5jZ1ZI1vq3/FsgPXVqx1NnoKLBFPJN1VPKFnVcIOS2mFWj7xEWVuSTF4ul2AP
         6IHSHo1pdFkvN3zbZ3XfR7C8jotfW1z0Ts42/f0m9GfL1VhBjFw+wQZxaoJc7yPo9eYl
         VjsS80XL+egINT9a6joSWhqSp2ZStMS5B1i6Y6JuOxlBoSVGMP4ootX3czIG4EqOrIaU
         S70g==
X-Gm-Message-State: AOJu0YwFB9x2fjwi18AXeDbNWkOXL5wAwxTewrpH/KHc5lzhS/GEGa+b
	ObHct2prSHqnY6UfYja2t0Zr2O6Z7ek=
X-Google-Smtp-Source: AGHT+IG71JD91ihYaqU+4lFFo8UvZL1kOchXU5lt1JUcuS7qgSQGE9YSCVatZ1yrz9GZjgJZDpbyHQ==
X-Received: by 2002:a17:907:9724:b0:9ae:50e3:7e40 with SMTP id jg36-20020a170907972400b009ae50e37e40mr2353762ejc.52.1696430476527;
        Wed, 04 Oct 2023 07:41:16 -0700 (PDT)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id q7-20020aa7d447000000b00533dad8a9c5sm2561192edr.38.2023.10.04.07.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:41:16 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC] scripts/oe-setup-layers: Allow setup using branches instead of fixed revisions
Date: Wed,  4 Oct 2023 16:40:11 +0200
Message-ID: <20231004144106.1577-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 14:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188688

From: Jermain Horsman <jermain.horsman@nedap.com>

These changes allow for situations where one or more layers are checked out
using a branch instead of a revision, care is taken to make sure this works
when using multiple remotes.
All changes made are backwards compatible with older setup-layer json files.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---


During development it can be useful to use a branch instead of a revision,
e.g. when rebasing often or just for easy upgrading of the setup.

This is a first step, as it is currently not possible to generate or edit
the layers-setup json files using bitbake-layers create-layers-setup, it
is however possible to edit these manually and use this and since it is
backwards compatible current json files will still work.

The idea is to update bitbake-layers create-layers-setup and extend it to
include the options used here, something like:
bitbake-layers create-layers-setup --update-git-rev some.json poky [--branch | <revision> ]



 scripts/oe-setup-layers | 91 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 7 deletions(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index c8012fa670..49f8cdef47 100755
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


