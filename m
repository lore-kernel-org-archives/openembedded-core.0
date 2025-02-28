Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C36C282C1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 15:53:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.19212.1740758016474074852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 07:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZ6DocRQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390f5556579so263583f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740758014; x=1741362814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG1zhxWTYlCETt8c0/l6TMamVvYCbcZQZCn2CtgJADQ=;
        b=JZ6DocRQljHpdnmn8aAVRomJtTBvguoFucrpUpc78bd8QzzOwsEPM+I2W7myWj85bD
         ROegbPKCKZdCzYoaH+Wi14PUkfJpPfvDFeVPVGShGdTdwR1Y3muC+mbYDRqcSYV8H1O1
         sN0pxxnVkZSQKxQAVWTB3AIcw3jnkOqHVbb8hPXyEeUK439FpcofZM2g1kMLo9h3vY5p
         WlHkh7dkjLroJPHZx+EBdHhk1e5IE/ScYYhERbSCyp+Z/uKneiUF58AAtXOZHSr2+QPa
         pzkFzxigOLNx+kqPchSrmTUtK51QYHnt9Qb/hBBdwNdCx9AnTaStTduNQrMqOewyZMyA
         O0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758014; x=1741362814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG1zhxWTYlCETt8c0/l6TMamVvYCbcZQZCn2CtgJADQ=;
        b=F99pR3LAFe/FfKQvn4hkNm0jikW9bOdiMWhdjqpF3pZM2Kk44yKLRhZTs995UhVY6X
         yMIkuByM9ndR/DqU4u6AvU3B1E1kLM0AG8fUxCvjiQif5YU/qkMUIz7VBREs6oHkctGH
         hoJwRBBgWbZpPA5cO6ghqEkxsek6C1zIvyRzPGbPI24krhwa0mKITgYQ8UU47NuzSpkh
         kb+0nhig0eFp8VTeejQirUsIpDU7IMVo5rfHcuGo/fbI2QI5Fk6rYSpeM6sdOloYYclo
         WTBuAXMyFTHu1x5adkThqYi8jpt6wEMHPHR04aKSUj0J8zONxoa2Hy8wd7JX/Xp1agFd
         aO4w==
X-Gm-Message-State: AOJu0Yxs5KvPqoHutbrWD7+G2C8BtKzcr2xdDBbBtLYw3989gOJWgzjA
	jAN3GeEv+YXYVGo6kwAZaDm+qEkCIVrrryUiMND57RgqqQ0xF/jZ92IVjw==
X-Gm-Gg: ASbGnctc+L6ARZCwI9AkkUVn8qHJ4gShCjFRlUDV2KIIoDWEje1Vmc/et0lEttWzuz4
	h7fFdfHKHV4xk22YXcJBFEh/S/nnB6l6WgK/pmgGPJZC/bDaa14+NK/t4SIU0lrZrJW4/Vvfat0
	1FWRQw7m1hRSdb9U/9Urq0zWitL6F/Cge2AW99SK5lztKfoW15vHTP14S0eB+ptNCLgUAu5zZe4
	FSi0XDrHg/pUPCAozZezDGianY7gF5UIP9FrjStqHR5r/6eZuhxo7i35YrI6V6nCUYBMp28oA2O
	V7GLxm51gymGdB2DERHyCTrQPSwgluP3ayM=
X-Google-Smtp-Source: AGHT+IHd20T9h7vw9srhVououS/LG2lDRwhHnk7gHvvUr7+jWOY6h/Q02Fqqf+2W4Bp0g2s5RXsNyg==
X-Received: by 2002:a05:6000:144a:b0:38f:31f5:9745 with SMTP id ffacd0b85a97d-390ec7cd192mr3567313f8f.20.1740758014405;
        Fri, 28 Feb 2025 07:53:34 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e48445c5sm5564717f8f.78.2025.02.28.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:53:33 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 2/4] goarch: switch the default linking to static
Date: Fri, 28 Feb 2025 15:52:57 +0000
Message-ID: <20250228155301.1033479-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228155301.1033479-1-jose.quaresma@foundries.io>
References: <20250228155301.1033479-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 15:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212066

The dynamic linked standard library /usr/lib/go/pkg/linux_amd64_dynlink/libstd.so
contains reference to TMPDIR that I couldn't fix and this breakes the go-runtime.

The static linking is the default and most used linking in the golang ecosystem.
Even in more restricted environments such as embedded ones the space occupied by
the libstd.so and the golang aplications installed on target is considerably high
when few golang applications are used, being in the end higher than what it would
be with static linking.

When we use static linking we can only use the parts of libstd.so that we realy
need and thus we do not need to have unused features in the runtime system library.
This way it ends up not even being necessary to install the libstd.so on the target,
which reduces the total space when there are few applications as already mentioned.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/goarch.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/goarch.bbclass b/meta/classes-recipe/goarch.bbclass
index 1ebe03864f..dfe1c64b3b 100644
--- a/meta/classes-recipe/goarch.bbclass
+++ b/meta/classes-recipe/goarch.bbclass
@@ -38,12 +38,12 @@ BASE_GOARM:armv5 = '5'
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
-GO_DYNLINK:arm ?= "1"
-GO_DYNLINK:aarch64 ?= "1"
-GO_DYNLINK:x86 ?= "1"
-GO_DYNLINK:x86-64 ?= "1"
-GO_DYNLINK:powerpc64 ?= "1"
-GO_DYNLINK:powerpc64le ?= "1"
+GO_DYNLINK:arm ?= ""
+GO_DYNLINK:aarch64 ?= ""
+GO_DYNLINK:x86 ?= ""
+GO_DYNLINK:x86-64 ?= ""
+GO_DYNLINK:powerpc64 ?= ""
+GO_DYNLINK:powerpc64le ?= ""
 GO_DYNLINK:class-native ?= ""
 GO_DYNLINK:class-nativesdk = ""
 
-- 
2.48.1


