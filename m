Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23135CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:56 +0000 (UTC)
Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18101.1790786312161332503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=eqJBPVf4;
 spf=pass (domain: baylibre.com, ip: 74.125.230.231, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93cb545be7fso7010485a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786311; x=1791391111; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lm4+gfNy6kGph3aZg4Q22eeYcjJi/40AVaWFeltRjJA=;
        b=eqJBPVf4hPSZjslYmFR5TRbOBURLC/h0Zhq0wOYf31xDZ81wz29qMe6er7AG3drR56
         pqgfriVA5OJMewcDBe5kLp0AkWE9yIOyOMS3s9ephB8Ena2gRMa3Vr9ojvxdeqRDnUg1
         RMvc3A+p1pM0PAw1Th0W245NezLWaO3RWp9kFX67mtYWiZ/ABoqKSwZMBWJ5U38aEDXS
         9IF5Xa1SSpDrEn76+d8O5mP8Rr+qQx1ygmEdQ92jeq1HTYz0wZ/EUYxlDVDCQu25/IT8
         XuXg44bjSjYCGTL4MP2M3zB1q5JcEIBtYqsReQ3HqJve6Cs64cTKkyzJd0+sjXI+NLXR
         W/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786311; x=1791391111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lm4+gfNy6kGph3aZg4Q22eeYcjJi/40AVaWFeltRjJA=;
        b=FaOqMd5wAxQ30IriVuuIsUnW/EGQ1W8C8582dRJuY9U5HaQvIZrfiCsYn34K5/rNra
         mST+f0umYsa0cwRubaA38y4/y9v9Jzb6yCAxCfp6Dgj0xxrthYvRJv1vfPL45kRZ+7hr
         FuB0zi0pfakHFTkoFWCAxGiDAAjT6ihInjxw1OWskeBRb1mencSsECUScIYucpnRjyr/
         28zAL7A8iNXQ7XJqZJQRudytRoDabOkZ4jV6L+AzIpIMrkOaf3MnnNlSxx7NgztljwWD
         9AxhavOBgLlN0Q+jzEt/iaZ6VntrdscR5oCx5dtR0SMLKlrVroJc9V6xCElvvABOd+m/
         xf+A==
X-Gm-Message-State: AFuF++kkCaeFeqCg46y9DJ8HYwBpJKn2LJSMHpPm2ylOwxyE94Wm//kP
	ilcWrR3Ll8T3RndKG+qk53+SnlsLJDdffZ9nkMFhazhp8zcZny4iUGOd5nsU+LWv56E=
X-Gm-Gg: AYBFou0R5dSMkkaZzjbEBmlJ1FRgm/6CtRyXFdNjg94fYMVhSP1MclpJ4yUfrvZLmiA
	vCV03hk00tN8lnLk+0QPwYojESbFhuBSCEyqgL0AciC9wrKrOat/l5QcLR7K/CqkzJjYMIRaFhG
	m/WYCSP9Bbw6g2GMW4e39WYc9bdaNsNXwnYPup4y6gGvPU1gkRpwAPLYXZNZr+TlxMixpPpAjlf
	ndoonQ/TwXogX9xGK6ruj7ChOo00UKvRcQ85naR2ykGp7KP/9mIf5HMLCl1b8AYQfgh1KqTYFWW
	8EdgxtpBtX1OGO6bQ7xxpAerePnFpgNx8ZxRWdQQ+FMr4ZEFZ5FnVTXXEqjJL/aGiydtI6ye6Cc
	pkL9ha8iiblYi1NTUv06aPNMtQpu9Dhgqx3WNUON34wahE+WuVC+0bIgYVncaiNU1HUpK2P6lAr
	/PMhfphbS2+l1bCX5UtH2OudJd+S6v7BltIKnDVCZjuVRlNRGrvAAKP3IQNXc66LxxQcW441rN/
	YSWepa0fwfXlH4G04XHZ/fzfZ34JKZ5kFbFd3KWTIc=
X-Received: by 2002:a05:620a:438f:b0:939:bc7c:15c8 with SMTP id af79cd13be357-93cac1c9796mr294483585a.45.1790786311083;
        Wed, 30 Sep 2026 09:38:31 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:30 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:15 -0400
Subject: [OE-core][PATCH RFC v2 11/19] tune-riscv.inc: add rva23u64 to AVAILTUNES
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-11-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246991

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index e3f3897978..500808ef12 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,7 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "rva23u64 rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
 # zifencei isn't part of these profiles per gcc's -march expansion, but the
 # Linux kernel requires it, so add it on top of the profile's extensions.
@@ -12,6 +12,9 @@ PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")} zifencei"
+PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${TUNE_RISCV_PKGARCH}"
+
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"

-- 
2.55.0


