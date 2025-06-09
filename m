Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0B7C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:58:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.56077.1749463130360827817
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NeVRclSY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453066fad06so9339485e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463128; x=1750067928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ris9746VJpp9uIz0NLRqtuT2xOLjDpKDYu3xhtmBMlY=;
        b=NeVRclSYaT9Efzxpn1c5q9vFu3vDkh09iFEG6FqElsXI92NoRrdkoeITPzEiAkmK63
         yNvUgbJg2nggElprLl02IHVyYV5w/aVTWwPxdCKZCWLk6QxyOm24JhhLhj0yzBOc2RCz
         eYWEVCOOlgoTLC2tvGT2f81koeuBrKVeeuqYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463128; x=1750067928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ris9746VJpp9uIz0NLRqtuT2xOLjDpKDYu3xhtmBMlY=;
        b=XmGEqF0EYgcYeDaZ+wsRfB+TfZxDwZ0DQQgGfKjCNvWQkSUoNZPnnisR5kw9Xhow7F
         B0xNGPED7JmkXt/I5gcfUUqCJQSvQu1XpmzmQskRV431AayWTH1CQRtrF+Ca5ddTr3xT
         VVaPCcxykKdCCAbIMQ5vtvL2n9tRURHzXy6VUmNjAN45As0VooqXf0i/XTtalYQ/rZK2
         cfE9FAODv81aqcF5+tJvWgxwj8F/ksSckiYrGWkWzyXEh79wbt0wu/UefSlh92uMLIO1
         H6ynqH0Hih4KQZTqX7K2yMDpZnmnQhcywxF98pgRaDhCuuOd9ok5dhGntCdkYNuY43XB
         ePEA==
X-Gm-Message-State: AOJu0YwsJcFMYPdHTPMH9FkOXs9m/sF1WBECuIdAn9kCeN6w+wcXhvs6
	z14jUZ6Po6jLkTbC5KyIbqQ2AT5lX2qnM8VTVIXGE0VAOwari8AM1svX9nGlJb2Iwudn+IVCZfG
	Wrgt28zs=
X-Gm-Gg: ASbGncui2c4ZVJCZL3gHRx5g2cICLHqCIi91IVbyEHQBpA/hfDE7z3a4sVZG3ww2uOv
	oOmu0MQ4dcWFboNoG1p9I4e6iTm/w/hYS9gj/Ui5dAxiCG5FvFvdTfXwnsyQoSsC9YA7IS/4cEP
	C2G0JVvD/h+NTXLA98OZ2K7V8raEQ7yz066x26GkZ/X5XIYX5/ZtISkiarA4usEDe/ME9ma54YP
	IzuXMvM/00ekpYMfWVMKFVTlArXRucWutrE38oNNw4J2ZmfkreykNw1fzY7Sy/qc8c+z+1uSXwV
	jNZDE0MxGp/lvFP8Jp3BECQBr3H9kZepz9X4fuB60Zh1qbArhMYrE83yISrKECrNp54zcMsNiR9
	sbBsJ
X-Google-Smtp-Source: AGHT+IEPf+ZSDOy7CcCpQnOgpw1Ss1cMhbGLLPdtWDkaHdpx8RSxdyI7iVUWHlTcrB3jfx0Cx1wRmw==
X-Received: by 2002:a05:600c:8b57:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-452014d5243mr126664545e9.30.1749463128303;
        Mon, 09 Jun 2025 02:58:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375b60fsm108406455e9.40.2025.06.09.02.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:58:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] cross: Drop unneeded exports
Date: Mon,  9 Jun 2025 10:58:42 +0100
Message-ID: <20250609095846.937759-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218251

These exports are made in bitbake.conf, we don't need to duplicate these
here. Clean up as was done in native/nativesdk.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/cross.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cross.bbclass
index 93de9a52744..9abf166e50c 100644
--- a/meta/classes-recipe/cross.bbclass
+++ b/meta/classes-recipe/cross.bbclass
@@ -80,17 +80,17 @@ do_packagedata[stamp-extra-info] = ""
 
 USE_NLS = "no"
 
-export CC = "${BUILD_CC}"
-export CXX = "${BUILD_CXX}"
-export FC = "${BUILD_FC}"
-export CPP = "${BUILD_CPP}"
-export LD = "${BUILD_LD}"
-export CCLD = "${BUILD_CCLD}"
-export AR = "${BUILD_AR}"
-export AS = "${BUILD_AS}"
-export RANLIB = "${BUILD_RANLIB}"
-export STRIP = "${BUILD_STRIP}"
-export NM = "${BUILD_NM}"
+CC = "${BUILD_CC}"
+CXX = "${BUILD_CXX}"
+FC = "${BUILD_FC}"
+CPP = "${BUILD_CPP}"
+LD = "${BUILD_LD}"
+CCLD = "${BUILD_CCLD}"
+AR = "${BUILD_AR}"
+AS = "${BUILD_AS}"
+RANLIB = "${BUILD_RANLIB}"
+STRIP = "${BUILD_STRIP}"
+NM = "${BUILD_NM}"
 
 inherit nopackages
 

