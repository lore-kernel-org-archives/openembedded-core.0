Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6069EC77B6F
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 09:31:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.17485.1680341459670201935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 02:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OLEM5ogS;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id q19so21627111wrc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 02:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680341458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=OLEM5ogSf3wroX1sSJAi6hD5hwPCOXhdWLLh2lJFkNzI2tvAY9+IFkpsLn9fa7M6S/
         avgbr0WjAbkXvCUaMOYX/fn0lF0tB1v0bh5lPCO805fa4rzbGKj0gwz2LJY6ngY4cvss
         IGX9g3HrOlXB1SyvbYit3AT66fPfUk+zm1bOLBGFZ+AlnRVgbzEZFdS/6EljnZkEqWt5
         1M/68In4/nSERRD5ChX51MjuDRGQCbUMvALHvdynEI0IZxNU/mMZnetNJdy//3EQK9Uv
         pg0H7pB2CoQrJ1BvApOeewf+ANMqqO5I8ZXbs1YxHQCnuEbyM7Xu/xn43JkFv4/3myIF
         8N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680341458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=Bq8QAzxRHOnnf/v5tiueF7QrH4OA2YJ5x+pmaRg+Hu5C5w3b8cuC5QU+UZI8+Za3xX
         tphk35NqFirjpm89hO/+t/Csmw4Xl40GTgzXDPqrDQGb8php5yDvZBPE7IX+HPfu1lB+
         6YZzsojF03wlNa08tp95c+eTbK7TaJLK1LireDzZRDapYnPkQjG0YwOM/dm0winaoXMS
         ElNXt8MZR0k+8kp5I4xT1m8fFlIXzXu6ABRCFSznToR6cHo4hm9yoBBsm6DSaQnNX3nm
         7Ef8faRPi5Ryy9paLcfH94NZxt8cYr8lVdTF2wlxXGW8+iyPRxwqjMonNZ14uXQMo8I1
         Y6Ug==
X-Gm-Message-State: AAQBX9dlLnoHJru7YcpBdaKKoeHXKcR/G4R1B3Ale9p1wvGRdWpk/6ZE
	GieY0HdIPciPpEpfX1PPCQ+gOwIRjuk=
X-Google-Smtp-Source: AKy350blVphZZCY3TXDj2FFrs/lhxIWOnAhcXDKsyhLIUs/sA2L+00+xdXzWvl24RwmwcuWEXXehXg==
X-Received: by 2002:adf:e405:0:b0:2cc:1935:1ae8 with SMTP id g5-20020adfe405000000b002cc19351ae8mr22304871wrm.47.1680341457617;
        Sat, 01 Apr 2023 02:30:57 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:eb6d:89c5:4fce:e824])
        by smtp.gmail.com with ESMTPSA id p11-20020a5d4e0b000000b002e71156b0fcsm1522232wrt.6.2023.04.01.02.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 02:30:57 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: [PATCH V7 4/6] patch: support of git patches when the source uri contained subpath parameter
Date: Sat,  1 Apr 2023 11:30:49 +0200
Message-Id: <948e193f5bc70bba830ddf410256dd13e8a234fb.1680340685.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680340685.git.frederic.martinsons@gmail.com>
References: <cover.1680340685.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 09:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179463

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


