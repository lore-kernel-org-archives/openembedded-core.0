Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F388C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.470.1660894068364851799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U/pffG2d;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k16so4156590wrx.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=CjdcZ0JUN+cUzfKd6msWMqd377gtiVLzkSzrnk1bBYk=;
        b=U/pffG2dn3OhNYeI53ReHhp9gqVE4pZeUA+bDrHn/5WNew3GQBbUCBS+t8JEGDIvQJ
         7s4oinNVmHytVczHgbA2/ksQ5GiCj5gnFv1MCA5pYviTJxl87idQmtwdBZFYvfECqsWH
         yTvXWYhuaqKsgif7u9ifG9HPpM+YybcHTAvm+qIk3lXYZo9zx+pnRmY2ebO8KTqweDLp
         Ga6bYLIaslLULm+h83xaA/aRmLWxOZEzczMJoHWFWekAebuEx36QA3jnTvC1YNeNc58R
         ZEFyD/L93y1zBoa+boge3OC/W/3++q2rnETYcD8P3JyVoJQmmOvGI7snvRmcv4cM/Y6o
         4gyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=CjdcZ0JUN+cUzfKd6msWMqd377gtiVLzkSzrnk1bBYk=;
        b=jYDjskXX6yJyJJyS4QhOkTFNb7Oe22YPT3s0UBNnpHGwWkHUKmRB5InxUE8cVh8F3d
         IZlZWnk8ZZFe1W9DEpllqBwFch3fIRCO2bP+3GUIOI8iKC/vKT3A6JK9D87AcMd+p31z
         8vEhXdYkT28+mNJKyXIzjfGL8daVEmhWwWQ8uxbcWmmDy/sVrSPU6ShPk5+22dWtBeYm
         ikERDzJxKLTVJmKeHWHFqCxSBLjnDT4gqm5KrIyrNBRa2BL0+8ap0GjadCCscXPkd4Xx
         dzegB87LPsPisgb9S3WntN/h/K8EOW2Nn89aPbfCrpGygRtP7Emh2DePqkngAIrOfQDp
         5Vmg==
X-Gm-Message-State: ACgBeo22ToTKlwIrMH7vZ4hoHhVqHfTTyRw3AREdhaCW7ey0dif8KO9M
	JSy/DtpapxDN+3HvSAR+4g0T+VFgQqw=
X-Google-Smtp-Source: 
 AA6agR411Onwq/jM2EAmxgRPS+GtU2BRqSqR7PL4d0jfa85uEg4WvmcRfLZ74lcb6KIyjPUzrDnEJw==
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr3398044wrr.130.1660894087302;
        Fri, 19 Aug 2022 00:28:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/42] pango: upgrade 1.50.8 -> 1.50.9
Date: Fri, 19 Aug 2022 09:27:09 +0200
Message-Id: <20220819072727.2236928-24-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169595

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-graphics/pango/{pango_1.50.8.bb => pango_1.50.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.8.bb => pango_1.50.9.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.8.bb b/meta/recipes-graphics/pango/pango_1.50.9.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.8.bb
rename to meta/recipes-graphics/pango/pango_1.50.9.bb
index 936526799f..03e2ca6721 100644
--- a/meta/recipes-graphics/pango/pango_1.50.8.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.9.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "cf626f59dd146c023174c4034920e9667f1d25ac2c1569516d63136c311255fa"
+SRC_URI[archive.sha256sum] = "1b636aabf905130d806372136f5e137b6a27f26d47defd9240bf444f6a4fe610"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.30.2


