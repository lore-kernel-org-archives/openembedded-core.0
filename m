Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EC1CCA482
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 04:07:07 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.5207.1657598821390046397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 21:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JXCRVPWu;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id C6FAE204CB5C; Mon, 11 Jul 2022 21:07:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C6FAE204CB5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657598820;
	bh=Dw/w1fAABMixqkfLnlUucp5Xppakthvovwx4I61Ms50=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JXCRVPWuZbsAUur8A5/ZCtx5OYsnKEGPeRWTFD24alxGZyWRNnKMgEm8lzqSeAwkT
	 Hnlq+ZOtZ6Tfpg/lF6uAsbLjoILxE+FPkp0qsc0Dm1NdM5MT4KuaK+wcLItIofhms6
	 Thy+uVwmfuJlJtowvSUzHcjy+IY8H4THLkgUsXTw=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] patch: handle if S points to a subdirectory of a git repo
Date: Mon, 11 Jul 2022 21:06:54 -0700
Message-Id: 
 <04db4145740ed4572d2b13582b7ad1d439b7d0dc.1657597513.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
References: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 04:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167891

From: Paul Eggleton <paul.eggleton@microsoft.com>

If PATCHTOOL = "git", SRC_URI fetches from a git repo and S points to
a subdirectory of the checked out sources, then we were erroneously
initialising the subdirectory as its own git repo. Check if the returned
top-level repo directory is a subdirectory of WORKDIR and do not
run initialise the source directory if that is the case.

(This was a regression introduced with OE-Core revision
6184b56a7a0fc6f5d19fdfb81e7453667f7da940, however we didn't have a test
that verified the behaviour.)

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 meta/lib/oe/patch.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 95b915a..4ec9cae 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -299,10 +299,10 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
         self.commituser = d.getVar('PATCH_GIT_USER_NAME')
         self.commitemail = d.getVar('PATCH_GIT_USER_EMAIL')
-        if not self._isInitialized():
+        if not self._isInitialized(d):
             self._initRepo()
 
-    def _isInitialized(self):
+    def _isInitialized(self, d):
         cmd = "git rev-parse --show-toplevel"
         try:
             output = runcmd(cmd.split(), self.dir).strip()
@@ -310,8 +310,8 @@ class GitApplyTree(PatchTree):
             ## runcmd returned non-zero which most likely means 128
             ## Not a git directory
             return False
-        ## Make sure repo is in builddir to not break top-level git repos
-        return os.path.samefile(output, self.dir)
+        ## Make sure repo is in builddir to not break top-level git repos, or under workdir
+        return os.path.samefile(output, self.dir) or oe.path.is_path_parent(d.getVar('WORKDIR'), output)
 
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
-- 
1.8.3.1


