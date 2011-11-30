Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVmPy-0000VQ-M9
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 16:49:54 +0100
Received: by eaad13 with SMTP id d13so834567eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 07:43:10 -0800 (PST)
Received: by 10.213.33.75 with SMTP id g11mr520238ebd.2.1322667789826;
	Wed, 30 Nov 2011 07:43:09 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 8sm7327803eei.8.2011.11.30.07.43.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 07:43:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 16:43:04 +0100
Message-Id: <1322667784-23451-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [Proof of concept] patch.bbclass: add incredibly naive 'git am' mode
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 15:49:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/patch.bbclass |    1 +
 meta/lib/oe/patch.py       |   14 ++++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index ac6c1ce..9f99e38 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -18,6 +18,7 @@ python patch_do_patch() {
 		"patch": oe.patch.PatchTree,
 		"quilt": oe.patch.QuiltTree,
 		"git": oe.patch.GitApplyTree,
+		"gitam": oe.patch.GitAmTree,
 	}
 
 	cls = patchsetmap[d.getVar('PATCHTOOL', 1) or 'quilt']
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f4ccb3e..06965ba 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -176,6 +176,20 @@ class GitApplyTree(PatchTree):
 
         return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
+class GitAmTree(PatchTree):
+    def __init__(self, dir, d):
+        PatchTree.__init__(self, dir, d)
+
+    def _applypatch(self, patch, force = False, reverse = False, run = True):
+        shellcmd = ["git", "am"]
+
+        shellcmd.append(patch['file'])
+
+        if not run:
+            return "sh" + "-c" + " ".join(shellcmd)
+
+        return runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+
 
 class QuiltTree(PatchSet):
     def _runcmd(self, args, run = True):
-- 
1.7.2.5



