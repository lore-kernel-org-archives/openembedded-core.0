Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3EC46467
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.1042.1668704112715064083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=k26cb78T;
 spf=pass (domain: linaro.org, ip: 209.85.160.182, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f182.google.com with SMTP id a27so1445640qtw.10
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGihK8SvZAcswnMXFG0JVSp1ImG/qx/M9JahXZlPbBk=;
        b=k26cb78T6VEQ7B3QCGDm4iMWVI6QbR+HLgnuwin+Pv8Iv2HZAyY4qTLducNIixuqYB
         wpSN+IPNNG8SKa7+GbQmBYxl9gsw2Ci+pYOwko1nPFWm6kMemvsRV6sGfciLHK7ALbte
         upJRPmZtuvzR8ORDdbreUWQ2abSPRETpEuZ7wlgQfjOc9fAcI6QcaymtlMV3cxRGWQbr
         EW33JhpIE5E3+MPjEtF6NP49VT2jUPy4dDasiD09tfAn/lQPKDdMzrWPjXrSDLxzoeme
         AzUIc2qBxgYUnUKSYG3jwfok22WNbjX8HsJso1JZ8o0yVEqiBrHxG0oYq7W6W9Vjwn+C
         Mdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGihK8SvZAcswnMXFG0JVSp1ImG/qx/M9JahXZlPbBk=;
        b=mdXf5ONmxPNeSU8JlOIuYAENXpOcjEwFfO8YRmigPb/jK6HKYqIbAcfgOf0Ph7q0f1
         aHut40QNU8HRM2CQ06kaBHGMzr0JlmihtmDb2Iv/YLX+lkKWo+uoSCQ04ccaEmU4zh4L
         ME3SyWxhhqEDrxc6Ln/MZTOqPPO7ThZmRE0TtFb+hSkZjz3yLi3vudTuo7skqBNigCMf
         w0in4TEYldXDiriL7wN8rZQKSZtyn+jnmpa0KZfr4X5IzRTO5/jaEFh1dUXwyDPTwmUo
         nRnJa4kb77mcsB6PX3PBPca58YKsx9uTlVMiHqYkGXBjZUfHZusdopCho4QSZGZMNHqw
         DVxw==
X-Gm-Message-State: ANoB5pm5df6yssAbSDYPS6jWI8cAKtSuob1UOXAfZaq2We7nE6Kp6Y6j
	Y3DYO7QbE4bjnHI41SydDxB/bILX10Kq7A==
X-Google-Smtp-Source: AA0mqf5qzcUv106YUbC7HPVLxVaNVOvEcUdoKjpCVOHaQNUznKncp34xuW7k0bjyE5b851mkzmPpWQ==
X-Received: by 2002:ac8:7608:0:b0:3a5:6797:c57a with SMTP id t8-20020ac87608000000b003a56797c57amr3049695qtq.34.1668704111855;
        Thu, 17 Nov 2022 08:55:11 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:11 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 08/11] golang: ignore CVE-2021-33194
Date: Thu, 17 Nov 2022 11:54:53 -0500
Message-Id: <20221117165456.1029099-8-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173441

This is a bug in golang.org/x/net/html/parse.go. The golang compiler
includes a partial copy of this under src/vendor/golang.org/x/net/
however the "html" subdirectory is not included. So this bug does not
apply to the compiler itself.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index a76e5ab70c..9fd46356e9 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -65,3 +65,6 @@ CVE_CHECK_WHITELIST += "CVE-2022-29526"
 # Issue only on windows
 CVE_CHECK_WHITELIST += "CVE-2022-29804"
 CVE_CHECK_WHITELIST += "CVE-2022-30634"
+
+# Issue is in golang.org/x/net/html/parse.go, not used in go compiler
+CVE_CHECK_WHITELIST += "CVE-2021-33194"
-- 
2.25.1


