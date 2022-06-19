Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A0ACCA47C
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:20:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.22170.1655666448526232797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZ0XzGCW;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id i18so492053lfu.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=mZ0XzGCWmbW6Czp7KzxMNoA1jcY/nu/ncogFhQhLee4ZEmIAJSSWT7qrXJsCyh9eXz
         NcxPTRuYtWyK2+VChW0Pu7DQykTT9q9VpkRZp/EevGvIM4Im2I0mOXM/V/nh2JGK/wGy
         f2TmnFmOCJlgxMWABbgLzR4E+3OyUwdL11tY5TACHagEjaq2jOzsp+7M5hVVxuHxSmLa
         CS7WgyLhuOeGEpKayzH4GVI0BzkSR3HBvCce8djCMEHqo3/lM0rZvReOaMH/+Lk2AQtb
         KdKr1PE1WScjTCR0r5tBS8+zZJ/+9v6k1NAb7f3mPS9G0rEuvrucl+y/9aqNv1rcO2rg
         W6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jx10Eh51y4HbWngWLtUzs8P6priZADjXMkCR29+D+5U=;
        b=7dpRAFJCcaPEfAJ40tEnLWg0XdSOx9YOZK61AkN9mRGF5bFb5mhS4rdIDCtBpkmgm8
         HwUK3fFFi3GeM9sSnAMTWrCrC3fA55Lo+ZqZtN4bgGPEhuOPvbBzCAqtqNz4PHFhLbTV
         LgXrIXfiL0LC2XKjP8CpnB2S6FgQtRb0shBFahkRhmdF6F4rZmtOwEEugwUsJ/MIvRYi
         rLe9H9yUTinwiSd2hmq4M6GIDovQbnyc9Hvg4G2KlTonfPSSgngI/8+lpDqIHJEP7NgJ
         RTrZUd8/m56qODAhPilAXs77hfD8VsclD+mzDOFKGRi+Fi+0r7cBQFmjBrbitmtnNnhG
         JlhA==
X-Gm-Message-State: AJIora9pGjTPFEFajqFh2ZvJXIHoK+Z1lSwC1p5sUcnU8qwitSIku2CZ
	vkI27q7KPFcLSgQGs4cpFAjuU3p/oA==
X-Google-Smtp-Source: 
 AGRyM1vmVxTOYc0/FHtYgTkgwRl+/uiU8ktz07TtCvVkCbADb/BFfU3v+j3BFbIrDkO7pAwsFloXtg==
X-Received: by 2002:a05:6512:3e03:b0:479:2e0c:3d2c with SMTP id
 i3-20020a0565123e0300b004792e0c3d2cmr11491641lfv.654.1655666446681;
        Sun, 19 Jun 2022 12:20:46 -0700 (PDT)
Received: from pneves-XPS-15-9550.home (83.11.57.73.ipv4.supernova.orange.pl.
 [83.11.57.73])
        by smtp.gmail.com with ESMTPSA id
 k1-20020a2eb741000000b0025a59470621sm817020ljo.26.2022.06.19.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:20:46 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH v6 2/7] gtk-doc: Fix potential shebang overflow on
 gtkdoc-mkhtml2
Date: Sun, 19 Jun 2022 21:20:36 +0200
Message-Id: <20220619192041.1113263-2-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220619192041.1113263-1-ptsneves@gmail.com>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220619192041.1113263-1-ptsneves@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:20:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167040

A native path can cause a shebang overflow on gtkdoc-mkhtml.
Replace it with /usr/bin/env.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
index 150d2c0b23..392913fcc6 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
@@ -43,6 +43,7 @@ do_install:append () {
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
-- 
2.25.1


