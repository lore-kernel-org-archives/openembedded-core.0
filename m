Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BD8C369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:34:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.36743.1744403645453645498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q5BIgr6S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739525d4e12so2361026b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403645; x=1745008445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=we3BNMR7i6CgBbiytHEEC3qnPSOYJa/ilDDoChPn6bc=;
        b=q5BIgr6SdB4k/Q8zvVqZ7L71xGV6KRAKyf6piX3SWgplVyLi/bu5KlGQg24lmzJbbv
         NX2A8sTqGofLcSPPsoarYSHY9q5mqGFfqutdi8mq1Nv3ZQH7ebK+F9W/ltmTUuUkS6a+
         LUnD9E/xrzEVls8+3Ks3qSynNRDF6Wcqy+I9OMBncZE7f+rSvnS8GvpPVQfcVkEuOiFt
         A5mf9/knF33C0rSAkAYC9Ol6JxNqt7cTp/dk+5EJTbgeETl9VNnF+i8x5VYbKgT43CHn
         GmX9u/WgYyFs+lC666oYOWoiRC5IfMbUKFwP8xPfasTt94G7JLtzaYuYFpfFHnBKUXk2
         KqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403645; x=1745008445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=we3BNMR7i6CgBbiytHEEC3qnPSOYJa/ilDDoChPn6bc=;
        b=qkbs4wZ4YBrGFhN8XoKttRgdOVHiPUmvE5wstQGzfXUNHspSTR1f76lDK+9wPRwufo
         GRf2VkOw3QyQ8/gwMHJdw+yVyAwx8/rp3aJcsG7bTio96ZOFovdL9p1Zq/QRPJvXhNBr
         Dm+BI5XL9CL2qZLYHGMXhMV0fcf1woVNBWql4L2yk7AobcbCFvKiyOBPVnuujw6eS4Yt
         o1/MFcnPmlYn3ljVeB2gs13Pj2onZBFHA0UlE7egX+bk07Ws60MkM+EZbGYDSEy65VaH
         PDBbL61wSomWlHF30C4uTOr3p88cdN5d434T4NCnKtTtiGZk1G+YpM92UGGXpWx1ZNVE
         +HuQ==
X-Gm-Message-State: AOJu0YxRWbeiRfwt1h4oLJHxIyWW7YpTp2G0E6Kjxmby3UvZiExxPkMp
	EzYrTxNXAktTf2g0qhvjIlv2zne5Lfg9Vj4LO7hx7jTEusS6AYTEl/nm1wjxQQ5e/vWXEz4+sOU
	Y
X-Gm-Gg: ASbGncsz/XHH7uCT2Lc+Fd9q18q3+Sr1jdd8yeZndawqeqxskOKFj5a8qxH40/9+gAf
	MaC+Vk6f0FQZo1b9PhBukjMpBKtzJeEc9m+TMFsPlpcc9G6v1fBrC1r084OJHauf9WghFP72F1x
	+uv8xSCDhS05ZoI7JcMCDBpsAum9sQBLXPSEk+LoX796h91SxPbUkSLupsHqbQDQzWHP20acC0Y
	fPBlp96Vt/gSMb87nkpbPtChWY4jm7ZBDC9D/YEwiH/aQsHcL1v9+VB3OeYbKdqXgNNts+EicHo
	v+zoDWuMULobCDI635aGwXH6Z8WUcjfZ
X-Google-Smtp-Source: AGHT+IFIa9hNBrvv9qXr4x6YwKGtiNa3Hv8ryj5H3e4nvw+gFtFlInWom2lzMeAA7VQ6EReFxjlUGQ==
X-Received: by 2002:a05:6a00:2285:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-73bd1209efdmr5336933b3a.14.1744403644591;
        Fri, 11 Apr 2025 13:34:04 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.34.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:34:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] patch.py: set commituser and commitemail for addNote
Date: Fri, 11 Apr 2025 13:33:34 -0700
Message-ID: <9de38ac99c2b19f549c00ea5277faf621c6f4e65.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214761

From: Changqing Li <changqing.li@windriver.com>

When PATCHTOOL is set to 'git', and user don't setup
user.name and user.email for git, do_patch fail with
the following error, fix by passing -c options.
CmdError("git notes --ref refs/notes/devtool append -m 'original patch: 0001-PATCH-increase-to-cpp17-version.patch' HEAD", 0, 'stdout:
stderr: Author identity unknown
*** Please tell me who you are.
Run
  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 60a0cc8291..417333e431 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -462,21 +462,23 @@ class GitApplyTree(PatchTree):
         return (tmpfile, cmd)
 
     @staticmethod
-    def addNote(repo, ref, key, value=None):
+    def addNote(repo, ref, key, value=None, commituser=None, commitemail=None):
         note = key + (": %s" % value if value else "")
         notes_ref = GitApplyTree.notes_ref
         runcmd(["git", "config", "notes.rewriteMode", "ignore"], repo)
         runcmd(["git", "config", "notes.displayRef", notes_ref, notes_ref], repo)
         runcmd(["git", "config", "notes.rewriteRef", notes_ref, notes_ref], repo)
-        runcmd(["git", "notes", "--ref", notes_ref, "append", "-m", note, ref], repo)
+        cmd = ["git"]
+        GitApplyTree.gitCommandUserOptions(cmd, commituser, commitemail)
+        runcmd(cmd + ["notes", "--ref", notes_ref, "append", "-m", note, ref], repo)
 
     @staticmethod
-    def removeNote(repo, ref, key):
+    def removeNote(repo, ref, key, commituser=None, commitemail=None):
         notes = GitApplyTree.getNotes(repo, ref)
         notes = {k: v for k, v in notes.items() if k != key and not k.startswith(key + ":")}
         runcmd(["git", "notes", "--ref", GitApplyTree.notes_ref, "remove", "--ignore-missing", ref], repo)
         for note, value in notes.items():
-            GitApplyTree.addNote(repo, ref, note, value)
+            GitApplyTree.addNote(repo, ref, note, value, commituser, commitemail)
 
     @staticmethod
     def getNotes(repo, ref):
@@ -507,7 +509,7 @@ class GitApplyTree(PatchTree):
         GitApplyTree.gitCommandUserOptions(cmd, d=d)
         cmd += ["commit", "-m", subject, "--no-verify"]
         runcmd(cmd, dir)
-        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit)
+        GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, d.getVar('PATCH_GIT_USER_NAME'), d.getVar('PATCH_GIT_USER_EMAIL'))
 
     @staticmethod
     def extractPatches(tree, startcommits, outdir, paths=None):
@@ -654,7 +656,7 @@ class GitApplyTree(PatchTree):
             raise
         finally:
             if patch_applied:
-                GitApplyTree.addNote(self.dir, "HEAD", GitApplyTree.original_patch, os.path.basename(patch['file']))
+                GitApplyTree.addNote(self.dir, "HEAD", GitApplyTree.original_patch, os.path.basename(patch['file']), self.commituser, self.commitemail)
 
 
 class QuiltTree(PatchSet):
-- 
2.43.0


