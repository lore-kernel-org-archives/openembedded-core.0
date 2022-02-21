Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E914C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:32 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.4749.1645478671327211980
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XPK6TYBJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id x18so9969868pfh.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KpabGmJjjk3K+/jFXIE88j1atOrJNVNNgrpdrYZkKAg=;
        b=XPK6TYBJyMH554OtoLzWToRkp6Xab/Il5+QHvrSeBcqqP847uCxScMzFehS/7r5LAj
         p1aABRmHVMo/tYeHVSP5urFcmjTPbuZSVgvXZuuvs3Vvw8bUshrpcuNIGfJR5Nx8RQv4
         AbHvjJis+BQagnZI1KOy2KMcOmHsJny+LHAzVBtEZ4wS6nh2n/7SMYQI6+GnmKegLZiV
         /+pAf+2HJ2ikGGZVrAvucbxZEQepUcxauK4f9EqEsmbcU83X5mmJVDySL4GvzBg4KNQC
         lKAXk4mmEqXpj03dd5CBS19jaKWnBnr4IFW7Gf+8jYetVVNNCn212gOJvJG8bB2XPjwB
         39sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KpabGmJjjk3K+/jFXIE88j1atOrJNVNNgrpdrYZkKAg=;
        b=veOO5LfJnOMzHAZfHf+dqr8pE8PIP2iFJnu7EQXMGhPUyn80rYGj/XtO95J194VzHt
         Ot3Q96A3U03gAZ908wZrkPGH0xLX7ZfhdNA3Wvk9V6dmNHOVcPyQTbddHtoY8WcZH7Hw
         CcPdubPO1dnlzwE89LQV+UUfuK14R1GM9HJZnq55/rGrETseI7H7mXZHpo2Nc56ZbwQ0
         2+ar0EEquLOEp9ybuuwVz4bDwiTwmOcHH5LQyXL26k6oM5gv5T55tL/en/0EuwkpsoUp
         uY6/EpE04GH0oMKQ6h+xaqiJ8xsEiF/6abU8kezJ0iIZ1UsbTj+9D/W9mGSE05wKV0Z0
         CO1g==
X-Gm-Message-State: AOAM532Tu0A2YvUTMd/AYu9Kq3xVoLGLbLReW3e0rugiIiaqL/Z012bG
	wwM3bscIVi+gdXs/Ab62wOuP/0pQPeWBsA==
X-Google-Smtp-Source: 
 ABdhPJxCgKB/Y+xJFww9khcFiVkTmpofIBoi+/g6ciS70bU6Jwn2eA2LQeicagRleIEusoCMY6voWg==
X-Received: by 2002:a05:6a00:2492:b0:4cc:eacd:58ea with SMTP id
 c18-20020a056a00249200b004cceacd58eamr21856929pfv.21.1645478670429;
        Mon, 21 Feb 2022 13:24:30 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 18/32] python3-more-itertools: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:33 -0800
Message-Id: 
 <79407e3f04830ed6305ef9b5ecc18c06bc712624.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162094

Define PIP_INSTALL_PACKAGE as more_itertools to match the name of the
wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
index c1e34b205da..5788af3f71e 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_8.12.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "7dc6ad46f05f545f900dd59e8dfb4e84a4827b97b3cfecb175ea0c7d24
 
 inherit pypi setuptools3 ptest
 
+PIP_INSTALL_PACKAGE = "more_itertools"
+
 SRC_URI += " \
 	file://run-ptest \
 "
-- 
2.30.2


