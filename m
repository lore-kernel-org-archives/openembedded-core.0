Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD79C19F2A
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 06:37:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2862.1660113468041075976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 23:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I2wcaKql;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id x10so13419908plb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 23:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=D2Md3/entGJz1Dro5hTpJQUVSCa6V/FMrrJVQzh4adA=;
        b=I2wcaKqlmHpUxW3o1HyS0OvObqURrAHouHtY7sXTMwGZfgK8QBGxGNYirVc6shg45M
         kwcIXCrXd6zcnSLnouhu41cUxr3RYoT5IHbmVq8LEuchcii6JWrWf5sksI8HBjPfw7gc
         qJTZMR8PkbSPKdqCbB3FtRkqC2LQeR4TriEpXu8zLx+vv+poy8ds2doNQEUMWV6+TPNn
         +qy3nZOsympQf4xobNMqUwJ0l6RejwFTivYzibWznr4mpbIAQLTaT+VNhDNq2EN5iPDt
         NBPWVqMDVwe/pe/u39AL6GWeYThWEeDCKQMc6wRwTnoU9j6G+YkFrVzp/n6HGAHdD5yk
         5QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=D2Md3/entGJz1Dro5hTpJQUVSCa6V/FMrrJVQzh4adA=;
        b=IDrGr+/wyBVO0Rzm9lcNW9I7Q1Y8oRJHnLuRAvg7Q4j6G53Ba8ykglS2+Wx7z8nnuu
         6hYPK8/cM31JdxPp7FeiSCT0eh22wcwgE3bmNGpe3HsDT+xWTBMlvlmcbGw0OtEUa9CI
         OLv60CkBKDAzYPeoNVXkmd1IX7m0LJJRfBrBpMbJBOqaLRLUCn7EKWppnu5t/daw+jTn
         og+XQlaH80s0kCy/yv9U4PLmGYc1WKSxD3JHwQuFwSdj7G3LNwSP5CZtJcbY2dvhYu+a
         4GIEAINTCMg7y3AW0wcnBXI6XAK4ua82f3Lp3VnoGYHHGQmA/XOF3lIiQwsFGeDO2l/t
         GOQg==
X-Gm-Message-State: ACgBeo3JetPjtWkhXH3cQbcyfR8sRIb+IqQpkwLPqrzGqKNh6UPnBUHY
	0cOxkVw6caBvSEpcWDKjq555DIVxe4k=
X-Google-Smtp-Source: 
 AA6agR5l2ct1AfbDSspa7GVK/Angoxaa2grwJnveAggTIWdOr8HL/G+JBunIBms0ETbeKpXw21Pwrg==
X-Received: by 2002:a17:90b:4f91:b0:1cd:3a73:3a5d with SMTP id
 qe17-20020a17090b4f9100b001cd3a733a5dmr2150948pjb.98.1660113466677;
        Tue, 09 Aug 2022 23:37:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a17090a054200b001f30b5bb378sm758091pjf.15.2022.08.09.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 23:37:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] binutils: Disable gprofng when using clang
Date: Tue,  9 Aug 2022 23:37:41 -0700
Message-Id: <20220810063741.2914548-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 06:37:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169184

It does not yet compile with clang it comes with __ builtin___snprintf_chk Not Supported
formatted output of built-in functions check is failing with clang
somehow it seems to be compiler limitation. Therefore disable building
this component with clang for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use EXTRA_OECONF instead of EXTRA_OEMAKE for configure vars

 meta/recipes-devtools/binutils/binutils_2.39.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.39.bb b/meta/recipes-devtools/binutils/binutils_2.39.bb
index 8eab78c3301..863eedbcbd9 100644
--- a/meta/recipes-devtools/binutils/binutils_2.39.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.39.bb
@@ -14,6 +14,9 @@ EXTRA_OEMAKE:append:libc-musl = "\
                                  gt_cv_func_gnugettext1_libc=yes \
                                  gt_cv_func_gnugettext2_libc=yes \
                                 "
+# libcollector/collector.c:547:15: error: no member named '__fprintf_chk' in 'struct CollectorUtilFuncs'
+EXTRA_OECONF:append:toolchain-clang = " --disable-gprofng"
+
 EXTRA_OECONF:class-native = "--enable-targets=all \
                              --enable-64-bit-bfd \
                              --enable-install-libiberty \
-- 
2.37.1


