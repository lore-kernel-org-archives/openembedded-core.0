Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6140CCA47C
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:07:41 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.3720.1657094852079454993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KT2L88R8;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id dn9so20384923ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pxl/dPLuBanb7RLXzBXX0nan3VnsUYYTkt/CqFs4Omk=;
        b=KT2L88R8C9T8uTHiCmItKk/F+7Svc9Y/FPC7Ushmir7TQ3qFlj1tRaw/fr3DAWq2Ch
         MRzHJWyRiSUsCYentKcwckZJSIOruOtGvf4MyZcX9FFwDxI68xtNgt7Zh6Mriv8YLQLI
         pGpkVcxXRNGYiFhCubUCsGGK5LfNxChFVdBvEhNJZEuqQniWaqYkZ6h3gan2Zuqz4Jwb
         qutZ0vbUEqZr1/PDuvs5bnR2+LL0rTMV8yjgFuIVWSIUO6VDXkZKkhWW7vuM1Ehjx4qk
         A0mShp1qaaNq5cn+0vdjp+3mvRxuGY7rlSMFcyT7VQqb1PN3cKu4jUTEP1DEIN4x7v8/
         SHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pxl/dPLuBanb7RLXzBXX0nan3VnsUYYTkt/CqFs4Omk=;
        b=l4AZAQDLUbVNkCYuiEn8q9MEU8+0ajKNeum138o/lHr5jQj1Dynsf7xbCwmA7l443a
         to6mEhdSVQZxNTKt4NRuZef3oQMRcFwU23Zhjn1U5UtpY5kOJCN06VIXaoPvvz3Ra6Zj
         JI3MYNgqXIEgx0IvHbLDNrXqh2lKBjvbqyJRdCNmoqd2CnMAJCn3FHMe9tgYolydWZBQ
         z2x1/uXu5G76faiGLnlSourlm8sllHHuH/tf/85XwunmGs4xt3qXvBEq3AW7zpUKz0L8
         mG0g2xv/x/YlOmB5aaEvL1dV8jm0M+4uHxzJ8fvpiOWoooSXMGQcRL8rHi4m0cUdgIoX
         s9RA==
X-Gm-Message-State: AJIora8N8X0NUCYEavQPzuUb21rXNXnxyCjymqY/qaPcn+sY4irPtr1+
	hi75iim8IS9wkD5znqwXKhJp2bT7nH/7Zg==
X-Google-Smtp-Source: 
 AGRyM1uqtEm230YseQRJVvzpPyYirU1ZA/VqhELJI+IGkbDLetXDQ9tobnGOp7v4wQ3Q2gGByS8A/w==
X-Received: by 2002:a17:906:9b8a:b0:722:e6e0:33d with SMTP id
 dd10-20020a1709069b8a00b00722e6e0033dmr37419193ejc.317.1657094850463;
        Wed, 06 Jul 2022 01:07:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/27] harfbuzz: upgrade 4.3.0 -> 4.4.1
Date: Wed,  6 Jul 2022 10:07:00 +0200
Message-Id: <20220706080721.3072553-6-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/167693

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../harfbuzz/{harfbuzz_4.4.0.bb => harfbuzz_4.4.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.4.0.bb => harfbuzz_4.4.1.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.4.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
index 007e278464..c2867d2a9f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.4.1.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "02035eddb9d84112834abd1654ce0e177d14f41fd8ce0c29d5b4376888890790"
+SRC_URI[sha256sum] = "c5bc33ac099b2e52f01d27cde21cee4281b9d5bfec7684135e268512478bc9ee"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.30.2


