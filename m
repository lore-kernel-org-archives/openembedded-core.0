Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B958C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.20270.1700174924772125091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cb2NeMHa;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9d0b4dfd60dso181197566b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174923; x=1700779723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta4TLg3JbHO+uo1q77kUrRRcXlFeybZ7iqiHAEbrogo=;
        b=Cb2NeMHafzC2q+bnBrxFhSQMcQTJr9r6Btg9h1A6E1mncv10f938IpsXVX8ZIzKsrM
         OEYpWDqZTvH4XhlT6wQSB9j/E0AZUUsgtXVCfSLc1pe/Y7NGg0bmLEW7HBQYX5q501NE
         IO2A1QvlAimtmUjqqs4xnC0yPwbgieBu1H0r9aoIuj0PpevwNwvzuDtxXM/BtPJjnih9
         defRlDkCAJHuYNi1W/t9z45YXBGIErbiNzm2OJU48VJ1sfOTO3TF3wUIxiphTE5XVvIf
         Vi4ltNgadpNRFg5N/0Q1+Zm9+1+KSzay9p0zkct4+uf6aD2+iIl7AlJKxwwoP8kQJnMu
         /26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174923; x=1700779723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta4TLg3JbHO+uo1q77kUrRRcXlFeybZ7iqiHAEbrogo=;
        b=DGy1Pzl/mZfU+Ih68fPApYtn9A4pvi3rWMdX9Iac82I4cgoMBQu3i2JcizbXltU5Sm
         267tQH7LPZ0/Jt1Bh5m3mUtnpezlH0DMcTLLzcEIdpMWTZCPX+Os+7iOnRInPCy5+cEB
         CXaYAoBg+55/Y6EQ17EBjfPxK0rSt0/ixI7PilEfxWsPe5pEOO2qRRFm+z4ALEqrovmo
         Vy0DR8r57JO1E0ActmZ/1NazFx++mMgWeqvXT6cibw9Nlh4G7YkfLeVljNZtFHeJxktq
         XzxYWxP8JcUxEYZEZMgiFAwZ77ErfHUk24ttl3JEiSBB6/icHZ58HdEaJcbfhnf34QHE
         GLHA==
X-Gm-Message-State: AOJu0YzuB38/wqEGQEuJmVG7z3asQ3SEUaWhyBJkZr9YKOFcByWsI9V9
	qhhU7+Qrd0v2MFXL6WkHenr6lt+G+O8=
X-Google-Smtp-Source: AGHT+IHirdOlczI4oES8sef1Tyd0IN3bOwth38BF2lXeta2eoWGwK2u3axd0p9GKlsgCFaxmJVX8Ow==
X-Received: by 2002:a17:906:6a1f:b0:9b2:df16:851d with SMTP id qw31-20020a1709066a1f00b009b2df16851dmr17263014ejc.57.1700174923194;
        Thu, 16 Nov 2023 14:48:43 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j4-20020a170906410400b009de3fd8cbfasm138476ejk.0.2023.11.16.14.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 03/12] go-cross-canadian.inc: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:27 +0100
Message-ID: <20231116224836.2696913-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190817

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/go/go-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 45758f3361..8298fe31be 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -8,7 +8,7 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
 # the gcc version may be old and not support option '-fmacro-prefix-map'
 # which is one of default values of DEBUG_PREFIX_MAP
-DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR} \
                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
-- 
2.42.1


