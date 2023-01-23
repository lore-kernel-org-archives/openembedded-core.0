Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FCCC38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:27:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.42221.1674480422108350404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 05:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EUcndrI1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id y1so6305752wru.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 05:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gGAvlEEL2aWKeQ59vf1dQquopR2iVuOL1rYf5eyHo4=;
        b=EUcndrI1OKbGcyylr5anVlNWz3JJGIMzgiNGi9WQavekGvxPeRYrIhuZ72a4xnpoGC
         Dp/DY1H5pOTc8wLKgxIA8ef9as2gzfOge9h76rWI44f4dCOoAJpBt3k5VFEG60nz8aSI
         UVNvsKjO2QXfEzsmw8ks4MEBP+Aur9RrzrHP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gGAvlEEL2aWKeQ59vf1dQquopR2iVuOL1rYf5eyHo4=;
        b=c4WSiCRrUy+TWQvK/4o21twwamxghC8y0LyHZLEUXdHPrraUXNkD5C3XE285Wkf9IC
         tFYxOm/RnjuBkUYdao7vrC2NHkC8He8C1OXnux7/nk9zNU8ETnU7NYPJ1NGeYTHYPuiP
         PayUkSB+b8vVPfRpu2wNyS2m0yY+ulqGTLdduQVZ4lMwDfR+/OeEyT6Un7fuDQNzr1aF
         gLLI9yIZsVk6shgiyZy95kljNqNt5aEiCcD8Z/4TG2DBDr2OMUGFOmGSXubegBS8dS0U
         p7RUPdH+I6cOUA2nx/rgwSCTqQxEvOAT0m0Eb+EWbfsi9ZAbv01IDBBFNb/2yyG7vxzf
         vYIw==
X-Gm-Message-State: AFqh2krLHSZGTmLHg5dUxj9VfeDTb+Kc8wiROFbEvFb6RoQTWcWslEpL
	/BPI1CGecgAaXnSoUopdMtgivB0bDSD5/974
X-Google-Smtp-Source: AMrXdXsI8X4h46iNWH3vqkHpr0YefJlGcWk7C70u2A+KkmL95BOtTlXJhaj4JNX6+7L7yqW13IiPAw==
X-Received: by 2002:a05:6000:1e18:b0:2bc:846a:8ead with SMTP id bj24-20020a0560001e1800b002bc846a8eadmr23135819wrb.37.1674480419982;
        Mon, 23 Jan 2023 05:26:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9195:b014:a064:8114])
        by smtp.gmail.com with ESMTPSA id r11-20020adff70b000000b002bdf290efdasm19689070wrp.58.2023.01.23.05.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 05:26:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include logic fix
Date: Mon, 23 Jan 2023 13:26:58 +0000
Message-Id: <20230123132658.2263105-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 13:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176304

The logic in the previous commit was reversed, update to fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 1458de57963..6304c4b86ae 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "cc1f6167cb5065daba1462056e2dce8ff72aa855"
+SRCREV = "9df045968d739ead0bebacce415d05269694de4e"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.37.2


