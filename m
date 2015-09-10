Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 63A7874242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:53:13 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so20024377wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jkMy7+adI4tRiJVwz08vsq9+HHxmv081rNBWbW2SqXs=;
	b=tIdDRV5XrJeVxpjJVSMCjjShSFGoQFkMF9vv8w6sn4yKemoKmDIc9MJFYUbJ9WHcMX
	6iroSJ2b3IRKQCNo5Y+rKk7zo3aMX6uNeNGWUw6ECAs+eJWqC5WtbfjtLScvgUsZ/Mtf
	AcX9bpGGzLOi3OCgPJcogWHcFLalQpcGlDiEX/JufmdFoW/CQNqEoCZkU+ZeLt3etUOR
	GE8wEEnXpvAhfEEzs8B7bFdpQBJ0Q3YdtqDS4sOZhlYYb7rQOFwzqGOuk08OQ5A40kHA
	i2WWn9oiSnFjxzLDsI7/vYwT/PoDUKxHtmF3tOrh7gb3cuHNd3SdvGtjAEK1u37R8p4B
	Dj/A==
X-Received: by 10.194.92.166 with SMTP id cn6mr69681698wjb.6.1441885993982;
	Thu, 10 Sep 2015 04:53:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pu6sm15283320wjc.34.2015.09.10.04.53.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:53:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 13:54:09 +0200
Message-Id: <1441886051-18676-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [fido][PATCH 1/3] rootfs.py: Allow to override postinst-intercepts location
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
X-List-Received-Date: Thu, 10 Sep 2015 11:53:14 -0000

* useful when we need to overlay/extend intercept scripts from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/rootfs.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index e86480c..d2de2c6 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -114,6 +114,9 @@ class Rootfs(object):
         pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
 
+        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
+        if not postinst_intercepts_dir:
+            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
         intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
                                       "intercept_scripts")
 
@@ -123,8 +126,7 @@ class Rootfs(object):
 
         bb.utils.mkdirhier(self.deploy_dir_image)
 
-        shutil.copytree(self.d.expand("${COREBASE}/scripts/postinst-intercepts"),
-                        intercepts_dir)
+        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
 
         shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
                     self.deploy_dir_image +
-- 
2.5.1


