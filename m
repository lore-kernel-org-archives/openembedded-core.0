Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2470C54E5D
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 00:21:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8848.1710462079443395813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 17:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=hjKVPrVS;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41400a9844aso233685e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710462077; x=1711066877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdmbUoH6aTIs0FGI9obSngTkUcfMHLg92/AL4YQ2PfI=;
        b=hjKVPrVSTQ9wrpqbBJzhw5zjK0sY9bq55NzAzrpS9mXq2KfsoP0bfGEvV1EsvQ9p2f
         AJFkkr4vY+J2G9ZDrgMhyUx5gPC6Kpj65zTxnr8GZ2VFqjV2uNZdNi+7QcYEw/CTZaRT
         Q4/pztUfD7WKMNawGeWACLun6/6GSv95SkH4rLgwA9fx/tFrAd65PN3EAm4Atk6bniW0
         1YUrvTKD+gec1ZdKHpUF0PRj3BMHoEVXujcoEM15KlAYczRygw89Oc4yC9nKYMqQAdGx
         xoIqhyXbqHQH0UxyqK0Z7zVDYS04tSSHSA/vMK0X9k4ibqFkl5gs11RhtCXTA+Gd5UQX
         wwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710462077; x=1711066877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdmbUoH6aTIs0FGI9obSngTkUcfMHLg92/AL4YQ2PfI=;
        b=Q+wCfXY46WpaKps/p6MEW5FuhXB0jZfQeYyADcOLNAGJ08gPW8XJ0pKUAkmYeKI1Qp
         p1EmEKjWsZoXzUHHbtYJCVmKZNH3XIA/020MUZ4rGJ3kiRLF7eZ2BnpNsAC+QUQzhDrt
         PwqAm9a7VBPSsVpk9k3eV3Q1kP0Xk2qMsYmDQblLr/tBMl1vdenJ6LGHN73v/liRO5kU
         GTXKaQnAjvyxLWWWOIlvxrvvE4Q5+22Rp613xxwMB6kUK/MSYAou/pgTvzbmwQ1yLuZp
         1suannp7R0jb1qqPTdGnJvz9agSrhPitwXiRDB+xGtWAkFgm4Uigbxz58DYClhEq6t/p
         rVRw==
X-Gm-Message-State: AOJu0Yyg0UFhRVWx1ny+H3D2FtBBt7XSi4SwGN3lFfuGe9RSzGmtcjYH
	WcWdNXnitruEigV1WFqrL6LtCFFFGGzF1e9aHkZfGdaNJqVS1X0ujskT6gBkshGPdDwbCSH72Jv
	8Ozc=
X-Google-Smtp-Source: AGHT+IHou8AYNxw5FuaOCKJBhXOI86ZzqvVMehkznHuDYrB/bhQLM1WEQTtBwd3Ukr1ub+H3AicT2g==
X-Received: by 2002:adf:f0c5:0:b0:33e:bf21:13cd with SMTP id x5-20020adff0c5000000b0033ebf2113cdmr4774012wro.1.1710462077183;
        Thu, 14 Mar 2024 17:21:17 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bs17-20020a056000071100b0033d9f0dcb35sm1868053wrb.87.2024.03.14.17.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 17:21:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 2/4] cve-update-nvd2-native: nvd_request_next: Improve comment
Date: Fri, 15 Mar 2024 01:20:18 +0100
Message-Id: <20240315002020.2194310-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240315002020.2194310-1-yoann.congal@smile.fr>
References: <20240315002020.2194310-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 00:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197119

Add a URL to the doc of the API used in the function.
... and fix a small typo dabase -> database

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 8bdb4a4b46..5bba2219d6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -123,7 +123,8 @@ def nvd_request_wait(attempt, min_wait):
 
 def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
-    Request next part of the NVD dabase
+    Request next part of the NVD database
+    NVD API documentation: https://nvd.nist.gov/developers/vulnerabilities
     """
 
     import urllib.request
-- 
2.39.2


