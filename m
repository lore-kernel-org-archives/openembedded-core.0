Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 24EB973243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 11:52:45 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so21679023wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4Wvot44GwqXMmdUyD1fR1djqMOjtyKTToZ+Fq9OJlOo=;
	b=r6DFZ+Yth+SYZF1x4Wb4rtpTT+4sL3alDM2RbL2EiO/anGvPdhNYVuXGZH/T8CZdBr
	UyVU9On9MrT3BHu/IxSQgUeyerffqwpHDf2f6QdLVwKTbhkJgk14gJsxjgv78yKVrW9T
	8RcsDSeepk+b/qrXqmf48lJeN+KzrD19E8YmWC/XHrG/F6PpQ/zhAjvo+RHW6uSIU7wn
	W9a7+f28Rv85gWP4wPcXKi0uTTexOqXIXyyb5jEI0A+fxlV2EBWGvu2cEzxWO6qNEyi4
	4GR57Crdtmq2o0UTq4Jy4pb98/fA7xND+qllpPrY8o//PceDu0xKpJvgFXNlK7cwUPMa
	urGA==
X-Received: by 10.180.106.4 with SMTP id gq4mr5768298wib.42.1441885965370;
	Thu, 10 Sep 2015 04:52:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id y15sm8934362wib.7.2015.09.10.04.52.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 04:52:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 13:53:28 +0200
Message-Id: <1441886010-18631-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [dizzy][PATCH 1/3] rootfs.py: Allow to override postinst-intercepts location
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
X-List-Received-Date: Thu, 10 Sep 2015 11:52:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* useful when we need to overlay/extend intercept scripts from oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/rootfs.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c4735f2..bbc37d3 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -77,6 +77,9 @@ class Rootfs(object):
         pre_process_cmds = self.d.getVar("ROOTFS_PREPROCESS_COMMAND", True)
         post_process_cmds = self.d.getVar("ROOTFS_POSTPROCESS_COMMAND", True)
 
+        postinst_intercepts_dir = self.d.getVar("POSTINST_INTERCEPTS_DIR", True)
+        if not postinst_intercepts_dir:
+            postinst_intercepts_dir = self.d.expand("${COREBASE}/scripts/postinst-intercepts")
         intercepts_dir = os.path.join(self.d.getVar('WORKDIR', True),
                                       "intercept_scripts")
 
@@ -86,8 +89,7 @@ class Rootfs(object):
 
         bb.utils.mkdirhier(self.deploy_dir_image)
 
-        shutil.copytree(self.d.expand("${COREBASE}/scripts/postinst-intercepts"),
-                        intercepts_dir)
+        shutil.copytree(postinst_intercepts_dir, intercepts_dir)
 
         shutil.copy(self.d.expand("${COREBASE}/meta/files/deploydir_readme.txt"),
                     self.deploy_dir_image +
-- 
2.5.1


