Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7374ECA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:35 +0000 (UTC)
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18109.1790786318572700173
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=BGTp7i2p;
 spf=pass (domain: baylibre.com, ip: 74.125.230.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91782711448so19720496d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786317; x=1791391117; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dhDiueeCOd0gg1rPw2RenP2mcXwm625SYSeucfCKLWI=;
        b=BGTp7i2p24qToliVYa4jHs43yvDHnIT41y+3IMXsXZNJRzq99tdOUNFMe/PedLFUW+
         O3nRX5GpdjiE1zPAppqUOPf8ZQPA2zXuMKnzxJHydBZ/AcdbpVxiOsobNoGd0lw6nVOk
         sWeW4wO9Bkr7JLqDHC9GsGaxypVz/4UZU4LkaDyw+SpaEKr6w87EuxCbqUaNHES23S0g
         H67r1z/5IYhagrCVzdxVX3Hx0kkrRW93Z2/8NyKoRFht9slGzQoJpKePQlGM1pmdvyCo
         2vF43qWcJ2u1gKUAabvlL8qaEbsPCld86HZtKpwDVDcD8lKkAYfVU9eqWlS2qeFYQMKj
         smvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786317; x=1791391117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dhDiueeCOd0gg1rPw2RenP2mcXwm625SYSeucfCKLWI=;
        b=K3haru6aWnpb+jD+X3EAKaJhuyH9fDAdmH/pckwaJk3fhERgkmi0cX1nT/3G7zDvGw
         N4HCBVzNkru1V9EguQIaKPO6qRBE3iSSdApSFjqs7+xOhz5W5zwlVGQin8iuSCuFaco3
         aqv6bB0MsWb5Rhj2ZECUPPOfrdiVhL1bbAuiMgwxS3w+BrWNV4e1eZKmDUDV1zo9rKxh
         rItTBmvBrLDwblryhesUtLsDRR3VH6gxYAcSQrbGuGNewDxFumhnkykGNyuUSnii3/xL
         sM+sEo5H0cJVg33LsrJvu51eu7yTA/FSvVyx9peuDvezOYWpxd83Wm8hcHxYdQJ4maAG
         TB8Q==
X-Gm-Message-State: AFq9FYJ7eVWkIepSREaUKbmLgIgO7exQAAF5xmuCZKQS7SJlU0YfU3Ah
	hDECIavDU1PD2gUf3XBOc8aZUWXbbA0QZ3PvbMtVFZ13RsobsLUz481g8R9dVEEhcAk=
X-Gm-Gg: AYBFou1J4zD2k7w4kF969RReqLnFyQgCJ9dvgxaVY8JGndmG0bEi6zoSfzMP8kGLK2n
	mLWjUNIlOkYkLcyY7KZX3m8/cSHUb0urbFvxUSzfclwiuxnex3hOxOOYtkhvuorrtzWEJlxk/Q2
	O21nbkLheF/Y5DHgl//1wSM4Dics5Wuym9WUAx/H4ZFR8Tc5fltQaa17VJBmcmJgLfgVrHjrEzu
	DfTqiq4p6jWFXwfR1h9PZI9A773TGkV9JfE7kt9KceAnnnbFFZ6dvV9dcC47OIYQjNIQ9a6mvtg
	GUclLnn4j4E5mk34XlcWPeWYISnmgITDuIt8qnjhZfS3uhdFUg6wZf2Amnu0so5zpFZNWqNmXfk
	ytzlsmyce3t+10AOL969Gu4n5/kyDU0c3IfMF3WKnXE0bAdSMPSnhlye3noeP9v3De38yuKfm8m
	28bmTyrjbrTxK5IERB5t8UshgwT8vvStIfKgNwhzvIBzS3DZnM6JeImpjBvBwyGSjq2LDicAluB
	KtNyfDuSbYrG2ZYX2G3kObWcp/GEGJghpBjv3VhxFA=
X-Received: by 2002:a0c:f209:0:b0:914:5531:1a0c with SMTP id 6a1803df08f44-917a0e7b2d2mr31805856d6.38.1790786317311;
        Wed, 30 Sep 2026 09:38:37 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:36 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:19 -0400
Subject: [OE-core][PATCH RFC v2 15/19] tune.py: add vector extensions to RISCV_IMPLIED
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-15-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246995

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 1ff4b32e74..2ab3428da7 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -36,6 +36,17 @@ RISCV_IMPLIED = {
     'zcd': ['zca'],
     'zcmop': ['zca'],
     'zvbb': ['zvkb'],
+    # The vector subsets nest, for tunes with some of them but not v. Each
+    # entry lists everything it implies, since riscv_implied() only does one
+    # level of lookup.
+    'zve64d': ['zve32f', 'zve32x', 'zve64f', 'zve64x', 'zvl32b', 'zvl64b'],
+    'zve64f': ['zve32f', 'zve32x', 'zve64x', 'zvl32b', 'zvl64b'],
+    'zve64x': ['zve32x', 'zvl32b', 'zvl64b'],
+    'zve32f': ['zve32x', 'zvl32b'],
+    'zve32x': ['zvl32b'],
+    'zvfhmin': ['zve32f', 'zve32x', 'zvl32b'],
+    'zvl128b': ['zvl32b', 'zvl64b'],
+    'zvl64b': ['zvl32b'],
     # a reservation set of at most 64 bytes is also at most 128 bytes
     'za64rs': ['za128rs'],
 }

-- 
2.55.0


