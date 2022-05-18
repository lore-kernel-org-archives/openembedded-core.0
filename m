Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222BCC4321E
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.3493.1652871542424809652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L92/yvJu;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id f9so3130684ejc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wi4pyu3+qMYGkJh7IOPzEX93XXFHKunCkIklFajUYDg=;
        b=L92/yvJuOpOzM5OyT39OLIYgbRFbJpNAbpYYCPyTiZfhxlypjBn8HG1e5aNwKScUqi
         zHU+51JlfjjgNmiv65sUAlwe2+vSsnoCmlSFqBuvt4ttYNnTlrnwd+2zAkCm9RjCCcnf
         sLBFmHotJpzPyEl54aBeKNaPSt5zJ1m5V49HBqEJ2OcqBfbdfHn8dPGM7EycCBJZ//8R
         98JAWnZ959b8XFccUAxvn9SMD6yqV5pnYxbTmCAah+sUMeg/uRbvwMVvdvqUa6ddSDUg
         +s25+36lPyCIVV4Ph+wbE/zhrRVFcMgwDWe2cTPPTabJHSTsjDdLmhk4CorYD43F9nrj
         s5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wi4pyu3+qMYGkJh7IOPzEX93XXFHKunCkIklFajUYDg=;
        b=ftsnGXOVnQBdP4tUZAbc/EkGyz/2BDmdylAZonFNuEVHKhVvSUz7pcNwvtHNC8KiLK
         ZC2dPTqA8K01ymZNTCAZXiZx0q7rhTZ9Icw1D8fLLXfMMjggi0Eq8oVXPr7d6kkmkZs5
         8lJmkScRcnpo7OfQOGtdkwEnwFOQEEO+5egRx0oJIwXtJgoZvvjuyhfPd5xYFau6y6BP
         24Q1dC4cWmAmtBFjJxeX0E04HuWWdmiXuU0wfJMvgtrij7zmS/8q7NF2adWbnERNnsM7
         4vPbCGEojGLDE8FbWlTLd7z+UEV0kYXoLTGR5HjXORlaDZh8degw4y35/50Qr49hUGlK
         fWsQ==
X-Gm-Message-State: AOAM530pBNICnmbmNPdXWljd6Pj3CslLGrlBX+S1tQI4HPIbg96x2iiN
	sFiczLaggMaSxLV/UxLtca155LmixHU=
X-Google-Smtp-Source: 
 ABdhPJy9m6AWG/MJv3OQxLrzwf3QftYAG6N00tkmow0sphF+mPJbHyq9h00F/uOBvcWbr2KNFP3xWQ==
X-Received: by 2002:a17:907:6d04:b0:6f5:a48:e063 with SMTP id
 sa4-20020a1709076d0400b006f50a48e063mr24218746ejc.302.1652871550493;
        Wed, 18 May 2022 03:59:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/49] gstreamer1.0-plugins-ugly: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:17 +0200
Message-Id: <20220518105843.3299331-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165819

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.20.1.bb => gstreamer1.0-plugins-ugly_1.20.2.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
index b0746c087a..edc2ece979 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.20.2.bb
@@ -14,7 +14,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "42035145e29983308d2828207bb4ef933ed0407bb587fb3a569738c6a57fdb19"
+SRC_URI[sha256sum] = "b43fb4df94459afbf67ec22003ca58ffadcd19e763f276dca25b64c848adb7bf"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.30.2


