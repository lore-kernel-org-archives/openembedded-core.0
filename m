Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90203E77198
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:45 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.28163.1735901140378528315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sn7CyUmL;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so137353025e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901139; x=1736505939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSqfxfOzlfMUTTd/beVOBnXSy6wrZ29r3pWYvsTV2Ww=;
        b=Sn7CyUmLxnia9Z73TploG4Sy2BUo17BvqW6eCxTG7BY6tIyIKeoKlp+WPYMEfB/rOp
         20ph0tJDos0EF74s5nKVC9bRkytX2sNkNTWvB+Z5tQkGTiILMuWfo4rbZZdjb8mdUs8n
         VOOOfGDkLkqH1g6VbgbiyQ0hV7/q9pH0KrsukjWco4+ylVGCbuwoYt5l4bsI4B6VIGxy
         aDDPZ3j6D/4S1pbIu6Yy7yM1fMyOoGHt1F9TejoOKxTUYck9OqpWl8K/WPA4rRBBSTLC
         3CA722/FTpdxdVgYlyNmY/vkQCCZHxOqRGLRjvRPwKDec5QSZfGd+bdGF8FZpwz2Poc3
         0CLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901139; x=1736505939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSqfxfOzlfMUTTd/beVOBnXSy6wrZ29r3pWYvsTV2Ww=;
        b=RKwpU2T6rmujvNVtH7hXjg/ghGEfWCy2XZtcuD0DL5lZ+3Nd+00OgX8VYHi09taWqk
         iu/tGifTeh2TG4D8pqBI2VW2os71wJNvXbQHoUZRcdKICac206YXbFvKz4GffSfhvv5N
         bUSW/yGgBPlm8YPlIUjMmw0jkLNS4bxFsBf3vClVvNisouHoU7QL8xSofGmJz37+4zJh
         YZSrQanbFxbgE85zXa1OGIWe7g+lmEmrEJaIWhvzwtS8mwFymWAfq4tAy6PFXYDdXXUq
         TCx6h8QI+CjnlLluDexqG4LhOCHLD96ishmxTwKIHByOyBMCWdKAvimpS8rvZLTmfwXN
         crIg==
X-Gm-Message-State: AOJu0YzFTOBeZn2XHRXt/fT5C3+RKAhYqblip13XHbzlupE0jBsVJvm2
	hWEdSQLHZEMpys9qxUkzC7Kf8wPPErKoGFsK44Ptxz6YawQlQzlR/IaAJQ==
X-Gm-Gg: ASbGncukxDXXeH2zoFZwtPJ9i/bHDxW3o0pgtsIvq5bYifeyaLIQl8m5fHvAKl/SIw5
	wdJ+zB1/SwbtDf00gk12laRXoEB08ZKu9lCYB80wlyP4wUIHsFf/jO4Re9Tpr3fArnCA4zvKevA
	aUV2NXuo7V9zsOHHae2qf3McD4XFtaHzBfdxewOR+TYQWHfOUnaSf+Rm/+j7rW8VjW3Yda2vEi2
	yJZDCDSRPzbeYEVwHYBEwukRTYT0M+geZfRPOY28elEyCNrScWkAx8hY5TCseKlgGkBxmByNzjZ
	wmYXUU5NJOIA4m1BTQ==
X-Google-Smtp-Source: AGHT+IGc/5JI/Z1HJ9h0TyCbvXtuIIHEb+jdm0AFleB7R2fTPY696bOi6AdMA/cmO9d6iZz58HcG1g==
X-Received: by 2002:a05:600c:468a:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-4366854c062mr412637355e9.5.1735901138668;
        Fri, 03 Jan 2025 02:45:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/11] shadow: exclude pre-releases from version checks
Date: Fri,  3 Jan 2025 11:45:23 +0100
Message-Id: <20250103104524.4053846-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209341

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/shadow/shadow_4.16.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/shadow/shadow_4.16.0.bb b/meta/recipes-extended/shadow/shadow_4.16.0.bb
index 1fcf82bb01d..b7282d7933f 100644
--- a/meta/recipes-extended/shadow/shadow_4.16.0.bb
+++ b/meta/recipes-extended/shadow/shadow_4.16.0.bb
@@ -25,6 +25,7 @@ SRC_URI:append:class-native = " \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            "
 SRC_URI[sha256sum] = "1744f339e07a2b41056347ddd612839762ff565d7e9494fb049428002fa2e7e0"
+UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 # Additional Policy files for PAM
 PAM_SRC_URI = "file://pam.d/chfn \
-- 
2.39.5


