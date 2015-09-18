Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 489FD7687B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:13:28 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so61846000wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=33P7tiHSY4VCEViR45C4hOqelQOg+6Zz421Z74rZ0to=;
	b=KrdAaYsfjVxp0JNjDTq3cfMaXAnfAQCRXFQHqX4zIPUjmLTBe3GgVrcgjWYGC3slzh
	UPfkghTvAm9io7xI5NZqZN8miMfyLHzaJD1i8JCltWIQXgwNDNzLVZNxPyU0wXpJ0uVL
	LSdqpA9p7xG6zFRcMh3G3Jryf0lm2RHsoJkujHkWaMWObHLiHBhvlYaDOcsn3eo1wgXf
	rOkCtXh67T0QGdHs1dkKWGBJNL1GRcyGy7DDG39WUBzD45LokACU4DMTryCh8ZDbZTuK
	QK+KOP8QNCaS8cywemQvrmTygsD4ldHsYVxkYmOs2+yyvfbQJJOdkY2wjI4ZxLqPm3Xk
	M7jA==
X-Received: by 10.180.87.230 with SMTP id bb6mr15615903wib.26.1442578407944;
	Fri, 18 Sep 2015 05:13:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb5sm8596786wjc.17.2015.09.18.05.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:13:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:13:46 +0200
Message-Id: <1442578427-27210-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH][fido 1/2] perf: mkdir ${B} -> mkdir -p ${B}
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
X-List-Received-Date: Fri, 18 Sep 2015 12:13:28 -0000

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
index e7ddfff..9982589 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -118,7 +118,7 @@ do_install() {
 do_configure_prepend () {
     # Fix for rebuilding
     rm -rf ${B}/
-    mkdir ${B}/
+    mkdir -p ${B}/
 
     #kernels before 3.1 do not support WERROR env variable
     sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
-- 
2.5.1


