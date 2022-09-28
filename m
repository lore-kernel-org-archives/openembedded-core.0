Return-Path: <jebr@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CC4C6FA82
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 18:59:10 +0000 (UTC)
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by mx.groups.io with SMTP id smtpd.web11.1761.1664391540500507593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 11:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=JZwN/z0b;
 spf=pass (domain: flex--jebr.bounces.google.com, ip: 209.85.219.202,
 mailfrom: 3c5k0ywqkajgb63j8gg8d6.4ge@flex--jebr.bounces.google.com)
Received: by mail-yb1-f202.google.com with SMTP id
 v17-20020a259d91000000b006b4c31c0640so12029492ybp.18
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 11:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date;
        bh=whqEAls8VajvWphEAxpPVyoCBnbCwotBYzJCbg5aRO8=;
        b=JZwN/z0bjZzjOUgTWnEkcY1QMHS44skWwMSsxi01cxcGUukiYO5cHyYDau87Eth+Cf
         hYdGqPjg0xlTTnH9QKkE3HbEA0YZIYGj4knFDEZXdBlFHTOzEqXet0tQZikN8Bm2OQcE
         J/J4pwV5w020g3LWOg/Nwojbsfkqf8ixclXOAppVvVdDZUI6jx0HiJpMnQ6a1w3qRPmo
         GXDGIypLRmOUgaZVJ5Np1/yOT3QSySfaWCfSUQ6svNH3xz5MAfr0w54AAJehLtZ1TSNS
         xoD9knuXgAfXXPoyUhNnlzsoV2HaWrzSoaD4Ennycn/TyA0moc03lqEUwS7f5YeKlqic
         TO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=whqEAls8VajvWphEAxpPVyoCBnbCwotBYzJCbg5aRO8=;
        b=hAs9tbjKUFi8Lelerhe6ZgKb1Wcpq5rwywExDOpUcA7ycRMrqj4hmdmLFfbI3hfgGo
         Xnfe8G2WYt9q+B8f3skEMQlYmH7CTAQvovON79aj3DjxlL2udZTveINoY5P5zJttc0ws
         2TsaWrzT9F+icCg2k/xH6ZaMpTPtDjR0kP6+F4Txb9+dqE59z2WNMY4pYfCLX0bDwCvP
         jsuDSCTvRB9ClgVTeGC3lbKC0IN665Edo8oCUCABLHppXFCspFvhWfW7aEpIjQe4XWOL
         qoEg44MLIhHcdhCS4bJ7pmG8TnBrjC9vzyBuP16CLL70sDAjrVjhedQIv7JeeSVetSTh
         2m9w==
X-Gm-Message-State: ACrzQf14yQ/w1mXxQg5L+Lyvsy57Qlpl6o2KWD9EbtN6wIuLgPRykehn
	FbMk/6ireNOIs+cPx0WlKJrqDDG4aQbIZKbYC7XIDlis4ELpZnUcbNETX8KHjqmID2T0u+Vhn/A
	WXDz+rwXpL+s9pkZBvfWMWb+FBMjg56JT3tZO8ToSIN5cZH3bgHzBjzXrv90WZEW2L1jzRVyNZW
	zAwgui
X-Google-Smtp-Source: 
 AMsMyM4iNzhbuQSFckDxSYKu9cuinJS1yH2I3PApuTtDpqbXd6SDINjdB9zZb80Fa+h3OYflbOtZXOp5
X-Received: from jebr.svl.corp.google.com
 ([2620:15c:2c5:13:24f3:85f9:597a:d0fd])
 (user=jebr job=sendgmr) by 2002:a25:ce8b:0:b0:6bc:97c:d62 with SMTP id
 x133-20020a25ce8b000000b006bc097c0d62mr11866579ybe.530.1664391539654; Wed, 28
 Sep 2022 11:58:59 -0700 (PDT)
Date: Wed, 28 Sep 2022 11:58:49 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
Message-ID: <20220928185849.2053193-1-jebr@google.com>
Subject: [meta-oe][PATCH] externalsrc:git submodule--helper list unsupported
From: jebr@google.com
To: openembedded-core@lists.openembedded.org
Cc: clabrado@google.com, edtanous@google.com,
	John Edward Broadbent <jebr@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 18:59:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171153

From: John Edward Broadbent <jebr@google.com>

Git has removed support for "git submodule--helper list".
https://github.com/git/git/commit/31955475d1c283120d5d84247eb3fd55d9f5fdd9

This change provides an alternate method for gathering the submodules
information.

Tested:
Build recipes with and without submodules

Signed-off-by: Carson Labrado <clabrado@google.com>
Signed-off-by: John Edward Broadbent <jebr@google.com>
---
 meta/classes-recipe/externalsrc.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/externalsrc.bbclass b/meta/classes-recipe/externalsrc.bbclass
index ce753fce76..06a9548a20 100644
--- a/meta/classes-recipe/externalsrc.bbclass
+++ b/meta/classes-recipe/externalsrc.bbclass
@@ -230,15 +230,16 @@ def srctree_hash_files(d, srcdir=None):
             env['GIT_INDEX_FILE'] = tmp_index.name
             subprocess.check_output(['git', 'add', '-A', '.'], cwd=s_dir, env=env)
             git_sha1 = subprocess.check_output(['git', 'write-tree'], cwd=s_dir, env=env).decode("utf-8")
-            submodule_helper = subprocess.check_output(['git', 'submodule--helper', 'list'], cwd=s_dir, env=env).decode("utf-8")
-            for line in submodule_helper.splitlines():
-                module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
-                if os.path.isdir(module_dir):
-                    proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
-                    proc.communicate()
-                    proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
-                    stdout, _ = proc.communicate()
-                    git_sha1 += stdout.decode("utf-8")
+            if os.path.exists(".gitmodules"):
+                submodule_helper = subprocess.check_output(["git", "config", "--file", ".gitmodules", "--get-regexp", "path"], cwd=s_dir, env=env).decode("utf-8")
+                for line in submodule_helper.splitlines():
+                    module_dir = os.path.join(s_dir, line.rsplit(maxsplit=1)[1])
+                    if os.path.isdir(module_dir):
+                        proc = subprocess.Popen(['git', 'add', '-A', '.'], cwd=module_dir, env=env, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
+                        proc.communicate()
+                        proc = subprocess.Popen(['git', 'write-tree'], cwd=module_dir, env=env, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
+                        stdout, _ = proc.communicate()
+                        git_sha1 += stdout.decode("utf-8")
             sha1 = hashlib.sha1(git_sha1.encode("utf-8")).hexdigest()
         with open(oe_hash_file, 'w') as fobj:
             fobj.write(sha1)
-- 
2.37.3.998.g577e59143f-goog


