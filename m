Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 99C0A6148C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 17:39:32 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hj6so208838wib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 09:39:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TgvmGkO3nJQfI7T+06c0vjCKQFWTB4M9Qb/hz3NsGTo=;
	b=lzwR8ga7IjabfLuoEApI7yQr3ezydWRCUpFqzfYAtxslugiRqfU6s9EYEHU4GW6ZRY
	3XTxJkbWeRV752ap2BoL4vDK/yXBhikQ9qmEY+6kJsX1yJRYis5rp5jUL/MPuwJXxi2y
	7Mr110yTshBxL3AzoDbgaap9DE+7KD0H6rlvliy4hZSkinLnCLQrMsRxhFmxecRN0LiA
	a+quBIjOB5sNLDgwU0058e/gt1oVJpMwDNe6q3NXytyNtyLY3V9kMDqoVp0RYVvipo3q
	k8OqZl7yPepVvcJACRInjcZRZd3TtW2rbftf2uIMN11J/1p94DAD/PGivKwP1OQ2h6hg
	tiXQ==
X-Gm-Message-State: ALoCoQkSdz5skMDjTM5AyeOECuOjgwtxt+J/DFQ4qTI2XAr/NZcSnGLNyz+sI3b4QqFxyBaMxaJn
X-Received: by 10.180.198.170 with SMTP id jd10mr2893659wic.65.1384796373880; 
	Mon, 18 Nov 2013 09:39:33 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	eu11sm26140789wid.10.2013.11.18.09.39.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 09:39:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2013 17:39:29 +0000
Message-Id: <1384796370-8899-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] combo-tool: simply branch/commit validation logic
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
X-List-Received-Date: Mon, 18 Nov 2013 17:39:33 -0000

Simply the branch/revision logic by using git-merge-base.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/combo-layer |   13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index ae97471..2c8ba07 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -283,23 +283,14 @@ def drop_to_shell(workdir=None):
 
 def check_rev_branch(component, repodir, rev, branch):
     try:
-        actualbranch = runcmd("git branch --contains %s" % rev, repodir, printerr=False)
+        mergepoint = runcmd("git merge-base %s %s" % (rev, branch), repodir, printerr=False).rstrip()
     except subprocess.CalledProcessError as e:
         if e.returncode == 129:
             actualbranch = ""
         else:
             raise
 
-    if not actualbranch:
-        logger.error("%s: specified revision %s is invalid!" % (component, rev))
-        return False
-
-    branches = []
-    branchlist = actualbranch.split("\n")
-    for b in branchlist:
-        branches.append(b.strip().split(' ')[-1])
-
-    if branch not in branches:
+    if mergepoint != rev:
         logger.error("%s: specified revision %s is not on specified branch %s!" % (component, rev, branch))
         return False
     return True
-- 
1.7.10.4


