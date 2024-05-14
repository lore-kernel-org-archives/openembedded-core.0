Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146A2C25B75
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 10:31:03 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.12032.1715682656100146239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 03:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lEOSS6dk;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34ef66c0178so3718540f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715682654; x=1716287454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rIJFhYT2brPwP0tPrWqdLFN8wM0xf0r1a9g1JpAtT3w=;
        b=lEOSS6dkNMhxpSTqcdjeyqgYqgBTacLQtthHofAIQAg2oSN6q8fSmk2HEOFPpZeu7F
         W97Qoqnik93EoGSRe4JWwhrhe0f25tjcXFwdrd6M3lkASr0+5cPx1yK/dEXYohPPLMIj
         Y1ueao/lqP02+vqHyNTsAxkqtEQEhK6Ld69fhj9GkyolX9bsshBLL2o/iupSCjpPubgi
         6sUqC+5yLSVEb9198IPsbKIN+0ygdzNKEsu1IC8fAFvaZ873Fbw2xEshWYzMdWkeAPJD
         hQ6r1dNquuvb8e4yVREWgYoE2YPbuGHmy5s1P3ywf9a6Fk7l0cOhlLJLKCmg0+SUZJ0s
         Po0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715682654; x=1716287454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIJFhYT2brPwP0tPrWqdLFN8wM0xf0r1a9g1JpAtT3w=;
        b=o2UmxlqfLgRaI7uibm2KNRXVtPlInIPoumytsB4kEttejsiJ+uoQkW7+DAVUfEbfiX
         SvcG9zBlENtOxt3bQhUe1qfUbvssAScafqaL5P6sasj88DFqQ4+6dvOZCc5LTRpoPoVt
         fSMrki/EBUGyda85VyD9nGjKNlW8QmfAny/a+N73Uax401DdXY93S4Q8alKHFEToAwDd
         2XxieUaMZSmEetFz0C8a9A2azLjyYdK608wevbECyN/C8WgPrVuMzmjY/uWDY3Si5jVU
         wdDAKN1zTe3lvqxRvApmpipzfF+xeckeo3antmCv/evCcAUZ0jcPg9VwchaQr0ABSToO
         cYzQ==
X-Gm-Message-State: AOJu0YwTCtZvrWVFdSb2ex+iAmVfF2VDlz7uI5ssloRmc+LNCecnHbYp
	bBQNfSye8jqPdpbXlkryAUTTq9tqw02HJAo4XkvlQEWNFt6nTsx5OV3pa1FVui5JYAOY
X-Google-Smtp-Source: AGHT+IG9H92GGWY7bLH8dOlfTRk5v9lYcn1dEbPFtL8jFpLA0CldNAxdutK7tm9W7NoKs4oq/BxPtw==
X-Received: by 2002:adf:ea8c:0:b0:34e:5551:49e0 with SMTP id ffacd0b85a97d-3504a10fb3fmr13181428f8f.0.1715682654023;
        Tue, 14 May 2024 03:30:54 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacfdesm13449293f8f.73.2024.05.14.03.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 03:30:53 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Lukas Funke <lukas.funke@weidmueller.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] classes: go-mod: do not pack go mod cache
Date: Tue, 14 May 2024 11:30:43 +0100
Message-ID: <20240514103043.582705-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 May 2024 10:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199255

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Clean go module cache from builddir to prevent it of beeing packed.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 328bea56dec8f83b5c118f567e122510f9243087)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes/go-mod.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/go-mod.bbclass b/meta/classes/go-mod.bbclass
index 674d2434e0..1ad782a304 100644
--- a/meta/classes/go-mod.bbclass
+++ b/meta/classes/go-mod.bbclass
@@ -18,3 +18,7 @@ inherit go
 
 GO_WORKDIR ?= "${GO_IMPORT}"
 do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
+
+export GOMODCACHE = "${B}/.mod"
+
+do_compile[cleandirs] += "${B}/.mod"
-- 
2.45.0


