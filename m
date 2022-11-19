Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BBAC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:28 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.26322.1668880105241392246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=TOGPv9Iq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id b11so7131355pjp.2
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsBcTdtCRI+v2IQw07PIN0xONEK9XBkvYNdxOApaVPQ=;
        b=TOGPv9IqX45Y0YFzaKZVIWYnmeHbFi7KKjwtRvq9QXRmVRto5VGt68IhW0+9gPAD14
         NLZRuXAqSx8LnKFAvtw7RXgPbKbmcXpFfmugEfQ9pEKNYUBjUqmK+F8TIXtVfE1efscX
         xEDXzQdRdEVd319AF9l1ZVb+AGOSc37C8MrPb8FDuB/5TPGrFCnyEwt5Cvar5dcbNIIP
         CU77X/Uj7V0kF7BPbS/ki9yW27NZ1/wYDcyuqUsRPdIfFNonDCr5k0bwf3Z8fzIcwTjV
         cGHhG2nzLR7nI9EDEeucbIMvXS7HV4+2tPHJElitnkLEbR7MNyeYqFv6Ytz/at4Ry3zr
         E0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsBcTdtCRI+v2IQw07PIN0xONEK9XBkvYNdxOApaVPQ=;
        b=kQgG517abftB77a5yrwB+fDWTMTOEuPCVJZTWeRVDi2ohj/M1MPby+dGkoXG3bM0/k
         AgpDpmHeTe14RCihM71Zu15yhnOupR7D/bD3VySYmxtpBkvnyWGQcQJtFaS8ScvFCCaU
         GAMU0WlamVFK601//shuh2N+BD5h8YyCCQzmznyq5h6wuzH3ADyeBOgOVEfPbO2+AgNI
         buQZH15WQrYXSnmbYCQpe4OtRPNtnrbPRc9sVRvkgN/xcKFRj92QnzYkz2KmfTmstnhW
         DBplLmiNkuRMlXsCFdEbFpem4K4v/GPq9icsjgWS24Eg1EO2pBEJTL/Bbv01vPaP0Zmm
         PS/w==
X-Gm-Message-State: ANoB5pnrzDO8CckaPXqNnOMUSET/bYrQpBHlP3B0EB3IAu5snbH5/YbV
	6ddNOqDMyfFq2ibpVIojcWrJAN39GUiRJISvIk4=
X-Google-Smtp-Source: AA0mqf6wi9DjZ6SHagJJIZx+RMZMUNGS8+P9E8R1Sz0+IR80WrsXr++mIcb/D4iFQyGVSVXAAo2jzQ==
X-Received: by 2002:a17:902:e849:b0:186:dd96:ce45 with SMTP id t9-20020a170902e84900b00186dd96ce45mr4686010plg.73.1668880104235;
        Sat, 19 Nov 2022 09:48:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.48.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:48:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/21] golang: ignore CVE-2021-41772
Date: Sat, 19 Nov 2022 07:47:43 -1000
Message-Id: <6633e3836a15632ead428434d6abe76a9cfbb118.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173533

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Dunfell uses golang 1.14 which does not contain the affected code (it
was introduced in golang 1.16). From the golang announcement [1]

"Reader.Open (the API implementing io/fs.FS introduced in Go 1.16) can
be made to panic by an attacker providing either a crafted ZIP archive
containing completely invalid names or an empty filename argument.

[1] https://groups.google.com/g/golang-announce/c/0fM21h43arc

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ac4c4e9973..8c7df2dede 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -69,3 +69,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-30634"
 
 # Issue is in golang.org/x/net/html/parse.go, not used in go compiler
 CVE_CHECK_WHITELIST += "CVE-2021-33194"
+
+# Issue introduced in go1.16, does not exist in 1.14
+CVE_CHECK_WHITELIST += "CVE-2021-41772"
-- 
2.25.1


