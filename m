Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DF8CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:34 +0000 (UTC)
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18026.1790786307322742234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UR6lJTbY;
 spf=pass (domain: baylibre.com, ip: 74.125.230.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91782711448so19719006d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786306; x=1791391106; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkljdKhpNV1XZU0yd3TbKFXxRl4IdAWTiblVkw8M/kA=;
        b=UR6lJTbYqZPlsbbqIeWX92ApNfBO/ALPNhokjgoSYegL36aJ7MywAt87kUM+d58Dt+
         KCh3p+gbALQkAK4668uWUTKBxCtITkc0DVRdbK3bShlaZmujE8n8GXbZaKFZum1umMDQ
         n522fLqGZ/w082rMGCHteoSdm8lf12c6bGXBwA0FcGLzoVMB3SGvdBlS1ti+9pKM+1AF
         Rnvvfu1Qfwxh5EMGZjdPS7CoIpqJOzLbD6/DRufxbSAWur759ivi57CQCSi6D0pWVTjW
         mdVebCaKlHS78dbQviUm1fey7K2/TyBH2S2fG3xS60n7Wr5m8N4Nf2/7sQ6bZ/eFk7KG
         42BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786306; x=1791391106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkljdKhpNV1XZU0yd3TbKFXxRl4IdAWTiblVkw8M/kA=;
        b=XhxeWd2oM4YKXeM8pRJzVzykUd1KlFHsQOBoo1oq/fiabLoXRi0s6NSYnG7IHkf4b8
         /ormWzqycj7++kBByDvBcCD6B189ARS1TLys1DCkGhYE6vNYfdh+HP46RIMugGxI7pFz
         +RnC6uBF0RR5eEnmSPrRJkp9kgPGYL1cDRKIkKHLT/IC4X3gdB6WIXx/pcNHNVJepDac
         1p6xIHwujBGEIvSF3gCs2DBpy1q6+5VaFVmEccOlZXow5myLoT+syLn4+4YCwuX3HCxc
         9gxbVMTL/MRxzPkgwaO9+2WiQhAPa+Bny8yEctxSwpf6xwanQu1XftrDjEb6grtcYjBe
         RYnA==
X-Gm-Message-State: AFq9FYJrWMtSLTrv6BaR6gbe0Q2m90OeG/uFLYxcnzP/DwHK5QpvD45R
	ZEk+QbulPoegYfu3yPAeGoUKR5aFHNIWkmoVNCEfVpiBh1UhDNrgfec/23SNGZiP0hM=
X-Gm-Gg: AYBFou0SH81z2id6XaFypGr97fmt695fFMwglUTn9R9kOKwTNGVr3kzYTEUeRDpfhkv
	ahX3Q+t4xkKC0A3+Fzn1YWUrwDf0JxYQ5nI5REwXKF/ULLyvykCk4rrcsRbZ99scjPXx+SSCwfq
	5DZxE4ZAzEk6vHSCOfNDEF1AoBAeond3AMhF54PDApgUGykCxHL3hcMbHscRDbhdKatV3lptvu6
	plJ/GdJvCUFOFUGq9rtrLEsqTAJyiot0JutJyZk2fPcZWlZzmGKz3nmxanZU0BHfBqNOKyjJLuk
	OD34sWKZ92TFHLPu1EEvZ85H0B3P/n8sZyV8CLmPYrX/STXSr+J3YM9dy/mml1LzZ201Lr7Ycy3
	yGJJODJ9z3qvsJbWB4E11mS002MwMfPZOfWeu19WiMkJGPEiRX1TTYZKNoy9HzXeiFE/nRYAU0U
	4Ildn5/D7EMzNGyPrgruAl7hTs74nuYaeYTGhVoEeLsJnCMEhnjvPh9do1M7uLa07I9xKd6NwfY
	sGKAFxEdQHnhRNratYGI9ygad5iRQRKBhIcJCqJ6Gc=
X-Received: by 2002:a05:6214:20af:b0:915:e6d6:477a with SMTP id 6a1803df08f44-917a0c234f9mr33457606d6.31.1790786306093;
        Wed, 30 Sep 2026 09:38:26 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:25 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:11 -0400
Subject: [OE-core][PATCH RFC v2 07/19] meta/lib/oe/tune.py: add rva22u64 profile
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-7-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246987

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index fed593e9af..8827d68a23 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -9,6 +9,7 @@
 #   -march=rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd
 RISCV_PROFILES = {
     'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
+    'rva22u64': 'rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt',
 }
 
 # riscv_isa_to_tune(isa)

-- 
2.55.0


