Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F1FC4332F
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:01:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.11935.1651248111896515725
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=shL65o/Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so10892186pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/KrXy9vYfRwzdRcQgglSE6K0Qfu/I13jHNVE6FqMP1k=;
        b=shL65o/ZfP1fop/fm0EfGw+bHDodcgRsIKEMceYNWH/SPzReQiEyMpWRmBgx8BfgPZ
         Dtv27wbjoUYU/cVamYT8xKVPJ/1/MBxuxxHqZjqkcNOPjwcq0sQ/bG3Dv+2N3iEA5VCj
         5I7F/8p9a16XTp82C6tyEppGWcAkcAPGAvhLWTu/rFd3U1Y1RIlnwoSOLcgP2Qqer1vW
         D5/ov4A4U0CZWmQAcT8qgJ0Z/soY1seI4aHlbo9JSvEmIabozFyxWfo+ODTBbRAdYhTt
         0sFXBNDg/6vxWpGIg3YiPWO+7vgQ8UoXOzQ/XVOoUJLTXkZy5tyc0jQjO7SQWK2D3JVx
         qjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/KrXy9vYfRwzdRcQgglSE6K0Qfu/I13jHNVE6FqMP1k=;
        b=P9bjgtf0x77+f826LV5YA3mU2ZD92nTJskX3DoRWem26HJ66EYigOGd5Je/yWO6AUD
         /Pirv5y4NGs/v3dLoEmZ7J/ty7Bgz4xbLMLRC01b3O1Hg2kgaHF0KZkQm8d0fHEwU5+l
         lJLAoXJVLelvy1eRBSFEZ+VLxvAMU1ifMWZ2Sg7obA+CPWh6Xq44inRGJeDuLmEyHeaC
         SDQfttOH4t6Tb7FEiioCDGHvgCh1Rsz9GLMCW3FhNOzskf/3HW9HvfjbkZeFD9ylRISy
         OG3DNwuglzdt+TP6+KqG9Ij6/PpcGv1eHyfL/XfnJWcsjQAgBfG1f7/6qq3VovedNQ2S
         +D6w==
X-Gm-Message-State: AOAM532aOlx3DHPNee6yAPDoGbMxgyXPSdwD34Z8z8myngUJ0iKbLf3b
	xXy7VGd1vSNP2kDIQ+VAxDdiPkPq75/+9EIrNwg=
X-Google-Smtp-Source: 
 ABdhPJwLRRnbg7YQk9LTmgLFBN8bC/mu4n4bMO673+3KOwgIzovZ00DHjxvA4FoK6wfuTgiL3stKtQ==
X-Received: by 2002:a17:902:9f96:b0:15d:1ee7:4231 with SMTP id
 g22-20020a1709029f9600b0015d1ee74231mr23693257plq.131.1651248110618;
        Fri, 29 Apr 2022 09:01:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.01.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:01:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/34] arch-armv8-2a.inc: fix a typo in TUNEVALID
 variable
Date: Fri, 29 Apr 2022 06:00:31 -1000
Message-Id: 
 <92e52e0bb7497a701a0a26305a1a1bed0f4a60ce.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165031

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Fix a typo in the TUNEVALID[armv8-2a]: It enables instructions for
ARMv8.2-a, not just ARMv8-a.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 0a4404c117ef8733713962767c1d2c9f87c2c990)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/include/arm/arch-armv8-2a.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
index 30f2870811..95368b0af7 100644
--- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
+++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "armv8-2a"
 
-TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
+TUNEVALID[armv8-2a] = "Enable instructions for ARMv8.2-a"
 TUNE_CCARGS_MARCH .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
 # TUNE crypto will be handled by arch-armv8a.inc below
 MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a:', '', d)}"
-- 
2.25.1


