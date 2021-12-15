Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFDAC41535
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2647.1639608047501077712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CS9lG5Hi;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id b73so2239766wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HyzdQxxaiJZFowzDZE/WcCwCS/Wd6B/Tv8f/0u1pjUg=;
        b=CS9lG5Hi8ARBRjLuk8nycZFZJxWS4/GZW6fXKJEJlFP707XGU91dSsPIsonvKUpU1U
         FGg7aB7acMbMMWvzxUK57jgp4YYwJvb2ckJRJz4SvW3ZsiZn6H9r+8AfoLMSoY5+Bw/R
         HYZtEs+4xrGG5c+2jlcZuTmNrmuWTt2opS0leOYrgDI0UA5sneJ2WoStwVyDHNt4Vo8Q
         /vszdLHuswVbcBWaqk8VP0OXUeLI+h1JhNZkKF6HVxah9fNXQZWEghaV4tOBu6+xyWlp
         oQAB/QKfDn99ibf4W9410BmdboxKoZL5MVL3MGI0GMilgWZt2H4W+BGzqy/WxOjBFT60
         Vsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HyzdQxxaiJZFowzDZE/WcCwCS/Wd6B/Tv8f/0u1pjUg=;
        b=d5B6/PnsMrrGMN9aNyWfyK1m66v900sAcT2Z6CdkxmTz5VnkqgyWQirxmCtRzW/g0Y
         SED8AgsMFnIi8kcgWUFFpugCgNNqXWo/5iISrrq6R4g2MgcgMvXIGioBNA3PXd2nlzIi
         i/eGoOw0B4N7gtG3zOHTCPnqFEuqAFC2PCBFnlUCLwgGmafchjVgYUL+DJa+nvqybLB9
         r728WeZuHSRn5TG4YMXxPY8OaQ31wq0/kDiEjc56jd7/P+WJvVYlau1wZYhJvI/QGSk0
         51S8/cE08UUMF+twSYaqVJnQPYQM4u5LtRXQ6ceRR0pe9FlLYHJNXwTmc+vMl9SGj5L8
         P54A==
X-Gm-Message-State: AOAM530fjQE+Sa2xguhy5M15Sp12DybcuAr5EMQxUZFcAxYjX4u0EXsb
	3whKxZegXKr746A4zLntf9Dknp/tZbxwDQ==
X-Google-Smtp-Source: 
 ABdhPJx6e/AnhFgMrKmgmYWoZMGuC41+a+3qm+7YnqnJ/D9fPnMoVnixv8MNSCR5V15W3x3yu2zrjQ==
X-Received: by 2002:a05:600c:4153:: with SMTP id
 h19mr2277708wmm.142.1639608046122;
        Wed, 15 Dec 2021 14:40:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/26] lighttpd: upgrade 1.4.61 -> 1.4.63
Date: Wed, 15 Dec 2021 23:40:19 +0100
Message-Id: <20211215224034.1814148-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159753

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.61.bb => lighttpd_1.4.63.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.61.bb => lighttpd_1.4.63.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
index 583b0e260c..41d6319e1b 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.61.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "43f0d63d04a1b7c5b8aab07e0612e44ccad0afc0614bab784c5b019872363432"
+SRC_URI[sha256sum] = "2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.20.1


