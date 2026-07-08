Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B969C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:40:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6241.1783510826356362350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fSJrk+tU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so4428365e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783510825; x=1784115625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sr/Qr3FCw0T6Bjzf9QY62WhmwqC49qiM2v5O+jp9vmY=;
        b=fSJrk+tU9taKrMt7E/KHpNgMqjHx+9Z7t30h6BZrlssWCFjgaFFBvr0ufd4YTwzxf9
         gQpo34Rf5m9VwRI7/fRMiskwDucdkP1pdrsFtJBSU3WIuV6y/uQhWMUDdGBgCYHC/ndR
         fAD4vGXuH9p151DxGmn10Dur8ZyoAUog1ofdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510825; x=1784115625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Sr/Qr3FCw0T6Bjzf9QY62WhmwqC49qiM2v5O+jp9vmY=;
        b=acoi29O8ISvD0H5i/7FFy5mO7Q2mU2xm+twOQYebc4eO07AP5IcpHKC80NYSUaiaTY
         xGwggWD+vqSNS/2KSm1dlsglF7AIjdjAvUuzj93y8lhU4Q6iES2E++jB5a1Rx0bCd2SD
         OwYzzqQCPahTea6ZrU8LR8IyUP/6Q8Ch/6IufjBv5bOtC4Gg2gI87+b5eWzS2B8xk9Db
         MIXS4XHuEaMPh5gUmJgYaCSWQSvcIVouoqdIk+itEL0AYPPqW5zGmvcEf+s7gNMMpDn8
         tQ3wQOzdSMOGJKGojIO21Qlb6YBC0SboIHiMMSgzZHt4EGF+0FcCHcdJhbfEu3JVWx1J
         XwVw==
X-Gm-Message-State: AOJu0YwNddRX2XLbGuRfBci378kSap07re1hCI8lM/ZDdE5Hi04kYc00
	u5FoT+KxC+JLrGQfJiE61cLo01bjmpcjA2ittI9cpmXJ7Wg0U1yD3YfXFAFnD9tP6WHyOhP83vv
	dapNIhUc=
X-Gm-Gg: AfdE7cn9iD9Z4srSynNYbu2bzVpwmbc9ecJw8TXRdMrcqmFHYNDI/Qc9bkBl7i/RPul
	y7EaRWroHwuSWV5N+TIfoJgrg9myVeEhOMfOqJGnfOLo6JpW8M/Stpm99nyrGiqmN02AGH8rdB2
	HH2MW7rU2SDVEnEwe7F6GqOT9DbrHs+dfVeOIiovo167kE5K6JDGlPbrOsnaTz+Gjk0EdPh/tG7
	qeD1WpRy82acm2ShLU0S6/TYslrZ7f7jxjCyc69GKVotmk5JWPss5BPag1M0a7wS2HHlIshz8xI
	z8l1KYvReCz619oXxmoiXTjKRASX0jleEjGuhJKSe0mHeSF2LlWF2m0T51vDOH6HHRi1Nl0/MTj
	8LgFk1Uj98F+oXF3HejQCpqsY5Z4drwkLN9Ek4ELrhoI6jsjVKNUXZ7EGW8jveQaUThoDR8kp0V
	EbpvrmGrJ28uhshQmhdUF4z1X7T4SPeWeOv8NdbryyGw==
X-Received: by 2002:a05:600c:6096:b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493e68ef28bmr23369625e9.34.1783510824612;
        Wed, 08 Jul 2026 04:40:24 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b60a:b356:19ef:1131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm131183165e9.12.2026.07.08.04.40.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:40:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] libxfont2: upgrade 2.0.7 -> 2.0.8
Date: Wed,  8 Jul 2026 12:40:12 +0100
Message-ID: <20260708114021.3484868-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
References: <20260708114021.3484868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240465

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/{libxfont2_2.0.7.bb => libxfont2_2.0.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.7.bb => libxfont2_2.0.8.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
rename to meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
index bf49d728b92..192c41d41c3 100644
--- a/meta/recipes-graphics/xorg-lib/libxfont2_2.0.7.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfont2_2.0.8.bb
@@ -15,7 +15,7 @@ XORG_PN = "libXfont2"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb"
+SRC_URI[sha256sum] = "f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"

