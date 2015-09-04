Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E832777038
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:21:59 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so20815417wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L49s2712aE31Mjh9c5gEPwERneDOjWN2oiPVLpKTejs=;
	b=JXAc4vuL9hH+EOHL9vFASajMt2Bnue50kk9KUZAHQnOhHa4oqHk1xwR69m/HPgduL2
	8mRJ8Ik32JnKQdOCGpKUgZgIx+9sJSxREN/nMMfBu0Ve82aC92R3OCcUw/hq9XjSowLR
	0BrHfeyCDGlhY6n6itZwbC5w6R9/u32I2rEfvEgSeNG4I+yvW+eVJdi+40xlObERLqNO
	6kHk2ZJTePGPcbVlcfuA8jpNrvwXeK/X1hS/Hpz3TBvL2z05orYAQ1U/q2P5R4vNM/u3
	qdnrui4ys4buQVsAqJClPo5wgJEMxABN1vQkUWjiY3M6K3F4/7KafKkfGw41PD0fHyEK
	WSTg==
X-Received: by 10.180.92.225 with SMTP id cp1mr6810734wib.2.1441369319330;
	Fri, 04 Sep 2015 05:21:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id uo6sm3799086wjc.1.2015.09.04.05.21.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 05:21:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Sep 2015 14:22:26 +0200
Message-Id: <1441369348-32182-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [RFC][PATCH 1/3] rootfs.py: Allow to override postinst-intercepts location
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
X-List-Received-Date: Fri, 04 Sep 2015 12:22:00 -0000

* useful when we need to overlay/extend intercept scripts from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/rootfs.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c29843b..76950ec 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -164,6 +164,9 @@ class Rootfs(object):
         pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
 
+        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
+        if not postinst_intercepts_dir:
+            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
         intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
                                       "intercept_scripts")
 
@@ -173,8 +176,7 @@ class Rootfs(object):
 
         bb.utils.mkdirhier(self.deploy_dir_image)
 
-        shutil.copytree(self.d.expand("${COREBASE}/scripts/postinst-intercepts"),
-                        intercepts_dir)
+        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
 
         shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
                     self.deploy_dir_image +
-- 
2.5.0


