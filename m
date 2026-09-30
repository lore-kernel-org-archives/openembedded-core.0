Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A074CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:35 +0000 (UTC)
Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18027.1790786308323508109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=IDUsJOUu;
 spf=pass (domain: baylibre.com, ip: 74.125.230.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-917912f0b95so15414906d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786307; x=1791391107; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awe6JoVbsijdkRJBRVDQTKOpL4B8JWL+754HTHcMMcI=;
        b=IDUsJOUucHFARNAt8EJ6mPZpVsn4fUflI7gc9rgra+xbaQnRuKV1/rCsSN6xXgsfzj
         nYggv1X2kMDP1yRTqlrRHrXDq/shq6FPIcjRq4fwytoUg/KLdA6aPi5s7o8MSHMRQvFN
         jMKhePtztB5kWgYtMYyK2rZDnqR+pNuun8Xn9pkfAgzO54Y+ad2+rO8IMeUsYh4SpJRb
         zvB0Z6q2ekTuDZQhZoB5yhT+qGXXgPfzFXmLBgB4u9oM7Iru8TzmNJfNNkNY5P9FshKG
         RYw+Lgv4mMQFDbY9DjoseendDbpCfYy3V+2Sou0NuW/crUd6P1MG5sLc/R9L9q03ee0c
         cglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786307; x=1791391107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awe6JoVbsijdkRJBRVDQTKOpL4B8JWL+754HTHcMMcI=;
        b=WhNeoCVyioLEuRDaEJMJJjkW9NeO+Lh6zYL7JNRAS2WCz8sW7g1wQ9FYbt1930gene
         awe2VPYTd1ePOcRJDFB619dpyXK8mu+0PMae9/DHl1DPu+m6oUnkN447K+/4s4HeoPwd
         zq5hn5QkIE13m3uVdr+jnEBe/Fhd86T2qE/bisP1Tz0o9TJFDgJP29K4RZepY25ao2Wb
         nqJy8w/p2Kyr1RXh+2e0GYEBVyRsC68wxx0Pjy2B6DRuV9oBm5++INh0BLD9CLoxRs1a
         tBGyUAzvXi7oaI5tcvFk5PZwZ4CfxhvOK7qP26CMXJavOrosObPWphPjQKXmWgKfYesW
         pIwg==
X-Gm-Message-State: AFuF++k89lNXK3Eo1WPWjp1cn6XKN/TZ4+iWVgrQmp9aSdppMfL4CE+p
	CbZRXgMfZv1XTCz/jAIONqXBVAA4ayqLSTGt/Sq3COuK9zODbVsLUzBq7GC4Si5WI6stSUxbRRg
	myk+p
X-Gm-Gg: AYBFou0srQgg66FM5e/brKAnI1VlCO5GxvNtHuu8spNA+aA9NoOamS1zbWqiwnfXTly
	nHDEQizj3KethX7leMbsddTYIEVOnY99AZY1rz8+JX8SsCEx/VPKgkKRtRC60TrZfvnAidLNkCb
	z4bOT1vIbnLWlC520+kc4n+Q/VcpsK+FgR9fiwibj+KO8D+JnVakSCXY1rgjQhk+VvIjVQpU/Xi
	CXYcB3N2kkgD61X7t7nwq4C0nt3puX8aa1W74gmOKVsjdg5Hq7Sz19+XCn8Nu1RTu/b9ADLo9Nf
	l4KWRuWhtjREidWJPJvlSXVYsi5MV6BjeyekLIkk9uHr7IpZufT57O1C53pi+i8Vp3f8z2Ok1T1
	74tXt+UDl5tjfPQ20Z1L6FG4HfX1gAQm0KhM+z80sx7Y0fjbud05sQelTpDsEt+qLhZ38Ose79F
	9D/QGxHE/l1gZMTvdtTc8dVn0rG/qlA6SaVKGcLIkYGMKKLtD1eFkjr54PPUN8uOSpBvfLpefh6
	ekNzPKXUfBQHJJTuvvURtQvqtoy3I1lcHC/gUa1U24=
X-Received: by 2002:ad4:5cc1:0:b0:910:3453:8f28 with SMTP id 6a1803df08f44-917a0ec3091mr32441306d6.36.1790786307254;
        Wed, 30 Sep 2026 09:38:27 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:26 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:12 -0400
Subject: [OE-core][PATCH RFC v2 08/19] tune-riscv.inc: add rva22u64 to AVAILTUNES
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-8-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246988

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 80c17ea0b7..e3f3897978 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,13 +2,16 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "rva20u64 riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
 # zifencei isn't part of these profiles per gcc's -march expansion, but the
 # Linux kernel requires it, so add it on top of the profile's extensions.
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
+PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${TUNE_RISCV_PKGARCH}"
+
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"

-- 
2.55.0


