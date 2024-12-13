Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10A0E7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 12:04:42 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.13721.1734091475340150410
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 04:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RUEDWMv5;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30227c56b11so15056901fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 04:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734091473; x=1734696273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sxqdMg3o0giQxl+LGjTiX+CUSO09djhFQXzD6i39mTU=;
        b=RUEDWMv5JfH0zGNVoBtkGQK2csixBAbjgZBKNvScFFf2rmnJu2Ghx99WLppdCxO4CY
         FDUpbEe+sLxXXc/Bvt2zK0srE50Ex1WfjF1uFRLvnXXh6XSUMDPaFDVm1I1tWb2hG73G
         7qVE7lTqSYQFnRMZuF60t7WWpa1wRBfQeHrXAhguBjbNnOPLa+hnOG78svFRGV1qpwZm
         jm1qc2fAfe22SjalQK7qPxVlg8IJOXRjxUnnft0DE3jHh6131qxdpPT457znpoianl6Q
         Ahnl8pUT1uZ8UmO5ecCTdsZFS7eOv0SSXxekLR6ogk6eks4t42+Qtql1KBIFqEp9oTwd
         yo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734091473; x=1734696273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxqdMg3o0giQxl+LGjTiX+CUSO09djhFQXzD6i39mTU=;
        b=ecrnUYLmwWcXr8RgxyIXAN8vfDZsp8I07SQNeNaNH7eVYAeFFDU8i63ULxlTSW7YAa
         v7HDBpYJXK5KwBIUkGbeksElBIcL1ynCcD3wpPhu6TCVvXByg7DyYuxuyTd9UJidldcj
         M/TJNaBJMZWiW8lZJT+XXZshzpVAxmWZcvxyMdFCBLsnnRWaJ0iR+2ppXG1uZm0afVrE
         Y7aSgT1hcmzNqUuff/pBh43DRenTEI2VWR1WJAMXUYBlSJ3x4ueptFItjHpe//pmS5oU
         i03Kx3mSPNwDNf22uYVhCC02HpxrMw5kSEzGhwm/8ujW2XnM1MnKqt2x2Lt6kfTE12uh
         ILWw==
X-Gm-Message-State: AOJu0Yyv481TeB8UIUDVp2BvKegk3OQll06+eY6ZABBfdSvCfTjjfbK6
	cCcXO6RTFUGF3Og2QARBEp3LDyirjW5WIePVX1CSMiazbuGzw3XEA0B7gWdINIej4gzpJspmmf7
	vvNQ=
X-Gm-Gg: ASbGnctB/j2Z0KWV+bWEJR6e/loi9S/Fc6WmXglzIL0Ht3ACBRypz2fEM+6KpPqgOCN
	1cjZInP66acKYDjsRYP7uHOP/wEc2FHJjUsdtJYnsJsZViUUdAmOQ557sXrE7h/K50BNR2Jym1T
	aZm7Bg0Fi/cVvOQH3uIAasXAUlYYjxEqnoHz4A8V3Hs3zAu6NdkXE2f1gh547tjyy82nWIWJpJR
	5g11+XujboMbEzQ/AATmwuWzF5sY5L5y+ZFMkHwkVGmpdgl0WF4534QZryllCNe/72zFm0g62C9
	YHOrCiaMmLip8KgeVb0lm28KTNFM4w==
X-Google-Smtp-Source: AGHT+IGVKga3ulCCNsnCRPkq6h8RZM4+Ead18JJkrHdIku8BhodE29HhSLd47uq6wz8kTq3PbZ+DBQ==
X-Received: by 2002:a2e:a5c9:0:b0:302:2830:1641 with SMTP id 38308e7fff4ca-302544c8feemr7732711fa.36.1734091473092;
        Fri, 13 Dec 2024 04:04:33 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-4f4-2a00--193.rev.dnainternet.fi. [2001:14ba:4f4:2a00::193])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30249b07930sm5389771fa.114.2024.12.13.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 04:04:31 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] systemd: set CVE_PRODUCT
Date: Fri, 13 Dec 2024 14:02:50 +0200
Message-ID: <20241213120250.704778-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 12:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208680

systemd.inc is used by systemd, systemd-boot and
systemd-tools-native recipes so make sure all
match to "systemd_project:systemd" vendor and product
in CVE database. The split between systemd, systemd-boot
and systemd-tools-native is specific to oe-core and
upstream just refers to systemd.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 989ca667b7..288d49e007 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -20,3 +20,5 @@ SRCBRANCH = "v256-stable"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH}"
 
 S = "${WORKDIR}/git"
+
+CVE_PRODUCT = "systemd_project:systemd"
-- 
2.43.0


