Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2286AC3DA71
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:25 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.14925.1671202704147520230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nExsbEnW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d3so2532602plr.10
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqdVRTU3ttke6KL1A8jIOHzndVuNNFFsUM9KDzu3Bzw=;
        b=nExsbEnWWKgtLCuOdSgSMLlrhquc3cD3zH7fmw8NYINS8jQ6agTsGGlYSmrOTXOBEq
         +I40FgEIwmMPHuhBTkZvOt8EgRakgcZltMXBzgSHwDmuDkQ3miy1H65otcDA9E7HhBbb
         dYATihahyRFBWWbKD8BZINwRIXL7xhCMvAc0SYoWHfKhXP9L0kRu9YmvdcS9E68gE3np
         7JQUHNBLZoMP1vAMGeAnlFQSLkMDc/10ekyFF7fXTYwmRIKT+eSr1mjL/KWwmTycxDuX
         QaWWUAYeCba/10m0pS7hK0QHmP6g1CmInH0YbbQ1YIK9wPUKA17a8OkRwZgqDqVa7Dvh
         fyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqdVRTU3ttke6KL1A8jIOHzndVuNNFFsUM9KDzu3Bzw=;
        b=4kJPC87xq/gE8/FTrvS2joIbmrFOY03tg3KMDTzH2CM+NKywXWj/HgHd5lwBZGPVZX
         XVj70PwdefNBR+60In6ylGoFAtbiiuM/IVcy4tJjnlcffT9k5+UYzeKlGAysELWbAxHy
         cfOFAV4YDaTqd5FOiGoeCTFEpwvwyzme8BACsf35yYyD4eGtsIToTjtRApcyKpAInud2
         Qpd2i1rJul9G6i/9zl6Wxa5hJ04ZW5eCXzCr2PxQxYnev25lmIlKsREyZrocr6OGox+G
         WyRZlSuGn+31Y7CX9YQ5Wj+xA22L9oIeOOmQ+qdIcwTyUhTqVC5iKfFFW4z4fWBJ7m/c
         accw==
X-Gm-Message-State: ANoB5pnVtVL9Mkoq+BKdDo8uYzsaJmtrJeDjMtHYDBQ0o9pgQALnfbil
	oZFF4Nn71KJWbcP3EWMYVvYgRSY8yYHSQWHYbBU=
X-Google-Smtp-Source: AA0mqf6lgyC69PYBweEf71nLCpOhJms9uSsgWHUTYbRwuQeq53f7pxzmhCWhaQXDZnbW03XX+Pndow==
X-Received: by 2002:a17:90a:be06:b0:219:ecd7:759b with SMTP id a6-20020a17090abe0600b00219ecd7759bmr33789070pjs.10.1671202703182;
        Fri, 16 Dec 2022 06:58:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/13] psplash: consider the situation of psplash not exist for systemd
Date: Fri, 16 Dec 2022 04:57:51 -1000
Message-Id: <bf9cb1a3d68da6463195f79caf8baf94cd01a30a.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174756

From: Chen Qi <Qi.Chen@windriver.com>

In current psplash framework, the psplash might not exist at all.
For example, in case DSITRO is set to nodistro, the psplash does
not exist.

In our psplash recipe, we have:
SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
This variable is parsed to if psplash-poky-img.h exists, a package
named psplash-default is created and is added to RDEPENDS:${PN}.

We can see that the psplash-poky-img.h resides in meta-poky,
and in psplash_git.bbappend file in meta-poky, we have:
FILESEXTRAPATHS:prepend:poky := "${THISDIR}/files:"
So this file is only available in case poky distro is used.

To fix this issue, add condition check in the corresponding systemd
services.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7a62ff9ed39c179d2b9b0c40f4f8423ced413063)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/psplash/files/psplash-start.service   | 1 +
 meta/recipes-core/psplash/files/psplash-systemd.service | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/psplash/files/psplash-start.service b/meta/recipes-core/psplash/files/psplash-start.service
index 36c2bb38e0..bec9368427 100644
--- a/meta/recipes-core/psplash/files/psplash-start.service
+++ b/meta/recipes-core/psplash/files/psplash-start.service
@@ -2,6 +2,7 @@
 Description=Start psplash boot splash screen
 DefaultDependencies=no
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 Type=notify
diff --git a/meta/recipes-core/psplash/files/psplash-systemd.service b/meta/recipes-core/psplash/files/psplash-systemd.service
index 082207f232..e93e3deb35 100644
--- a/meta/recipes-core/psplash/files/psplash-systemd.service
+++ b/meta/recipes-core/psplash/files/psplash-systemd.service
@@ -4,6 +4,7 @@ DefaultDependencies=no
 After=psplash-start.service
 Requires=psplash-start.service
 RequiresMountsFor=/run
+ConditionFileIsExecutable=/usr/bin/psplash
 
 [Service]
 ExecStart=/usr/bin/psplash-systemd
-- 
2.25.1


