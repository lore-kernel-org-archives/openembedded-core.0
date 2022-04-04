Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1FAC38162
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.34447.1649073187477347494
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 04:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZjYMq1ye;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id r64so5728806wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dlsyzpF1DPI0Z1medV7iJJEEtXovCIkDrZusL9LVnq0=;
        b=ZjYMq1ye4SZUrnrvenVKVwiLLc277H5KJO5zMFa9IoI4SgfSE9thjnlg74ZnLxmETw
         dE4BlEoWlODBszwhTjT7xDyNhptxTpa373ABLpWVk9ituSQDw651HjzdiTQHHxnGzO2T
         mliuv3080+YrTiggbDFuctqi0ATu0fRaMXPz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dlsyzpF1DPI0Z1medV7iJJEEtXovCIkDrZusL9LVnq0=;
        b=2qbHQHmEKucl4AwXkiIveXhYYCjAxZWGZoGqOsbe2NT/IpECA3Zti4ceY6hHtjIUPu
         WrvsT0zRFSp94/LfxPyC1GO+uk797p6cljw5hM0TaODEtjvtMc8tFbs3H87bNY2CQcwZ
         RuytEt9C55C12I9yNs1lPU+V3WPa/0+joDoRYDxSt1PE71tV+xDjd2o4sEeuXICl3Jlu
         AVi5uUq3J7R5Blzxvu6G2//mFZLLy3yCB9s2Tl8mKst6YkmZ8sXFdrS7bxRl5gxR7Qhg
         UcLb2weNudqhlSP+5beURu9JCNLhzR9Xz3IxypTErPN9DKAmdSHqfq3RcTaxiFGix+4o
         vU/A==
X-Gm-Message-State: AOAM531Zarh/qo0uKiPFcHy5IWWxVJmDuCi/SUvSxMipWJSTiyNS0snJ
	6JzF4rhxNDQI/rLja2ZCnfEb5GdjyuMogvBp
X-Google-Smtp-Source: 
 ABdhPJzgZXqoGV+cJfYOrmxjl5pHTgG8R33Pp0jzP2YbE7w9EaDEFIm2dWj19exBS+wLu00MGqwonQ==
X-Received: by 2002:a05:600c:4611:b0:350:564b:d55e with SMTP id
 m17-20020a05600c461100b00350564bd55emr18813245wmo.124.1649073185536;
        Mon, 04 Apr 2022 04:53:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4552:8cb0:e722:b501])
        by smtp.gmail.com with ESMTPSA id
 p2-20020a5d4582000000b00203f51aa12asm9105899wrq.55.2022.04.04.04.53.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 04:53:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Drop unexports from a different era
Date: Mon,  4 Apr 2022 12:53:04 +0100
Message-Id: <20220404115304.1727375-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163988

A long time ago, we used to pass our parent execution environment into our task
environments during build. We stopped doing that for reproducibility and consistency
of builds. The variables TARGET_ARCH, DISTRO and MACHINE are not exported into
tasks and hence we don't need to unexport them. The resasons these exist is
therefore no longer relavent and they can be removed. This happens to improve
bitbake -e output from a user commandline perspective.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3b8760a3f8a..3fa2bee053c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -915,19 +915,6 @@ SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE').replace(' ', ';')}"
 NO_RECOMMENDATIONS ??= ""
 BAD_RECOMMENDATIONS ?= ""
 
-# Make sure MACHINE isn't exported
-# (breaks binutils at least)
-MACHINE[unexport] = "1"
-
-# Make sure TARGET_ARCH isn't exported
-# (breaks Makefiles using implicit rules, e.g. quilt, as GNU make has this
-# in them, undocumented)
-TARGET_ARCH[unexport] = "1"
-
-# Make sure DISTRO isn't exported
-# (breaks sysvinit at least)
-DISTRO[unexport] = "1"
-
 # Make sure SHELL isn't exported
 # (can break any number of things if the user's shell isn't POSIX-compliant,
 # including the flock command). The user's shell shouldn't affect our builds.
-- 
2.32.0


