Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD134C25B06
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 04:15:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.10723.1659845750428153880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cf9guebs;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id k14so3510860pfh.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 21:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=D5/FGMvJP8lpzkXnkJqZqB8XO4nCvIeutFhFm60Yzzg=;
        b=Cf9guebsJsNoyiRrByqgkKpqBPid1cXwNdQXdYuieoKDRdyCxfE1UvaflX6BSdRoY/
         R1NWItT7VzWiaLoJysb58mi3mXY+wcHWCDdtK5lvBQ5chfJrfqh54bV66SExcjdW6M9U
         2XVpnBWSyp8wf8s+I1DXLKf2vCPyhREAtzZ5Phd83TSuJSx9WVKk5eWdY0F/L35ho9ye
         qlMS5LS17E602M8n0Kk2iNtsdHeVLc4S+z4HziuXYBfkG81vDzDkwwXAtY/KISeY9HbA
         gikV5P3wfEkorVGCux+EmUPYIrIWtw2DakHZ646GD6t3+Ad51Q7QnojE5jcxdUhgfCUW
         oKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=D5/FGMvJP8lpzkXnkJqZqB8XO4nCvIeutFhFm60Yzzg=;
        b=8RziiPJhSe6hl8da74tjeK07y0iiinbsPKsy35+qo+FhRgdtzSauVfgtj+8O7YgO5K
         wQ9VJzuJohnEPuYrP1Kjs8/f5v7fAxFZxyYrBPkdZYUdGJM+MYuGu6lRJyDuCLrHpQEd
         aUIUDAIvPUGv2/Btpx6cWJJV8nmktupAXrJ58TMFrEAwAVP3n6WxQ5P4pLJxV5pNa2js
         8LRHA1U5806Ylg4Ep1PpoqarDF8N0+Mra8pqYZMdW+h6J5P+lphFx5AilFQOm67e/ips
         rBlm+d5P53EJKj0CEG9EY3uvPVRfUGNZIp/BSx2Eobhu/pZEVmNHQ95xfm9nC+GBrqwh
         sSbQ==
X-Gm-Message-State: ACgBeo32fcQjYxv9PbI8yMzTv3g/ZJkvc4W9ytYzAaCK05eqKnjCfVWq
	KujEirmOXYdi4zb/aVgQFa8m+8V5Y4g=
X-Google-Smtp-Source: 
 AA6agR4vNgghef6aGh/fr23DlDjSn1XPmyeOG6I5wKnxpc+s8FdKyowqoAjgvQHCNhPF/NYEmSaamA==
X-Received: by 2002:a63:f854:0:b0:419:83a9:4c00 with SMTP id
 v20-20020a63f854000000b0041983a94c00mr11332059pgj.115.1659845749462;
        Sat, 06 Aug 2022 21:15:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 z67-20020a626546000000b0052e8bf1c27fsm5654146pfb.31.2022.08.06.21.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 21:15:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/7] bootchart2: Fix build with glibc 2.36+
Date: Sat,  6 Aug 2022 21:15:39 -0700
Message-Id: <20220807041541.2665647-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 04:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168986

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Do-not-include-linux-fs.h.patch      | 31 +++++++++++++++++++
 .../bootchart2/bootchart2_0.14.9.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-Do-not-include-linux-fs.h.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-Do-not-include-linux-fs.h.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-Do-not-include-linux-fs.h.patch
new file mode 100644
index 00000000000..4e71e5c7887
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-Do-not-include-linux-fs.h.patch
@@ -0,0 +1,31 @@
+From 8591c1e3edaea8f17396e3d2819d9064b2818cfb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Aug 2022 20:39:01 -0700
+Subject: [PATCH] Do not include linux/fs.h
+
+This header is not needed to be included anymore, moreover it conflicts
+with sys/mount.h from glibc 2.36+ see [1]
+
+[1] https://sourceware.org/glibc/wiki/Release/2.36
+
+Upstream-Status: Submitted [https://github.com/xrmx/bootchart/pull/99]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ collector/collector.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/collector/collector.c b/collector/collector.c
+index 5055181..12738ff 100644
+--- a/collector/collector.c
++++ b/collector/collector.c
+@@ -34,7 +34,6 @@
+ 
+ #include <sys/mount.h>
+ #include <sys/sysmacros.h>
+-#include <linux/fs.h>
+ #include <linux/genetlink.h>
+ #include <linux/taskstats.h>
+ #include <linux/cgroupstats.h>
+-- 
+2.37.1
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index b1628075a7d..b4d5b7cd9bc 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -95,6 +95,7 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
            file://0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch \
+           file://0001-Do-not-include-linux-fs.h.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.37.1


