Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE7DCF3945
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:33 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.21512.1726756653229442260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ecc3q6GJ;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-536562739baso914698e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756651; x=1727361451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMHKrlrsTVk0uUvK/TIRcDwWQtyRXn6XEb4zPPLaQRU=;
        b=ecc3q6GJnXpXpayTvy0rnE5HQ6N6T9JpAUkK8OqGitWaCpVn9cADKh7It2apN4mVl4
         DaDIZWiUKdCvFHHcL4WOMw9da3dWDW1iNHqMB3iSGsghkTAurs9TcKww3d4fztpLTw9K
         wTQjfPNamLuHDROFYhJ5BUkz4+X4kLyiGRGawa8MqLzw993Fi7zgquudiXsq2Osy5hX/
         itfMRcc0rdCyaQD43nCwBsXgzFp2o9VCs88jkHdA7Lgv9OTNrPXJP/w6b5hu52lTeYqs
         WGYsm4KUey1RogASWbwOxjLpfv57QB61hRHPCbzGpLsuYpgKwL1bwA+MwVSYcPgacNTL
         i2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756651; x=1727361451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMHKrlrsTVk0uUvK/TIRcDwWQtyRXn6XEb4zPPLaQRU=;
        b=j1tJtEmeN6j3SEYyW42Koq5xOK7TkknauXt1Ut/9kn1A8EfZ2eamaxyH1TXOlZ2yoh
         cDmr9I+RM8s0dFJ7xYkGIcyuQ600xZP8I19TCiwLzq7LCW/hABlAPA6M5hYxC/e+qOvw
         ybi5ejxcbEr9nvWhTqXb2zCD51VIWjjhJctU/oFWxe+Vs4J4J0v04UjxsL3ocvMSqjzD
         N5Z3yErAjGFjAs7uXGSmolvbZpS/GjQUbLr/wrE0tbwczxFEMLnHgOznxOUKWPPReqKO
         ADb+HSMH2NircemmRJmSuEH79UpEx91AccbVyWVMDsy7wJ2FDIo060/lkY/Q2lVTyA/j
         7zcw==
X-Gm-Message-State: AOJu0YzXqUoHoU2G/MwbcjJ/Je59n+H0trcJDDBtJkKpJJmE2BrdK3dF
	iK440dYUqaqsKzdshgwT2gIaswVNlJNXbDQqE8azr4ibZ+Dtd3uP/8LG+rIE9SFN+u5eWVLkHB+
	MjBI=
X-Google-Smtp-Source: AGHT+IEkD0Y9/ftx5e3xzkRlFOt8bjGLSxQxWuoC8/M4JZZ+2CHqBjEY7IOoUgO/ceRYjUDWk0GS4A==
X-Received: by 2002:a05:6512:2345:b0:536:545f:3893 with SMTP id 2adb3069b0e04-53678ff5e83mr14645150e87.57.1726756651309;
        Thu, 19 Sep 2024 07:37:31 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:29 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 02/12] maintainers.inc: add python3-pefile
Date: Thu, 19 Sep 2024 17:36:56 +0300
Message-ID: <20240919143706.6074-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204694

Recipe moved from meta-oe to oe-core and
Khem Raj <raj.khem@gmail.com> agreed to continue
as maintainer.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 60f36a9449..b86c91c5d6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -662,6 +662,7 @@ RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
+RECIPE_MAINTAINER:pn-python3-pefile = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
-- 
2.34.1


