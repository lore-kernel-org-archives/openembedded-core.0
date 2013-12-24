Return-Path: <lpapp@archlinux.us>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 64D4260C08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 12:48:54 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so5963467wes.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 04:48:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=qCg8di0ISvmf5BgVALme7vK0YVfFMcS/PUE6/2/dPmM=;
	b=m0o6rqHqRigmsctYPm2HXB3JFZjhzwa+3WJI0AcnZkiLqbspy9WLuX13bhpIQWmnMN
	iWDUI2C942CWhs081o1EJhaQbC438+guYTOpKFGOR5y339N2K8r6UyfkHeoArJkI+sK4
	1mf8myx9fAxa06d3pVQJY6PdMf5EXYjOt+R764uQ8zSPfk5A5Kg+hwsWCGFHoc6Jwl24
	FZhiAN93tsqjkRu8TBR/WmY7xL3LLoeXyzkO74aEEsyam/BEmJ3Wq9o3HufRFLNmklOG
	wRvlJr2KOkYQmDYzQ7QJyd2arhXTobHA8TniGJ4qdNd73JdnED6zj7Z9LkGRWFMatJcU
	v0iA==
X-Gm-Message-State: ALoCoQkVCPp7dZWN3qYn7zlETf9iW2kkahC+2JbT2XpKvwMTgyr5la3Y/n41qnHuDyRKXKHcB3Xi
X-Received: by 10.180.189.6 with SMTP id ge6mr22570003wic.1.1387889334470;
	Tue, 24 Dec 2013 04:48:54 -0800 (PST)
Received: from lpapp@archlinux.us (mail.polatis.com. [212.44.19.228])
	by mx.google.com with ESMTPSA id
	jw4sm12346307wjc.20.2013.12.24.04.48.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Dec 2013 04:48:53 -0800 (PST)
Sender: Laszlo Papp <lpapp@archlinux.us>
Received: by lpapp@archlinux.us (sSMTP sendmail emulation);
	Tue, 24 Dec 2013 12:44:12 +0000
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Dec 2013 12:44:10 +0000
Message-Id: <1387889050-25592-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.5.1
Subject: [PATCH] lib/oe/patch.py: Prefer "git am" over "git apply" when applying git patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Dec 2013 12:48:54 -0000

It is better to use "git am" when possible to preserve the commit messages and
the mail format in general for patches when those are present. A typical use
case is when developers would like to keep the changes on top of the latest
upstream, and they may occasionally need to rebase. This is not possible with
"git diff" and "diff" generated patches.

Since this is not always the case, the fallback would be the "git apply"
operation which is currently available.

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/lib/oe/patch.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 59abd0a..b085c9d 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -203,17 +203,23 @@ class GitApplyTree(PatchTree):
         PatchTree.__init__(self, dir, d)
 
     def _applypatch(self, patch, force = False, reverse = False, run = True):
-        shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+        def _applypatchhelper(shellcmd, patch, force = False, reverse = False, run = True):
+            if reverse:
+                shellcmd.append('-R')
 
-        if reverse:
-            shellcmd.append('-R')
+            shellcmd.append(patch['file'])
 
-        shellcmd.append(patch['file'])
+            if not run:
+                return "sh" + "-c" + " ".join(shellcmd)
 
-        if not run:
-            return "sh" + "-c" + " ".join(shellcmd)
+            return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
-        return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        try:
+            shellcmd = ["git", "--work-tree=.", "am", "-3", "-p%s" % patch['strippath']]
+            return _applypatchhelper(shellcmd, patch, force, reverse, run)
+        except CmdError:
+            shellcmd = ["git", "--git-dir=.", "apply", "-p%s" % patch['strippath']]
+            return _applypatchhelper(shellcmd, patch, force, reverse, run)
 
 
 class QuiltTree(PatchSet):
-- 
1.8.5.1


