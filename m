Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D198C32793
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:35:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4425.1661294155111062939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kQII3VxO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id x19so12001785pfq.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=xgzqJw9YUH0qJ1YT7YE7TLunHJcaGT5NbgXr9ye3CGk=;
        b=kQII3VxOqNkv7qZcYbRNlILGF125lsunILhRJXPEOIN7x2DbVRpyfjAplFE+kb2cBp
         CgxJD+0tavA/ouVvNIUIgiX7cpkWJoRGaCYX9QQTu0I2o4T1WxSnPS2AicXCMKF86y+r
         V7h0rewOtP1VqjCx5xe0lLtYfPBdaUZMyLBOMzBlNlwVg6oqSpp9R3k5/FF29lEKCIWd
         di6S+Vdxs40/nOHCpLhp11Ir0811tghbAWVtpRAfxihuAobnBjHDLyyclgRP1Ag6JFuU
         45U1dJn/R0N9cOP+LCxj1ibY4k1cgKRiy8ADsfOfAq8gum1ag+5Cs0TvyqKxp1iXBfzY
         HJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=xgzqJw9YUH0qJ1YT7YE7TLunHJcaGT5NbgXr9ye3CGk=;
        b=WmbqcXgSCDDBVUjB8BoHDpGVvIY5/FWhtB0efMBjixjrZlCe2D68fchW+6b8KlE82Z
         b1RA0lyg8MmLXx/ZRREzBI+CZzkAEM6ECM4+u0rrHjOA7xCTuq3bI3UJILA2brCNCijd
         iC+lGtjXo1XCEe3GUcvrDtCBxPHmp7cma0cvV5jIULr3R4rbMqVeMa+t+eNdq4UHZvAh
         kYjKb59bFvmlurJMoX6dEvBn6IUxy7LiIUHL1dmXNHqDIExF4YYEA5LjF+7mBHuDkjji
         LW4AKl3uWsa5QALALB2764DQkHaWu9vb21Q8McQWptQN0a04PFyNqX+063IEmK9uFLlq
         GDlQ==
X-Gm-Message-State: ACgBeo2gi1HF1yORuvha03flWCFcupUcyfbli+8la/lRbF39vlHxxjEV
	l3fNbFBTjD7446uyR5N0pEIRT2jWcwozT8B1
X-Google-Smtp-Source: 
 AA6agR4TMXblU4ROFpJv8ZxP/o1r2ZYnZjc7AgtnuB+QgqgS311bdcQ5bJAB02IhrJITkoCRfaELQQ==
X-Received: by 2002:a63:2b4d:0:b0:41d:6d37:365 with SMTP id
 r74-20020a632b4d000000b0041d6d370365mr22011094pgr.325.1661294153888;
        Tue, 23 Aug 2022 15:35:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.35.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:35:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/28] libxml2: Ignore CVE-2016-3709
Date: Tue, 23 Aug 2022 12:35:14 -1000
Message-Id: 
 <a2806f24b95dd8cb1e687655e202bd7e053d0ac7.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:35:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169734

From: Khem Raj <raj.khem@gmail.com>

This is fixed via a revert in 2.9.11 [1]

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 131b7010ae45b0c4e1c6a29dfc56b225d2ad2a69)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.14.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 3081ebf92f..e58298d3b0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -29,6 +29,10 @@ SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c
 
 BINCONFIG = "${bindir}/xml2-config"
 
+# Fixed since 2.9.11 via
+# https://gitlab.gnome.org/GNOME/libxml2/-/commit/c1ba6f54d32b707ca6d91cb3257ce9de82876b6f
+CVE_CHECK_IGNORE += "CVE-2016-3709"
+
 PACKAGECONFIG ??= "python \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-- 
2.25.1


