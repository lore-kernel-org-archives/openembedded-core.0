Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C77C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 13:49:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1068.1787924958633584710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 06:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AlTb88Fz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so4918575e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 06:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787924957; x=1788529757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEiFgSfG4qWZX4RHUCaPbz8bjTUC5Ui75NW5XbKKEnQ=;
        b=AlTb88FzU0M0Yeol/CbpTgq3aHKyEcrSQqTUnoVT6J1qON8QnnWWRCzTAnrhOWyWxo
         U1cigmgNMFQbeE1MhMSf6DDKR5hcI9MEovUmNPDKh2LHvFWReXDKrj6riayJAeOwCCXv
         XEMA/o3l0lbmnT60Bz7cvqyY12WtRSIHvq41g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924957; x=1788529757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FEiFgSfG4qWZX4RHUCaPbz8bjTUC5Ui75NW5XbKKEnQ=;
        b=hLK21Hd1tSdh8cmYG37EhGYl1GFRyhjBuQMNHDFKGt6UkpNNPMXYNIFSCNQ1Jq22Zy
         NSHXUo5JXYtN2L4wUsfHsPQVxTjrG7XtF+EA5HGaLAT0BISlXYMpUMQ7zqMHVPsBil6T
         cKpGqbs0gaDRsyNnqFmC3xwkG1/VWaZ92FYLHA5TJP1m8cU98NJugnY27H5FDt+eteFE
         g0qCi3SK/ymOWXqR9TsbJPrZi4Jy5R9YWsEZTdGOJxfCEX/pduIhhTIk9on71kURZukt
         yZ4XSr7XDql3L1rI3SWqL/fAK5T8/6oeX+cHMk+tv43oqZXrAIHUzVUsz+Lqd5J6Rv5/
         vAoA==
X-Gm-Message-State: AFuF++kj2G2Y0mK5D2yOd5Um/5z9YciIjdb3O6EP1mLjdVfD+j2+ZiUX
	cFFMtq2c/Ui3dQRL53fRGjbxdJHpeL0s79hdbswxzl5BlDQYmWHFbphSkrwdlOzKML2IPhumLad
	UHHXyBQ8=
X-Gm-Gg: AR+sD13EC4kx4p4AEnph1ADlCAoG0HDsGR/kntB83FSHJXkPbPY+A1DY0NZZGYPGvVD
	7Q0EjgiIxQX72B4L/4mV/+gd+YSApgY2ONy2JApK+twuYvivCo+4ff3VxFnx6Lwiq5nNsz6lNWV
	m8yp5j+M8bn4CUDl8c3oMzoaUtaSOu+HssaTX7QLwKPYZsGhf58QVkOpumC0R2XUXcbIkbYT7rD
	3q7Rcpk3ohz5pQTNWSm51T4p9a89COegJFPcWqTIEAqcASgBFlsV8iq+t1B780NF1Jc2XSx9yhV
	c5h0yE3rvfGXAFOQ8QMUucPEb6wXhwhVZ9yCcTMX5/o9xP0T3mZYyMxYY1itxMDRUF1976epuMn
	9qY9AAhGkWMMQ7x1syDIcQj8S99Dg2aC0/ck75F+6FMRqCjYGVwhB9TVoxBxRA3XRzBZrb+OJuy
	XcI1dnMvOH97pOrAB5/R2/rOQ9FAeZ7eZGsLWJsqhXVZN0m9CvEuqA/c+EsH5zOLnImpeIAHH6A
	9MFI+UVo5oipaoQWHY=
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr100917735e9.4.1787924956526;
        Fri, 28 Aug 2026 06:49:16 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c3f1:c7b4:8368:83c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91ca11d0sm56144815e9.1.2026.08.28.06.49.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:49:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] lttng-modules: 2.15.3 -> 2.16.0
Date: Fri, 28 Aug 2026 14:49:09 +0100
Message-ID: <20260828134914.1288180-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 13:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244542

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...1-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch | 2 +-
 .../lttng/{lttng-modules_2.15.3.bb => lttng-modules_2.16.0.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.15.3.bb => lttng-modules_2.16.0.bb} (95%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 6463bcd6cca..3841b9bdcaf 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -1,4 +1,4 @@
-From 78f79eb607b6c0be71144d1ca70391f989846db1 Mon Sep 17 00:00:00 2001
+From ffc2211208cd3919337db0e675206ce05382c3a7 Mon Sep 17 00:00:00 2001
 From: Bruce Ashfield <bruce.ashfield@gmail.com>
 Date: Sat, 15 May 2021 10:26:38 -0400
 Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.15.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb
similarity index 95%
rename from meta/recipes-kernel/lttng/lttng-modules_2.15.3.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb
index 0d9a872ab5f..bc1d50a8b3e 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.15.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.16.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "7dc7fdac82a42ce2ed78e00270b69d69e7418a620e8e30791191fe52f0fd3eda"
+SRC_URI[sha256sum] = "854600604cdaaa66fc1711e564aff37d8dbba9bd1d3aaa94f12a561da845deb9"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 

