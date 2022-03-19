Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77C3C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 07:16:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.4911.1647674180914359401
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTCyagvz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id q8so2995120wrc.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPsxWegu9PpasBWkP+0rNS7DtfJLo0ZBfV3CaV+Gzhg=;
        b=pTCyagvzHmpxts6uHR6YynbpfCfR0PpIkPlPDPnEjf8SZmRc5UX/pYdF6AV4ZsOGK8
         5e6fG6lNEZGgg3E9EvFWPKgC+5p3RBW4G48Sz1rEJmT2fM+g2XHOxTD3Cx/jglW4BP+h
         zYxxppk7wmdXtlHRMHdiEJt3ht1Ey3jzeMv4E7WqYNrbuOgdMLtZYfnD1cjVzvZdj0t6
         Yv0P3zUJeYs3GfIcjT4huwUbMVsdMxdi+rb/UfluJUn97dBqAPShHfE9enWoy3YL0JGw
         2izX8xWIHv/QTKTn8RLp1VcWx7AUU1Vx5TCCF8ZBEko/iYMYHHHoh6LrM5zI6ThkJboC
         nVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPsxWegu9PpasBWkP+0rNS7DtfJLo0ZBfV3CaV+Gzhg=;
        b=qYyW1IGD6gTthtZ2YFpHXYuglk+LsWuAJWnQwMwGVI7duuTIC5q5R3Sx1VYwnLfUah
         bgbLGO8TLccytU5KC8jlfYVluiaDc8ymg+Sc+y4TeiRhfw0ZIh6ALN0ih+hQBfHuP3qE
         +OhCYu9wXk3TyTy3zOEImAhoXYTg5mUClnnV7mpK0m+SNZ+o5pfxjM3ZcH1Qt131mD77
         gTxbrrINxUQMEoUziI7kqi6O64JmF8U5djHtIHlSa7kboPDzj7cV/T1aT9UKfl8eCVht
         A2lueoJVC/h1kzoM9Zx4EJUFhBgaAVP5r9eHAf8dL/WYse3QuglZiGwbXext+64xCSpY
         2CMA==
X-Gm-Message-State: AOAM531b2ZYXfWaB02OG29xidaeoSMQxxm/xxdWOXB6wNFiX3IvSJ0FZ
	tC/0cmLDSaTsgO0/OKI4c1wXe39Zji4=
X-Google-Smtp-Source: 
 ABdhPJzrpRsA2aO/+iszW4OtsZe3GhKoJRJVhqPPhsIS68mifIUFfaUCoPTvYx1FvUpITQYF5yx9jA==
X-Received: by 2002:a5d:6283:0:b0:203:d8fe:7053 with SMTP id
 k3-20020a5d6283000000b00203d8fe7053mr10527975wru.18.1647674179524;
        Sat, 19 Mar 2022 00:16:19 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i15-20020a05600011cf00b001edc2966dd4sm7656999wrx.47.2022.03.19.00.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 00:16:19 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/11] diffoscope: upgrade 206 -> 207
Date: Sat, 19 Mar 2022 08:16:01 +0100
Message-Id: <20220319071605.152904-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319071605.152904-1-alex@linutronix.de>
References: <20220319071605.152904-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 07:16:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163463

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_206.bb => diffoscope_207.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_206.bb => diffoscope_207.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_206.bb b/meta/recipes-support/diffoscope/diffoscope_207.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_206.bb
rename to meta/recipes-support/diffoscope/diffoscope_207.bb
index 7eaca74b33..004d4d1ee6 100644
--- a/meta/recipes-support/diffoscope/diffoscope_206.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_207.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "93731939ede57547a3275c3c81875ab4bd222f26364a7519cf6aafe1939cd603"
+SRC_URI[sha256sum] = "e670160911c8e465ab178f23bd1a2e6a827032b7bbec5f24eebf9215f1ae5f54"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


