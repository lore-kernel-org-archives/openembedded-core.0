Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B1DC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:42:05 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.14294.1702791722651073463
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emQr8d4x;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: ticotimo@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6da16eab6fcso1574900a34.3
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791722; x=1703396522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEdHC8DILfS//TTeMX1yvQGdJFY67m2me1WuqdJkrrA=;
        b=emQr8d4x9Ul539nhh/Hj6QiB3AUe+hQPE4FxhGPLF2ULIICBmoueaOpZyC/uh54LYa
         XbwqlKU7IKYBhikwP/LvTZzAKACxH5pDxRqEPWdzKty4X1f6sjfaxEqsRd4MS7WJuP9J
         4FYTGxiGYhXk1f1ZohsnEZeLwYXGjw6hvx5tmfDfmdP0PLs7xdEiyrRHjWT4bUc7MYNC
         Y6uhRioUU98Ena6CAWkrls9NmG6f49Pdof4kvvfZLum5W7d17u2E4q5DDsdDN465HfLe
         NkcryEa+5TTNN8FGAaDzRGWygUYzHPADq9ik1Iu/taDfxk4sYPtpsIrWKX4bTvA6J4bU
         jqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791722; x=1703396522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEdHC8DILfS//TTeMX1yvQGdJFY67m2me1WuqdJkrrA=;
        b=UA8nIoqQWzKeI0DEVosACn5LYaWr8h8QwThHCLJBSkBX2GtyYDrOg/S1m+51JlN1AO
         6MXbPi7FGTjxnR3UKvs1SHvDGfaXpcTpPHdirk4lDzbvlmzuR0/YbXBgI0ceUoSsKs/k
         xo0tqdiMm9t9s0f4N0FG6+MVjO1COJjq5P1WvUEqnv3YiZKoLVuwWmK+7k91FCs10I+e
         d25GXPw8loEWzEet5t+oaDpVuyisoKSxmFgMcwIKiLdWwrvfgvy4GBsHzzWByu1BRTzh
         WcXSMfcLXYMS9IOIKDAqxrxwow3+tgOPS/s0SFGTBQIzqwWfHh2+0X9NokcoFpKBp+Ui
         tpNQ==
X-Gm-Message-State: AOJu0YwtcqclCA1QGtH8qC4+HUcfQMy9xSAVKJfnWyFWoqgj508Htuxh
	pbp0w3EOZDqxUGRNiyGxEmrtM0e41NQ=
X-Google-Smtp-Source: AGHT+IFsl2Uqy5c1mt/o3880Boe7pg3yGdkQseDQM0kN3BTPo6an2hdU9/VKdBCzobtqvVH9MOJKJg==
X-Received: by 2002:a05:6808:1390:b0:3b8:b063:5d72 with SMTP id c16-20020a056808139000b003b8b0635d72mr16581433oiw.89.1702791721595;
        Sat, 16 Dec 2023 21:42:01 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.42.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:42:00 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] python3-maturin: bzip2-sys reproduciblility
Date: Sat, 16 Dec 2023 21:41:28 -0800
Message-Id: <8803dc101b641c948805cab9e5784c38f43b0e51.1702791173.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702791173.git.tim.orling@konsulko.com>
References: <cover.1702791173.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 05:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192576

The /usr/bin/.debug/maturin binary ends up with the path
to the bzip-sys (bzip2-1.0.8) source in the python3-maturin-dbg package

Fix this by mapping the debug path for CARGO_HOME
to TARGET_DBGSRC_DIR/cargo_home via CFLAGS. This is
required because the bzip-sys crate is compiled using
the cc crate and we override default CFLAGS.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-maturin_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
index 6f7cc6ef397..07ad1201b89 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378b
 
 S = "${WORKDIR}/maturin-${PV}"
 
+CFLAGS:append = "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+
 DEPENDS += "\
     python3-setuptools-rust-native \
     python3-semantic-version-native \
-- 
2.34.1


