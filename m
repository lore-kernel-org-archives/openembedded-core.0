Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9966004D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 20:50:10 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t22so3543452pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zl5143rxrym+K3rVfcxwCvkgIQ1d9IxqPQgArV5zBKk=;
	b=c3uKBLl378AOGFmboay3i+ODcS0HpNXGzGLVu2wYwFUn8ArvrnCftPgpTMTS9vY542
	Yr2g0LN8RHhv/RDzq0K8AB2Ss53Q4p3Y8gTJ89IckL351JBqjnmJ/HTNIWIToIQtUS4j
	yRTH8vDy0E0163YZN4si7L0Hva9rUsIJsj6j5YYccEhzuaArOCXEhGZcwclXD7ud2lB+
	wCy6YPwcyr7wYRizBNfp9wASU3x26c2KpPLoS3DCPANicbVsN0PV5apbEpQFMx/Qef2+
	f2t4cRSbPCXYuK7umSMO5zma5tjmhEy7kh3p6QNXxSdlGuRfQEPc19RtXZg4mymbw9wf
	pwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zl5143rxrym+K3rVfcxwCvkgIQ1d9IxqPQgArV5zBKk=;
	b=X3sH8Sg5aBDz6RtGKartSeicChSy9IWuPDz+7QfM53UUU7T5syuBf2VEpZmsack0qc
	8nRzEpGoGi7gr+6KdFPdZxTm2SAw/NN+lO5yoQSTbRUJLRJ9uCzgD/GYena3gY06Jpv/
	Mk9YPo/lK30f2odcNGHdeEfqkOIsoIsocVH3l0Wt4lmr+Eo6VD+N5/wxq4BGIbLevg8T
	N5xHK0iPrkZMbPsdvr3zyl1s22z0AtyFwGBqfIo8YAI79ro8kl9vFzADNEAjKmwDcX0i
	Y3zDlDbFsdDqdriwJ5JYeldnU0zlkxK7xjt+bI8itTf/j0S6vPy8m0XGIHAgBMCC+zvt
	ur2Q==
X-Gm-Message-State: APjAAAV7OunZYhmNsXTm+FnqA6SjJhxhogRDX2tkUoFqeZylBnm0cAQ2
	q9N6TBazK6i20NEENMZmADull7uTfmg=
X-Google-Smtp-Source: APXvYqwtfAPH5mAj+OpnYUhfMNnynEmc21048hj7kRkdCLP/rIhvKWwFcVkGX6O4VLM+SVkg2JqHGg==
X-Received: by 2002:a63:e417:: with SMTP id a23mr15806676pgi.224.1557521410806;
	Fri, 10 May 2019 13:50:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::592a])
	by smtp.gmail.com with ESMTPSA id l1sm7477044pgp.9.2019.05.10.13.50.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 13:50:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2019 13:49:53 -0700
Message-Id: <20190510204954.33591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] mmc-utils: Fix build with clang
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
X-List-Received-Date: Fri, 10 May 2019 20:50:10 -0000
Content-Transfer-Encoding: 8bit

clang has more warnings to report, lets fix them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tra-braces-when-initializing-subobje.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/mmc/mmc-utils_git.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
new file mode 100644
index 0000000000..12707357b2
--- /dev/null
+++ b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch
@@ -0,0 +1,32 @@
+From 04fbe6ddb5f1e02efbcae3cdf5beb16757a98948 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 10 May 2019 12:58:01 -0700
+Subject: [PATCH] mmc_cmd.c: Use extra braces when initializing subobjects
+
+clang warns with -Werror,-Wmissing-braces, as following error
+| mmc_cmds.c:1886:36: error: suggest braces around initialization of subobject [-Werror,-W
+missing-braces]
+|         struct rpmb_frame frame_status = {0};
+|                                           ^
+|                                           {}
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mmc_cmds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mmc_cmds.c b/mmc_cmds.c
+index 19a9da1..838e8c3 100644
+--- a/mmc_cmds.c
++++ b/mmc_cmds.c
+@@ -1883,7 +1883,7 @@ static int do_rpmb_op(int fd,
+ 	u_int16_t rpmb_type;
+ 	struct mmc_ioc_multi_cmd *mioc;
+ 	struct mmc_ioc_cmd *ioc;
+-	struct rpmb_frame frame_status = {0};
++	struct rpmb_frame frame_status = {{0}};
+ 
+ 	if (!frame_in || !frame_out || !out_cnt)
+ 		return -EINVAL;
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index f3a7234670..0c401c86fa 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -9,6 +9,7 @@ SRCREV = "aef913e31b659462fe6b9320d241676cba97f67b"
 PV = "0.1+git${SRCPV}"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH} \
+           file://0001-mmc_cmd.c-Use-extra-braces-when-initializing-subobje.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.21.0


