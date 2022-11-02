Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CD4C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:24:58 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.716.1667348680787322093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=EX6Ud8Go;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id cr19so10448302qtb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6hodiEIkIkDPmYFG/TPsFChlaKp0BTU989fexxex/s=;
        b=EX6Ud8Goz50b6+IJzuWoJ87SmglqDhQXe7+0PQ6yoitzAF7onKnL/mJyXnsIKgp/5p
         hJybfq1unlk0q7xVBXX0cR6yFwihBHiDfMh/E9dugDMdkTPOyhz6LWXhiWXdafUrEv5q
         aTRRD1jXZN4XXA6Do1Fs1VRj7+GoFr3vx7FvMWpqFWVDbsXeN4Zb62M6OXI47Ooy3KLI
         vsx3lamopybPWzF+qlcSHgG6/j8FfB8QIK9FxvspWtB5+2Fqa1G3Mjw3Wl7oRpECxjGM
         GdmU1nfnLxRsiI2m0mRF0W906+gqEFTSFqfrawb9ZfwA9lUJFMYWa00raJTLcRwHO/DW
         MbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V6hodiEIkIkDPmYFG/TPsFChlaKp0BTU989fexxex/s=;
        b=BvVchTyIc032YR0X24YOqdq+BVje5DKYdrQ760jOlgXifqb0D4rQv8P4HQOQXSBlYL
         p/BJZiya/y2zBrAVqsS00NfhXnLv74aOjNLawS6QIgGmB+YfZhE667wIhcsloGkxAoO9
         yS1X5yfOPp9Aw65vubg7cWC8rz6pz9j+g6nsEqRpw0zR842oaqhdD4TQxWFUnVTHWv3E
         3nZbDDPcXQH3ZMe/xncUvIPI5y+ouLZckf3wJ5Zi2IERYlQpgUbEyTGYOj4E4JQ2E2c0
         Esi12U0Im78tAQCQ6C3r51Aj8FRbbaZbsIE9jRhTKFqjtHojO33uk4Ylmv+1YmPwCR+h
         q7ZA==
X-Gm-Message-State: ACrzQf3hD3I3gEl0UEFW9DIHKsD6pPUGfDF0tdzkYK4FT/gUxKbczoZS
	YzF2KQu/h5sZrV9h/L1H5qXLFt5Ni4J5CQ==
X-Google-Smtp-Source: AMsMyM7WssMI/1pWyPbcnZhUqr8GpNQ5IfXJHZVr9+54LmQQLLU0PTsg7tCVB2QhvMWazVJi67B8Zg==
X-Received: by 2002:a05:622a:14d4:b0:39c:fe54:1cc6 with SMTP id u20-20020a05622a14d400b0039cfe541cc6mr17821717qtx.88.1667348679186;
        Tue, 01 Nov 2022 17:24:39 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id m8-20020ac84448000000b00397e97baa96sm5860523qtn.0.2022.11.01.17.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 17:24:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: add qemuarmv5
Date: Tue,  1 Nov 2022 20:24:38 -0400
Message-Id: <20221102002438.2618588-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172394

qemuarmv5 passes testimage on with the linux-yocto-dev kernel.  Add it
to the compatible machines list for that recipe.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 4825bf7a9916..aeb04f59e8d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
+COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.30.2


