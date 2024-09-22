Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80240CF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 08:42:04 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.11535.1726994517669840130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 01:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G3NoxBbV;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so37327511fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 01:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726994515; x=1727599315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMHKrlrsTVk0uUvK/TIRcDwWQtyRXn6XEb4zPPLaQRU=;
        b=G3NoxBbV8rRoeQ5zZhvcL8ispUIlD21Br0oOWM5NZfoqTkCsiPpXbQXXb9a99rnLmU
         gzU6PZ/pqGfNpCGxhayXi+b1QkqQXVvlChdyBe4NP5L/BcwWs8fPmuw7JcnL1fRjBuS/
         Jtw+Nwg1jWWzG9s3Nu8wRQGGz3SGV0sWc5u0wqWTTmhb0IwAFOyMzuVIwC6PNubbgwLY
         OMvhU11rzUX8TXyQcQFyo6R81PDd1gHA8JkTHYgx9qL44q10vtDXLvUOnWHm/H/T6yn8
         97Zs3Qw2qY9MyvxQsMe22CsligAA1nd4fFdTdqWTG+mddo+T1proePXRp5E9HQajJf61
         V2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726994515; x=1727599315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMHKrlrsTVk0uUvK/TIRcDwWQtyRXn6XEb4zPPLaQRU=;
        b=VeTBTDZpcInugDamtrshHolqqDPHhMeoqbb7oTwwajc2MTMrMGAkvI7rfmRRJtpVji
         K/tdFWRdXXYgUOt5ecvZvnzxlbKDJPPPH15VjZcvlCxkXbyBKhdYF2Otevm3V5gMtL2R
         Qe95vhrau3E/xm6pw93IHqBhGM0IQmF3LH5o5uEWgpnGDhCOti8kWdTM1uyRUfHsW6k3
         2gNoSnfsN158mYttGXJzzsr3m6P7/YVMCjF40fkl821Lf3p9gfQiSXMb8MvGze4+kpI8
         6iV7jts32Z/60Gl2XykfQV+71tztE90sD7cZlHQwlRA7zJU5j13uv23E+4y67Xrp8vHs
         bvzA==
X-Gm-Message-State: AOJu0YxFdobSsVVllj2s8BxLURthkCSvmdgOtHXEI+QXvkpGarKZNXdH
	u0oGN35168dTcrx5wcJTSXOwlTqrZFxRqI3t69UBjjQq5w44Bsc5RQU3qp7kc4s2KOVKrlrU9Ee
	VbiM=
X-Google-Smtp-Source: AGHT+IFmYdrWdVC1EALl9ot8EIzyWVGFoM4pS9qzh5LKk0DtSoL1ChPV1ODsRUtECP4AugsmCHCDmA==
X-Received: by 2002:a05:6512:1153:b0:536:52c4:d7d3 with SMTP id 2adb3069b0e04-536acf6a51cmr3752911e87.9.1726994515444;
        Sun, 22 Sep 2024 01:41:55 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8745sm2877339e87.236.2024.09.22.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 01:41:54 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 02/12] maintainers.inc: add python3-pefile
Date: Sun, 22 Sep 2024 11:41:18 +0300
Message-ID: <20240922084128.9648-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240922084128.9648-1-mikko.rapeli@linaro.org>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 08:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204774

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


