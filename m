Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27B2C7EE26
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.72228.1682871974660663664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Bi7psvJh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso1200929a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871974; x=1685463974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGXyymn/jy/ByC108tbXe69KZLGDMnlCdpPgQceYakM=;
        b=Bi7psvJh+fkX6fuwpNJBKHhZSQww2QSK3WU4QDvGw1GWGqyTY9CtAuvXey7IFoDdwj
         p1p8LBHofw227NkpPM5ypOCfqMAyJNJe0sElJBS2wXWATUPUWJn6uZfnssSnCxGRQYBA
         iX2GIJd15QiirD3wuFNuul3svFQQ5fLSwBhK5kU0GUJTPrGKeizxc9/aqqMIzq2re55j
         SRXJ9wznbiKFfJIwvZZ/thiKEwkcPA9KOFwQJ+bGPPgVI6vQ6qY1B8CvoM5CUxptVge6
         DvcPQUgtjaPv8GrACWpYf716KTk19HfXanXrGRRWEg/acTM1FZG3hwmRmIh9DUcfm6vy
         Se1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871974; x=1685463974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGXyymn/jy/ByC108tbXe69KZLGDMnlCdpPgQceYakM=;
        b=DA9Wv6otK/CbHMsSSFohdoSJJoCOPFkSftM6ra/+8dCnGFGQcAkvoTl6a5o0ttynrF
         hACtqB5wZ0MsqGAOjWhnU+H2BLTxEMGTNvcPFH7wZOIGVLyBUvxzv+PPcSjdyyH7UKd4
         4OS2TSB6lyjPgR1binfFnyCmJhs4rFkoCLz0yvawNJYOvFHfTjIdWiYLJDxVUHomNzsO
         9JWFuz6RXCZHef+IQGrpeSSk4shRHE+paZx6B8xtq8Y0g46whgR3FmBlVjhzwg8NY7Q/
         AOPGzhnzWevLzvpnwqI4yPhiPFq0P20F+sfr5Jh+FTiMhFnrRxJ4F+CvEYtKrR6hq4wX
         Z5Dg==
X-Gm-Message-State: AC+VfDymg4xynd3uaNeOS2B87USl05Xwgwbn/oU+x/DF2Fcr2/d5bKLC
	Ihi+iBlozY66EPo5CE/KxcCvBXRL5G8Bmn2bh3M=
X-Google-Smtp-Source: ACHHUZ7p1CGfKYMg7E68/gF/5c4+Rsuuy6jnUQ5eeiLSSaUjJzN7qpg4uCxop55+iOvf8GYWaOJ5jA==
X-Received: by 2002:a17:90a:b886:b0:247:2d9d:4722 with SMTP id o6-20020a17090ab88600b002472d9d4722mr11760113pjr.0.1682871973736;
        Sun, 30 Apr 2023 09:26:13 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] go: Ignore CVE-2022-1705
Date: Sun, 30 Apr 2023 06:25:53 -1000
Message-Id: <6e4a952efc94a3bb94216db1cbd738f4fb70217f.1682871868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682871868.git.steve@sakoman.com>
References: <cover.1682871868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180574

From: Shubham Kulkarni <skulkarni@mvista.com>

The vulnerability was introduced in go1.15beta1 with commit d5734d4.
Dunfell uses go1.14 version which does not contain the affected code.

Ref: https://security-tracker.debian.org/tracker/CVE-2022-1705

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 56f4f12c37..b1d7bc155a 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -87,3 +87,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-30630"
 
 # This is specific to Microsoft Windows
 CVE_CHECK_WHITELIST += "CVE-2022-41716"
+
+# Issue introduced in go1.15beta1, does not exist in 1.14
+CVE_CHECK_WHITELIST += "CVE-2022-1705"
-- 
2.34.1


