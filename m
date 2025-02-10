Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361EBC02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 12:59:20 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.50119.1739192351586159801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 04:59:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BUzB4aBi;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab7c501bbecso134591466b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 04:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739192350; x=1739797150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rRewMPSVHrucyeOkuu4eEhXGyJw+tqB8Vhi4nAxpbVw=;
        b=BUzB4aBiCzQTw7pphHz+jOim6P3iiPHDyfjb9VkxPU7MZjbchm01rSMJYYlUy7EQW3
         +eExpCFVCqdoZ5BM6sG1WzKj3s89Lxg3EAs36IsgsJO2weJM1asCbhyRyTHcxv4qlElU
         a2DC6CaFQA36THllGrPyiyLKJTHy+vB266cEdIT5qh9UGNTIlm50ScqTQQAOkM3wXyrg
         MAt317xXs2aCedayyb+sFF3O7orCDZgz5Hzj+VhgOOLUp10wh7UCJNn7558iElpu2FuU
         av9ln725TmxlE111FeCHgnDU3oTVTgcnNn65qoU1rCgXZfH9eibAf845iX3w9vDCz9cg
         fIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192350; x=1739797150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRewMPSVHrucyeOkuu4eEhXGyJw+tqB8Vhi4nAxpbVw=;
        b=aLbxSy6NNSf1Y+jrnrdC2pOv98H5rbCWG6TKPhjvOx1zkQ25HCVW6nPErTLQkQWn8A
         v0C623wqdyVyi7o2vqIcTW4LICGQp2jiEzMu+OJf9FCNsxshOUe5T+NUzVg1m3EHmq5P
         9oDodLM7sLMSHc+b7vyM5S4qmwj4hGqnBQkjaOJYX7G7ygDr5bIm9AnWyyXDi0RzRfj2
         qmsyA9wlhw35Q6PBFMHZtc2o5fPwD6s14Jpp1uhWSdMBd69wM4In1NQ1fSVIOtHVixn0
         pO5NVSBZaD8rVAnAPwISjPxQ4MkIwMXzg4tj2ETOS2qQlDGtnXOwyMcqnS/XgQsYKs/I
         v5Gg==
X-Gm-Message-State: AOJu0Yy4wmwq7aNWqEoVVZi8po185AN42O/SxYJZJurRvj7uMZAlGjYs
	KHzBxw5rTMXG3omELE5vnj4++ZTr2amkklPxxDfW9jKhN755OxB68jLaGg==
X-Gm-Gg: ASbGnctaRCZbp7dRgt/a3jPlk5BL1uJ9Xah5bCXo+31czLq3h+ccpEYFQL+0ZO7dcuc
	6iDFa+u/hAZiCvHSuYxSnNp22gO9JaCLExrh0JnJI7bbE4mbId+arRrzL5tXb+MNNoV8qbX1a3m
	W210jvv+1eS+32d3zckpvC2MlfL7yrFD0dL/M3WkxFsZ1x+c8prmvWKudch0/5VhehQGlb8P3hf
	AzVs7fuPxT3GjAuyCEef9sirboVZF8BSt1q+zvNLOlrr6JSS7Imp+eJvEOMDVslAKu0VPAdLRSM
	zEQ127gtAZAT1mYPGFiSjCDtqI5mUX1oc9vKBLmJb+X54QXpFqYi
X-Google-Smtp-Source: AGHT+IEGbKgCFiIoEbRU7L0XR4sxljQ4OXyQtrOK434xmdYt34qTjqw+1yImKR6Y+QL5FKxScJkBog==
X-Received: by 2002:a17:907:97c6:b0:ab7:10e1:8779 with SMTP id a640c23a62f3a-ab789aef873mr1504575766b.27.1739192348152;
        Mon, 10 Feb 2025 04:59:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c520a3a2sm181545366b.158.2025.02.10.04.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:59:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libxkbcommon: convert to git
Date: Mon, 10 Feb 2025 13:59:03 +0100
Message-Id: <20250210125903.2857177-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 12:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211095

From: Alexander Kanavin <alex@linutronix.de>

Upstream no longer publishes tarballs. 1.8.0 release is git only.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
index d87ff661d9f..f216a079836 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb
@@ -7,11 +7,10 @@ LICENSE = "MIT & MIT"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
+SRC_URI = "git://github.com/xkbcommon/libxkbcommon;protocol=https;branch=master"
 
-SRC_URI[sha256sum] = "65782f0a10a4b455af9c6baab7040e2f537520caa2ec2092805cdfd36863b247"
-
-UPSTREAM_CHECK_URI = "http://xkbcommon.org/"
+SRCREV = "7a31e3585edf78be281559377e26d15f8c4bc655"
+S = "${WORKDIR}/git"
 
 inherit meson pkgconfig bash-completion
 
-- 
2.39.5


