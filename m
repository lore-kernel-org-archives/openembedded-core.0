Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EC4C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:45:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.48081.1680241536949799799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zabld/kj;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p34so12199382wms.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680241535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=Zabld/kjSGsWfGJ7FLbQrjopKG6lAUxV7biJdnH5RC4N4PiJB7D8TggzJR1xQJXCHO
         ah9Zi0COtHX1c2N9611IAnDOXgTEPHQ3YcAa22+ocKtVfa2/fC1gKxkiRuaP6aZZI5IP
         ZWN8UuoYmZZAryZ3EN1byBQ5l0Jr+nY9N3QM8IK4GVzGngTKEB7tAfBuxzkIKzfpcy9i
         bfmK9TFMKgTAG/xAWfz+FTZx8uuQasyjChYrYbd/Q3A3mlpaR/nn1Mo2vT3afMCixrry
         dUaxL5MaC6McNQE49QOwboEXlNv74UMDO0gsbeQYCCyaALA/IS4m5uveZG7Vr6PqsADP
         eEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680241535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q2b0TPXaHTFMvF4K3YVDuI9TJZiA28rwMBdM4p9jhj0=;
        b=RV51Wh4nspQhJYfWSqNKlC7qwtqqE6mFkT5RHCKL/ZvNOTKLWSNTVuz+JP9NQxqM+h
         WZMBurSLqsx889/3OdB8OlYVkqwsJESzaYqS4/mfq1IUQA4LWhclBYAzq2qRSSdkvqpR
         Tb3IbwSfoib1kGcfevVabZVCCthWHXoDOGX1/3YeSiEd9Ep0FKcwGVV/SHViiPuwc6Ll
         ewGEE4tppuiG+wBxyxezGMDge8pWGLEuRhXgmghAYv9zl+vAKZW3eoRu2weBReTBAmVZ
         fxVwZQ4bYQ9bsHdx++uhrQTjzn6tRPuNbUyYMI7Ya+Rqp+/jn4ZNIszTV+rSvV18/WiW
         dKpQ==
X-Gm-Message-State: AO0yUKXwxdka+Kx97ERP8v/ZOaYkLws5EK90+o5zbYlARnKcz0t40iJK
	BHbkDhk8eRo8p0MdtVIyuq/wcgC/5xQ=
X-Google-Smtp-Source: AK7set/bY0GCH/2Y1LB9nZ0oIopGMapqieDZ/huUns8ylGnmui1Ygqtve301s0cy8kaTTijmmK/4Vw==
X-Received: by 2002:a05:600c:b42:b0:3ee:6cdf:c357 with SMTP id k2-20020a05600c0b4200b003ee6cdfc357mr17798481wmr.20.1680241535040;
        Thu, 30 Mar 2023 22:45:35 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:72d4:654d:401f:66ef])
        by smtp.gmail.com with ESMTPSA id hg13-20020a05600c538d00b003ed793d9de0sm12664307wmb.1.2023.03.30.22.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:45:34 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kiernan@gmail.com
Subject: [PATCH V6 4/6] patch: support of git patches when the source uri contained subpath parameter
Date: Fri, 31 Mar 2023 07:45:25 +0200
Message-Id: <6f36bacf8683ca801ee1493233df9f717edf4794.1680238655.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680238655.git.frederic.martinsons@gmail.com>
References: <cover.1680238655.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179397

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


