Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064ECC5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:59:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.56097.1749463182305611214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eMghwXC0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3422211f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463180; x=1750067980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/HdiM27TpldNt9iXnG9Yfmfb7pGoxEUyhlx7tTSLlY=;
        b=eMghwXC0WYV4uwGPDk2kaopLphXG3ag8I3XDYyXUnTA8kRd2W+/6oDtr8maqCzhndJ
         6arvfl5PAgRhG8eIiJovxp8AJBdIgpD9vJEfjsXtlBXuaFauQ/RvupmZ8OWdo+s1ITjT
         Sv9sSOQS2BTQj34xZwMhr/ffXCLpQf2x0HorA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463180; x=1750067980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/HdiM27TpldNt9iXnG9Yfmfb7pGoxEUyhlx7tTSLlY=;
        b=e8CFx/WDaMieYkeX2kGjFpMox1m2zpxwMPPkZzAxSfTBkGNzTiE0KylyxPR3XGEcf1
         1uCYy60eDRlEckF7s4DpbJ/bmoZrWT1+r8INaCI+buVQUwzZU44nrXQjSS/USPCT+4Bh
         vE1vLMj6IuLYe48V5Mj6n8rmtl8q215ynCaH6PJEoqjrnC0w9XXTfKd80jeTt6KrhqFk
         JxAIQhbYuriQ6eLJqwx1LvS5o8PXKdtQHtrMhfJMKr0561cjnv5omokUj7GJrs7E4dgZ
         UdOREdcrR4lAsoeZ+aSiDbFVGFOnKnQq7sgfQemcJQBWEgqNGLHq7rYnG4sEiTX2j62F
         DAMQ==
X-Gm-Message-State: AOJu0Yxy/wLfAycoC/EgBt2SWoi7TBAro9ePiYXbM4FEDH+GCBiLm6Co
	4HQvBX9j8D26D8lM7sqKuxzPL/bDwTjaxKoE2jqVYl5V5tf/UTIC9QbxkbWkzUeMccVt5soPSHT
	MvTl0yzE=
X-Gm-Gg: ASbGnctB6oKZUykAbbs9bVSSV35MiWOymtYgfFEd0w14ukGd69S67azyaNxhQu7iSc4
	sOhpe3t7LLsD7wkYWgCfU75u4FXODHJKTWrmL2ZlCU1QK+vJluhZaVbaB7mGGGIno6jHI+2qqRd
	FCXtrD6433UMrEs2eGgvJRtAMFlP6/7TKLxcHG5+j8Ferm1d4HuAoeHDWsYnv50IFLlR9ZLXNVt
	1JPPG03JOpF/HXJFS02zPHO9KIMInJgeUlnEFeyUFYnZJYq8StXx1BjpeAvxWxqZCIH4DrMMadh
	jotWy2/+OKs9KWWR5w342tomQtH3Bg4AB9mwRl5lqxJk+P+clY2Pzj/sWfgxLbMs61YwW9iXaj+
	hE2Y6uJFJ2x7gDEk=
X-Google-Smtp-Source: AGHT+IFyRwLS6bvq4IHzkLv6Jk2MbH7Z7YMTRFoWXfXGyBz5N2XwbSxiNeXe0OWrHVXWKMizrF1wvg==
X-Received: by 2002:a5d:5189:0:b0:3a5:4b67:5a70 with SMTP id ffacd0b85a97d-3a54b675b04mr1472471f8f.18.1749463180331;
        Mon, 09 Jun 2025 02:59:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d6dsm106289785e9.3.2025.06.09.02.59.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:59:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] cross/crosssdk: Allow deferring of these classes too
Date: Mon,  9 Jun 2025 10:59:34 +0100
Message-ID: <20250609095934.937987-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
References: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218260

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
index 5cda0e474ab..14484f17532 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -947,7 +947,7 @@ BB_DEFAULT_UMASK ??= "022"
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
 
-BB_DEFER_BBCLASSES = "native nativesdk"
+BB_DEFER_BBCLASSES = "native nativesdk cross crosssdk"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"

