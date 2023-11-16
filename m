Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F717C54E76
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:52:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11724.1700153573577811106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IqLfOFx5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4083f61312eso8374385e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1700153572; x=1700758372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4II6gYOh7ChRTmaRJAojS1JRJ78sbaAT9gRrdifPwI=;
        b=IqLfOFx5TjayJNFRLX88XOIxJn7Jv4Y94T9TFu3ghQI9SvGaISM3teMxMHQwh7F/TT
         tGkK61drRRkTV6OuaoPWNC//dmEXNofE8/1lZJKDDJFDd8c8MXLawPap9gOLuFqrr/Oa
         dyyFhLlTfZHkZFQvdsn3cdFq4fsOaYvLEAMP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153572; x=1700758372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4II6gYOh7ChRTmaRJAojS1JRJ78sbaAT9gRrdifPwI=;
        b=K9ou0a8P7VQRp/eGeIKqpJEtgnntHr2B+9wWeBAy5ZOeH9VBYqFrMyyOJ2aJ7mJtIo
         BlFrmjOKJHwcT2uhvsjqLhjFm2I9HyDE1zwqRyW37BR0WP/arVuplv7DZV17Hu/8/BQ3
         GuezdrrUNyshgLNSzFfnjiB2U930hIm7LfPzsLnGMC5Z061uJNpC99ZVLCd+9beqdKRF
         ApEWjoxEeVpmRVcXMkHvhNkbezYjd4drer7EqUTv0l9lSQUy6HeHocCitMAiffvDWJ/S
         dp1xA+SpiHh8BMAm802AGTl+lOEzKQTyJmcqZHdjBA/xPyP7usoG+6zEyAidehie0QYo
         FFeA==
X-Gm-Message-State: AOJu0Yw3zlpivN0MkWvg1sPJOvcoSpG/WxtklHC3nDSKGwDYGyDSGYD5
	5uUMy4gGEGEqA8HA7BGXc4aQY5cCustJZ9AXbKY=
X-Google-Smtp-Source: AGHT+IG3vePuY/LQI+pXWXgSOXA7mDtG8aAkICOVeFR0SO++ot7qSZCyJMn4SqJ73cDVNH1DG3uF0g==
X-Received: by 2002:a05:600c:22c2:b0:406:599f:f934 with SMTP id 2-20020a05600c22c200b00406599ff934mr14131953wmg.12.1700153571539;
        Thu, 16 Nov 2023 08:52:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f8ae:b070:36e4:3937])
        by smtp.gmail.com with ESMTPSA id be14-20020a05600c1e8e00b003fefaf299b6sm4395047wmb.38.2023.11.16.08.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:52:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: Log events by default using BB_DEFAULT_EVENTLOG
Date: Thu, 16 Nov 2023 16:52:49 +0000
Message-Id: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:52:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190806

By setting this, event data from during the build is saved out. This can
be used for analytic including toaster to allow builds to be examined
later. This will use some disk space but it is worth it for the ability
to look into what happened during the build. Users can set the value to
something else in local.conf to override if they wish.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 67ff7690463..12292714d2f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -934,6 +934,7 @@ BB_DEFAULT_UMASK ??= "022"
 
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
+BB_DEFAULT_EVENTLOG ?= "${LOG_DIR}/eventlog/${DATETIME}.json"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasicHash"
-- 
2.39.2


