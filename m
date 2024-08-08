Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A71BC52D7C
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.50968.1723084148033189176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xsr2KUmm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7b396521ff6so413173a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084147; x=1723688947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0PJEyGS1itnTmJp2yf6j7yUls4Q60LxYMaxUuF2994=;
        b=Xsr2KUmm7MqEVRqLy+WWRvJdcDhybEq2ByVqobww+FmF1O+IqR+UGsANmA4ViOXN3l
         5fkYnG/tEZqLpxs71TwO/DzJYWzVvIr/UCE66USHoK/zhtF60yuy2PR1R8eu96HOgugG
         z6tcnPRt6nyYmhWgBW2Mw019nqA8EeXJphkAQBK0oDsiplNFEzRMnTZyjJ8zaxorE7Ug
         OG7IPigI75wP/uqcaWqx4J8KtrbqF2u4ANQsqmVdrzEIIbQ1YYCrRrZpBSiUvFu0vd5k
         f5Suml+8D0jfCGWZQJ0vopWW5CCW0pIFHi+skxvGT/exXICpTciwqMljxdOSVybwP/+P
         0T3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084147; x=1723688947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0PJEyGS1itnTmJp2yf6j7yUls4Q60LxYMaxUuF2994=;
        b=gPiDJ5MEorXY1k0GwheVQ3C/7xHFjvPA7ka2vV5+QhacONHrLsZ5NPLni2oKglW1IT
         CZEUT2/itKgRlc33/kEwsiv5x8QYDmgxTBA5LFzyar5dJo4hwCg3LTo8KiU2+pyUIBDT
         8fdOT3LpmKSfFO9tkwL/TDXJA/pAcS/bOYDZEUKDdhlla0W0wrLyC1jDyc4/SL9Vi1FP
         leUXUeIr9WxTBecH/fpOfItOztnXuar2pOg3bFdglTj53Q8jviiaiEh67LkrUdv0O6xD
         Gc33TlGNK3nOiz3r3vBhIMYFeab5JDE4Pecqs1CwEYDSXVg3WHrJXRpDpuZXpMCwz+yQ
         W8YQ==
X-Gm-Message-State: AOJu0YwHiUJk8LZ24FSa+EvE64xfxMTYt+Tz2iW9GaibVdd04JOjx0G0
	dHH5XJbJ43Vc6aLCtBGWVTQtsxmmDTL6Fc9xlFid5DUpJJFGzikJnzo4uqRE85PZ994S7qxkomJ
	xAXc=
X-Google-Smtp-Source: AGHT+IFwAeYoNqgwVUS9ZhnGR5QCn6B2twgNLUOLn4PDno+cUZHFs4VWQ4oyb4+OmipfrSrGKtaMNg==
X-Received: by 2002:a05:6a20:3950:b0:1c4:a531:bafd with SMTP id adf61e73a8af0-1c6fcee72d1mr591795637.18.1723084147261;
        Wed, 07 Aug 2024 19:29:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.29.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/10] libmnl: explicitly disable doxygen
Date: Wed,  7 Aug 2024 19:28:45 -0700
Message-Id: <fdce1a6f1143edc577f12c7e8fab878ec69c3c9a.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203109

From: Peter Marko <peter.marko@siemens.com>

libmnl autoconf autodetects doxygen to generate manpages.
If doxygen is provided via hosttools, the build fails.
Also until now manpages were not needed.
So explicitly disable doxygen in configure step.

(From OE-Core rev: 8d7bbf4d6936d831e341e9443a6b3711be09c7ab)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 748326c0a0..66b30d7f60 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -11,4 +11,6 @@ SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b4
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF += "--with-doxygen=no"
+
 BBCLASSEXTEND = "native"
-- 
2.34.1


