Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A85EC4321E
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:13 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.1164.1668704111942703296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ct9zujxi;
 spf=pass (domain: linaro.org, ip: 209.85.219.50, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f50.google.com with SMTP id i12so1598407qvs.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5WCKJmPHKzaNjRot287QJac8qJ9532nYzrvkAsgscQ=;
        b=Ct9zujxiEggmlENmRXzD1ytMxVG86/p3hCYzGdzFQPJ2Cto7dpTudKeLLEuNvSgQol
         AjIsxkbVkaWq37bIcRKi51SqP3VAEVKRqdRuBg60C4pAp62xz+6aSirhrj+v4EaePSqN
         H4aXfh/yUpKNVbfSPsTeuBmiI8o2oyvjfFGXqVyaigYul4kNErWv/1ZNzPQ8QF8eL3lK
         fQtpuNMlOaTmIA+PftuhvvO2LxYeFq7yNyPO1DGxpiVZ6eYwreLfAa1xtGlFhyw4MlLi
         Aevdl05aHWrNogq1D7ol3U3KQQRGLni8T26l46pcDaaCZEGvBRSVC8+/XdPrTjPewO0j
         u+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5WCKJmPHKzaNjRot287QJac8qJ9532nYzrvkAsgscQ=;
        b=WQOTG4CH0VucnYUwfivqcwoNVxfyOQDQfH1s6MXtnJ1wtbHjcieQSGZXHpIMfZr0I0
         /pYDeI7TWkEWnbzvbtGGl5lJhyVoYy18MqFsitq0A1AkdmPwS/P+ku9Adw5DE5GHglNS
         RjMYxfptWs/JuSlGNMbFZuG83HgrLk0twP9WJFby/fnZb1GTtgXYt14CwiWNQX6nLDsp
         T4JTcktejRR5fl7urkCFwOHSCSApgy5o6wHYZfsADQBhdvmuCVrADQUWfszPz3sXyoMR
         Sro5FVTxBzpypea8wADTpYdgJNZ6gXnWukCw6lNZaMqOOpzEiUNeBRVs4V6LtmzJEvRF
         Ayfw==
X-Gm-Message-State: ANoB5pnrmgUeR7mU2S+zBRfW/gD0y4kg7gsacef9Sk8qdnW8U5BcqXJ6
	gCiv1Wso/pKtUdfAj/ddAd/tB4AS02eHuQ==
X-Google-Smtp-Source: AA0mqf4b2Qtz1Lw4gYt3Q6rs2XlRwvVN6IAaWOY4imETfVHPx45nYi14QFvm+38oxzz4vXGc3xdY4w==
X-Received: by 2002:ad4:48d0:0:b0:4bb:7584:748d with SMTP id v16-20020ad448d0000000b004bb7584748dmr3095095qvx.117.1668704111003;
        Thu, 17 Nov 2022 08:55:11 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:10 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 07/11] golang: ignore CVE-2022-29804
Date: Thu, 17 Nov 2022 11:54:52 -0500
Message-Id: <20221117165456.1029099-7-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173440

The issue only affects Windows per the golang announcement [1]:

On Windows, the filepath.Clean function could convert an invalid path to
a valid, absolute path. For example, Clean(`.\c:`) returned `c:`.

[1] https://groups.google.com/g/golang-announce/c/TzIC9-t8Ytg

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 467ba13b72..a76e5ab70c 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -63,4 +63,5 @@ CVE_CHECK_WHITELIST += "CVE-2021-29923"
 CVE_CHECK_WHITELIST += "CVE-2022-29526"
 
 # Issue only on windows
+CVE_CHECK_WHITELIST += "CVE-2022-29804"
 CVE_CHECK_WHITELIST += "CVE-2022-30634"
-- 
2.25.1


