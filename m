Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFFBC48BE4
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.459.1660894076525308798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ntLbKGgl;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 m10-20020a05600c3b0a00b003a603fc3f81so2082705wms.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rq6be8FpFX74LmyXNi2rG2TJcmTYVVdNC9el53Deyyc=;
        b=ntLbKGglh3zLTdjyRsQxWd9/YtZeB6S11kcBLKAoVhrZy5q3TUdXo30+NXNG9ngiES
         BJFrNRwHVTFhgNAfZOtJ+qC2zKPQkIEKrGucjJ18zeybgSxy7ylG5aHko1GyxWFNqbgw
         0Ta0xkulBPmoDOhfAwemhu4EZ2SPRgBjMaOvWUravTdkNMXopG2vs366VKKMx+gq3ftf
         R+sh/5zR1faMiL/HfjMnMsUqCIGB5FkF6Dt0FflE9ECkTJ7zpVLb32ySDR+ZGKHRojr9
         SNNVlAyev13cQ7WceYZ1GQZGcg46cl3ErvdzCp8nuM0ROkf3BBFMjbfzg6CWx2MBDKut
         V6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rq6be8FpFX74LmyXNi2rG2TJcmTYVVdNC9el53Deyyc=;
        b=fK5KCfgROKVReg/NyTs9Sf8kLBDAutLJPkZmrJYlE/yzgXWLRu5x7ZxeH69MuVuWSL
         PiJjghLwVGomOkI8350j0hOD7Uoytt0CooUyAUnTIu0hm9D3JptLW0ifi2qBGvaCvGjq
         WFpI/PgfXgPDpepJSPB05aWL2tDjaHPtaNCIPH1F+RcNzjaHIAi2TV+IECDeIxoBC1Q0
         JJxHjO3sIVYZuSCqunbjWrh9u1qlpI4ojgAqhyWM7MVST18VjuCgnxaJEIxl8drnX9uf
         xXNzBA8atGNN52TqD9D/Jej7mxhgrUlJjlN9l9hVo2VEfr1ZDtw7MqyOGFfDatwK+9aq
         zseA==
X-Gm-Message-State: ACgBeo2xLtd0iYk15c3HZjQAkS8QlFA+fJw8W5+8gIA0dfG1PQ9TBohc
	BN96c2p7U/RCSy6Ygd2GyivtRWIHxKo=
X-Google-Smtp-Source: 
 AA6agR7RzDAuBxP2ijOBPfN8khMphwvUsACDzNgYiAPfdpilMnAtDCrtFzj5UiIcFHZcMANG87ipzg==
X-Received: by 2002:a05:600c:1906:b0:3a5:fe9c:4dcf with SMTP id
 j6-20020a05600c190600b003a5fe9c4dcfmr3981223wmq.118.1660894084561;
        Fri, 19 Aug 2022 00:28:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/42] mesa: upgrade 22.1.5 -> 22.1.6
Date: Fri, 19 Aug 2022 09:27:06 +0200
Message-Id: <20220819072727.2236928-21-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/169592

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mesa/{mesa-gl_22.1.5.bb => mesa-gl_22.1.6.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.1.5.bb => mesa_22.1.6.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.1.5.bb => mesa-gl_22.1.6.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.1.5.bb => mesa_22.1.6.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.1.5.bb b/meta/recipes-graphics/mesa/mesa-gl_22.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.1.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.1.6.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fccf14a7d1..c4efc13438 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -25,7 +25,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
 
-SRC_URI[sha256sum] = "6fd60d38efdd25317948c61494b5117e01d42da695278728b1faef9f5f9a47ba"
+SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.1.5.bb b/meta/recipes-graphics/mesa/mesa_22.1.6.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.1.5.bb
rename to meta/recipes-graphics/mesa/mesa_22.1.6.bb
-- 
2.30.2


