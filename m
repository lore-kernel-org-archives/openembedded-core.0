Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9526C0502A
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 16:22:13 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.50658.1661617325499009610
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RKwIZbzO;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id l3so4175706plb.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tkpbUDEGvwrvujcSVbKxpqd7STN9+4OwWlUGR9lYfAM=;
        b=RKwIZbzOl3kNBRs/VcbZ5gmUedpOBSi0+qycFjF4yuJJPUkvDjQaTkl/1UKJjdEuPD
         jGTM4CjBYroK5vAPnNz/0ukFWoXkfBBbU8/+wnXh46Ub5VBOYvxRXAhVAn7jXKLrT4eX
         KYQ6qJq3O8JPS8vXFgRJqlXSm2rtUk4Cyr18CqQaSmErlr68f740o1SIvyE2JP336+0+
         jln5+NaG5EClkanWDnV0exb49PQ3bhoZJTlGm35eGY6Q3zRE5NyOwUqlp80ORORgo2fD
         35vM25E7UIQ6t6xfpeh+g3sjbqO/TmGmeZFqWSci7/+4sF0uAx5tRc4v/31w/UMpI0FV
         4jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tkpbUDEGvwrvujcSVbKxpqd7STN9+4OwWlUGR9lYfAM=;
        b=4uAD14ROl8veob3Un4MNz+vKGJuEc4nNrS/b0VJAMhKeVsKv7xidpceSvCXKLpQmla
         iimShdsXmTjvtzQOBxLXisqcEWEjYuhU/3bmRDyWPQOaru0kjM6SzoBHvEt1vSbi0y3e
         T2dpS+3LiPvGCYif5U3Rm2/Qse4gD28BoOHWOd/GZ5BVAZUrcGIfO5m2d/ZslRUeFLaA
         6A5XiE7KGknYif7eXNsNS0LWWHPhiUVYD8gkMOikAp/sahiHrss3SM9WRwPWOUYbhhpU
         nTN9eN8RXnABKbNOKHJvb6WXs7DQgvLzDBxTURuXT85h3bVktck/olJo+z4DBTNAl/k5
         lvsw==
X-Gm-Message-State: ACgBeo1VQhemiAZpVBicVM1jhq4qLJbYGF56P/Zf/PPbE970s+qZ4EQy
	t8kMHBLu52TOdqPcCa6AWyZmfEUcyoiohw==
X-Google-Smtp-Source: 
 AA6agR64YAMNc8r64d4g+ShfPg8O99Zzl28fmdchB91EqOADKqhd+O9MNmc7lvL9zIi7ewvy1fuC6Q==
X-Received: by 2002:a17:902:f604:b0:172:75a4:33ea with SMTP id
 n4-20020a170902f60400b0017275a433eamr8736772plg.7.1661617324692;
        Sat, 27 Aug 2022 09:22:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a170903110800b0017440342b5bsm3559326plh.206.2022.08.27.09.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 09:22:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] librepo: Fix build on musl
Date: Sat, 27 Aug 2022 09:22:02 -0700
Message-Id: <20220827162202.2769805-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 16:22:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169930

Add missing header file

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ownloader-Include-unistd.h-for-lseek.patch | 34 +++++++++++++++++++
 .../librepo/librepo_1.14.4.bb                 |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch

diff --git a/meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch b/meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch
new file mode 100644
index 0000000000..22b3110a61
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0001-metadata_downloader-Include-unistd.h-for-lseek.patch
@@ -0,0 +1,34 @@
+From 5c63ec2e2d4726268ace85e5c61727cbd811d982 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Aug 2022 09:00:24 -0700
+Subject: [PATCH] metadata_downloader: Include unistd.h for lseek()
+
+This is found when compiling on musl systems
+
+Fixes
+
+metadata_downloader.c:331:9: error: call to undeclared function 'lseek'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+        lseek(fd_value, SEEK_SET, 0);
+        ^
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/263]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librepo/metadata_downloader.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/librepo/metadata_downloader.c b/librepo/metadata_downloader.c
+index 123c77b..6604255 100644
+--- a/librepo/metadata_downloader.c
++++ b/librepo/metadata_downloader.c
+@@ -24,6 +24,7 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <errno.h>
++#include <unistd.h>
+ #include <sys/stat.h>
+ 
+ #include "librepo/librepo.h"
+-- 
+2.37.2
+
diff --git a/meta/recipes-devtools/librepo/librepo_1.14.4.bb b/meta/recipes-devtools/librepo/librepo_1.14.4.bb
index cdd9645298..2b8bd132f3 100644
--- a/meta/recipes-devtools/librepo/librepo_1.14.4.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.14.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
+           file://0001-metadata_downloader-Include-unistd.h-for-lseek.patch \
            "
 
 SRCREV = "2bd1041c741c85bc196ca01dcca1eae6099eb742"
-- 
2.37.2


