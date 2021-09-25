Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65917C433EF
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 09:38:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.5084.1632562706535221282
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LK7ncFhj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g16so34866282wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 02:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xLiPWEkFVGrqzwDtLT8FwL7GbfrT25QMiPxdm9ACADE=;
        b=LK7ncFhjMqvsN6OlPiP7GCXF2QHM6P7RJL7+5ptGvGilgzjp6ex/x8QoFoBIjoJt2O
         nU14wKr8IXpq5G3Ai3RzfSmvjU1tFMZudjLMi6N9tU40lit5TQw/FXike3D2Pdwdc98n
         VHfjaFlLO7y8zxWnjY8kW1SQzggcfq7OvfmCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xLiPWEkFVGrqzwDtLT8FwL7GbfrT25QMiPxdm9ACADE=;
        b=fVpH4SQvywYGMLxo9VLYhlR4/eQEmyxhj1Nz0k3iJirXQeYWfjdfRapdM8QkgfocW6
         2e5vAK1Nr4WUdBe0d5zopLQanXxbiM2HADx3omXCRVDo8EAipVFG4M2xZqxhHW7UfLKp
         VrU4h9LYIMQhOPuY5ePxz3AxLXegI2CXRRFnRKBmdCwXwTI2PqegxBEKMT34DRQEN9N7
         eDRDe2btX5X5J+MitIcqUHkz34acCf95tby6gGqJ35LVrxgTvWSY0qMOp615T6TwXTiG
         dpucFL4oPbGl7AFgo6kdxIe5HyMFkYjgu26sZbdPN1ih88FptNn+1435b/LKwMkfzg+l
         FBUw==
X-Gm-Message-State: AOAM531HtQqnoEr2WBxt1HFPzJvHdDQZkqjog0UWL7v3d7mUL1l2sbGi
	+6aFTd1fNdZLXYIQeW/ekETO/ky12oG4H3Qt
X-Google-Smtp-Source: 
 ABdhPJwBYoOyutw6/tjW6Usz0dbJY4kwJwGv9k5WnA0mxF2v6c0WU3IjCfkyWfZXuaDqU1spVgDe3g==
X-Received: by 2002:a05:6000:180d:: with SMTP id
 m13mr16092140wrh.383.1632562704825;
        Sat, 25 Sep 2021 02:38:24 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id
 f8sm10491742wrx.15.2021.09.25.02.38.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 02:38:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] pseudo: Add in ability to flush database with shutdown
 request
Date: Sat, 25 Sep 2021 10:38:23 +0100
Message-Id: <20210925093823.1780735-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210925093823.1780735-1-richard.purdie@linuxfoundation.org>
References: <20210925093823.1780735-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 09:38:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156345

Pulls in:
  pseudo_db: Flush DB if there is a shutdown request
  fcntl: Add support for fcntl F_GETPIPE_SZ and F_SETPIPE_SZ (test fix)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index a9ea8b4ef66..7acb1d64d59 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -13,7 +13,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "21ff2fb690efbe57e7dd867c39aff36ab72a6ac5"
+SRCREV = "0cda3ba5f94aed8d50652a99ee9c502975aa2926"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.32.0


