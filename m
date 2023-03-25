Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7C8C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 09:01:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.17928.1679734863570675321
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 02:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXja2Ein;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id m2so3910210wrh.6
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 02:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679734862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7JKrauJL9LYEVQ3deOLTGqGpi0em4MLcoQ1kq2+gh8=;
        b=gXja2EinptRNW+U+02RTQt4+ERiS7wjB2ppNsbI+WKCrGNWYTOW7fxt2IS9GmsB4Gj
         blpvfA6JvLSsvxz3DEFOA0XOQ2rzCvI1tDbWPQbdTydtCO7vX5QfaXcdP5IR+VLjNh1t
         vJS15HwjOpfGlpDB3cKXKA4MTQs0a8HP6d3hOd01+s+twDZ5wJPNMG79ZqULv+LsJx+O
         kAKRo7yWYk+m+eKorCZziN7PGEL2S06nNETfxtPWEr+EVSd83AIR5Ox1dprUJoHYXGHo
         dzu0/DSqezVpKJEXLBocb/B2JqCnSiX1letYGoDVCdfc5CRuhk/CB2qvzH+LO4ylcBmk
         sM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679734862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7JKrauJL9LYEVQ3deOLTGqGpi0em4MLcoQ1kq2+gh8=;
        b=aQMqNGv75U8HvqHHoDT5bx+vDYZwghkJ56qTZHM7ALp4A2/qKZccaJbUTqvyoC91lr
         tTnYhAssrW0OXxGM1FFvpYcf2AFeOF7vrPvNpXCqO4hVv9kwqOakCuzQW5YDOki95zyS
         G9tp5dyItDFMMHCPVl4/oEzuG3jBlKqpdsDRN3eyMYqnbtpCBu1CLjMGZK5D51JYNyo5
         3bOmuUOVLYPSRzAR9RFXoG7aXphV3lqVfMMNalf4bDQcAuW4IePf8M0UMnA/rQp3I5sK
         1N1HbODOzkhfwNlkxsSoMygqonktirwpYKqVcG+DAjIV0JCeu28w300Cdk3lzG1p+Via
         i57A==
X-Gm-Message-State: AAQBX9cVo48Ya8K+ADEvKNo2jNxt4DFhonLTYs6EXR7TDJQPHTnf8Zln
	lSVng9L+k05rCNMpWna9Y/9bTEsktAw=
X-Google-Smtp-Source: AKy350ZvtnCk0xDx7+AEjTpqeR+bI2gWsQ2UO/04U10LXA0DAWa7+W3L7Q4ZJX1jJg1YRdGP/HGv6g==
X-Received: by 2002:adf:eb8c:0:b0:2ce:a8e9:bb3a with SMTP id t12-20020adfeb8c000000b002cea8e9bb3amr3978422wrn.4.1679734861655;
        Sat, 25 Mar 2023 02:01:01 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:a02e:c702:681f:71a5])
        by smtp.gmail.com with ESMTPSA id c16-20020adffb50000000b002c56179d39esm20226621wrs.44.2023.03.25.02.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 02:01:01 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH 5/5] patch: support of git patches when the source uri contained subpath param
Date: Sat, 25 Mar 2023 10:00:35 +0100
Message-Id: <b89768b016e793fb02feeebae2a8d334ef99b7f7.1679734210.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679734210.git.frederic.martinsons@gmail.com>
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 09:01:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179094

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This is for a specific case where:
  - A recipe use a subpath on a git repo (e.g. git://repo.git/projects;subpath=subproject)
  - The recipe contains a patch to apply
  - a devtool modify is used on this recipe

With these condition, the patch cannot be applied at all.
GitApplyTree class is used for handling patch under devtool, but
when subpath is present in SRC_URI, the resulting git tree
is dirty (every files and dir which was not in subpath are suppressed)
and so "git am" refuse to apply patches. That would not be such
an issue since the GitApplyTree have a fallback to PatchTree in case
of error, but during this error management, there is a git reset --hard HEAD
call which suppress the subpath operation and finally prevent
the patch to be applied even with PatchTree.

When devtool is not involved, only PatchTree class is used and the
above problem is irrelevant.

To support git patch during devtool, the presence of subpath and
the dirtyness of the repo is checked. If these both condition are
met , we simply fallback to PatchTree like it was already done
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


