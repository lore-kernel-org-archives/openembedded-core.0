Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E177FCCA483
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.3672.1657094851137117741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V7S2AO79;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id v12so5600790edc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mtZLm+aFKBup6YOog4XDwJ9PhcLykH1BeRpyUMSdACg=;
        b=V7S2AO79Faab49nAJpkyhlUwKlhIrxbMnFYJt8HgMi9O7LijN0NGvfZjpfhO+aT23d
         oZ58o2QinE2S07xPq05v++dwH+FEdau3H1TBy8WNk0+xURxgZAWua9EB+n7fqLZZ+gZT
         XzjN75FM2batQxZJimfM3taXx7jUEZCFNub5jF0i7yj1WbCtOWSkL/OUCDoy4Uc19XpD
         OSOvBYrTPzlqzpxAOTXfo34k/Ngo29jFcTfO5Qy/0S+JkDD0duBEtOQ94FYmFYIJJgyF
         CUfRpg9ZruGlzFmhL7wRw92U3QCy75ITEUELUEKradGJhAY48MHJtFttnpw1U6x/Z7rm
         L0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mtZLm+aFKBup6YOog4XDwJ9PhcLykH1BeRpyUMSdACg=;
        b=UYb9/Yv+mUcNOwOIzdHJrDrazNMeTBz7bS/+Q1q4UUA4MrceC4HQQdldFejqLde9vw
         iEipmBdbyCNYwaHT3E3XGCmpoFNIaPy04ZyQg/X9CNYhM5qjhWZnkjhI/7X4bJBFsZ0n
         BFtQzrAUjjWdn0ny5DVPfdwD6QTNRTA/RllZaQU5U4Zoi7/x9loPdnSxYR5Lo6CwOefp
         Eywu1V0a/IsX6T9iy9QpK4h8cHbuSyHwT6DKeFd7xvIPbQ1M32h1hF/Tt2mdx4s5VtMU
         8LXS2tcoSMoU5tLvScFUiguOuusN88F+4y8UyoAsSTNCk44nIjufCHX3plnfnSqp0x0D
         u8cA==
X-Gm-Message-State: AJIora+fLu/+30nS9HpvfGHLTSXk9rQ8/7BAo/Nm1bHDiJAKLk2gGkF4
	yrZ2UUsWP5FxYADBwFd3cvAci0Sqr24sYQ==
X-Google-Smtp-Source: 
 AGRyM1sKYdD0jHXdOg3pvJz0TIbzR0Fd/tDUeXMyfDJ0hsrO/AKWMHaMKjc4dIYk9x+fpW1JgV289w==
X-Received: by 2002:a05:6402:510e:b0:435:9052:3b16 with SMTP id
 m14-20020a056402510e00b0043590523b16mr54663597edd.20.1657094855908;
        Wed, 06 Jul 2022 01:07:35 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/27] nghttp2: upgrade 1.47.0 -> 1.48.0
Date: Wed,  6 Jul 2022 10:07:05 +0200
Message-Id: <20220706080721.3072553-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:07:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167698

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nghttp2/{nghttp2_1.47.0.bb => nghttp2_1.48.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.47.0.bb => nghttp2_1.48.0.bb} (93%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.48.0.bb
similarity index 93%
rename from meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.48.0.bb
index 58ce08084d..4ff3ab829b 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.48.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     https://github.com/nghttp2/nghttp2/releases/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "68271951324554c34501b85190f22f2221056db69f493afc3bbac8e7be21e7cc"
+SRC_URI[sha256sum] = "47d8f30ee4f1bc621566d10362ca1b3ac83a335c63da7144947c806772d016e4"
 
 inherit cmake manpages python3native
 PACKAGECONFIG[manpages] = ""
-- 
2.30.2


