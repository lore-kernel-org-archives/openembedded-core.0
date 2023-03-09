Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30902C74A4B
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.16023.1678375215730355927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W1w+byxR;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id bw19so2212422wrb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFwfwd4JkMTBp0Nz67m7rBJf93hXW0OpTJ3/J6fDdc0=;
        b=W1w+byxRAGnYOhBeBwFtpg/NOh4qKrRj0DLOl5IWYHv0Py/NolzpzmCrldg8o5hicl
         yGh8C0qwpXzxVrPl24yq6SFyPi4zTvW9gA2kw69HAWMBpmk6yRXtM8Tojs1OV3Unn5/2
         Ks0wPS0ufRQuBz51szC7KbPYV5/pg32okIcixt7SMX8INwlANDWA+M5erXEfcNPVSUGF
         3fYlHFt2sfTnyi6y92wIisP1ICU7e2w08n1UQDBTpiD6jNTmzrEQxspVqt39UopLqjM4
         h0vY9/VJaGSERmw6QFQTXDk+67qpV+tJDOuXdt7s69AM08uB2mTtPMki2JVoZC8DMA2J
         8jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFwfwd4JkMTBp0Nz67m7rBJf93hXW0OpTJ3/J6fDdc0=;
        b=YIYBONkci1314r+QWpEHmpA/USrjLdYgZIPcbOESAwC1CI4LRJg4Gv/I5HoJSTaMLH
         TJsHuOaVfVW00uaQq5R3fKCY5u2i9e7HVcx7H6xVtExRUPFZVy/ACXM04SDiDRREXLRq
         F95sGWYGxdxLJSMRK7r7lBaNoZWTyUfOo9DshElDTEfjkv2S1hGl4/RO1vp6G/sjrygY
         WO46oCF1UEAjf2fKMIC5tpS73pcpd3KuwuVqyf8/nehPtPSCOu/zmYN2fp0PhFu75/0X
         G/Ap0zDBZ+JgPPmRqG03MI4gf6k9SSSWK0lmOQp58xrPsGsn297qh3VWvxi2YirMCGIt
         WSXg==
X-Gm-Message-State: AO0yUKUrO4XRlpe/oOXk4DFankq1/V10LlOx9sjUc/T8q6AKujemdH7h
	KD81OTOh6ur2vJaym5w5x1BoQrj/zmQ=
X-Google-Smtp-Source: AK7set/emE1gKOpCFlyfM1n2rPJNoH52FbqEPpdoSqXonRhChGivCni7cS6W6CpdXPfK+EZ/2y9H0g==
X-Received: by 2002:adf:f70d:0:b0:2c7:1d97:bdcb with SMTP id r13-20020adff70d000000b002c71d97bdcbmr14627232wrp.36.1678375214321;
        Thu, 09 Mar 2023 07:20:14 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/26] pango: upgrade 1.50.12 -> 1.50.13
Date: Thu,  9 Mar 2023 16:19:51 +0100
Message-Id: <20230309151958.3619193-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178244

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pango/{pango_1.50.12.bb => pango_1.50.13.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.12.bb => pango_1.50.13.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.12.bb b/meta/recipes-graphics/pango/pango_1.50.13.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.12.bb
rename to meta/recipes-graphics/pango/pango_1.50.13.bb
index 6779f39c4f..e673366dc7 100644
--- a/meta/recipes-graphics/pango/pango_1.50.12.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.13.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
            file://0001-Skip-running-test-layout-test.patch \
            "
 
-SRC_URI[archive.sha256sum] = "caef96d27bbe792a6be92727c73468d832b13da57c8071ef79b9df69ee058fe3"
+SRC_URI[archive.sha256sum] = "5cdcf6d761d26a3eb9412b6cb069b32bd1d9b07abf116321167d94c2189299fd"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.30.2


