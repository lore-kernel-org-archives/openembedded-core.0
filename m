Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F168BC32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 11:03:10 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.29949.1661252588823564567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BO4MOYeo;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: mateuszmar2@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id bt10so6176268lfb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 04:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=J9f+BcTclUPOW0xQZLV+hTrQ/XZ877jUmP8CwZ5XOf8=;
        b=BO4MOYeoIFr1W8i1iEVODGM9u2O+ipm3h6nF4aOGypsS5elOV4Fzo0LCitejLYaQze
         2ckyyP1gi9iXr6Dqp1PzIsiSTRwr2u3qvf0zTh4+qUkZvFxbkcgewsHgJ8MA/FQEd2st
         D25rivLTvl6MYY1qKRetSJVjaSMXZF38I5cwnvIyzo4N29LMfHoZueNryA1RK4rXkK+8
         U7GEhiq8JHFcgBQw0+9Zj7sDbptN5g+uRhGFSUa+9FBbWkZ6mY+WHzlgEqw0lgphaDqC
         8nXmgEyfqAkSK+vItW+SMbUDJG8o/zPYEVZBGuGYtVENGCsHx0abuq7Gll+Hc2Fx4roZ
         cp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=J9f+BcTclUPOW0xQZLV+hTrQ/XZ877jUmP8CwZ5XOf8=;
        b=j/MdF6fFZBfxqaaMOs73MBeVOIT8ePoK1WrscRtxPSwRn3EsO13qRMohOwPLthN1vY
         EFOnNLJDCpSnjUGwabGeZltvZS4jvPCpEG7INx/23+qIdivgo0mxidjSzTqRBb7TzQgz
         DBUCYX6ykVq+I2uH9I/yPkYwY7oRAV+adPjVr7gHO05oxUxQlrVsCVcXzxye/d2bur2J
         8cynb+l6x9NYsEPLk9lRHaHSfi5KJSRrkXclA3kelbdVXkICN96sAbBq1k8DO9Sgyoe8
         yJfAuOSeIBb7smI2J1hzMYVfa5RpvZmW2tt3O6Qsj8fiCzdMBCo3Qqu7vXVgEsWM6A1P
         teGA==
X-Gm-Message-State: ACgBeo0FBmBcISyHTqZUhu97U2nhaox2NFO5s1xkPQtNoF86YY6KP1o+
	3m/oGWa4Cfd0BvXmQrIw4HqW+uoBliM=
X-Google-Smtp-Source: 
 AA6agR6rhvyvsUdkTq+7E/LQtVLtt8EZWgPEulVgsWxOgHW18KOOCJToCQNfsBxLR33cFH5PkHbzUQ==
X-Received: by 2002:a05:6512:2828:b0:492:f6b8:75f7 with SMTP id
 cf40-20020a056512282800b00492f6b875f7mr887354lfb.79.1661252586739;
        Tue, 23 Aug 2022 04:03:06 -0700 (PDT)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl
 (178235146065.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.65])
        by smtp.gmail.com with ESMTPSA id
 e9-20020a05651236c900b00492e148365fsm1195725lfs.294.2022.08.23.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 04:03:06 -0700 (PDT)
From: Mateusz Marciniec <mateuszmar2@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] configure.ac: Improve check for magic
Date: Tue, 23 Aug 2022 13:02:39 +0200
Message-Id: <20220823110239.667405-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 11:03:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169702

Check whether magic.h header exists before defining HAVE_MAGIC.

Despite library availability there still can be missing header.
Current test doesn't cover that possibility which will lead compilation
to fail in case of separate sysroot.

Upstream-Status: Accepted [expected in next release after 2.38.1]

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...configure.ac-Improve-check-for-magic.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 416550a6b2..3868b1c41d 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -36,6 +36,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://display_testname_for_subtest.patch \
            file://avoid_parallel_tests.patch \
            file://0001-check-for-sys-pidfd.h.patch \
+           file://0001-configure.ac-Improve-check-for-magic.patch \
            "
 
 SRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
new file mode 100644
index 0000000000..0748e4cfb5
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-configure.ac-Improve-check-for-magic.patch
@@ -0,0 +1,39 @@
+From 263381ddd46eea2293c70bc811273b66bc52087b Mon Sep 17 00:00:00 2001
+From: Mateusz Marciniec <mateuszmar2@gmail.com>
+Date: Fri, 19 Aug 2022 14:47:49 +0200
+Subject: [PATCH] configure.ac: Improve check for magic
+
+Check whether magic.h header exists before defining HAVE_MAGIC.
+
+Despite library availability there still can be missing header.
+Current test doesn't cover that possibility which will lead compilation
+to fail in case of separate sysroot.
+
+Upstream-Status: Accepted [expected in next release after 2.38.1]
+
+Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
+Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index daa8f0dca..968a0daf0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1570,8 +1570,10 @@ AC_ARG_WITH([libmagic],
+ )
+ AS_IF([test "x$with_libmagic" = xno], [have_magic=no], [
+   AC_CHECK_LIB([magic], [magic_open], [
+-    AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
+-    MAGIC_LIBS="-lmagic"
++    AC_CHECK_HEADER(magic.h, [
++      AC_DEFINE([HAVE_MAGIC], [1], [Define to 1 if you have the libmagic present.])
++      MAGIC_LIBS="-lmagic"
++    ])
+   ])
+ ])
+ AC_SUBST([MAGIC_LIBS])
+-- 
+2.37.1
+
-- 
2.37.2


