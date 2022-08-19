Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 985CCC25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.476.1660894087143332176
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KOodJ5pS;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id a4so4190255wrq.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7rQWcOBoKEgkP+glYH28+aoiwcrIF7QIdRpv+xwvmDQ=;
        b=KOodJ5pS8c873LEuEhoNFGbJtz13GZxLnS8PsVzkEEA4XmlQrweUuKUEVxUFyXbsDH
         BXpElR5qxuemnKvKoKyUXl4zoxNdgyraUrj6kMTzgQvKSiSaIzAoXem9/ecrJ6GTT2Up
         Ej0Tna4E8tcV6MFS1x2u9hT7vmGTKZCBLXKSiVpEA4Zhq8OqTLY6i95yDG+3CDH3zch+
         5U0Mau1meSkhL9JUwy47AoJv/YqQ335pemRE4aFj/4/fQ8QJNP793plV8K2jALU6QrXp
         kLKt8sQmLiT1sabf97qrRxnqlRqZpTeWMDF0dRANrBECrwwriOfqXVXJ2yZhpZam9Ixh
         tcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7rQWcOBoKEgkP+glYH28+aoiwcrIF7QIdRpv+xwvmDQ=;
        b=FUB+OTPfwh51slyfF6I9U6l0hlq9hz3F78wrvZxTvEV+Unxh8Jpl7d5s3D/CgTR77Z
         sg26YDF4zLML2KP4/KEk52osk5hHw4Bk6hv41/O98VmTEaUXMecNGMi/Yco2gC0v5YmH
         ykhNB/5LFYIOcl1N/9Guc+FhakfKCK6/Niez0QkHKSuJX/EunuYQf9tEDkF0QDTIk2C1
         9GMI76fwQf6xEM5pEbUoQoRQWNQ4BiUkUsZXCrb7R9iztI1q4wO8ggmcD0nJyC56jvEV
         GzOB3y8Ec5x/byYQOUklG0Xd98RorNuoQhPmpLPApNfQP1AE02vVg9mdLCSymi8efada
         fKnA==
X-Gm-Message-State: ACgBeo1xzpLX8H6FmiGjttdX3fO83F9BD7Zy9fAxfZIJsIImwjjmB8Yz
	Y6DSdJSjd1Pu6V9P1aiM4DlJbx/V+4s=
X-Google-Smtp-Source: 
 AA6agR6HTAOCG7BcfZFqby84N99F8V49VsJ1QgyjpHD+1Zqd+Xq9wXzo7Ks/JQBNaDG/fNwVyWKYjw==
X-Received: by 2002:a5d:440b:0:b0:225:2106:2f30 with SMTP id
 z11-20020a5d440b000000b0022521062f30mr3330115wrq.533.1660894085576;
        Fri, 19 Aug 2022 00:28:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/42] meson: upgrade 0.63.0 -> 0.63.1
Date: Fri, 19 Aug 2022 09:27:07 +0200
Message-Id: <20220819072727.2236928-22-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/169594

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/meson/{meson_0.63.0.bb => meson_0.63.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.63.0.bb => meson_0.63.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_0.63.0.bb b/meta/recipes-devtools/meson/meson_0.63.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_0.63.0.bb
rename to meta/recipes-devtools/meson/meson_0.63.1.bb
index 890f47506f..7f77a7de34 100644
--- a/meta/recipes-devtools/meson/meson_0.63.0.bb
+++ b/meta/recipes-devtools/meson/meson_0.63.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-is_debianlike-always-return-False.patch \
            file://0001-Check-for-clang-before-guessing-gcc-or-lcc.patch \
            "
-SRC_URI[sha256sum] = "3b51d451744c2bc71838524ec8d96cd4f8c4793d5b8d5d0d0a9c8a4f7c94cd6f"
+SRC_URI[sha256sum] = "06fe13297213d6ff0121c5d5aab25a56ef938ffec57414ed6086fda272cb65e9"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.30.2


