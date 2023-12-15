Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B63C46CD2
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:26 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.58164.1702626740276514368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UtVDZkkT;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso4373251fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626738; x=1703231538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obpoYcQ3clNzbov/HsIkCdipUh5EbWfxKCCXTSIBBuQ=;
        b=UtVDZkkTAYGmWpjd8B947jzAIwXa8sfZRcAa7HPMS0YXbW+Kvhow/7pL5+gtBCc89i
         dBRABTJKw1r1ucAcLVI85xDx9urB+ofTzYojB5vK1XvP8A23IyJJmjdCB4xZRHZHgIB5
         d5npKSyBbp3EAxf6nbDWuGE6dy48XK5PQPND/0pmXy69a7XQpQCqCQOmil7dNPsUYaRz
         GoUkm/3hRpQEmpmvWdfpDdNF144tRtQGhKI4AinytXdcIVLXjN1HhauPO9Mnb16f0Lze
         ejFpDpl/Mpd6AItRRBMbjdk7NIY5IVWgqMP6Fp245IK/CbXQXKJ+9skdSOvuivXshj6g
         0B+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626738; x=1703231538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obpoYcQ3clNzbov/HsIkCdipUh5EbWfxKCCXTSIBBuQ=;
        b=vNJ62NR+VS+cWv3xEgwREFE6w+/aWWNRCadLj3B+lvDRSWkAghlICOBrXjb7X+B7d5
         epJhUZeT5+D537KmFyAcKVBD+tK0Q658PCUhr5mkUMt+sypLQYeHLnJXKHrPT615FKbV
         NEy1IDbIybolPFvwKbS4i53E5J7rr2EkrTJz+SS9mxyEZBpnsIsCYDI9ZQrYPRK148F8
         rlw9tBA1C39O9MhvXy/biNU8TpqWSZJ3X+HMcXy2ypKqjZ+1c6R31mpZVAD3EcZwLpMT
         mMtOyTr3g5F4T+chw7MgiwHs1xaBopjBth3DZB4wcvzB+DoLQvFDs8j9LCbkNmux+iuG
         hR9Q==
X-Gm-Message-State: AOJu0YzyT2SHB+cb1PQE/NheIUpuI9x/qa3XArK3ARWw5wsUMF1Pc6ie
	n0zfZYwe9TTwWgIvzhcv2YqiHhmqjbw=
X-Google-Smtp-Source: AGHT+IHR64oMmO39jOL1jWXear3A1SgzV11bNUCaO65qIU81SZAH8RXvdT5gpj7Nxx5HQkmQD2HTjw==
X-Received: by 2002:a2e:9787:0:b0:2ca:3454:5994 with SMTP id y7-20020a2e9787000000b002ca34545994mr5257808lji.87.1702626738042;
        Thu, 14 Dec 2023 23:52:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bt13-20020a0564020a4d00b00551d6d51401sm2961885edb.53.2023.12.14.23.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/10] python3-pip: remove distutils depedency
Date: Fri, 15 Dec 2023 08:52:07 +0100
Message-Id: <20231215075210.3049785-7-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075210.3049785-1-alex@linutronix.de>
References: <20231215075210.3049785-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192420

Upstream has removed usage of distutils.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pip_23.3.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pip_23.3.1.bb b/meta/recipes-devtools/python/python3-pip_23.3.1.bb
index 3699bdf515c..38d6c4ad921 100644
--- a/meta/recipes-devtools/python/python3-pip_23.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.3.1.bb
@@ -50,7 +50,6 @@ RDEPENDS:${PN} = "\
   python3-unixadmin \
   python3-xmlrpc \
   python3-pickle \
-  python3-distutils \
   python3-image \
 "
 
-- 
2.39.2


