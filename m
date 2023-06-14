Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD69DC001E0
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.7502.1686734996981981313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aW8Z+V1r;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-98281bed6d8so23288066b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734995; x=1689326995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S28wK1Tccku+xpqlj9gx7rbu9PKuibeL+hcbFE1RTUc=;
        b=aW8Z+V1rTJhWc1QPMzovSVqmC/NYc3i9ewx1e0K4L28DwsaTBzkwVrBa8AEOH07egf
         /iCHi+4Wsg3Yxt97hVCUevib4ZC6qPGIiCnghC4Gtn8k9Pz1eIVktFm4Mz5ttaqT5Pab
         NVCbyt1WSP1fXIjFTjBrtsdFcTcC98sNvHBB6RZPcDLBraD+IMZaXqUnNPR2API+rGN8
         rGL/jyeor5VXXACmxajJcSFqFHPJF2t2BSKxus0rJnuAX9Slg2NeNqIiJAl1l0ZnCkZV
         fPtAIPO1NO8bkXI67Zv0pTQQVw7ug/Rbwmv8v23LOBZOqqUo/o/MJnQAc30x+nGFPKKC
         r9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734995; x=1689326995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28wK1Tccku+xpqlj9gx7rbu9PKuibeL+hcbFE1RTUc=;
        b=S/fmYkBnTIbukRbTdS+KyquN+V9kwZacx4r6RYoKJRicGn1I/wYzUZdcUWLWP1v9qC
         euCGvkjBwwhA9dpO0AhXE2B7ay27Wr3oIsiepYeF19VUbSNjQ2F8g2ERdkpI0kJkkk3d
         j9W3jDQ5QJQn705si59xLNTzzCM8uphayCgTtSey6vqwj6+crbdt9vSXfBQHiq3Mm/RD
         NanuRUTHtlUn/IFICu0LUw9E51WhhnWKWsOHNFjgwcja3Nkydgu5VJULQt14eP8uNFzU
         u0php+C05URCvg+SwIYWpX50sC/fIxYdAG2vI9utEpBAu8Dr5iraQwn/8+Lpbsp4OCy/
         sXCA==
X-Gm-Message-State: AC+VfDxm3DV5NzxkbZpmqjZOpazuhQpFE9J0+N6IK9UoX+IV5fG9EXML
	3oxJQrsrQUdOabO5eiGfqQlaMdvzbXI=
X-Google-Smtp-Source: ACHHUZ6ptSc/d3cYr+4Cx1iDuo31J5X+gRw3LSE4oVyvlgKZB4fx1Rj6FPbaZoamvfqBJ9mvS/eWag==
X-Received: by 2002:a17:907:3607:b0:973:ff8d:2a46 with SMTP id bk7-20020a170907360700b00973ff8d2a46mr15074920ejc.3.1686734995418;
        Wed, 14 Jun 2023 02:29:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 51/55] wget: upgrade 1.21.3 -> 1.21.4
Date: Wed, 14 Jun 2023 11:29:14 +0200
Message-Id: <20230614092918.4065570-51-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182796

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/wget/wget.inc                           | 2 +-
 meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.21.3.bb => wget_1.21.4.bb} (60%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index d31756dbc8b..51926e72962 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -7,7 +7,7 @@ FTP sites"
 HOMEPAGE = "https://www.gnu.org/software/wget/"
 SECTION = "console/network"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c678957b0c8e964aa6c70fd77641a71e"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6f65012d1daf98cb09b386cfb68df26b"
 
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
diff --git a/meta/recipes-extended/wget/wget_1.21.3.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
similarity index 60%
rename from meta/recipes-extended/wget/wget_1.21.3.bb
rename to meta/recipes-extended/wget/wget_1.21.4.bb
index f176a1546ca..1d31b0116d2 100644
--- a/meta/recipes-extended/wget/wget_1.21.3.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -2,6 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[sha256sum] = "5726bb8bc5ca0f6dc7110f6416e4bb7019e2d2ff5bf93d1ca2ffcc6656f220e5"
+SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
 
 require wget.inc
-- 
2.30.2


