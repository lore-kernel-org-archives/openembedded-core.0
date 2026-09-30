Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B54ECA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:42:24 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18096.1790786304743241765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 09:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=gZD0hHHA;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93c64decd21so144747685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790786304; x=1791391104; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QLWvOlAQIW2RRoxfytmeiMBfhASybU2hiKjiK1vjk70=;
        b=gZD0hHHAdVRtQOV+CKhea7zwi2PuoePV10Atyo22yyPt6cGvzMpRK9O2oZdVQvDniO
         Bupi5vSvTvO6qh8IE0ihW2C9F7r1XkNzigcIrPFKoDQbundmaAWxgMpCwfB+P+h54Pit
         7KOEPS1Wu72ygR/MUbuZQxPnzZ5O4MIOd9DgCRXx21xXuwjRM76naV7EQaS3sa2RwakR
         HaJihxCTk0bTiDWgAbEXEfYqAdOqCKNxABhrRqvP+8SSknOp/bhU6BZ4TSmZap8fnPB6
         /pwz8qGqYK+p0JclFyKtfNMX72pG0xc77zJ0VkciTguYpvrQzMvn1dBtNsOPbeGmbI8a
         0hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790786304; x=1791391104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLWvOlAQIW2RRoxfytmeiMBfhASybU2hiKjiK1vjk70=;
        b=OvS2rhjy5uuc7kx1Am3LLFCouOjtYIwMkCVLhijmDmZBW3Sy639s5xDtUJ5PWh2RPx
         6VipNm1NIIQSAz7S731VMSfesymwCLMwn4Z026puVd74T08b8u756Z1El7XAw1zXFDAy
         d3vZC3qWpS442/XbdiLuehcD7BJIWoX0JSmM8OiD0ttqqKEhmXLYymtBYVBz1HL+6r07
         3NyOmWo0/g8jEPt9TaVGwir50Iv49QYYF5l3DP8hlXVhooWtq/mreIRDyMkPBPPupaym
         s6M1XyCNU+zAmb/CH1P1sG6H/xe458yajxkM7lQ09z1TURdVnno/CgLzKCszsfWJjMO6
         ykyw==
X-Gm-Message-State: AFuF++nDVxE4HXOmwDawmJnl4Nfs6h/S8sbZtqdM/rrVyJnSFoDcQ/Ag
	cpekNWornvtRIDrAfW1JokxDz9SVdIydYgpV8utAvtsXlbSHrA3ottEMtUfyDRdvlj8VkcKmx+h
	dl2eR
X-Gm-Gg: AYBFou2FPUUgJh2N4B1zjsJlGnEmm6r3O5cnt3KViCXnu+RAoh0wXv5KVNvhufres3K
	kJhA4CcX/zSIMgsIHEIXhdAV6CyiYzRcLxtTxCst8BxJb0jM9UzXNsNjR72MCHN5QonV2fUpYgH
	YmW+p+XUm5w3VhemLyPVMCN20DHJ3578LsKMxghqLh7jbmAThdrhN5i9V+oVo/2Qne+YuLBmAdf
	V3JqEtW5BfAzi405w2cWzK006M/0FF4P8TCEBGqwsaW17/QSGhaTeR1EN/bwbHO5K0qy1isGG1C
	3K5XsGl/6BoQRJwZlbR3KDydO7QCBCt5W1Mex1JnJ5aBTko8atfcbPMc1+VPV0abqL5zSIp5WId
	G5NomRDmIsX+1FbOD6Bj8exd/pPWjbalK8GQ2dLNV4EFAOI8DK9ylERVt9RvbeSdgu/Wm9p1Mzd
	Y2uozeiQwTaZjXlI/oBJi+LDEUrGm2vLT01GiBxx71i8IDt8Ag+RX2/tLIHLWOOJxH6tX92aAFm
	hYSHwL3rgxyQ8GDOWGUCE8OAJuZ1HMhhUiQ9QOinxA=
X-Received: by 2002:a05:620a:3187:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93cb5c7ab21mr31213585a.35.1790786303621;
        Wed, 30 Sep 2026 09:38:23 -0700 (PDT)
Received: from [192.168.40.142] ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a89edf7fsm3519516d6.21.2026.09.30.09.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:38:22 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
Date: Wed, 30 Sep 2026 12:38:09 -0400
Subject: [OE-core][PATCH RFC v2 05/19] tune-riscv.inc: add rva20u64 to AVAILTUNES
MIME-Version: 1.0
Message-Id: <20260930-riscv-tuning-rework-v2-5-9e29f3531d0e@baylibre.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246985

riscv64gc remains the default for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index ed71dc06ba..80c17ea0b7 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,12 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "rva20u64 riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+
+# zifencei isn't part of these profiles per gcc's -march expansion, but the
+# Linux kernel requires it, so add it on top of the profile's extensions.
+TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
+PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${TUNE_RISCV_PKGARCH}"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"

-- 
2.55.0


