Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7350CC77B6E
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:45:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.29131.1680191104176573485
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LUjiHEOD;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id i9so19566474wrp.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680191102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=LUjiHEODK4sGQUECt6ayv8gcdQcC+QrVovEWyg6p7uCwGE+Q5Sl8D17zrkSGe4Zzl2
         oihJDcogKM8b61h53z6f/FJeboaEqh88k/yiCWhduC9E9Y7/7lSnMo++AVvQn+hn1EIu
         aD6AYBKDSFhcDNTnn9EsOjLh9tNumsaNvJLGieIkDG4SjiRJEXkxFXievJVgPzwZ9EoA
         J6CgTrlghiEj2RJCPFdXVH3V45SgWWdM030+gdm4Hd7pkI7rM4MtHQRAGsX+Z6hQguKD
         Vqb4VWdnwdeNzADl1VAQNp05YZnNg1GritE5SpmiCtSICb7OItwJHEvmhKsWCpv9t/lp
         bN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680191102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=yj47sUD0FulMvS67IdIXFte5ZpBXDtHgAfpuGY6D4gvQWfYddMvvhTPpS2q9m3ZyB/
         otejENExme5JTfDat/aTiLRUs7Vq/hBIITkcv2jQUy/jRoUBVFhisAJr2B7pSL+wm6Za
         nHDgZjBxWxOJM/sTBU1BKQnj6tgH0wIGR6voluPsWHm52RdZkBzkY3K+q6OB6/Rd6t7a
         ZixlN6UAlXZHYU9n7UcBofGCx0tD6OnoWZr38gp2h9Pzg4a0CsHVezFIABr6CpZV9lZo
         /c7ZexrwHgG2wJXWngB8RZR68paEzYGQURraiaXRIJ/NejAleNqowfXB4hv5TqFNJ69K
         ajxA==
X-Gm-Message-State: AAQBX9ff1KPNXWOm+hCsbGpamUs/FsQkcFElWM4SEcQ3vdIg8pjeYgYn
	DchfUY4nXuuDHlvHtQ2K/yGEAVjbhuI=
X-Google-Smtp-Source: AKy350bW/fJjVTt0wxog5gggZdHUbsbTi5Ey2kmJH9H05hwFQAGVcCChHF9QKOgHBezViu0gNYGRcA==
X-Received: by 2002:a05:6000:101:b0:2e4:506c:6483 with SMTP id o1-20020a056000010100b002e4506c6483mr2992313wrx.48.1680191102254;
        Thu, 30 Mar 2023 08:45:02 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:c898:b1f6:d5c7:39c5])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm33151056wru.89.2023.03.30.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:45:01 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V5 4/6] patch: support of git patches when the source uri contained subpath parameter
Date: Thu, 30 Mar 2023 17:44:51 +0200
Message-Id: <6f36bacf8683ca801ee1493233df9f717edf4794.1680190966.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680190966.git.frederic.martinsons@gmail.com>
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179341

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


