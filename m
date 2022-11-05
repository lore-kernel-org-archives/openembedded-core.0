Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C6FC4332F
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 15:43:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.7208.1667662988552932470
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 08:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FQ1kJvva;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667662989;
  x=1699198989;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d0KlWDUc9ANjXfOwNarWrDQ6nZYpzSYO8PeCRy4czto=;
  b=FQ1kJvvaQn/5Bbrio7yvpQXoNYo0IIbPuiC3fEzBjSRHJEOksxsScj07
   qBeg9N1Lf2YvWEsUXAd0BwGCLGN2owExbHovnZgIQ5b77/b2A2WDcnQoE
   /fRh7R2z0l5dQO4tTpUD4dRR4UAEnDFtrAMyacfRWCkaHLWQYm0FxoHU3
   emYXwsCMOJipFZXSdS9JqJ7JkqLECgHbC9RwWsfu48PJzXITVSwyZX65Z
   pwQzJxTeb2CFEBCxkmr3pCzdoCE6Nu8eP7qsc1X/cHAnj7lsdB7eMH8vW
   5CqpGb2RZNuFkRUrA9mL5nwZfgNgEHScJXx0IqT6KNbb674buGeIkRx+H
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [langdale][PATCH 1/3] externalsrc: git submodule--helper list unsupported
Date: Sat, 5 Nov 2022 16:43:01 +0100
Message-ID: <20221105154303.274085-1-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 15:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172749

From: John Edward Broadbent <jebr@google.com>

Git has removed support for "git submodule--helper list".
https://github.com/git/git/commit/31955475d1c283120d5d84247eb3fd55d9f5fdd9

This change provides an alternate method for gathering the submodules
information.

Tested:
Build recipes with and without submodules

Signed-off-by: Carson Labrado <clabrado@google.com>
Signed-off-by: John Edward Broadbent <jebr@google.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/externalsrc.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 8136d25cb1..766c4979c5 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -229,15 +229,16 @@ def srctree_hash_files(d, srcdir=None):
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

