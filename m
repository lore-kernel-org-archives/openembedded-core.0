Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69E3C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:33 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.38937.1680210872258774197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1pjSBqqS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so21161922pjl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210871; x=1682802871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrB5nKSTh22Z4FVIMnL+SnRgDunBL7oWIB7bSxpJaL0=;
        b=1pjSBqqSYQIFpCinPvr38IpeKAhbPgqhKs6JyvFiu+hgeG5HMRpsx+AU1VW/fRIzoO
         0+b1HuDwUXdRgyz3CFj5gTi6BE/Vu/ZWdpGQd/FzK+xqDobhjlb2BwdreYKd/OEHVvL7
         H9SIq7/7DIeltoxwrYIp15I4kuhY2tF5eVF5D7gTppkkvCJBoD84ERLGf86fsFgV/HZ0
         eVYdl9/MA89mn2LAyrSU+MTLhAJnAW8IvhJ3VY4KX3yo1Tf4WOhyDlVAoAI51qdwThDg
         ZJyRceozfLPgX9P1gYvI0SXxc8mYJeEZf1dIoW4XtrkfaxJaZtpBMDoBpkMbF3HcH31r
         abOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210871; x=1682802871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrB5nKSTh22Z4FVIMnL+SnRgDunBL7oWIB7bSxpJaL0=;
        b=ykuAz6KdvMw6FoiCHWfIxGOlX8MIq+6gxXalHPmHtoGb96kCCBgwumwLCe6xQYqaGh
         sEJn/7RJfRV+vgzjIUn4pA7AvNMxxz+XNLCHeL1I8PV8/wQwQ/G0JREtoAQXiepH5U9D
         NYRL53DjDx3LZny4miXkQSlj0nY/Yr4kZG1psvowLQ7BjRMT8Rwi8mvqxS6BU9FdLlFq
         xvv91S802AraTuw+bryr/vcZ1gNdhMtm5qu6AfUEWOQBx7Q6aHVY5wBUBICjrLoK9BUi
         M7YadaPQyB5K0tsh+JgNSrtgM5XJa3mIqnaGqPlJkDxtkcYC0ezo91OPfqTrlvrUDywq
         1v4A==
X-Gm-Message-State: AAQBX9fMJ3ryVs2eznFPmPIatLjBD2mEAMmToWrVvpz5N0CguWLOW7R8
	5iBO+vSvEBUEIS9vgnNk6VRPj5fLY26Qdlk9nWc=
X-Google-Smtp-Source: AKy350aqw+G7+LFAJ38J1R2Qt6uOoR4atxAm6vPTDd8fO1efZ+lvsau/NnlNU6hyPYDBW6NUYo49Ig==
X-Received: by 2002:a05:6a20:4f11:b0:db:ae75:c70e with SMTP id gi17-20020a056a204f1100b000dbae75c70emr8990292pzb.15.1680210871230;
        Thu, 30 Mar 2023 14:14:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/14] gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch
Date: Thu, 30 Mar 2023 11:13:55 -1000
Message-Id: <6134af5739c8a373db709bdbe2ba897d1ccaf39a.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179372

From: Peter Marko <peter.marko@siemens.com>

This function is referencing '${S}/..'.
It uses ${S} only as good known directory path to start
traversing from, and it does not need it to exist or be populated.
If ${S} does not exist yet, the function will fail because
it cannot evaluate path .. from non-existing directory.

Reproducer (verified in master and kirkstone):
  bitbake gcc -c deploy_source_date_epoch
  bitbake gcc -c cleansstate
  rm -rf build/tmp
  bitbake gcc -c deploy_source_date_epoch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 42661a59cda164b2d236ffc35b4d8cf43312b677)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index cd2e341099..03f520b093 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -16,6 +16,6 @@ do_deploy_source_date_epoch () {
 	sde_file=${SDE_FILE}
 	sde_file=${sde_file#${WORKDIR}/}
 	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
-	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
-	cp -p ${S}/../$sde_file ${SDE_FILE}
+	cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
+	cp -p $(dirname ${S})/$sde_file ${SDE_FILE}
 }
-- 
2.34.1


