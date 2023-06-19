Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5604FEB64DB
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 17:16:15 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.13177.1687194972396653417
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 10:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NpKcKbX0;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-988b75d8b28so153118866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687194971; x=1689786971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3UgSaiUzGhpmmDmMasVrsNnWpxCJQxPXj8oFISU1v0=;
        b=NpKcKbX0UOPio3ItghQLEQ2vKB0UQGsd3gnHEqiOiZ7WHOqodcyGXH/YhpH0eYWqXk
         UoRN04FwP07lUejgd7VtYubuVRyAa+6n4SFK1YkOMbhJw5qFqzxG7ea3JuMkYktXr19K
         6kfpq9/CfXS+Iw1LVdg+/LiZv3m7QCBH9ozQbwwJKAb2aYHBKdOvGisUczDal+9sTgJd
         pnl0tONoF81dJUJi3mWY/AsPB4L5LDg76pTuF3yg76qtl3K7hJd42srF2tPj946XA5Hb
         yvNml14fSWVL6HubUafXYbAo+2nPUZsR1OvZBH/UuRDR1HPZAoDWOoxcmNVhMKSXQ1zW
         w5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687194971; x=1689786971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3UgSaiUzGhpmmDmMasVrsNnWpxCJQxPXj8oFISU1v0=;
        b=GYh9jg7kJQ1IKFwxIIdZwsw4okxCSRWJqko25Q5IC+Y+Adg3FtKSihKccVmkpZ4bkn
         PiXQsAEz79SAARLaxdYOzCGeNdThRZrw3VDkUwKD7rDIDwiXyY4qVoFjvhzGfkXWG9rR
         8iAN6/RDH5idaL9WrQ3WTuaS+Zeszm7TOOWUUc11gygTwgy2uqrKOjvZWI399gaXH3sy
         9yWpfz5vu0RuHAgBcIOPFqXWoCdkWkwySgBgTYkVc1m9s8ARqWKnoC5JFI9BKTBefP1Z
         j42ZRX93He2gTZHUbL1xEyG1qfVpj0p547degj0d2GPDiiemGMjDq6nBWqilyXOVCYH9
         /39Q==
X-Gm-Message-State: AC+VfDyLYHY/AFLhMS6gtfmyH1mHuJqg593p1j5O/llmFMw49KTzyVxE
	EvjakgI1b5sZeA8VncQkvLDvjS9zvR8=
X-Google-Smtp-Source: ACHHUZ7zuHLWKJc2XvB7BDKACAByca+ji3IcxaJg2Fqu5dx625z0eGA12+DJjGsx1MYwMaVm/W8SrA==
X-Received: by 2002:a17:907:6e90:b0:987:525e:302d with SMTP id sh16-20020a1709076e9000b00987525e302dmr7435191ejc.69.1687194970542;
        Mon, 19 Jun 2023 10:16:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h3-20020a170906398300b00988f066fe33sm636703eje.94.2023.06.19.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 10:16:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] zstd: fix a reproducibility issue in 1.5.5
Date: Mon, 19 Jun 2023 19:16:07 +0200
Message-Id: <20230619171607.2600309-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 17:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183121

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-use-directly-for-the-test-c-snippet.patch | 39 +++++++++++++++++++
 meta/recipes-extended/zstd/zstd_1.5.5.bb      |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch

diff --git a/meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch b/meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch
new file mode 100644
index 00000000000..847a641691d
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd/0001-pzstd-use-directly-for-the-test-c-snippet.patch
@@ -0,0 +1,39 @@
+From 121ef5253a49065dea6a89536ca7bd3dabd40e25 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 19 Jun 2023 17:10:09 +0200
+Subject: [PATCH] pzstd: use c++14 without conditions
+
+Doing this check with a direct c++ snippet is prone to portability problems:
+
+- \043 is not portable between shells: dash expands it to #,
+bash does not;
+
+- using # directly works with make 4.3 but does not with make 4.2.
+
+Let's just use the c++ version that covers both the code and the gtest.
+
+Upstream-Status: Submitted [https://github.com/facebook/zstd/pull/3682]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ contrib/pzstd/Makefile | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/contrib/pzstd/Makefile b/contrib/pzstd/Makefile
+index e62f8e87..58fb82a1 100644
+--- a/contrib/pzstd/Makefile
++++ b/contrib/pzstd/Makefile
+@@ -37,11 +37,8 @@ CFLAGS   += -Wno-deprecated-declarations
+ PZSTD_INC  = -I$(ZSTDDIR) -I$(ZSTDDIR)/common -I$(PROGDIR) -I.
+ GTEST_INC  = -isystem googletest/googletest/include
+ 
+-# If default C++ version is older than C++11, explicitly set C++11, which is the
+-# minimum required by the code.
+-ifeq ($(shell echo "\043if __cplusplus < 201103L\n\043error\n\043endif" | $(CXX) -x c++ -Werror -c - -o /dev/null 2>/dev/null && echo 1 || echo 0),0)
+-PZSTD_CXX_STD := -std=c++11
+-endif
++# Set the minimum required by gtest
++PZSTD_CXX_STD := -std=c++14
+ 
+ PZSTD_CPPFLAGS  = $(PZSTD_INC)
+ PZSTD_CCXXFLAGS =
diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.5.bb
index 487465b6c70..5c5fb5e7340 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.5.bb
@@ -10,7 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0 \
                     "
 
-SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https"
+SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
+           file://0001-pzstd-use-directly-for-the-test-c-snippet.patch"
 
 SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.30.2


