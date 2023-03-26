Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F4CC6FD1C
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 14:56:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.11692.1679842581838291310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 07:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KfIycqlK;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id s13so3608900wmr.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679842580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=KfIycqlKPJZAF3q3iOt64kWx06BHDMceHGPR9HeBPC6sG3lKX3KgmflP6gJRAuwa7z
         8ppk9GxFJvvD/uy1S4L6OODW4c6xsZUr0KXuohwg+r1SQGBy4K7quyyowBR4ytqSPr6k
         6RZ2zgrl5qAFCgVmVROFFX1cG63KOjr6U29cq1GbbkUi68Z3DXxl21h3Mz9eiEqr1ofD
         e6HsqsiyWcxu448207G1Appjb1H58ztyz5SRtJbSqzYN0MM9KoQhigMMckaqXdRCFCKs
         IepMRIQCLuH3mAWNnN5ymhCCyw+JC3in/oHa4XZOojYOlnHA3ZzRNPRPmsh2H0v2Jd+W
         pnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679842580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=LGf3VrQNCnUidjYsA09FVFysN1qQS1Atb05z7FJ1o2IZmKr6tIIBKjc1rIezEbQEWc
         8hHDt2v1g4WzXcuJMpY7jke7ybi6POXNq+aXDrbXGc5pSIqzbfaKT2McAo6lfPovB2n6
         Ni/mHxFeOPw8r1LLlS30BJ7t8954ohj3d29bm82fTgbBPRXAQjjRBrEAc4WRCx9CiDGT
         cRiLa17OLE2ZM60zGWbmUX7AZUUg0cWSsJFnBsENiEn+S7s6rVoa1tdBXpeXqgYrfqOx
         +swNJVmU71Q5t9UCR2L692mv+1mM49+4E28h9KAtyNZV6eCvoUal3BLM2upmNUCM65W6
         kwHQ==
X-Gm-Message-State: AO0yUKUi297OmSTrxM51GMx9FDvklB6HuXEFWBgJ73B7zavZ321WQhTl
	+LHmC0ZPGJXjvGxIOxQZiJbo8/wzfEQ=
X-Google-Smtp-Source: AK7set/MmqQN5sbz9xWVNoZvoh7aMfmdRUz839GWh+3LtGUyyRG1obD5PiLLWt3J+yVxP5bSNNt4nw==
X-Received: by 2002:a1c:4c19:0:b0:3ee:96f0:ea31 with SMTP id z25-20020a1c4c19000000b003ee96f0ea31mr7029751wmf.18.1679842580029;
        Sun, 26 Mar 2023 07:56:20 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:af58:462f:1cbf:cab5])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee63fe5203sm10797549wmm.36.2023.03.26.07.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 07:56:19 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV2 5/5] patch: support of git patches when the source uri contained subpath parameter
Date: Sun, 26 Mar 2023 16:56:03 +0200
Message-Id: <75b47f5819c08719147f3d0d39be8e92c77310c3.1679842454.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679842454.git.frederic.martinsons@gmail.com>
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 14:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179126

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This is for a specific case where:
  - A recipe use a subpath on a git repo (e.g. git://repo.git/projects;subpath=subproject)
  - The recipe contains a patch to apply
  - a devtool modify is used on this recipe

With these conditions, the patch cannot be applied at all.
GitApplyTree class is used for handling patch under devtool, but
when subpath is present in SRC_URI, the resulting git tree
is dirty (every files and directories which was not in subpath are suppressed)
and so "git am" refuse to apply patches.

That would not be an issue since the GitApplyTree have a fallback
to PatchTree in case of error, but during this error management,
there is a "git reset --hard HEAD" call which suppress the subpath
operation and finally prevents the patch to be applied even with PatchTree.

When devtool is not involved, only PatchTree class is used and the
above problem is irrelevant.

To support git patching during devtool, the presence of subpath and
the dirtyness of the repo are checked. If both conditions are
met, we directly call PatchTree like it was already done
in case of error during git apply.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/lib/oe/patch.py | 57 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index b2dc8d0a90..d047b3b947 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -499,6 +499,36 @@ class GitApplyTree(PatchTree):
         finally:
             shutil.rmtree(tempdir)
 
+    def _need_dirty_check(self):
+        fetch = bb.fetch2.Fetch([], self.d)
+        check_dirtyness = False
+        for url in fetch.urls:
+            url_data = fetch.ud[url]
+            parm = url_data.parm
+            # a git url with subpath param will surely be dirty
+            # since the git tree from which we clone will be emptied
+            # from all files that are not in the subpath
+            if url_data.type == 'git' and parm.get('subpath'):
+                check_dirtyness = True
+        return check_dirtyness
+
+    def _commitpatch(self, patch, patchfilevar):
+        output = ""
+        # Add all files
+        shellcmd = ["git", "add", "-f", "-A", "."]
+        output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        # Exclude the patches directory
+        shellcmd = ["git", "reset", "HEAD", self.patchdir]
+        output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        # Commit the result
+        (tmpfile, shellcmd) = self.prepareCommit(patch['file'], self.commituser, self.commitemail)
+        try:
+            shellcmd.insert(0, patchfilevar)
+            output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        finally:
+            os.remove(tmpfile)
+        return output
+
     def _applypatch(self, patch, force = False, reverse = False, run = True):
         import shutil
 
@@ -534,6 +564,19 @@ class GitApplyTree(PatchTree):
         shutil.copy2(commithook, applyhook)
         try:
             patchfilevar = 'PATCHFILE="%s"' % os.path.basename(patch['file'])
+            if self._need_dirty_check():
+                # Check dirtyness of the tree
+                try:
+                    output = runcmd(["git", "--work-tree=%s" % reporoot, "status", "--short"])
+                except CmdError:
+                    pass
+                else:
+                    if output:
+                        # The tree is dirty, not need to try to apply patches with git anymore
+                        # since they fail, fallback directly to patch
+                        output = PatchTree._applypatch(self, patch, force, reverse, run)
+                        output += self._commitpatch(patch, patchfilevar)
+                        return output
             try:
                 shellcmd = [patchfilevar, "git", "--work-tree=%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self.commitemail)
@@ -560,19 +603,7 @@ class GitApplyTree(PatchTree):
                 except CmdError:
                     # Fall back to patch
                     output = PatchTree._applypatch(self, patch, force, reverse, run)
-                # Add all files
-                shellcmd = ["git", "add", "-f", "-A", "."]
-                output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-                # Exclude the patches directory
-                shellcmd = ["git", "reset", "HEAD", self.patchdir]
-                output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-                # Commit the result
-                (tmpfile, shellcmd) = self.prepareCommit(patch['file'], self.commituser, self.commitemail)
-                try:
-                    shellcmd.insert(0, patchfilevar)
-                    output += runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
-                finally:
-                    os.remove(tmpfile)
+                output += self._commitpatch(patch, patchfilevar)
                 return output
         finally:
             shutil.rmtree(hooks_dir)
-- 
2.34.1


