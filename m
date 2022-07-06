Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C13CCA480
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3721.1657094854092807176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XjJHJHnO;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id q6so25599398eji.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xsoxAAVGu/gPFSiYPCtq7yvgqg1MyYBgDcdhQvljykg=;
        b=XjJHJHnOC3Sq6VnTOkya2Jh2Q99PECm/T8YOVDXnAhO2/thraxWJ2pgaynxKh//vfN
         Qvh14QdugWG8d9BtTqBli+YgKr9KDRFuPTAcX9QSe+9MUY4mK0sVnPQTUp39iqnNMJKF
         ZunU2nf+ofnf5VJdcMv1dUfuvshPfNRir2DrW6+tFG08gtPLm75XrmKBpj7nPTgipn7k
         2sNBOc1pDOoPfeFEsuWtWqvSsl5SeCkBi9eOfSkuICKXPa8wHrxXiDTaFh2C9Eo4N/hs
         FfXguAhhOhjzDYZw8j38jTvm+lnKsdUSyw1iimE8kB2M75yQcJLKfej4O3k4CQIVCZVA
         6zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xsoxAAVGu/gPFSiYPCtq7yvgqg1MyYBgDcdhQvljykg=;
        b=ro7q6Mompyah9gUF6K1RI3JvpviPrQ0JqxN2+AxWA3YgGwpXswi9ek8HcThynMmDxF
         AyGIw6l46xgIj8MWMk6jaexV8I32Yon3J1WH+rsdducKkvEnmjvcZTTPywcp0gaM3hy8
         FAe+r6cM6EBfYeiinbmE7ZCiHa8kivYXNTDuz1Jn+D3Xa0zHI9HO34A+x1R1DCibpuHi
         DICPN4mJL3cAILcDCgitzH/uJZS7sCWPRu8iXX9v7rykMkex3SSZTaw3O7ahfpd+1rpq
         gxaUxl5LrgbP9N1MPEujGBoSuI97Uez+DuleSr7I9SunjKbtGNaetdsedAC/eb1Cvo/T
         3v6g==
X-Gm-Message-State: AJIora8aYyaewCmgKve0lo7coeCiWZkYbRETwwsQTTXCMjU/uePBcydW
	YrPiKEDtdETVWvz0JuU/ALW2eQR+HTTZmw==
X-Google-Smtp-Source: 
 AGRyM1uAQsXo+u8uGLHP75OLRW1aVcWAe3+DwFWpZj3qgqSAAiC+Lj80vmNziX1l28sE8uZcboV2JQ==
X-Received: by 2002:a17:906:5a4d:b0:722:e8ce:8c7f with SMTP id
 my13-20020a1709065a4d00b00722e8ce8c7fmr26303273ejc.405.1657094856806;
        Wed, 06 Jul 2022 01:07:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/27] piglit: upgrade to latest revision
Date: Wed,  6 Jul 2022 10:07:06 +0200
Message-Id: <20220706080721.3072553-12-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167699

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7b8dc5f0b4..38ededfcf8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "b84975ef4575d8121dbc50fca72341aad4572cdc"
+SRCREV = "479b0002d004bc99514d186724b5a4fbfe543370"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.30.2


