Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A6CC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:12:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.29699.1679904763583701923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cKYM43KL;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id u1so4478665wmn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679904762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=cKYM43KLzwunJtRc4P94COzUqRrIp3jK6cXKAuPj5W1B6u8h4JiSFTOZjSThDDKTSk
         ofvP8jJq6XqD/jPovQxHCQqEyM3Hsw9VZQW2E2ZtmMqgVw2QsCS5is9aJDc/6cYUxQo/
         gDpU3IdEcYeNdKt2X69XmqxTXqqHnuto+iSGSAnpVkVUCKuvbDMNXlFNL+k7MFaJUR6x
         O4rmh0tzaBbfspnB52OwyKt5uChMA+gAYlFx8awtgyUBMT8dz7nYFAoI+VZuc1lo54lP
         4onwwI71WAojHDbWHdtdIiOSibFbQvuxYU/xPg4lXraVxSSTwnxPPu32B3apMhk40/9z
         pHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=NruveTPwhP3oUBek9KXJh02SPpebvpWd2hVdr/TT47wYWG3uuUwrD+1jRXy803XXdg
         8qWuLAmceD1z250Bb337zOWDFM376RGyvMS97ijuxqJylr1wiEyxmmlylNoYkEtMx6WU
         Lxa2IpvZ//d0wsq4yaHdx2GbRKCpQwEYvHHUCtPx2GuKeJhRZXBIH294qxSPGYp2RLnG
         defSQMl6noCzefljdgLp7n2BOTwGCajl+dqegd5ED2zqBidvxW9+B/1MIo7FYYQLkDsJ
         5TETQU5khxM8my//o/UqD4FsLCuWyfV6bF2Qxc2ACNZZL3JgxddUo9fu8swPHQZzMML8
         19OA==
X-Gm-Message-State: AO0yUKVjiPaqKrPvwKw9IpACCGkJ5yz9aRhw1HhmGr4CfnDIJRuVJ+Wn
	0szci/5Xa2D99Tj9hbtInZGyTiT01kY=
X-Google-Smtp-Source: AK7set9tMxAM6mnhMlCLexI3R5FrSrSm7OXAVPwvA1yW2Lj6ltkHGO+OPrGqBA3ZwkVyM6x9koPEQg==
X-Received: by 2002:a05:600c:2205:b0:3ee:8e3d:4b9d with SMTP id z5-20020a05600c220500b003ee8e3d4b9dmr8338743wml.30.1679904761725;
        Mon, 27 Mar 2023 01:12:41 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e313:787e:85a7:511b])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ef6708bc1esm6186380wmq.43.2023.03.27.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:12:41 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCHV3 4/4] patch: support of git patches when the source uri contained subpath parameter
Date: Mon, 27 Mar 2023 10:12:35 +0200
Message-Id: <855931994ea68c0691d0a67ce2ccad947e77229f.1679904677.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679904677.git.frederic.martinsons@gmail.com>
References: <cover.1679904677.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179144

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


