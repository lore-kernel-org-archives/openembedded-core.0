Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1179C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:11:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2146.1743577874540740456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O1DKAkkc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913b539aabso3684369f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577872; x=1744182672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdvJ+UQSpPlJnqSLnTokCDu9aDpE35Cjliuznf8NsP0=;
        b=O1DKAkkcDtYCwp8QCYBN3BDLUywP1ooQNZoQV0bqFwSyQdeTHq0uuNDqQBzN3hnggl
         raAGsnIqaUOpPcrygeBcv4PVGT5/wBhkVWKLWetlI2ofIicyN9dCX5yugdbn0c63vRrP
         oZpQLKPMUz1pt6KuJQE1WMXf+Y91amITIG2ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577872; x=1744182672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdvJ+UQSpPlJnqSLnTokCDu9aDpE35Cjliuznf8NsP0=;
        b=mxydkCSB7yx8ADydiht04sH/vv34rN6ZzzDqdR2h6Oz+YNnx9e24vkhBBFJnfV5igZ
         CkQ+0MCylf+c8+dRh8gqI8511hyoieHir8TxDslFnbx77fkPeJk9WovqpWSNrG/zKwLu
         9aNBdU2sRGe8OC8rtcdXAOGP5X7WHw9Ev7/2Mmp9RUkRLucg6F2ajYhXEFLjgTlECYDK
         0mscn4bL0jjlotiq1ae7q3ek89Tts1gABUWd6MF323NBoqppKziImT9QzUohRALG6kEG
         fLWE+r/0v6PW9QT8VJa/5ZnzQX9dQsuUFA9xYfbCZqyfA8NRHGJanFeVq4p5RTW4fr3Y
         eA5Q==
X-Gm-Message-State: AOJu0YwEyxQs0+OXZ7HFBxrbK0YEqhnjRTu+1PgK9s4M/hZIFa0KfeXn
	noaFoaNcOVyVH/ai3lxC8s2sNv/PzNEPB/Np7WW1agrE3J+PI/yZ2f4ZSqV/AmlOiRSA00zXcZP
	h
X-Gm-Gg: ASbGnctygNR9COWLVlHxe15FuCq5/4EP8GTavW1GM7GyvpoH57CJyRQsswWgNWxh/tf
	07jXS3auon90iqBc+HDtJiC2bHb7GF4NhIxFtG33mohVBt6pTM0hXuNqlbutQ54tB7oVQi3QjL2
	ro/tQUG3mkHmfMQkmspKi6bUHRpYO4OzGjb9o6BssEbQSsltfdHSkLlOgNWD1fRnsL9BeJALJSJ
	0aAxcurpnZ0Z1zwWb9Ap4F4EU2STqDy0uXanx/193uJOen9oZmD3SpMzWAmqYHX99/RtdTEdL+/
	XifQnjTx9KZF5Jq13EFyM0K29A0qbU4bypg7UCpaCgCvat6YuaenWcGgAhM6+K19lHTOc5/1SA=
	=
X-Google-Smtp-Source: AGHT+IFdbWsEqWqsV3HYES+eunIOFTQavnY/sfg3zEJJ6x/p2Zx6UvRY7U+ngtHZ0BO0EspPasfd/g==
X-Received: by 2002:a05:6000:220d:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-39c2669d7a6mr3783999f8f.19.1743577872485;
        Wed, 02 Apr 2025 00:11:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.11.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:11:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/48] libusb1: upgrade 1.0.27 -> 1.0.28
Date: Wed,  2 Apr 2025 08:09:50 +0100
Message-ID: <20250402071017.2157620-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214194

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libusb/{libusb1_1.0.27.bb => libusb1_1.0.28.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.27.bb => libusb1_1.0.28.bb} (93%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.27.bb b/meta/recipes-support/libusb/libusb1_1.0.28.bb
similarity index 93%
rename from meta/recipes-support/libusb/libusb1_1.0.27.bb
rename to meta/recipes-support/libusb/libusb1_1.0.28.bb
index 5bf854f95d4..51287499b7a 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.27.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.28.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "ffaa41d741a8a3bee244ac8e54a72ea05bf2879663c098c82fc5757853441575"
+SRC_URI[sha256sum] = "966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29"
 
 S = "${WORKDIR}/libusb-${PV}"
 

