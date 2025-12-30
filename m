Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8772AEE49BC
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:55 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71926.1767125573826954745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kKwP2vD2;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f0f875bc5so148186545ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125573; x=1767730373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSZhvHLpIa17dCqpbc7RSmM2WKEWHIxacEbiY8/QrQk=;
        b=kKwP2vD2HC6zUNUMljD24grRgYh855QAGj4DxySohjGfGlSisyyiS29gOdW+3rOFem
         WfAmhXhofYubVnxtRJtyGzp5qBrrAqVmj9fQvdt38q5r2Xl8D4u/leoRTTmRnKJbsZwY
         wu56G9euKZL0a1WXheG6JiCbyklJ9ImdpLQI2csEJFcEf8DVpGTz4MYAPyLUVrGNO1Jh
         YJkCzhjwSm8CXwL5vaVkEki77qspxlldcHzH05CzCrFay4Emd3oXn/WEABw+pzJkt3CY
         VWui0cjM20PJ0XtF0KfHyo4gFAWf8YPTYSOY15Orbvnkp5X0YnOBOkOBaj7Q9Y9YkUl5
         2QTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125573; x=1767730373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eSZhvHLpIa17dCqpbc7RSmM2WKEWHIxacEbiY8/QrQk=;
        b=u61dzfpA1WsIga5eHltD1AXLgVCvX29P3ew6oWvsSBLv5EE/QH2kxNe6JIFHOrhU2+
         UXTJUE5qEPK0X+usI/rOMLSjJbNzjqwV+4veaVFE+h3szsmoVZNCjZCO+rI54Fpep+el
         l8+hvUBrWV45P7iT1FI2SbVrNXos4mPIk/I9gLPzleUj8Og5RfMzufENXOjvRH2WE79I
         MlVQ1u67RpYnXqqdp3bvZFcYV+FI5nOzwJN36KzPpUqJU2WgWxMeTU6+z0cGOyNe3MBO
         n2GT53t9jd/STqr6nKETpBs26DyIRT26drgqNF+QN4gTxkQQjjjFxdl8ynYBUIN4Bx+5
         xcAQ==
X-Gm-Message-State: AOJu0YzTkAi0ZahKaM1RA4JPZvgOGocxgTiAKUighUA71B/1hmk8LOD7
	4+zCwM9cQBBm3OEbb1lMa27CybTX7mk9kk2DJ8CN2y5y46s99cJEebc7/6d9pPxqQJkw9dS4vqL
	X+OIo
X-Gm-Gg: AY/fxX404NZZtQ9REbCUo89auI2Hm3JQ2J/iCkS0YUAlxjEuTRENz7uYHUB2Ul3nKyJ
	gm5ef5kdwnGcRLAFX0ISnDTJVQ2di6caigkop3qq2m3SYChjOkk2ujtZrkSLV5yMBZ2R/gccgoh
	VYZjR0R664BXetlK936nZ8fbpYZPVbVy4kFUE1KzYBhGx9xcZrtNTWHePP5xm11otOvyIJcqIoH
	Ua3UcQzsHytq16rNR3ECUvGqknMbrE0Z38ySfBBl9drG/kC9wCH1fdJXJ6zIeH5JVqVpPymp0EF
	o5AIHIEE9KSXE2ngWsqlO6pI247a8nx59MWGCNGXLtyKZxfcVItRJ5Rl7V76Xpa9OLOwOUKF0cG
	GZohbvso1nBXRKnx+uuvwovlK3XIBY+m/kv2nP4kTIkWiYJ2tyiYRFV+tu6dDRrEslAD+H/hFiz
	Smxw==
X-Google-Smtp-Source: AGHT+IE+8emz55Oom22N8KRbhpYIQSv0e1U5f5782QjauNWF4pIfkG9hqd+5/M5ZBagS1cGTExBraA==
X-Received: by 2002:a17:902:e785:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a2f1f71a56mr317449665ad.0.1767125573068;
        Tue, 30 Dec 2025 12:12:53 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 28/29] ccache: 4.12.1 -> 4.12.2
Date: Tue, 30 Dec 2025 12:11:58 -0800
Message-ID: <556ef96d61bef4aafea97ecb08ff6ac9ddcf3592.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228720

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c422df7d511fe76e7662968ab52eb26a72d55fea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.1.bb b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.2.bb
index 2d0b83e244..28f36e5ed7 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
+SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
 
 inherit cmake github-releases
 
-- 
2.43.0


