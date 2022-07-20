Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0677C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:14 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.51506.1658306713916990399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZKXw8bpi;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id fy29so30655478ejc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPjguQfeZWX9Ag7e/k7WQGRAErA/i1qtFOdRKMoBCfU=;
        b=ZKXw8bpiT3Ve/e/JVkvq0UHuUb0dAziolmMjzp3Wl0iiFPa7fxrqqM+PfbokcwtqlF
         57euSCjBtank1TvMa9xNmEtZlOBGFojv8ymVOpLhYRsOLbumOb00G2BTgemkez/m19/q
         RBy80AGjwngfixovvBoDwUcyIgJG3v/ebg/CflK5fo2DN9OqFmSACAofzJ7SZvGoOJpJ
         WVdroDPreFwukBLw4hM1AGn2HwwlUkCvFaYdicL1IFj/xvB0UnkIiro50v1OljdNb9uy
         tiuTkG5Td3HG/2A21dSck5XNpSgMWsysXSz5SNzyWG12UPENa56Qm8VYt47oCnRsAAqz
         qJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPjguQfeZWX9Ag7e/k7WQGRAErA/i1qtFOdRKMoBCfU=;
        b=KTDaBDnpCZTWSmwlCGNnP+VvO5rGP+yOG/Bwm7qU49xM/B4HB14rFRJ5IBUr9Y8HY8
         BlijI1dUdxvhHMANuDJeBWqvMBAZOcue5DxvA6rjEECLl7GkbCTSYeWcxM/YJNhbGQeA
         t7RY+dJzVeSQ2I+m7KCXY3y2wS5/xLenn7S5eWGcbU6NlzbAmbAYXLb/GnXxod0nq/zZ
         +F9RRxYw8djSSwQIfArh+ui+hJhSd0r5n2MvPRl9W83/1m3tL4tS3TYHNWe9ES2EVUTb
         1hJR7xJeZ6kYP6ggRDFZfWnpRx+XlnnMOxF+GV1lwcv1ywXlcwb1A1jwtM3DWtpqMmch
         u47w==
X-Gm-Message-State: AJIora/fA79w3X2cDY/jpNaH+u5KUbEQ2/SnPfqUXKmX48JxWCenPcVe
	K4W6h2WxTXTG04yaFL+kkhGf6iD4dqM=
X-Google-Smtp-Source: 
 AGRyM1t8AzOGnI1O6sxpAVFdkaLspVcZ/MoNIj79/XtuKPTyiQtRNahGKBwQZl+oHF3ToDJNMPqMEg==
X-Received: by 2002:a17:907:16a2:b0:72b:87c9:af07 with SMTP id
 hc34-20020a17090716a200b0072b87c9af07mr34388816ejc.121.1658306712385;
        Wed, 20 Jul 2022 01:45:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 23/51] alsa-lib: upgrade 1.2.7.1 -> 1.2.7.2
Date: Wed, 20 Jul 2022 10:44:14 +0200
Message-Id: <20220720084442.2940187-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168317

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-lib_1.2.7.1.bb => alsa-lib_1.2.7.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.7.1.bb => alsa-lib_1.2.7.2.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb
index 7f7b955a7f..9efdae8ad5 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.7.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "046dc42dfcfad269217be05954686137e5e7397f3041372f8c6dcd7d79461e61"
+SRC_URI[sha256sum] = "8a35b7218e50f2a2c79342d0de98ded81439ce19e12809385ec9be9596de7c2f"
 
 inherit autotools pkgconfig
 
-- 
2.30.2


