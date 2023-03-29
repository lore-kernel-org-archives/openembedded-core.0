Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E340FC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 15:30:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.1034.1680103853991073604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 08:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=avb7QVBi;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id u1so9172398wmn.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680103852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=avb7QVBiwGYLBZ5PmNL4FjGFJwaLTesSaRfJTeTG0oxLd8eLlinOnkTYID3xkomC0D
         kJCebauMeTBfYFa+fEQjetvDeB26tehpGGvudpt0BRznJXrcZItieuwGjWpwZd0p76x4
         g+nwPa5KFP09IVLm3zU+eu2j5RNBOQFq84F84SsLbHshH06LeT7BAnkBxYws3kU3LHS9
         dsH882Z9d33FpohLY6xbbf9VR7U+xbzaISRCVSwJ5uIhfqIpRBK7h+iC30zNkrswX7X6
         H7UL4wxJ5QceERmlfNjMSrIWBeTBVKunI3E9UTWBL6XosFHNsG+LVAnNucIOVy6LIFMc
         Drcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680103852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=JQabBV3u7q7dg3BBe0MpvsH5d4g9OYocVIzt1DH+GRlWOVxPO+6O7EU1TdiBY3OUQM
         RdBCcsldaRN8jBo5fJN/SGelabTQvPTXtyE+ZfQYsbbYuf8RDJDirlJpwR4CS9j2viAC
         MJ0lDdLBQOlz2NvA2tjGMQAr2UFKZecUrqjeMQhzXuYabgKnMZca2ZBweUYdbuTcOBmt
         j9yVzvXc1+OkjK06ms9JUlVDTnYEksnRqogGuAMwT9LSv2wIo1TQp9sTRmTPZskD6HoC
         LguBnsDDG31ZHf38Rret26xlETJRdPQEKC4VlnHN0ykcSOCd3I0Ey2moyOuYMaVnrM8r
         AzAQ==
X-Gm-Message-State: AAQBX9e8UUCAZFosTzNJi/N73gCwT9U7Eb7ElStmBvovuS4ov5cXQSjF
	L7RTyN5XZJ2v/b57T2B+LfqENyUYtCE=
X-Google-Smtp-Source: AKy350Z4x/BOEZrqXPR/mN/bYIC8sOgDpFG0ht3qDz6HnFWTvgAjG+A2Lsmttff1MEpuZyxH1FQaVA==
X-Received: by 2002:a7b:cd98:0:b0:3f0:3c2:3fa4 with SMTP id y24-20020a7bcd98000000b003f003c23fa4mr2191489wmj.12.1680103852182;
        Wed, 29 Mar 2023 08:30:52 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:f236:1d99:4c31:5762])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c224d00b003edef091b17sm2607378wmm.37.2023.03.29.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:30:51 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V4 4/5] patch: support of git patches when the source uri contained subpath parameter
Date: Wed, 29 Mar 2023 17:30:33 +0200
Message-Id: <917c1245019b2f55e02422da93cef9ba03670a0a.1680103647.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680103647.git.frederic.martinsons@gmail.com>
References: <cover.1680103647.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 15:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179289

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


