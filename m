Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C20C54EED
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 22:22:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.60242.1674685345643272991
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 14:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NGf4iNL9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so3145393wmq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAjLFdf/1IRvIhWERNUysDUmcwBTiEOjvg2/snfoLBs=;
        b=NGf4iNL9rfGZ+/ckyaUuI9qzclpy7kBB3ULIy9W49Eccs7/jA2Eyihf3VrEPCny1B+
         BQxcji3Z/ElAQDmGrnfnvE3J/QxmiajUAilEPOOjB4q6gA1Wyoby5ZVT1xBjv+aHBD9+
         AAKB5c69t7RAfBy7xAH4HLLwIh/bYjYdkM8lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAjLFdf/1IRvIhWERNUysDUmcwBTiEOjvg2/snfoLBs=;
        b=mxXib2GGJ962y7x8GMa3KBIIYg8nUzUuR/SzE0X3tL2TJusPLqfX8rdwN4QWrS694G
         XEZa3IWlHMMzETHPDzIqcz/14ssA5NCsd6eBz7moIL+gC9z1TSeIKV1G+NxtSf5LdH3/
         sr1m/11A10EXeo/FB/1PLfv0P2xv1BP2f8davQVxrHDrtS36A7yLYtlnGG4OyV/NlIfT
         RMGKfrdLGoO4WdBpACf2iP3YiahcaFr/lzsKJsHRoQ+Nk/XrD0guGea5l7AF3/7pY9Hk
         nFXj5N6OChBE6OBzZCNXmnz6U9/h/VCYbcqojBJ1c5A34XnSS7Sv8TK/ui7nEr6IEV6e
         6bQg==
X-Gm-Message-State: AFqh2kqpWZ8mdYm/JKI9UICeBJzD6YKvgBJczCXfc7afiKnldaFdFhdL
	mogMrsDTmpkOKaiuoscRwT3sbaaMRCsjfJQV
X-Google-Smtp-Source: AMrXdXtssm/LyZ1qqPIbiPj5/VcoPz+no+MZCBwAkgP0gSZuGiR/v01uQwoVxAtR8d3PZEqqYU5SLQ==
X-Received: by 2002:a05:600c:2046:b0:3d2:3ae8:886a with SMTP id p6-20020a05600c204600b003d23ae8886amr40777440wmg.17.1674685343972;
        Wed, 25 Jan 2023 14:22:23 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c500d00b003db2b81660esm3154986wmr.21.2023.01.25.14.22.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 14:22:23 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] conf/sdk/x86-64: Set march specifically
Date: Wed, 25 Jan 2023 22:22:21 +0000
Message-Id: <20230125222221.2462169-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230125222221.2462169-1-richard.purdie@linuxfoundation.org>
References: <20230125222221.2462169-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 22:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176380

This is really no change since it is currently the default in gcc but
making it explicit matches the other SDKMACHINE configs and means if gcc
ever changes, or we switch compilers, the flag is present. It also makes
it clear from the config which tuning is in use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine-sdk/x86_64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
index 2ab607e65c2..3396f95d69d 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1,3 +1,4 @@
 SDK_ARCH = "x86_64"
+SDK_CC_ARCH = "-march=x86-64"
 ABIEXTENSION:class-crosssdk = ""
 ABIEXTENSION:class-nativesdk = ""
-- 
2.37.2


