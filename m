Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54945C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.1897.1645557473915803192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xqs73p9z;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 cp23-20020a17090afb9700b001bbfe0fbe94so419379pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hj6hSOKPX2DElqItnNa5+99vodX3FnC8yHLq7s+Kkbo=;
        b=Xqs73p9z0mZ1qigJewT0/1MOSN4J6xaY9/7MDEq1LYJVxBOv1Hq9K+TYTxDVJVExhZ
         KoAJ7xmhTM6ISwHBQYIfrgRMWs3k31pRGkeq8DzvcpnFMIn01t8kORBcXJQEf7RldneT
         JUx+AfVtkNyCQsvmopfeHzSN3gxy+tJqJQAnShWmcJAa2sdE8/9fmPfcagPzmriQ7NIw
         lAXTnMnWUrba/dxN2ubJNbkAGwJMFijtyF5R7w/AK3zMA7gw4z52HKZm7HMzkpXPYlWY
         9UMBS+MWYJ/hys0DStuGFdPiHJ3/4L9NDFHzwgEFBVqrV0IQoQdSR3ulGkQJbwjS3Dhu
         kXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hj6hSOKPX2DElqItnNa5+99vodX3FnC8yHLq7s+Kkbo=;
        b=ahpx2u0PkyiC49n7wWLAjEmxbnSmsoaIuwLpZwWSaNn5gqtVwDjLO47RKFOLf2rHkZ
         c5lE1eTiKsFXTiYLbDR5EFNfdQNd+eGlLyWKEm+wLPnqBUj8IqtHiPNKNOhvBShdlLJp
         0xvpJ+E6tCc7DhbJYox4q8/QLG+lNqlJuk75iP3y1EkIgUyceVybUNevEG0oR9rt+1Rs
         iz4aDcuD3ife8bqGlvbEr8JaUeIW8ziWIiljSWTyWqstHs6uF7UvFRVsyoSEVGlokV0Y
         /IXwh85OTpMg2dmnlsX/wVr9bKdxduVgsgO13V1bmlsPflCLP0Nk1KH+e8JVON8YP9qM
         /dhA==
X-Gm-Message-State: AOAM533/Htak3snMlqulP4cmrU8rlaZFQjvlRh0i2zlZW6fKf7td6BnH
	mXCLHgM6h7GxuDgCaUVstw6ybzsayub2/A==
X-Google-Smtp-Source: 
 ABdhPJyANvxL3z3n0GCle1NzauUvOCDjPyu6KNEy7xpkzM1Dm9ZHhFE83nOiumpbz6xm7QArvyd9Vg==
X-Received: by 2002:a17:902:7786:b0:14d:51c6:21a8 with SMTP id
 o6-20020a170902778600b0014d51c621a8mr24828542pll.75.1645557472810;
        Tue, 22 Feb 2022 11:17:52 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:52 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 30/32] python3-mako: inherit setuptools_build_meta
Date: Tue, 22 Feb 2022 11:16:56 -0800
Message-Id: 
 <74b69bfc771f72ed1536bc956f8876ec707c243d.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162221

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-mako_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
index ec8c9cc12a8..23e13cff948 100644
--- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.1.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=943eb67718222db21d44a4ef1836675f"
 
 PYPI_PACKAGE = "Mako"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 SRC_URI[sha256sum] = "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
 
-- 
2.30.2


