Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C2DC71148
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:00:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.14020.1749736803621089633
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AMD1aBDQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4530921461aso8803475e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 07:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749736802; x=1750341602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1esL3ed/r/GNubkaHgXL1/tdMMEZUUMXaF8KZ70WKL4=;
        b=AMD1aBDQfjclaXq8YmpKIomGs+rCxb4/4rWhlIQfTdbjzYylszAURwOxk99VB8EJS4
         V8nk1Z7Q8yrvL+RBXPFqzuL4I8JByArVmJE9iBTdFWcqsWKKFCfKPRaLPJ6ymvMcxtUu
         qR6jL8bhKF4XdiWaYCx/A1RhaLYI5BdxPnPyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736802; x=1750341602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1esL3ed/r/GNubkaHgXL1/tdMMEZUUMXaF8KZ70WKL4=;
        b=FP73YtEujgb0evr1NVigj6XiJw06ELkXKkY/LFuGD48js17SlYbl2nTPJUh8EaZwe1
         TXyrjUghsqohECduRgcKeI7L4irmqJ3ivEB7Z5K1P1CNvbvOCW6f2z7Jk/6LRwpYOS3m
         bzWt5RPQamsAXOaL6k7h4NFrqjad2jXB6P9GkyDK4SCtYLfp1PZUVXUuzhYLnWaDWP6m
         OLRDCa3Lx6Q8Yb0Y46CrklrDhxQRXA/iiF2Y4K+v3VZVpk2hnaVwwMcxKdPEWjBhwO+b
         urwWzYsGcUnhQkoXR6TArSpjjUWe1RDMyQcCXqgDSbhVMuGtLxpnehxikYH4V5jpVC4c
         7XIQ==
X-Gm-Message-State: AOJu0Yx8Zm2WNCsANViSnXfaOahlUJQ+hrH/HB0tYiNw6kzFQwQQPXIP
	H62AGzVbp23Lyf4ii71j/BsS/4fLNDGEQVtGHGQLk+heg1NIItWi/sdaHPixmMz+R4EgzXZWwzK
	Dk7O+mjo=
X-Gm-Gg: ASbGncseVHffA7QWNm/L0kUoPkW7QgMUdoK9hSo1XBxmv3Lrb7119/fzEGWtxNEByF4
	k2ZAElmdqw12rHndcI98XWr90UToSrs9XdjkIBq5USUCQ/j3p00I5zUI2lxPaiwUZI6bb70qvmx
	G0xyokxiNoAimBSf2wrrxQKD7r5icHrW/TvdiTO0rI8zV57JCUHrdZ4Jj5Yc2VrNLb2kbmmL75T
	fieeRM7DAv0JT3Q5/W4+z95+L6ggh4s39hwLGNwFnuJA+62VLGOnpxZ9hRM7upXzSFESX/FG+9W
	22nqkBmDhs0jTrjDCQpiOptEbemFoY/o5Htw1/vi4SdnDRAmH5YfaoBEOPr0aU3AiDFrHsZj2ox
	cXlR7D5MmXBxVem8=
X-Google-Smtp-Source: AGHT+IEsfmaB816xs9jbpRmxmClFvgMdLK+vgj9+VfH2iBig2nbWxyiYfTaoKg5dwvw/yW94Ekfv7A==
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ed10:c14 with SMTP id ffacd0b85a97d-3a55869b2b9mr6222703f8f.14.1749736801596;
        Thu, 12 Jun 2025 07:00:01 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9e93:4c2d:3b22:8e08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2089474f8f.4.2025.06.12.07.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:00:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] cross/crosssdk: Allow deferring of these classes too
Date: Thu, 12 Jun 2025 14:59:55 +0100
Message-ID: <20250612135955.1413300-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
References: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218525

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/crosssdk.bbclass | 1 +
 meta/conf/bitbake.conf               | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/crosssdk.bbclass
index 824b1bcff47..3541c2c393d 100644
--- a/meta/classes-recipe/crosssdk.bbclass
+++ b/meta/classes-recipe/crosssdk.bbclass
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
+BB_DEFER_BBCLASSES:remove = "cross"
 inherit cross
 
 CLASSOVERRIDE = "class-crosssdk"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af3465b5b1f..f085a0f7475 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -947,7 +947,7 @@ BB_DEFAULT_UMASK ??= "022"
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
 
-BB_DEFER_BBCLASSES = "native nativesdk"
+BB_DEFER_BBCLASSES = "native nativesdk cross crosssdk"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"

