Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2EBE77194
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.5390.1735810889179853810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VYaLt9Yb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso113517605e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810887; x=1736415687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0p8osgmtLV/aQCugc6fQ3fLMejfTwfUaBruABxHIcM=;
        b=VYaLt9YbkxAWRP2KmEvFJF4T9pZo7PrJ+2x50L9kWzcnuBRatdW+dyad8kBC726pGo
         f39M2SZ8x88HI1umbWKqZMfI4+l7Hhgcoo1sHaWttE787Qu0kfYuHMWN8GgykxGCERu1
         ZjOwBsSYhde1S352qUccW/hlxjG1XA3blW7G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810887; x=1736415687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0p8osgmtLV/aQCugc6fQ3fLMejfTwfUaBruABxHIcM=;
        b=qKP6F1JtKgjkC6ZYlkBL6gNfojy7dIC95FZ5NG8FweJ5XWvFXpjRE9HsfUr1ocYafa
         8X1I9KSg4Q88CpdFfhV6AN5UoiCJQTdOtJDFkPYh3OH55yw3MUHp1Fg7R5yBdAO7laqW
         LJ7DyhSMikeIv4qR6JtmMm6JIIR0SYxSdHxOMUUjQS3HXTpqh7mu6QxKUCIpcbzET9WQ
         sXY+FfX6N+jaM1TQsTkftaV0AwceJotKVtYPNV+/v8+z7SMwNrO/HFEhxFsJ1EcQky+e
         YoVckkpTk6Ccffx/CTKpHqVm6Y/i+Vf96jxtPTmSsub6cEG3jYuBM7I2kkk7hkvMFVxK
         wI+A==
X-Gm-Message-State: AOJu0YyLCBC/pr4ef1KGAVibSbK8Bd4D1UJXjaG+hL68UKwRfNVCTisL
	bNfAWJyJj00cewf1Wo3XjrQWDK/vqLhD6J7f7e+Ra906ic+V8Pez/B4M3atO6P1rLzGae4sq8pd
	eEcY=
X-Gm-Gg: ASbGncvslLbwO+usbVCbV/faMjboUid0+TEgf+zvK/rliBfG2RH8aoOlySrzFykwC2/
	BLjAGRLMpCB4+tBGnAMoF1kr/V1RC+ct+6sD2DGkOZVnPGPnaCsVB2mBAYH5OrBu0ZoZ1fPhh+3
	aODB48BEnB1GFQtGZ31GGeyceErfTKqI2mdU1WsXKb/4LQjGcDm6R/zyEy64dFsf/4nBrHUD862
	TItMmLXaIApkNu8sV/E7axQKqCUf75YiXROV5s/Qsdkje0+4XBcUFL79tUHMyjFrAW7ybkaGqf5
	nYH5+fC2CQ==
X-Google-Smtp-Source: AGHT+IH01RzHscImz6cjAlnJwLK2w41ZAy9jFSvKvHiBL+w4KXTuNTVaUG4qIfogCFN/IMHsa5Rx3w==
X-Received: by 2002:a05:600c:1c9f:b0:434:f623:a004 with SMTP id 5b1f17b1804b1-43671244708mr370903405e9.16.1735810886792;
        Thu, 02 Jan 2025 01:41:26 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/21] python3-ruamel-yaml: upgrade 0.18.6 -> 0.18.7
Date: Thu,  2 Jan 2025 09:40:49 +0000
Message-ID: <20250102094059.322187-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209278

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...hon3-ruamel-yaml_0.18.6.bb => python3-ruamel-yaml_0.18.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.18.6.bb => python3-ruamel-yaml_0.18.7.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
index 8cdcee9ec26..137b5289137 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.6.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.18.7.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8b27e6a217e786c6fbe5634d8f3f11bc63e0f80f6a5890f28863d9c45aac311b"
+SRC_URI[sha256sum] = "270638acec6659f7bb30f4ea40083c9a0d0d5afdcef5e63d666f11209091531a"
 
 RDEPENDS:${PN} += "\
     python3-shell \

