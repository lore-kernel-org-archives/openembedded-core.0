Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1497C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:55 +0000 (UTC)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4701.1789499026659253025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=K1hD599N;
 spf=pass (domain: baylibre.com, ip: 74.125.230.234, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53122c5bbb4so428401cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499025; x=1790103825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvsTy+ASW7zkCbtoF0lxateslrz46DDTvVuweRIoar0=;
        b=K1hD599NDxyIwSSv8k5EYwwKGjdBJsL6hApOswDSHQP7fIRSDXEgdqu6EiIcebyekf
         yfsFR1kjt4HLHMB8Xn6WCSQ9oaBrb8MhtSx/BdDh0hiVLVZqYy3wl9gA+vvACoExbNzo
         LhRPYDn0xvsqtfOsJTPXePbRAjXIM9NJxGiz0BDzqnoVYkR5+doPSzXn0U20t4QBA4Kg
         BGo0ZSSruoHUdN4cClvT5rf0oGlWnIGDaqwaCH49sr6798Bt9qG0DUYNVsPZYEtfx+Ew
         EmOPvN8CJf+npckrI9uGl1TCew9wPtyMiSt/7R4xExbsiPrPBBulNKSm2jFIYGd+LN4Y
         RAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499025; x=1790103825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvsTy+ASW7zkCbtoF0lxateslrz46DDTvVuweRIoar0=;
        b=gHq44ZKEGDb/BTFcG55MZX5ynmJNuky1cRPTcbXqWnEKKfFnoFW46YmW8JbiC1zlxx
         E/ltzx7TBR+CQa2b1EK7saf3hCq3mRGfhBvbPIhem8gyCOOc/UUdsGzb9UYyWYOyZdjg
         Sp+fITvX4J40KOtHc3qHJIQjd04z5rLNrC2LCiMwlHsc9uDWTcZ4jM90oC9kD07Q9Cvs
         TZa6t08C54Xpe1MHZyPjQ758u040HyXLs+5jOsQMwBfW6u0GI4Y8hOBUD91+XjpdwJPF
         L09m9zfnIqvGso4V/p0rQq1H3MDfESXlXByzvd+MPERNwjjcO6uhjFMEU6uMqzjC3UHU
         viBQ==
X-Gm-Message-State: AFuF++mr339V84EMUikF7lpUKrf7jtQzuwwWXV0RO9q/cjFhm7fS5UVX
	HjpHO+RwicCoZRaIxid3+dCljBMIFot50COxhFrutFGAkTd9Dv5R8fipRu0mfuUsH1g7PMVfxGx
	WFAD4
X-Gm-Gg: AYBFou0U75kR7SYGIbmqLBAJAGKmtAxDZI68pu+cWb5qTFPDqd3DtWlOrpyE4mzM3NA
	7v+5IG2lJKgP1iP+xcLbGPCDqjlrOvgUl87OePw5AxIjImuwXpTeMvGTvy5fAYkx9RT6T0ntPHx
	7DDNoTttoN0ZBd2kmfvhwytFku9tGiMlSVfIjiDODhTlvFoyCN6vF39i4WA9jesu/vlv0VvgPJm
	Z8CnxLa8pyoTTl09uFMDPw+1Oi01ikTN6CFFqsioHNc84ZpNoqxbvspRsVAez/UJTqjLvSnruOp
	ddgin1VR3E14pWt63eJ5fmH+1N6EZ1XAqMBcQAXtSZ8KqFfOcQzBEe09X97OlAzkdSd3VrglZ5b
	7DUqYdUv+pIPeR3mCaJi0CyQblWT2rgeLN3ArSRVoHxzBKFrOWALhfYyVNWxWYeFWefvusTN2C+
	oau9aNGk83LdJPy0KiAGbK8tg0dKxCZxqLqg8KrxnStc5XaF1XzMdZqyzLuZIUQv4M1/MuDvvXc
	g6G/ucESFZYf+CXsbbOXnqw2+lb13885g==
X-Received: by 2002:ac8:5dc6:0:b0:530:42e4:effd with SMTP id d75a77b69052e-5310d031949mr127010031cf.42.1789499025532;
        Tue, 15 Sep 2026 12:03:45 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5326204ad36sm1660631cf.18.2026.09.15.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:43 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 10/14] meta/lib/oe/tune.py: add rva23u64 profile
Date: Tue, 15 Sep 2026 15:02:40 -0400
Message-ID: <20260915190244.2983746-11-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245885

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


