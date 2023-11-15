Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC82C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 11:10:49 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.10767.1700046639413198689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 03:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=N7RTno53;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507a3b8b113so9349046e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 03:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700046637; x=1700651437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJfISZY1lHtXp2WdXvTWL2SEgwdcVy/dn6++VqJJtSc=;
        b=N7RTno53v/uCOaTGSn9p9zBeHbj2aVa0vKfOWm6S0WeiaG2gl5HCcRadielXUFSFqI
         Gc5OUb2AKZkbQXT3lHvViidfmti+CSAHKHdIjuBR4S39k/eweawdHhmUpU+F0IaN7Z31
         svaVM6KMrJkIMvYJkZRA5x4sUpKhEbMq79JgDTzsF86MVDNtrrwZ3mq1Ub5vrig7BM2t
         SSFGB7k8OENKlnQFuCxDEJ3qgNVNkOuNS1bWAvu+Yt8RItFC2rvsGlJSLv/Ly00tQ6Uv
         4z9zxt7GlNdnREOUJKLeyPeld7l4Lf54oeBDPrFQrjxvcm0kFayybrzxyWpKFhh5LaV+
         aRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700046637; x=1700651437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJfISZY1lHtXp2WdXvTWL2SEgwdcVy/dn6++VqJJtSc=;
        b=dWsAHn8L4yqjCUE7nvEMOfJ5HGqytd2EO3rd4aZ1xDh8EYIEcfT5wIe8APPm7l8nxu
         rcylBGVQ3p/MtGGZI7DkY0IOcCOHtO5eab/KrXOHJPsIK5MfglnjHtRREXbwZqEtf3gU
         IWilX3WWMqopNR8+jM9CgzlOqc4e/qLFhq2h/AoBij6H9Z4+N2qVK95ir9p/s6a97Bbr
         I5GCe6NK7WtFNOZVsPDtboPwwLAPTxJs145O3fK35DlVErXpqTerbSV+Xb0MyOitpW/W
         XSFDH9xvp/qq21B58lHoeXQgoqPKEcDl8MzkakwPOPSdMd/M+ssGzhmGo9jzUdNgAP4D
         +j/A==
X-Gm-Message-State: AOJu0YzCFyjFP0fnyQOVHVWjG6mf6vs97iyXNAcacoixmvjjwsLcI8wR
	EWKKU6C0XmbLepmg/KpecgXg7m9ok+4ZhT9Ztsc=
X-Google-Smtp-Source: AGHT+IHyohj5X4C9l2BMaSSdnYurapwyTNwwi22t06qqojYqpa+SdiZZtvGwrxiLd3wEZXtcn68LLQ==
X-Received: by 2002:a05:6512:3142:b0:505:7371:ec83 with SMTP id s2-20020a056512314200b005057371ec83mr8165526lfi.48.1700046637112;
        Wed, 15 Nov 2023 03:10:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m7-20020a0565120a8700b005041b7735dbsm1618145lfu.53.2023.11.15.03.10.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 03:10:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libdrm: upgrade 2.4.116 -> 2.4.117
Date: Wed, 15 Nov 2023 14:10:36 +0300
Message-Id: <20231115111036.3020786-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 11:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190585

Bump the libdrm version, in particuar to get updated modetest with
support for custom video modes and writeback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.116.bb => libdrm_2.4.117.bb} (97%)

diff --git a/meta/recipes-graphics/drm/libdrm_2.4.116.bb b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
similarity index 97%
rename from meta/recipes-graphics/drm/libdrm_2.4.116.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.117.bb
index f0aaf314c6b7..3e6fb16e15d6 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.116.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.117.bb
@@ -13,7 +13,7 @@ DEPENDS = "libpthread-stubs"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
           "
 
-SRC_URI[sha256sum] = "46c53f40735ea3d26d614297f155f6131a510624a24274f654f6469ca905339a"
+SRC_URI[sha256sum] = "a2888d69e3eb1c8a77adc08a75a60fbae01f0d208d26f034d1a12e362361242b"
 
 inherit meson pkgconfig manpages
 
-- 
2.39.2


