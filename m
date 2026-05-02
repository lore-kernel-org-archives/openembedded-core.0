Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2792CD3430
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9355.1777739374395921166
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UqSHh5GQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-449de065cb3so165925f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739372; x=1778344172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oBT5ks1YOSZaK1qVq6QGbG1gxFyk5ZThjUCXjk+h4C4=;
        b=UqSHh5GQtta7k81FAMJ3Mv+42SAVew/PKfC24Y4TPOUiUgJOskReb683YLEEhjjYEL
         /gtRrAPJ/6lTPrfrN8/sXbdLgtmb8ksoWMejjjXRIxbnxS6pSuZ2ZoQ/+YrA1ijMU2OX
         1tIcTHv1e1HoQIgbMjcl18d6ykVyi5mSZVaSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739372; x=1778344172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBT5ks1YOSZaK1qVq6QGbG1gxFyk5ZThjUCXjk+h4C4=;
        b=oK5rBS07DBcxcnA+Kl01icxhRCzko6RpAY1ULb4/7hSu253NiPX5/vYpjjYNxMiTTI
         XTVYpTBnWDHvkh71r/qtJLEIM+2v0KemvZxEyUaMFSfRc858kRGCVoE36kMkqYcHAUvl
         WsULByBubAxf+Yd818L1D3+lZ4VDSnvf8LhYNcHZ6o5E94Q4cLEU6yau0PdpphzqVlGt
         JID0CxWKufOXWk0Q/hsMtq6H5BUrTAaw3ABthPJ0AubVB/lseuIL7/RpQ88YvzyByVGM
         GOpcxfFzlzq/3YncKUNgNkmXqZT3oNSZnX5bAxW0wVnRqimVT6YsISIKKdiLz6zcPMTs
         6zWA==
X-Gm-Message-State: AOJu0Yx7TazBgYT91arR0RDmF1o6YF0mH7Uy2J/Zb/+XhVDm/Crfzuib
	WDoccvaMO3KmVwVTrCXgIuQZ9iDCUCeJ/2FfvBLO6No4tCNXQkDoakm+Dq68xtSk9XtOglu9gTN
	uLsqmLPhz8G2GYWpZDU3Fo2zQaJnEzqhItgr09euoSf6Y0IRzg8h++OeyU1c8ZzuVMvaetR/DS2
	IRi91j8ixy6avQFoU=
X-Gm-Gg: AeBDieuioreuBfoYLsG6Ph41grSSYWv6RzDwfJZLPlHZjCJF3zvdg4uZv4jILrxCa3v
	PttFYcBLmPddxkpy/wJ2+MNyBBxI+kuZBmrnQXB8xyzzouAWrKVuB/rU67BiofIbrC8irgUrHaX
	OYFPmN10xj6O86am2Miz2H6PUeh6x5KaFEvXl5eG1FFZzJ2XpoQr3LNUQQj69ki7ljSayGNEiqL
	221YrAEVGqvykTcwtMlxu/+x9TbNeo8+EhbPbx13+BCrX5T287Xb9Jlyn32fybTWG9pCfNSaPCK
	RU0G0H/UQ1c30tTw9Kon45g09JlWvNG2ZO54HDN22NwJ/Y+k6BKSaJK/jsfvlNxvK7DaV3nq8tc
	tLPrh+XJOqRjXnrDKKbPcbVSjZ3LCs+n52FKgGZhlQ9crK7RURD2bzJm/u/gSatLV/xZjSwpZPU
	l8Eu3xB2sQKl6pfZD+1BUEgxCWiLsQLPjmp4mXX7UYIZU460PBsMDcdEbB8M784PU=
X-Received: by 2002:a05:6000:18a5:b0:43d:7c1b:b8c7 with SMTP id ffacd0b85a97d-44bb65e0664mr5688829f8f.21.1777739372073;
        Sat, 02 May 2026 09:29:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/62] at-spi2-core: upgrade 2.60.0 -> 2.60.3
Date: Sat,  2 May 2026 17:28:21 +0100
Message-ID: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236310

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../atk/{at-spi2-core_2.60.0.bb => at-spi2-core_2.60.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.60.0.bb => at-spi2-core_2.60.3.bb} (94%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb b/meta/recipes-support/atk/at-spi2-core_2.60.3.bb
similarity index 94%
rename from meta/recipes-support/atk/at-spi2-core_2.60.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.60.3.bb
index 8e3314222c7..4ebd0d0bf05 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 CVE_PRODUCT += "at-spi2-atk"
 
-SRC_URI[archive.sha256sum] = "80e50c1a97d8fd660a3fadb02ca35876df881c266d3d6108fc5b4c113614cb99"
+SRC_URI[archive.sha256sum] = "21056bc04e43e8ed34fdafd916a0ddcc29ec03a4ce6cf5aacac1ddf6ef185ef7"
 
 DEPENDS = " \
 	dbus \

