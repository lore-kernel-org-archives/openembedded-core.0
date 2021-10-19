Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2D6C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:43 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.11480.1634657682443800036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lgPEdkre;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so3322547wmd.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hpZM+TaZjTvEs3fkXKREajZgBTRyI53II5nAFugxNWs=;
        b=lgPEdkrewaPYetz63ElJXYoIpmcuAjtCo9fX8m/Rvbci3iKn7h8rWHSQT+DflCup/e
         ZizqRqtAW/ee51cXI5LoJI2bLVx0JsjH9cEJ4MkMAPalAtYmhVnlycetruY/0ZbleS0I
         FA7Cr/Nc+BEI9WBdV/EeFdS2Zj0DIe4Vdt0s0QOLalqqPIceaLGje/ayhXSSP+aJOBXV
         UJXG2Ajsd11TD4jE9gBC7ySt1YMJgOl8j+LeS78vubN923NsOSwZMjS85eN6Er9nLYOI
         9jsWCZ5n/c9YsvX7Anssi+TjG3shBe0tJ8HvC91WwBwqZA0U1mNeM1lvvA/XMaZnVe5P
         +G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hpZM+TaZjTvEs3fkXKREajZgBTRyI53II5nAFugxNWs=;
        b=0CPde5sUVMgxzQ98UBfuPMRcVbiLW2Ell7NhLZa73tp23OiIdP2VFNpaAJtbah/jAA
         ovNlnVFliiv9wgykthoiHRdTlgtu9DVh2hW/zKLvCcTVOyDI/WcdKmg1pbcm0xOXJgFE
         rNI3zoab8r6vZ0uRpwEYpjMMuQYhIy5Ds3O2lozTCXvT0ww5MQS81Yb1ICuKh7bShFfJ
         ZEcZkQV18XTcyQ180mcRLHaLKJvlR82SQCcyWrHGpl1B/g2n52ErIuA8rzUiTqXMeLKz
         1O6KdHT2S4sNeQZ3tALTAmEuu1bpsGKMI6u9EkyC3VGQHu9lDGG6tIZpHHXW0+QqwSNO
         ke/g==
X-Gm-Message-State: AOAM532QexsBe8a50HfUQAXyZQLyTbGysPEA1TtTELioxEnql9IcKC6a
	Ilymk1Dy7jiBH/wlX/bA6wv97LmKIao=
X-Google-Smtp-Source: 
 ABdhPJx44Y7SEZDmr3yYZJueu7U+WT4JzJc/aXleTq4jFerb5Ya1R0qGWPd0PpEJsg1WpLrfNOsbAg==
X-Received: by 2002:adf:9d47:: with SMTP id o7mr45420714wre.50.1634657681131;
        Tue, 19 Oct 2021 08:34:41 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 24/65] ofono: upgrade 1.32 -> 1.33
Date: Tue, 19 Oct 2021 17:33:38 +0200
Message-Id: <20211019153419.3319802-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157143

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-connectivity/ofono/{ofono_1.32.bb => ofono_1.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.32.bb => ofono_1.33.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.32.bb b/meta/recipes-connectivity/ofono/ofono_1.33.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_1.32.bb
rename to meta/recipes-connectivity/ofono/ofono_1.33.bb
index 61424c7469..1fab90c08e 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.32.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.33.bb
@@ -13,7 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[sha256sum] = "f7d775887b7b80cf3b82e3f0a6c2696c6d01963d222ca2217919d21b9e803042"
+SRC_URI[sha256sum] = "e4591c5353ad2069cb9c0861fad3f1bf655137f9785fc5f16151d509e49ba708"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.20.1


