Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20F5C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:39:25 +0000 (UTC)
Received: from mail-qv2-f18.google.com (mail-qv2-f18.google.com [74.125.230.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4506.1789499035488957495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UyEG3bwm;
 spf=pass (domain: baylibre.com, ip: 74.125.230.146, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f18.google.com with SMTP id 6a1803df08f44-90cdfc6db0bso1200836d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499034; x=1790103834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/rS4Y2yXCQBaYZZBkyBOePfX0wWIOU+dcfGEUnHsmg=;
        b=UyEG3bwmXaag3CqEj9pcL+NEFROB7oi0tV8Fufur7qzYzrw3Fim4DZk7LALUTUwRbY
         PQ0y9ORutAYZXSm6+0AyPuv8HOAeE4GD8hrTcyf11Y6GJRSsyBPXIDP/zx8ngLoY57wk
         YDHxOlnIfKG247SDci/TAEFgoDTb5hGW0RQ7rU5e6HyRu29wVinXVO2Nmmxj1gy1W3hk
         1JCk+2kwVF9IxTQNA1Jw4Y2ILtzI37Uis6mwXUcsjhWm3GmBqSnOlS68bnMAxspSp6Um
         A0lNpvkwgy3xVUVQlMbGOGAGbpy+K8mhVcYAnJLfEImD6FWbGf0ZwyEteRibDdKCBq+W
         YsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499034; x=1790103834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/rS4Y2yXCQBaYZZBkyBOePfX0wWIOU+dcfGEUnHsmg=;
        b=VKREsz9saQp+THrrPD3Ce2Z8d44MZa1VdwbBya+tRzrmGmZ2xAFklveM54nmPByhyp
         fRaHCnKLkTa/hXQym5/cq75sLm4Ktclpv+qoIdLB7tw7OuEpoit0XM4s+IJr7xylkI+R
         y6gV9mZD5THeZBqgI4A4ZGfE7QvGxUrNWYe2Bi4YvXR02uCMLTwWO8rtsFOsQosmWvzx
         sYajGpr1Y9cN0+BCms7+l8gy8Qka8m9WVJVtSubZtIVeL4b/DQL6UeVGi6jVzFtxN3AV
         R2JruIqK3fKzZS2jNhuFYw6yvbow779FB0BdWbTNkqc/B4N4V7uZVT4+49DfEVJ7rEbd
         aOTA==
X-Gm-Message-State: AFuF++kpSllU4LlNA7BOVN0IW15CPBAzNehLJzYrPeAPcR0wXQwP91bH
	y1pxlhrmMwGHQEAJnHQyD2G32MMUNUCXW0FcGP77/X8CTYFchwL/E+nIYiAOqKx2UaLKh1FO+Zo
	yH8l7
X-Gm-Gg: AYBFou0ypVStFNwVRmZ/JeygrBopQyTZwHlSZf3NzOQ+NlP2opQIOT8aos10tKrcyW/
	/+ELyJvCYgAefYCNLNHnzo1ho6URzqLGd/XC4OmW/lACs2qK2N4T5nFA897Bl+YGA+QkMjLPTJZ
	c6OJ91Fa/zdTzaJL7qYE2Gy8jm5J1MsAlHZLI1A+k+Kdyf1Kk36Z9p9kUf2YDcwXndJeNeZvOD3
	v8inTjgUwHkrEj7dW0+nE4RM+KZcRxPbKxiwjPbBnXmyGSBzvgDOnC+QTmX9mbSvOUu2jBjo1p1
	A5CiRoyAnlI4NGExgJXR+rGohpL0ZE3ZPQgZC4LjGTkuu0tTrmes9LQK2V0XHtT9pTI/mjL3HPq
	AcIsdU+QFXAoMW1alnVdfm9WJsp04NQdcRTYc5C4P0dI2yCeN3L40pYD7KTeCvho/BhNDPh9vCe
	cerJytXPQMYrqq9/xYJCgTcdeODPfSDSb5cGMq/22+amE0sc6yvGBvFodstfDv0kkuFZUoFzoL5
	LkKRkza2ragtm1AMtCf7lYhmqptCo8RfQ==
X-Received: by 2002:ad4:5e8f:0:b0:910:4874:66e5 with SMTP id 6a1803df08f44-9122e552ef6mr156527366d6.21.1789499034162;
        Tue, 15 Sep 2026 12:03:54 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123be925a5sm5697786d6.28.2026.09.15.12.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:52 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 14/14] tune-riscv.inc: append zifencei extension to profiles
Date: Tue, 15 Sep 2026 15:02:44 -0400
Message-ID: <20260915190244.2983746-15-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245889

Only riscv64gc enables this by default, but we need it for the Linux
Kernel. Append it to the official profile strings.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 64d1f89dc6..9357dc67a0 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -4,13 +4,15 @@ DEFAULTTUNE ?= "riscv64gc"
 
 AVAILTUNES += "rva23u64 rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
 
-TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")}"
+# zifencei isn't part of these profiles per gcc's -march expansion, but the
+# Linux kernel requires it, so add it on top of the profile's extensions.
+TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 
-TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")}"
+TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${TUNE_RISCV_PKGARCH}"
 
-TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")}"
+TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")} zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${TUNE_RISCV_PKGARCH}"
 
 # Default
-- 
2.55.0


