Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F5DCA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:55 +0000 (UTC)
Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18100.1790786310964212951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=feeP5map;
 spf=pass (domain: baylibre.com, ip: 74.125.230.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-9142b186be6so10833326d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786310; x=1791391110; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/zwhJVA6pQL1cuw7nYmribVDiWeR6dkGMUyVrv5KLk=;
        b=feeP5mapaR2cthBerjMbbMBP7hV5yU9Iueyq4Ut/PfkjCTBa2n5YDM+8KT3AgARPTX
         NHwYf0av0pPNGk9JwQTIanTEdxnwYyUuv3nE0WLyFr9fSxcebfNjHqAPz33RC447Mn/i
         TlZrNFIA2d58J5Ob7aPu0nkCEOVcqO3+PFoB36gZYoEf9OO0MmPrg5wbGdlHB4ava4FZ
         hxlwNYg8ssGv513RpBlZV86K2b9TIFhF0L2uYxVR+osrA0NEy3U79YSLklu5JIvWW1Ji
         NRESlXF7CDnFwimODHut4pVnqEO5nAWtI2pbY0396u9iu/m8u1j7Gt0ABUmuWerGRPwR
         TCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786310; x=1791391110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/zwhJVA6pQL1cuw7nYmribVDiWeR6dkGMUyVrv5KLk=;
        b=etXPFxdgBH/osmatMYEz8U9Gjsl7ZF4ioDqHAezSgka6ObPsH+NkjxR6R80fK3/q38
         dI8NuZIWm5ajR3PapTIN39wYwFvuiiP2b8qIQZjJ/6+pXRFLCGCiV1cvb+wpsJXZeAL/
         f8BisguxH/AWBxsfk63dt4clIWa9SjPsu9TpR82zYJXVST84JFrG4covWlji1G9AM/J+
         AxANkoTTywvW7Tvqxqu43RykxRp6GihkONJI8X+9BYGrxbk0Yw4T24h+nw5fN02JQ2au
         fDhv9SRcUFhtbRs1ITHRdvVmBfRcaG9t4qRPpDGVY0BYDSSqUbOPaFkm3ABI+y3aL9NJ
         hr5Q==
X-Gm-Message-State: AFuF++kfso5r7Kc8d2A+5gtRQk6XB8iwIgrWyECg/fF/G63MW3Sxt6TD
	3JA7vCp49havmSQs0OchtDprAMAUMZfjdez3rGEmVJHRKakGHBMmdLWb6KcpWR6ftXo=
X-Gm-Gg: AYBFou2pjX97Uu30uNXWT51wtv3m9H3MrcjwfUlZREjz8AsUS0OkfvdWtpl5zPsW0Mk
	nuucK1hgd0m/+VJfRNepDngk2lixvFsTxa8otewr22L6tm93jDc9ON6qYwG9uLGRAzCEKJRFxrc
	ABdBw4lpcvX4RkP6HKr+c5FR29LtudMQBOouOtB3JsbnX4IXnKV/tDQSfBFCw4Nb2KRoa/etGQU
	8gfwmLk5vTyooN+0YbtTO9j0xwnPfY8xrzvM/uoYCxMv0KRP7bztdqlRLbb20oKxXg3TYWndVG1
	wMYXq0n64IDxG/8s7i6uiICMtmYELwD8yrfeHezaIup7h/L50fqgI23H8MwVG/2eWKkIb/LcQ43
	f5Gd1FQt0zLPDmytag2/3zwXs2k8HsAeLXKg+/skbgmmw1dNh13Gu2VSDBCP0f8W8CP30U4Ro+0
	OXLYD58qlhtYZBBxl94fqWguHhPWsKnaLWjVBTginWarzmKiTnZ0v8J/c4MnAhf9QYGAflD6xBS
	K86T6hu+6CSiDAoFft61kyX2B7prR496dCn4bS40Ec=
X-Received: by 2002:ad4:4ea4:0:b0:8f0:afa3:594e with SMTP id 6a1803df08f44-917a0b772dfmr33945646d6.8.1790786309877;
        Wed, 30 Sep 2026 09:38:29 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:29 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:14 -0400
Subject: [OE-core][PATCH RFC v2 10/19] meta/lib/oe/tune.py: add rva23u64 profile
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-10-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246990

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 8827d68a23..7296f39e66 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -10,6 +10,7 @@
 RISCV_PROFILES = {
     'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
     'rva22u64': 'rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt',
+    'rva23u64': 'rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_zvl128b_zvl32b_zvl64b_supm',
 }
 
 # riscv_isa_to_tune(isa)

-- 
2.55.0


