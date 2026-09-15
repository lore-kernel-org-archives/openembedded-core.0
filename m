Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D40C88E77
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:38:15 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4493.1789499012169079155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 12:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=jb3iY0yB;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93a0fb2f9efso89298785a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 12:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789499011; x=1790103811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPYFJ6ICUdpVDI59NdkP71V+lNPtjusuWG2CipWYBo0=;
        b=jb3iY0yBbW1L0P15i/k14euex+sZ/wuiEjBNYIgdVlS0h4QHsQP7dc9tLSg3IC6y+Y
         K4tCN042hczbbBBiWqEGUvnE+OYDwXCiT6YG4HAzca5cMsy6jdfwvuc1pHej6J3BlCH/
         b4AYaz4BjzxyHFyRRs2yjiKn6nQF/5fMGDwnsdqUI46d4aAFnx1dH6441VDiWovjoxsd
         xzrorLlVNnd2QmHZcOuueh0rcEn6wMByQl+Zg1Cw6V2R6JK+yvkK1hu5K73/sZeYwv8C
         eGW8EMlS14oOCBhQOViJW3lr0F+hBaIaenEcUu4hO0jD2VpgkP/AMk0qp7eC58w3+L/H
         Z9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499011; x=1790103811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fPYFJ6ICUdpVDI59NdkP71V+lNPtjusuWG2CipWYBo0=;
        b=lBuhkitlMlkiLVUNAIz3B5t+Kcy6wX+biO7FsXuNmfqjaRYD0td7W7hCuKWVXsiH6B
         fCXc6uWHyGNTgf2hia35mzRt9qZSz8CGdYWZWabta1vm2uQHz3GpTaEcSJEmQNGVZIz7
         oUo5f0qntezM59rP9ltI8aoltbmKg2joxxMqfXH3c+3yfdH6YjrQygrstTZ2DWNhgZZl
         iQfg2+Sw6M5oiDAzBTXBpo9tnSRBDKz7P0CQSfMHa8ZXV/PE92oohCenPiDHcbaNmxDW
         +uH8QUkpn+EbAj1EI4Pp2cphhMknYlEfue6RbKKsZYzqrdtin1g8enGBezDmyPzZ0Or+
         Prwg==
X-Gm-Message-State: AFuF++n4ZkJ6lgy5S2IiSmo+9HBabt64RVLqF37keRtu7+CnIw9CGswy
	cn5cBai7TKn+J/gqDeHCn/IQjSE0JAYNOS41tOxH5b6jXiTo+/DJKJOWVp9TiSOye6ZNKKqlbpN
	uCJL9
X-Gm-Gg: AYBFou0t5CIWDPsOLjg4GSIYL815dLVD9His2wHw5e1GtYuLSTPehu//RaP2dLtc78S
	inKVZshdx/A4Z01GqUGehp+BAyHL15MVuJOwVkWZbdSIr2NYffIA4yw9yWbBsUS91BtRe/3v952
	iFfFCkHuHQA3y6sYomSTyl/46fr+s62Ate0rhBTPgAzZv1lL53oXZR1OFgdX4+5AW42toVAQxR1
	o8D8D2QRFZUgJYUbxEValAxngTrkddg7g50QhijMwxpP5N+PwMC1Zcm7djf0Kq9xtCG3xOocmF8
	4RDMD8uuajHQ284GBK79rFa0CUP7MAr5zsUHS5DjcRvjge/1E4ren7bTJr5Vg5wuO9MeE2yIgeK
	c1XDEzOrlFiUS7LwR25MyvXiIklV3f5Zx1HhHFEIdVXdDUw7tV4qfAqUFwwk90tQlc/XgzQTeKf
	3PwvPU2LxVnjGlAjM4uZO1Q96WK2nKhEtSR9iBAYR4f9yrDceb1FIqpU/onkio4owu7DIZ8HHMn
	THsLuzJAderlBYVejbN0CzpXLiOqmQlhA==
X-Received: by 2002:a05:620a:4110:b0:939:72cb:bae9 with SMTP id af79cd13be357-93a34723680mr695610385a.32.1789499010924;
        Tue, 15 Sep 2026 12:03:30 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b7825553bsm26431385a.30.2026.09.15.12.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:03:30 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org
Subject: [OE-core][RFC PATCH 04/14] meta/lib/oe/tune.py: support profile strings, add rva20u64
Date: Tue, 15 Sep 2026 15:02:34 -0400
Message-ID: <20260915190244.2983746-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915190244.2983746-1-tgamblin@baylibre.com>
References: <20260915190244.2983746-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 19:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245879

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oe/tune.py | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 7fda19430d..fed593e9af 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -4,16 +4,25 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+# RISC-V profile name -> equivalent ISA string. These are determined from compiler output, like:
+# tgamblin@alchemist ~ $ riscv64-linux-gnu-gcc -march=rva20u64 -mabi=lp64d -Q --help=target | grep rv64
+#   -march=rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd
+RISCV_PROFILES = {
+    'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
+}
+
 # riscv_isa_to_tune(isa)
 #
 # Automatically translate a RISC-V ISA string to TUNE_FEATURES
 #
 # Abbreviations, such as rv32g -> rv32imaffd_zicsr_zifencei are supported.
 #
-# Profiles, such as rva22u64, are NOT supported, you must use ISA strings.
+# Profiles are supported for the names listed in RISCV_PROFILES. Otherwise, you
+# must use ISA strings.
 #
 def riscv_isa_to_tune(isa):
     _isa = isa.lower()
+    _isa = RISCV_PROFILES.get(_isa, _isa)
 
     feature = []
     iter = 0
-- 
2.55.0


