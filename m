Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 206C3C677C4
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:59:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.56096.1749463181183860339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Cb/V0hDR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45305c280a3so3509895e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463179; x=1750067979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZ4eZNRINUFTEv6D5Lu8yzKd6+2EHQArhNenUnM5i/I=;
        b=Cb/V0hDRBTR7YvM0xyaUQMDfYFl8x1ENCf4xAYeMjwhLRDxtgDSpnIrOOdEHA3RZ5y
         CupnGvRZlUpCyCaatTk2y7/XMi8IL1bxop6NMcET73i4Yx2gjwJCtGmWWQ/KI5bNOXui
         /i/ZUqOdnwJIUYnKwL6TazhQPcoR2BnJpHAt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463179; x=1750067979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ4eZNRINUFTEv6D5Lu8yzKd6+2EHQArhNenUnM5i/I=;
        b=Q1ZPNYJI9xLqxChscJDxKFBi69b9P9Mnl88vEyK3lZA2BhzGXiS3t/CG03tK3fmcbt
         k6AH8IxZGgajjzyZ/uwxWLhau5sQ59u6+IiD6orNAARM90a+ssolicvOS8RmUP/TjqxU
         YBPeIbu7RMlp/GWi31zkiKvL7OuTKLFLXCP18MenC8j1bv02ACc20nNuQwg2u6iYg6bS
         6OO85K/u1OdXtIP65wH2HfzvcuppWK5lnGqK47OdqeuktK5DzOSaOs7UqLC7uIurPdHm
         CrFuwr3UweSf8lB92d0xasTlzUSveNhTU7CIOWLW6e5piE3hkgdEei0U2W9MCKtYMjbU
         3EGA==
X-Gm-Message-State: AOJu0YwzQGC8N+D8uWZt4AKPCx34UMYg+iK+ml78V+ZrSj/EO4i5pHI9
	5sCP3cTL8LNhyqourEyBahvVHelRK/xZR1M3QrY1U9MEXIFpV8TxvFVrZdEirDsE/ctHnGliF/X
	ntyHBvjw=
X-Gm-Gg: ASbGnctjE4Ax1ikXMlHSag2rv/GRSh7LEEvnx5I7Z5N4Jbr8OU2wYRzA0rZOJXcbDVN
	GQnXZgtmTTzrxujC2VujIwtZpXM/uCJDRv9IsIxQLtTW4Mi0xmdlnyQLulOhaz1a8rwi0Yc0BHK
	hql5xbRd+Xh2gBh+pVM4hh4aPk9qJQERpo5QKPgjh2P2BTCbZB3IxzJTGVFAE9M41wTYDRC3mWK
	yypZrCoT/M8tsWruYVAxo+ta01KpeCBmBF56Rq2BuSHuO7YWDTqfaeVFraWEi3AjaRvbX4t8Qdd
	4j0J5rl1wMdHpC8S+qjlWzeH7t4R7h4MS5wtCqW79mwIdd40lmsncrt3j8a3hh9dYDVOc5mRZAf
	HF3O8
X-Google-Smtp-Source: AGHT+IF2C6YgHpSw6LmDUAYlpNzh8rh7sV/3G4i2KN4lcbFpQ6REUhAPnz+/UlHaR84j/oSKCElqaw==
X-Received: by 2002:a05:600c:1e1d:b0:442:ff8e:11ac with SMTP id 5b1f17b1804b1-452013898cdmr125175105e9.12.1749463179206;
        Mon, 09 Jun 2025 02:59:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d6dsm106289785e9.3.2025.06.09.02.59.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:59:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] bitbake.conf: Automatically defer native and nativesdk inherits
Date: Mon,  9 Jun 2025 10:59:33 +0100
Message-ID: <20250609095934.937987-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
References: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218259

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c011c943d42..5cda0e474ab 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -947,6 +947,8 @@ BB_DEFAULT_UMASK ??= "022"
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
 
+BB_DEFER_BBCLASSES = "native nativesdk"
+
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \

