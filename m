Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6CBC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 16:14:34 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.10288.1750522472778232734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 09:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zu8tAL8K;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so1556852f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750522471; x=1751127271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=guIlSdBR/xtiGNmwhqheOkVnGwJE0+8Uzr90b6V/4qw=;
        b=Zu8tAL8Kwn0oTVStBCtxRs/oHqvQUz99lmRR9jzJd44fMd0xsUkFj2LVuT5i1f7hbL
         XPePadTAKlKLQBERBr53i+Gam76JypiICGTun4pdhjlIbZMIRftdqlhryUpd1SfLRN71
         kyAtWCL9LvnC57Co3HwXGdWHnXt+5cwnNJukwbkKviF7MB46SJ+yH+BzMOl2AWwchAcQ
         02oACI1JsEVTsu2I0DVPRV/69cgoIwgXYGeO9t1+vtzHz174/sXh6lmJIlJM1txk++5u
         W8v+qdHGLmi+UnbBD0WFkoL3M5vCHxO0wDm/N0ivkjrAibWPdXQy6hNcxm4+8+VwY4nL
         XmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750522471; x=1751127271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guIlSdBR/xtiGNmwhqheOkVnGwJE0+8Uzr90b6V/4qw=;
        b=kaEDHYtbcSO7S+/Hr4u5FIYn4keIrBLXQSNQpTvIRkKODO4NeNt51IOw7hrQLPe5fn
         pKIWHAmZ5+03jYa2wkmTv5KEEAdtbZDHOA8Ewd/sjdxcXrcGZN0d4ktv8Ph/uvuelR+r
         CcWPDkkllPCVpNnZqCqnOFn97YtaeqWHnMqveIIF0qvixhoj9LX2gwnPtTfzXJmVlVi6
         QziL+UZbIbro/FZneZ12v8tKo4qVP//14Z+X40ySdrwiiegewy0z3Qf7ZSa7dnv/un2T
         /+2GpSlPEG9vhaeFn58nPShiXgp48kji9i0ydgqjV5l0q2Dhm7dT6IBbRC7dXmsBFp3M
         mBNg==
X-Gm-Message-State: AOJu0YxBmHn0FuPXV0poElLAooIYb3O6Z2JAJxiMcePFHisPMa9Wk79S
	oBgiMGOioHIIUcHBFmoXygYJp7UklEFhQMl2ecb4mWUOcbSXbvE+wjg/S4+IaA==
X-Gm-Gg: ASbGnctViF/1Lpa9k5rOZfx/QggrWYLKC1bQ5YYEI/F0RD0QuYufEq31bMCS9Iq3n5K
	vq89d7i5q5QqMCOlc3I/4ym3ruTWWEvHwJpEbVA1m+nGKfZxu6FmBMyv5VSt4p1DnhIDc6xfBKV
	DTppMh9tCQeRArnPhVQ/BdyhrC8lKZFuWLUq60Ys8XzG/KQRDVls7DpHjmQydATAiRBvNEI82ua
	vSMDBznocBFHL1EOwFnAr+/NGWytfPgZi/ti7wk9uF93X2gFcO4X46GFOvkWoUEht0T/PaT2/sw
	dF4PABwBQrM/MK5NRz+IxWe4UeXXjCCQY68n1dk8QwPuYvxaTrnbpeCgnAfEA/nwkYrcGw04COy
	v55DrsZM8F7g=
X-Google-Smtp-Source: AGHT+IHv2VJ0kYkhHEiV58F7Ko6vASb8KtirOqzepAZ8Nuvcyyt4Rzg+PzqjT13gZ+lzbN/f85YYnQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a6d12d5873mr5528956f8f.33.1750522470679;
        Sat, 21 Jun 2025 09:14:30 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f189cdsm5118446f8f.35.2025.06.21.09.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 09:14:30 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH 1/2] python3: drop old nis module dependencies
Date: Sat, 21 Jun 2025 16:14:23 +0000
Message-ID: <20250621161424.13595-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 16:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219166

libnsl2 and libtirpc were build dependencies for the nis module.

The nis module was deprecated in Python 3.11 and removed in Python 3.13

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3_3.13.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 7c36fd92ed..7e9e2a2035 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -72,8 +72,6 @@ DEPENDS = "\
     bzip2-replacement-native \
     expat \
     libffi \
-    libnsl2 \
-    libtirpc \
     ncurses \
     openssl \
     sqlite3 \
-- 
2.43.0


