Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E8AC433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:19 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.745.1648399278427534313
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o0uicljg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id w7so7857454pfu.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zCmjDb/C6MGbl26SxvNVTkqIzQpB+okfdLwuIeLYDmE=;
        b=o0uicljgB4hYh3AO93TgU8OSPbCiXJzxibJNlcF4SiMVUIOs5K7UAe5r9WcBL65Rqu
         onHUNZz2//jTcpVcPB3pAILai/yxjYXO9SGkWgIcDEAxkI/IPQeHNA+51WuHAjU4jBS5
         Gf7BGyNq6QRHrX0mRJcoxIqyjRn4MCgToV97pFGYxDi+rb/Lm0ASomQby0OKF2MDxYIt
         SkCTj81pt9yjsg20/nYjEorUdG2BGVR6YjDb0ZI2or+WxJiA/HGwfM49lh2FL9g67eej
         Td0ClWayeBlhXSXcnCvmLfcsi9M6BMv5nxhiWc7EB1Zl2mffXrBeGH3g2H6X5cIhbCUa
         a6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zCmjDb/C6MGbl26SxvNVTkqIzQpB+okfdLwuIeLYDmE=;
        b=JlVUGWerOFm0ohIALJaWUhCntsZAk0Y1IVT3FIq62onk2ruHCy78ObbeJ6Qj9BOKUw
         GXjwiNOspGaskRGTBozd6Coq+h780ZkpOaiVe/R05l8FjpB9+qSORiXRPSuBmeIGg6oR
         XnEwgJf6rPo+Lh1+7qAwx1j8Qrmo0NV6DDYlBPCCiNH0Yy7JPKVx/g2XGbJRiYAviBTU
         xTY7dy5lzA80DUGYA2Xu4NM8CN7ltFqRsluR2DtTS7WwOvmz9Kiy4sOCa3HRlakLEWq/
         4xEGCdMTaLI0RUVibf/5Fnw1ECXsoifCYhx7/COzfZFV5tx8KEUHYIEpWxQdQFN8YM0Q
         aYTg==
X-Gm-Message-State: AOAM532SoGb5lhnwXrlv1Es59edGxUBYOXpkx/e/3DUEb0ovZ7cNSqHd
	M8CiFJqgowDx2D7pVJ7FeprHBJYOgPQqA+H8PFc=
X-Google-Smtp-Source: 
 ABdhPJwI1bLod5vSR3aToGyPzCjLVoGbY7DMlgjA9/5hIvq7Fnklx7qMSFwkoEu91ZXuZ+g0gCLeCA==
X-Received: by 2002:a63:1d0d:0:b0:382:5f9c:9391 with SMTP id
 d13-20020a631d0d000000b003825f9c9391mr7331137pgd.617.1648399277572;
        Sun, 27 Mar 2022 09:41:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/10] python3: ignore CVE-2022-26488
Date: Sun, 27 Mar 2022 06:40:52 -1000
Message-Id: 
 <d966a07d1f04aa76a4970d4af141f817197be0d2.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648399113.git.steve@sakoman.com>
References: <cover.1648399113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163668

From: Ross Burton <ross@burtonini.com>

This CVE is specific to Microsoft Windows, so we can ignore it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2bd3c5a93988140d9927340b3af68785ae03db65)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.13.bb
index 112ebec4c1..d7f6e9155d 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.13.bb
@@ -56,7 +56,7 @@ CVE_CHECK_WHITELIST += "CVE-2007-4559"
 CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
 # This is windows only issue.
-CVE_CHECK_WHITELIST += "CVE-2020-15523"
+CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
 
 PYTHON_MAJMIN = "3.8"
 
-- 
2.25.1


