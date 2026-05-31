Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55D6CD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 00:18:14 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16953.1780186685618880204
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 17:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=n7Q7f1aY;
 spf=pass (domain: konsulko.com, ip: 209.85.214.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf3781ca51so9904225ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 17:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780186685; x=1780791485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BNrff3FD1GDeW6E3YHvQsFNVt2EACMB3jUSANo9f/aE=;
        b=n7Q7f1aY/O04e7xXmfzfFKTEv7/P4hpMdZc0ix54rKFeet0xY6GK0K0dMg6zE3ynmA
         EbGhJJ/GMwEA+GY/Aligg4NiOUyOEsZgXVVNMAslTy2e6IuLkkue6imi/aE+bMxxyjGX
         RrcEgDzvxCMTdMgIXX6N6thnkKY0sr3McO9Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780186685; x=1780791485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNrff3FD1GDeW6E3YHvQsFNVt2EACMB3jUSANo9f/aE=;
        b=ir4rxvm1UFs8d6ByeXrHMPrcEIjbqedYfYwEvwgPWe+sHMqMPl5fjgV3+/4Oe70KFK
         1yjhhJ6KshBINMF0CN9UMqjMba+pIjTdoBK/caJ2t41YGTeNqSXgaAN+ayOKWzuAUUIZ
         rEBLQQ6S2rkat605FVD5VVNDHZkK/jFIwoVffSfN7UggSly9dpPVUYSl0YFjqp1v8ZfV
         Xn5iAUAeh2pq0y5U+EbhL7dhXI+ff0Y5rF87xlQAM8b9EbPiOqbVg8EjS0OHAg78aMUK
         t46P0+z0Ady9cRLrkmx/jnz1Tv4D1FkDXSuU3HsXCENVAfOgxJE+qnCzdSrmETRs16MN
         V17g==
X-Gm-Message-State: AOJu0YzH90auo3laSXNCosIn6tduzG6nhNYw72c6LnXqyyndk/qm5Mux
	k8LYjbtVKQRZIVC9q5gjENEeqAxzZwDWoqsen+TWsy6qmNNiB64ldyfTspMyfL0Mm4IqS6YCfRy
	3CzEk
X-Gm-Gg: Acq92OHvy2weU2X7L5SZVYCvwvOZ48UfamfDSbfL+Uyadk+H19S/xAUoVqASJO2IPVr
	yrMSVGpSBsVT+SMEJZQoiPh8zQXXAcwA+RShz+E0wWVykblz0j6XfJMXNnnbBc8N00xh7XXpXP6
	+/F6ivjX07snRckenz/h8a2k+VV7hpFTDGC1O5buPwOzNmz8wTYdZgxWJ0JYAoTmgfM1Mdmm7dw
	j/RtsgJ01w0O63VaKL25kfCdAhv/XFp9cf7JLOdkOw/egcRGsPMLbJYqzmXOSbZ3HR5X8IGkioC
	tq3vqiShlsfS7pGXpE4g44ubFgmm7P/YXT0gMde0pHIRB9L6GBqEbyJBLSmOoUadYFSbju3W1tw
	cyRA2d8DIegu7Wh30r3anKLOclLbbYtg5I27t68ET1tHqbPYAN0Zhf9YktCDSiENJnaHp3pL8ht
	CjK76L6Nsc2lTUCosv1R+V8PrJ+o69T+6UZ1BaPxoIExEfA7RDzRRdo/Rze1eInN1aV2meNPlLK
	EjLkMhvJTrk
X-Received: by 2002:a17:903:2389:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2bf3685af15mr67395445ad.35.1780186684876;
        Sat, 30 May 2026 17:18:04 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c580c6sm62177065ad.82.2026.05.30.17.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 17:18:04 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/9] at-spi2-core: upgrade 2.60.3 -> 2.60.4
Date: Sat, 30 May 2026 17:17:48 -0700
Message-ID: <20260531001756.1582306-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 00:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237780

From: Tim Orling <tim.orling@konsulko.com>

What's new in at-spi2-core 2.60.4 [1]:
* AtspiDeviceA11yManager: Make use of pid when returned by queryPointer
* Fix deregistering application-specific event listeners

[1] https://github.com/GNOME/at-spi2-core/compare/2.60.3...2.60.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../atk/{at-spi2-core_2.60.3.bb => at-spi2-core_2.60.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.3.bb => at-spi2-core_2.60.4.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.3.bb b/meta/recipes-support/atk/at-spi2-core_2.60.4.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.60.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.4.bb
index 4ebd0d0bf0..5068cb82fe 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "21056bc04e43e8ed34fdafd916a0ddcc29ec03a4ce6cf5aacac1ddf6ef185ef7"
+SRC_URI[archive.sha256sum] = "1a1f5ba9805917f41fc6aa6823dcf887a291d607a427e2d5afb6b5dfa65070c7"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


