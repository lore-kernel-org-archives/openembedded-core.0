Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 43E2877024
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:15:00 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so28468976wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Th9+oSGGjytlPYXQrIOGvtf//JB/aX8ppo6fCtvwahg=;
	b=fIrtm8MaaKpuRQy8W0RPCiuC1p1TCiUi0/hBOSJEJLv/5WulqnTVVobi0og7kphq3S
	jX83BX5M9/y7BuT8PZBq/T+pYURzNZefRzkaA9PQGNW6hR+hML4V+UeFVoCeILh1Rclj
	Oxa8L1vKeXNjixzRBK2ZxMmWTZRPcPZvKVBt4guQeaEsSkj1cbYXzfSUieFEhV7mJZlN
	DmoVVFjohvbkE2cqOlLuzyG5ozaMoBTIvftPxoM7EsQtycozB3Kwmkefv1CvGLr1QsY1
	bccw8o2GcZYdiSzhUowHfohtzn1uGbOZHSE1x2o0gFNzq1vn2bPpkwB9CDlL4YlJP/Of
	2fjg==
X-Received: by 10.194.109.226 with SMTP id hv2mr6560739wjb.99.1442578500050;
	Fri, 18 Sep 2015 05:15:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id s9sm8599172wjy.16.2015.09.18.05.14.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:14:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:15:19 +0200
Message-Id: <1442578520-28019-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH][dizzy 1/2] perf: mkdir ${B} -> mkdir -p ${B}
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
X-List-Received-Date: Fri, 18 Sep 2015 12:15:00 -0000

From: Robert Yang <liezhi.yang@windriver.com>

${B} is the default cwd of tasks, so there might be race issues such as:
| mkdir: cannot create directory `/path/to/work/qemux86-poky-linux/perf/1.0-r9/perf-1.0/': File exists
[snip]
NOTE: recipe perf-1.0-r9: task do_configure: Failed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 1f1f552..cf75918 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -119,7 +119,7 @@ do_install() {
 do_configure_prepend () {
     # Fix for rebuilding
     rm -rf ${B}/
-    mkdir ${B}/
+    mkdir -p ${B}/
 
     #kernels before 3.1 do not support WERROR env variable
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
-- 
2.5.1


