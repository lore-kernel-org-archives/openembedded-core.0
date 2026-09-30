Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FC3CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:43:45 +0000 (UTC)
Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18033.1790786319517986563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=pNJxHaEx;
 spf=pass (domain: baylibre.com, ip: 74.125.230.168, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-917a7420703so2549946d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786318; x=1791391118; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvzD/6boeAOu5j6bWn10fuU2yDSGhmz69hLXNLoA1d8=;
        b=pNJxHaExUXWT1k2LbL7rKQ0LH7JrNfnlupaGSVhqzLkOVd24RHFfuXaHdPFFKTNHnw
         CdRU1UDidpyKsT2SrDoyXF5A7cnnGUpOQeSmT/8PPs8QvEY3ZIahbPEzrIYnyy94Tg18
         yOac/PKVrgGYm1f3xL2oE8InK4q5NbGSAC2dNZYdlUDH8J0vfBcRmJBhVwtCIVHHUqd1
         gLwCK95/9Ismz+y6aLM8pTBhO+gd3j/lY63VqhWmAGPsfjguNHfzmPnQsa+JwZbUC+Bi
         0RMAgzgvaHiw2ZMvOn7h4U4jrtR/CbeW9fBjaZMK/mq4w3XN1ufqeczS6iaq+RSNnmQm
         d2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786318; x=1791391118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvzD/6boeAOu5j6bWn10fuU2yDSGhmz69hLXNLoA1d8=;
        b=MmQazmDjaw5VcocJYGHAuta4wliyA8TGUKKyZ1/oTm7G2A2HugcCjZ8tKTOQCHEx72
         iUG9B4Yo6Y31hvSWMwyHVPyBtBr+/9BLx6/OsOTHGS3wPtRY3mdJbFMw0VJzNgOjPgZG
         hvk79cMC9k3E/+GN98PtafyYrV/oX7ZJqnXMIPbNON8MWHstCO1v5pVU4wQNbWfQ22to
         AlqZKc3K65EjYf/RcYOGe64Bjw0yrkRkupnVJwWJxAt2VEVxeH2h8HOWsBIK1Fj6l8Mf
         enb/fqA40l7mS7r1Uj5mago/eji83DNNocn1FRf6MqxAQNuVtUyHwVzNo+s4rbyEDbh5
         RYrQ==
X-Gm-Message-State: AFuF++nMId1lUgGEBfCHKcQWCe2CxLG5gCaG6TyQbuW/QC4FCyxIjf6f
	WYeoBpw1V7L37c0anO2c0c/bJgb56y14A6HcY55QhhsAdHMPzAhcp16AyGeqY5rXoC4=
X-Gm-Gg: AYBFou09QmxSxlJSPYhPGzjZ20Coes2o3ZLIBFz7iu5fnXOzz06hRWjmgJQO39O46qO
	i/pGnAPUwTqYxX6QXsVJs+yE+uoSMAGdV4Sf/QMHeN1NuSxEvBggtZqoaD0myIyVT2R94HWow14
	gI/Y8ewKfOcthjeOfQgKkjZsBVM7ZyTihou5ikp6CUHxFM7aYxvTYTROYM07Z5xQcz8dtMxAG4s
	990NIBxszjHzKgjt4ZHZdp7nVz3zqgDpeVQvt+0jBDME/COjs7yuZ4istryZPkuedI2ej+QAzLy
	6niqTfp612uGzxJ69e8LQeRQd01v6hxpmqIU26+f3wWb4YnxznvmX8qIzUnUT8KeVNhiv7IUTgj
	yMVLGhexprfn4Z0asxkM7XaqUddySu7gNLtef1WZ/Qm2ch+cwNHmdHbKSHqCK8Y8r/mFPZcDkIp
	BQ6REKaOKzBh054kXT9ctWfuMAyiHO8Q/ypjuiBnjsVDczi6eq2RZ3jay8AjVGbD9W5A25oXU0t
	bIohCPoJSolWWn4luzNo+If0XLrZFHIkXQMBC5drJs=
X-Received: by 2002:a05:6214:4607:b0:912:60a4:e759 with SMTP id 6a1803df08f44-917a0bd7310mr36703556d6.20.1790786318494;
        Wed, 30 Sep 2026 09:38:38 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:37 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:20 -0400
Subject: [OE-core][PATCH RFC v2 16/19] tune-riscv.inc: add RISCV_PKGARCH vars, set PACKAGE_EXTRA_ARCHS
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-16-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246996

Add the RISCV_PKGARCH variables to help with indicating which tuning
profiles are valid for use on configurations which are supersets of
them, e.g. 'riscv64gc' packages are valid also for the 'rva20u64'
profile.

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 500808ef12..b31d903172 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -4,23 +4,33 @@ DEFAULTTUNE ?= "riscv64gc"
 
 AVAILTUNES += "rva23u64 rva22u64 rva20u64 riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
 
-# zifencei isn't part of these profiles per gcc's -march expansion, but the
+# Each profile is a superset of the previous one and of riscv64gc (with the same
+# lp64d ABI), so list those as compatible package archs, with lowest priority
+# first. TUNE_RISCV_PKGARCH only expands to the currently selected tune's name.
+RISCV_PKGARCH_GC = "riscv64imafdc_zicsr_zifencei"
+RISCV_PKGARCH_RVA20 = "rva20u64_zifencei"
+RISCV_PKGARCH_RVA22 = "rva22u64_zifencei"
+
+# riscv64gcv is unique in that rva20 and rva22 are not strict supersets of it
+# (they lack the 'v' extension) but rva23 is, so split it out for comprehension.
+RISCV_PKGARCH_GCV = "riscv64imafdcv_zicsr_zifencei"
+
 # Linux kernel requires it, so add it on top of the profile's extensions.
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
-PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
+PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${RISCV_PKGARCH_GC} ${TUNE_RISCV_PKGARCH}"
 
 TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
-PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${TUNE_RISCV_PKGARCH}"
+PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${RISCV_PKGARCH_GC} ${RISCV_PKGARCH_RVA20} ${TUNE_RISCV_PKGARCH}"
 
 TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")} zifencei"
-PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${TUNE_RISCV_PKGARCH}"
+PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${RISCV_PKGARCH_GC} ${RISCV_PKGARCH_GCV} ${RISCV_PKGARCH_RVA20} ${RISCV_PKGARCH_RVA22} ${TUNE_RISCV_PKGARCH}"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
 
 TUNE_FEATURES:tune-riscv64gcv := "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${TUNE_RISCV_PKGARCH}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${RISCV_PKGARCH_GC} ${TUNE_RISCV_PKGARCH}"
 
 TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
 PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"

-- 
2.55.0


