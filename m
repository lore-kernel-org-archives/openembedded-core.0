Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CB4C982C1
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:37:55 +0000 (UTC)
Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4477.1789498975297422212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=K5+T8DEp;
 spf=pass (domain: baylibre.com, ip: 74.125.224.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939f1so945627b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789498974; x=1790103774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WTtizYCKEnhYNmqGYdWVdqjODIfhRbf7UHhFiovGNrw=;
        b=K5+T8DEpiedIFYRLKO6jpYVKcQxNJAXLGA2tasp6pGVxQH7uqsrIbjlu/1MRkI2Htr
         xTiC5INDyQ2RfPDsTHsCygdxpAx3wbxroJEb+Hu16kMdQ1AzZnxVG5rJljYz/FQlww7w
         K1nkZamCJGAFw4EPBCoCY5FOCcguJHyBKzK033gN6pB6IwF4PjNa3mybydnHG6iH8gml
         KjCfAIVJ8kk1xdIW6paeMwFhPimLOv23l0SuHJ21RLD/RfOJKThI7K6j8Vr6QjQBHE6h
         G4wjX7NU2N17dl91TJbTQuYnUDqARF8QsMONgjkutpGh+TO/MJF/2b9rYpFK8BG8MRJk
         ZWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498974; x=1790103774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WTtizYCKEnhYNmqGYdWVdqjODIfhRbf7UHhFiovGNrw=;
        b=oOa7QGiMjLxgvIOOCnvK7yfrzj5j+u4PzczUCj6rO8efEP38vN3XgxmkVd4Al0ipOz
         9Ye3Tx29cldQTjbJpcGcshAP0GcOxplfiy/t3J8T0pH0QPGyhQSzn29F5ZCWo44Yqnb6
         75z9S1y65J+U5y839IBVCCV30yQi1o6cmEDnlzF32scYAKhVHFnudkEXJzvXUuFD/0Lm
         iVp8w6vkfpgsN8X0BqOHB1/zut5FMluZXOtYd8hEFcnWS2EUzCx7bRyXkCe5nd+nagPd
         lcX+55QrjCIYDRORCduFNnKvFLNZbHlUDe8BgQzcO0MhGFYEeXO1MBcLEZD0/341Mcs/
         tr5w==
X-Gm-Message-State: AFuF++nIhwGkH1DCCa5GfWsM6dmREfWh7d/UDoXToUwWxSlM0Sc+bQrl
	VBdXoBQZhtOniXSrOPNe4bRj+R0afAZPPyohckFk0dO/Z3q1JTW+UvNl3yF74ZEr69e3W6kWPbh
	ZaADH
X-Gm-Gg: AYBFou120o0nhkWwRVr5oQABWUVSrMcRT/udzuNcAwjFDr2a5f9gM6U9izorzYhx/87
	oZPF+oOUM/3eIWzPXc9OkIMEPdOAXk5IkBtbShk7NuWea72MgrwrnpNV0tBo0+4z6zOCrqwZBPH
	FqpqWUrcBTjiWZYsd2Xauu2DT3jMXsIN8UITkgXmaBevWkLa7gmvtX3OCbCnR1IX4DtxVWX0BQM
	ds5QvuOrEIV5lMyHRU6ux56cqeMe17XUMEaqDPEY8zbSTSPy5hv2l+tZAg0ossC92Pmzb1EpFJ7
	5WL+a/11UecxGQYHgt54PCXrXB/fqfwWEMm+wQKMSfyrceszvnb00s+VmIh/L/iYtdQNE8tTqIJ
	9CD5igkSjDrNT0AzC9JlTq2ATpPraGEHQ0k3UVx+gFfOsFx9sRVuxRjKVJ2EnxteJWC6d74Qhyg
	S2BXIqxIvMXm9iXbd59hRhEv2malTF1uPceKXSuxCFU+9+wiwe1NHTtPEJ4ts5YE8ovFkkssLmm
	Ga9voHwgG7Znr+H/grzN5NkmC//9n4mk7eHxQm9doOK
X-Received: by 2002:a05:690c:ec4:b0:873:5bb2:6bfa with SMTP id 00721157ae682-890f1530e26mr8532477b3.36.1789498974199;
        Tue, 15 Sep 2026 12:02:54 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d27515sm25348485a.47.2026.09.15.12.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:02:53 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 01/14] tune-riscv: be explicit about riscv64gc default
Date: Tue, 15 Sep 2026 15:02:31 -0400
Message-ID: <20260915190244.2983746-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245876

The string 'riscv64' is a generic descriptor for the 64-bit RISC-V ISA,
and can mean different things under different contexts. In the case of
tune-riscv.inc, it has served as an alias for the 'riscv64gc' profile
which packages are typically built against, resulting in the following
output (from a typical bitbake preamble):

|TUNE_FEATURES        = "rv 64 i m a f d c zicsr zifencei"

Modify tune-riscv.inc to avoid overloading the 'riscv64' string in this
way, instead setting DEFAULTTUNE to 'riscv64gc', and changing other
occurrences to match. TUNE_FEATURES remains the same under this
adjustment, but the .inc file is clearer which profile is being
targeted.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 12c1125c8b..f55c122fe3 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -1,15 +1,15 @@
 require conf/machine/include/riscv/arch-riscv.inc
 
-DEFAULTTUNE ?= "riscv64"
+DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "riscv64gc riscv32gc riscv64nc riscv64nf riscv32nf"
 
 # Default
-TUNE_FEATURES:tune-riscv64 := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64 = "${TUNE_RISCV_PKGARCH}"
+TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
 
 TUNE_FEATURES:tune-riscv32 := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv32 = "${TUNE_RISCV_PKGARCH}"
+PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
 
 # No float
 TUNE_FEATURES:tune-riscv64nf := "${@oe.tune.riscv_isa_to_tune("rv64imac_zicsr_zifencei")}"
-- 
2.55.0


