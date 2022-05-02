Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31588C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:19 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.4331.1651532589181596848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p1OHcY1n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id bo5so13425609pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CCyv7WBStfESqPHWPPVlufFw57pmYyDrkpN++vttO5w=;
        b=p1OHcY1nFRYhUGmM86ldFsCjnYm3VBTJ2WqJaAM2IycJm9pQRnjkWv+t6uArtbF3jr
         TBwNWoqn+ScHaFCgmKTpeskaoG3p0oFHu/C4uyKH064boFhuV7BcAG7H8f1OYGjPQiZ/
         brHHUz0GMweVcnZVHItP+ZZpCr8ojyawWgxjF6WsPj8yz0teUvcHJ9obAsZqNpJDse0G
         rKDzg42nsrYTFA6GuUlChMCl6OV0PuJLeS5pU5xT8nFIzZ76e6DWA8AeYZeWaS2AyQLE
         1lIiPP28Goj3qiziW3AKEMgaRVbbuuRDw8QzcQ/tU6F0waW8XDBGuKsW/kDssGO76qME
         oyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCyv7WBStfESqPHWPPVlufFw57pmYyDrkpN++vttO5w=;
        b=hdz5RHu+gIppV+0ENXPECMDL3tnBtpqWx/lJY1ub7ix3hmRffGtrHOum+ORj4s/wj1
         J0IypO0Rq34dOFnKYYyuwX05U8SGj97Q3KZQsK6Wk/QLYrxb0+MeKqCydBypMc4MUmrm
         pCofijtT9BlF0S75j0PxS5aVEO058eA3NIZBw66QEATaCPWgzkTiH19I8WkvZWqIqh+j
         SrzwB7Qyx+xBMDA/P26SF3oPh4xpOib7FYPLiIY0kpmSPtotf/gxMLfiYumJCQbPXVth
         9T31GxmpqKqkEsVxIqIGd0fACBFjX8hNuV+hrnnXEAzp1K+hDrrN98Cpa6rv5cckP5Jl
         YNiw==
X-Gm-Message-State: AOAM530DyXdwkDHaWt0u4rNw8N/UY9dupAdMebQICu7pJiIQ/h5XhkIE
	Wd8zqW4VyuT8mgpz3bHix1TPjlfveGtb2wz5Vu0=
X-Google-Smtp-Source: 
 ABdhPJw3KkeR7lLT2VrNlODOpmu+tLeJpn75R+uFTI6IEWGi4sXgZ6ejuLJaAnjw/AEIijxyoeexFQ==
X-Received: by 2002:a05:6a00:130e:b0:4f3:9654:266d with SMTP id
 j14-20020a056a00130e00b004f39654266dmr13395815pfu.59.1651532587853;
        Mon, 02 May 2022 16:03:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/9] python3: ignore CVE-2015-20107
Date: Mon,  2 May 2022 13:02:46 -1000
Message-Id: 
 <1ed7bb74d35f08af3babf73c68ee01af5f28a50b.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165180

From: Ross Burton <ross.burton@arm.com>

CVE-2015-20107 describes an arbitrary command execution in the mailcap
module, but this is by design in mailcap and needs to be worked around
by the calling application.

Upstream Python will be documenting this flaw in the library reference,
and it is likely that the mailcap module will be deprecated and removed
in the future.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85fac8408baf92d8b71946f5bfea92952b7eab01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.8.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.8.13.bb b/meta/recipes-devtools/python/python3_3.8.13.bb
index d7f6e9155d..040bacf97c 100644
--- a/meta/recipes-devtools/python/python3_3.8.13.bb
+++ b/meta/recipes-devtools/python/python3_3.8.13.bb
@@ -57,6 +57,9 @@ CVE_CHECK_WHITELIST += "CVE-2019-18348"
 
 # This is windows only issue.
 CVE_CHECK_WHITELIST += "CVE-2020-15523 CVE-2022-26488"
+# The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
+# The module will be removed in the future and flaws documented.
+CVE_CHECK_WHITELIST += "CVE-2015-20107"
 
 PYTHON_MAJMIN = "3.8"
 
-- 
2.25.1


