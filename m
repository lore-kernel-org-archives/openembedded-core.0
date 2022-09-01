Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C066DC6FA84
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 07:21:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9307.1662016896890988787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aZ91z7v1;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so2752305wms.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 00:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=QsflKpogaWvX7EhD1xaxwoeuCsK1Pc3d2SPcjNa3MmE=;
        b=aZ91z7v13VLE2XVw6eQPWohq4yDeJotnjqRqKjj1E+EeA5aqncLwQJtuXKete9K72i
         Q3o8UDuCn/DhOOx3Bz+NWnx++PzaVMjcwbY0nxoY5t0HNGKIVyyfvM0fGK+N13kxaSIF
         lpAo5SWbHxd1BiKwTDHxpACdn1hfjEhAXHxaTJ7EIJwuAVbPjDhPiTTZ8iOwldLRLTG/
         Q6f2CDFmOL0OH3JMOkt6XngUipagu3q9eIjOfTE2wmv785+I6VUAU5jwbyCo/djsTh49
         7gqHFGMBL9LSwioyK5fjivOeaDjeAdsj3/BEjwmnObMzMtsIjPElgSOt4PFsBSticf0r
         TFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=QsflKpogaWvX7EhD1xaxwoeuCsK1Pc3d2SPcjNa3MmE=;
        b=NP5SlkK7rILS98hr/0f1ljAAKIvjtl+t1+IFtRSALqBC7u3RTBiJh0tgS8keNZNgne
         mDa5ARjQ22rT5T37ugoAGA6McO7e3bQsVM9Rd+sJQfdlw7fkBWD8yEt+HtWMb5XyhAVY
         JzDY2S/gqTU0W+miUjumer00A7D3HloaNwmhob9DaiXkBcLAj7trZQY4IF757F4+UYIw
         QCH0Nueyj5pa5NwVQ7XUPPUTNztmthRnYW8i0AmpY/BPBePCiickWP9Uybt+QBy7FXXE
         dGebf3pOlWRVlQIkRpZHHITwR04qJqhzdQH8KAJW7mPsQJv2+XvVc3F+5YW3kwvVhLfa
         vGAg==
X-Gm-Message-State: ACgBeo23XvaP9tm6zlY/w+DBNyLkSvVftXFWptzYMWb31DrVegb8H+Fs
	0YHt4WS7QsqqFbYMIz2q+v5NJP9Tww8=
X-Google-Smtp-Source: 
 AA6agR4YRKA/raA8xKzvZEzZnFwReOOb2iKSPazYGsTjeFJ/K0w+7k05p8IgEZsrxg+Z8vQK9Yu1Bw==
X-Received: by 2002:a05:600c:3514:b0:3a5:dc71:d9c4 with SMTP id
 h20-20020a05600c351400b003a5dc71d9c4mr4228242wmq.42.1662016895242;
        Thu, 01 Sep 2022 00:21:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 c18-20020adffb52000000b00225239d9265sm14022982wrs.74.2022.09.01.00.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 00:21:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/14] syslinux: mark all pending patches as Inactive-Upstream
Date: Thu,  1 Sep 2022 09:21:12 +0200
Message-Id: <20220901072125.3366367-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 07:21:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170143

As seen here https://repo.or.cz/syslinux.git/shortlog

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0010-Workaround-multiple-definition-of-symbol-errors.patch  | 2 +-
 .../syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch  | 2 +-
 .../syslinux/syslinux/0014-Fix-reproducibility-issues.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch b/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
index 3665af9c49..813d10ba5c 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0010-Workaround-multiple-definition-of-symbol-errors.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Workaround multiple definition of symbol errors
 
 Lifted from Fedora https://src.fedoraproject.org/rpms/syslinux/blob/master/f/0005-Workaround-multiple-definition-of-symbol-errors.patch
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  com32/cmenu/Makefile           | 2 +-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
index 6f8314dab8..21b83e49dc 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0012-libinstaller-Fix-build-with-glibc-2.36.patch
@@ -22,7 +22,7 @@ TOPDIR/tmp-glibc/work/core2-64-oe-linux/syslinux/6.04-pre2-r1/recipe-sysroot/usr
       |         ^~~~~~~~~~~~~~~~~
 ...
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  libinstaller/linuxioctl.h | 15 ++++++++++++++-
diff --git a/meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch b/meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch
index 372b2a5ff5..bc48160cba 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0014-Fix-reproducibility-issues.patch
@@ -7,7 +7,7 @@ In order to build deterministic binaries, we need to sort the wildcard expansion
 so the libraries are linked in the same order each time. This fixes reproducibility
 issues within syslinux builds.
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream
 RP 2021/3/1
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-- 
2.30.2


