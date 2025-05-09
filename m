Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB2EC3ABD3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1407.1746804246148151727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ogyPx63T;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739525d4e12so2234891b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804245; x=1747409045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXshk84FRRfhZV6O4rFK66rhd7Qr392pbI8QxwZKq4s=;
        b=ogyPx63TXoPcWW1ex77zPbOxsGniYIvN6wQyk5MZwakJtXsAtaoag9N7SlkEcPs7xU
         HE6fM/AuCh0Naw7udLxCY8RQZmDhPechnQmDm2kEqmOWF6FlNQ+OUKdALulkoRYXhj2o
         AXilgdy/IVs6Do0Q60mlSsafqvdNRXBv5fQzkR2ybZagmCyojLvWZZf1bVJ2FpvTg1A4
         vet3DyZpUDJekDqNNIT8tGJlJCcJ51rLCudBLsOjr+zmeZLoO31hbY2sF8zpsBvmtoTi
         pjIZCXcpIGVL1wMSgn/6LHRzIupLUp9GAaAB2+WfkO5cJ8Y3O/3bBFHo05nVC1fbnzDa
         ZDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804245; x=1747409045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXshk84FRRfhZV6O4rFK66rhd7Qr392pbI8QxwZKq4s=;
        b=MZ+vqUzWFPGQp6HE5DPvVbjdL9ZZdCrwnUXQypyl5LjKN8Bw9NB8FYyBdb+dKHdv+6
         VbLHKAgeNm+Y2p6EeJIilc3JvLui0oGuFRXthj4+Iu/iEaY0Qtph5+XhokDG78EaWWcq
         ir+3vjDhWfvPiM3S5JzGv63iWIOtzJiFQNgDpfDKOOJFTDIi4ijzgQehEitUWlzxNRlr
         XNaS7+TJaOgCUxgbGouw6VYqY1iv0UuGIuNIe1Us0ZRjwtwbnul054IFYozXRhWZqss9
         7CRZvnVivPctbPXyi4gVBxA+IwsuA8pD5Ps6jNZaYEhJaSpCDmvY/OTW2mJsycva5Wd0
         8nww==
X-Gm-Message-State: AOJu0YxgmxpFqzt+2KcIW6iBfany/gdMrDmvNnnbhiFd83pv3PpQj2Vy
	q15lGHz3rD/A6fhAT6B8WE/38DjETcX8OhOjl7u+oNafotTF6C8RSfvQ80T5h2fZTsK+pGKZ/Sn
	G
X-Gm-Gg: ASbGncu/dQIwxNpJUGeeqnJhsoSbAaFpz/HuaYDPyfV0+XL68oBRfJmqIJFwCR1vGXv
	5haQdkSc3T/Ivgln7xmTPeqG8CW1eLbTgMUDVftp4jtN+5zneppMG/q8NL3UKOoBmZqCtVXtZ8G
	9sewTPg5INurOCsDupb9eNnYBs1sFg6aIAxB4g6foCEL7u53BXq2K4Kc+3LwtZA/1tv+mLzCKla
	Sotk7k2WM2k1ZTxKsxmtXx6NyxmwBnn6hWTpvx8hPBjqbakdfAVC6sXl8ZNIlNf8JCNDj3KxTPr
	UcL+fzSZIrUuo3ViOJhsv8an8AGETJdONz6+Hbs6a3g=
X-Google-Smtp-Source: AGHT+IEuP+9ZbdhTEyrkp823WWxQd/Y9CA2CGJJ65eZ7hlhoTcy7yjVPzNy9efpk9NEyeh/G+NlOzg==
X-Received: by 2002:a05:6a00:138c:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-7423bc1d5f4mr4920962b3a.1.1746804245384;
        Fri, 09 May 2025 08:24:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/17] patch.py: set commituser and commitemail for addNote
Date: Fri,  9 May 2025 08:23:25 -0700
Message-ID: <2d202462cf85e92cc18bc07cffdb0f335e524256.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216217

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 58c6e34fe8..edd77196ee 100644
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


