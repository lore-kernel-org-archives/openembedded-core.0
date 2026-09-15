Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EA4C88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:39:05 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4703.1789499028433812474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=FnSB4uLH;
 spf=pass (domain: baylibre.com, ip: 74.125.230.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6eeso1259406d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499027; x=1790103827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNJ1jImeqNqlFu+Bef2dd6JJpENfJ/wXA78iy5DuVUo=;
        b=FnSB4uLH+c5EuPp1E3kSHMs7ijkyQN5TMUtkvmZmJnmi/zZ+Q/nSCdQ9TABxWSdnO9
         6WvT17jsuIblbzpYzrwU5MX1mdh4juYJJtP8FKtqMjSiwxStnlt/Bdjtrpmkud92SRGB
         QeYmYuqn6h/lKJ2m1M61CFhHyJkmv9sIEQ5zLfzWky94CCxjsPaRJrsDWyR3DgDjT/rf
         d/bVSJcQ0v0O90SmGpha7kNWKZnFQFFHDeURGwHewxIVUHlDqkUVQsEwrxm8TdJOE0pn
         xTA5ygvpxlqxPcqpGCX6CKbfSFY5dYPijLHcZB3sLLxsqbN2ZsMajCF2VNvCI9NqZFRU
         cggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499027; x=1790103827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNJ1jImeqNqlFu+Bef2dd6JJpENfJ/wXA78iy5DuVUo=;
        b=vR0VrU4SKFJkce3tuKXyLE5Zz8CDqCCL1iFFSEGJfCjKxuSTkP4co43gawFP/2jdtw
         SSxf2nop3b2+1cXqJ6OTQBJYP9BsYkz/Zkq7ajiBeec5EgLycTYk4XhW+evQcxW7zX4J
         R/AdcrTx5nELmYkHw52otG9riAZa7SjN4jq42R5m2H7zpNZS99+hjrnVl9ibG4qTUIkq
         p32JgD/Et0yhyd+6KVZSENr0LFYc7eE9fWF4rdD51soZHTolcpBmxEi2lzKhns8Oen5G
         7fnquaw4UDVwhhBoPKnY3GpQhK0QjVyHRtkMYc04q5Fwma0SWMbbbQSGcHy3NZyr5ng3
         xH6w==
X-Gm-Message-State: AFuF++lY9YnKgOlJ0Wuq1YlEm+l559VE3+PLkKGy+RRNB0jMhbZM0YYO
	n452DTrMejnK4heSixoDrWazl7kZOX6qvIXxJvXVr+CezpS3ZLu8u2MS5J/KLUwZXPaYGzaM6Bt
	irByg
X-Gm-Gg: AYBFou3ZolPHy2QapfbZrgPXHoPueiblETLDWLBm/+AUR2kA0/hzAC8VPi5VHMRSTTG
	jHsMJ1dlnFKfRy807C9ExTPKDYqfkVNyo4rG3amvgDrx2UVKkG/I+TjbLqSc/6zFhFjpibC5Uz/
	VY7UJ/eqOB7o0JEDfVthlZoutstoGv49gj3gLZ6uvr37uYbPXRs1D4BpITJsuA/nLjmNQL0Rgk1
	FlkUYdePj4oL4X9ukJSmE/bFqK0ecjd7iW7DdqAnE4wMlCuu0uSmVe5XM3BxT6bwiIy1ukjfDm5
	4AD7j2lticm4GIFbD8HX8kDNDr54h1b/ORDpGX3w0wg/AOwCJCid4+7ITtYqIQDSu2vqouf5udc
	l5nV4iH0QuVQ+wvwo1S1Sn4WEPnesphfMH4v2us27HmqvEFNaECobmxRtD0PHvlsykbMFjwI12H
	qDlXeCjygFpxZUItg858OdgooFKo54ibXk25vkJ82hnM661q91RyMEuDM684NLq6CSB1gd0CAhx
	AYa9fIy4IzR0rq9w+B9bf5ue1GM+B0sYA==
X-Received: by 2002:a05:620a:2a08:b0:939:69a:4764 with SMTP id af79cd13be357-93a29b97135mr1284086185a.39.1789499027336;
        Tue, 15 Sep 2026 12:03:47 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781deec2sm28944685a.7.2026.09.15.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:46 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 11/14] tune-riscv.inc: add rva23u64 to AVAILTUNES
Date: Tue, 15 Sep 2026 15:02:41 -0400
Message-ID: <20260915190244.2983746-12-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245886

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index e8544ba8ce..64d1f89dc6 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,7 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "rva23u64 rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
 
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")}"
 PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
@@ -10,6 +10,9 @@ PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")}"
 PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${TUNE_RISCV_PKGARCH}"
 
+TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")}"
+PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${TUNE_RISCV_PKGARCH}"
+
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
-- 
2.55.0


