Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9819EC5B549
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:36:20 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.24705.1748248574385601659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 01:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jHUD032s;
 spf=pass (domain: linaro.org, ip: 209.85.208.182, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32918fe5334so20019281fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248572; x=1748853372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKqPhQkfjn6Clyy+kuTiPpKSNq3EXwgtEWm3XWqIWKg=;
        b=jHUD032sbRgqUnhlLZcGX5UTEJbkvRBBE/YPaLIj6vhstWAQ/iI9UJPMqIkQUvu+4R
         uedzRMyg7CiPC5TgPgnz2u1MKUAjPsyTnVM/1kQl1GEV0v9g8Vjd8TRHx62zbDQpe+hJ
         1/c4ITlnpOP4mOHZh+VfFoQvZYI5lI1fo09plkGed3vHo4UEws0wDrD0q1y9Qok+yxJD
         cHbLaFN16HoYk4os8ZK1yXmVnK3424JdAg+lSmSMW4sU94ngcHwvjeEmAH+MiCJ99RJa
         CKRSks/sTjd33wyp+dMnHZW/bNx/NuK59LGqA8UlIeElniSqsQXK4/tYvVspRcaA+g05
         3ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248572; x=1748853372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKqPhQkfjn6Clyy+kuTiPpKSNq3EXwgtEWm3XWqIWKg=;
        b=aU7sF2oEWXaLLBaWoTFrbZDuDNvRJRYBqPD0zndt6tSB1AKMVVoMWbsOS4QpVaEjhP
         K3JnKrTRLB4+zPS3luJ0ld96b/oxQ9USRJD9Vks0eI3ictA6LlyjmU2bBjS0sIFFgEf/
         MkjQiAK/Ir5ntWfRsHSRSPqDSpJ/blFStG5wQyZQMYJQyxtLmp3/OJW5bXCTEBK6NmwW
         94nAuqYpgYMMHLxa2W2xmLXJeaDl3+KRwN3Vte69T0oAHdS6l0GXXZ9buR1J9g33SCyc
         ok82Q/MDHcEipkRlmLJj9f5RV8JyRplhKmyBQSWwf0xqlZdLHqsOxb1H77t1cqIP36Td
         C5Pg==
X-Gm-Message-State: AOJu0YyFn0HON8vkewMjtW8lMx+QVoqaig2vzS2z5ZFUHZf85Qa1inQc
	KI7W4uctxzx+UpiHBJG4ZLPlY6iBsvN8BNA+FycKUHoXpjwLCqdmsrrgmIo+2S6RRscLsQ7zPEZ
	QbFIrGGI=
X-Gm-Gg: ASbGncuYduvm7nCWRW/PLajaCXZ1FwONCW5JzQPi4gC8RCbj5CxteIaaDv5cUgzbStn
	CgTVPRjDAYc0weYBurqKDEO1yG8dofYeIe566j39bEUUTRpxEDgRz1c62mC0DoYwio3Z+Vqb1p9
	tZWwAo0lKafPVrZsdcdVLY1jDV8y8RZQEvDMvzli2Ex6u9B1qpZImwnh0S5Cn+fJf0Cu/3GSbaZ
	gXO5/+rngajeUsFJwQW2O91E49jmLrYHoGFjSRzutC3K60y6iL5WvzookysokUTk56tLnV4Qyy2
	MwCDC1nunuYKgn09BfJ1j/paK9mmMfDcFlh7YdeIHV5kCm9joEBM5TgBw+AdqFOu50ENbbJfZvB
	kL4ZZKJV+WR71npY/B28tidhWOJSw
X-Google-Smtp-Source: AGHT+IHcqotkM0iOGj/PvbZwONSJgi0f9BdQOaloiTIkd0P4pjUNyNICideUOL2AVZjiQtDw0BPPow==
X-Received: by 2002:a05:651c:1463:b0:30b:b987:b6a7 with SMTP id 38308e7fff4ca-3295b6da9f4mr23502691fa.0.1748248572485;
        Mon, 26 May 2025 01:36:12 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6502c667sm1271651fa.101.2025.05.26.01.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:36:12 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 2/4] qemuarm64.conf: allow overriding QB_OPT_APPEND
Date: Mon, 26 May 2025 11:35:45 +0300
Message-ID: <20250526083548.413834-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526083548.413834-1-mikko.rapeli@linaro.org>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 08:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217258

It enables qemu USB support which causes a reset
loop currently with u-boot.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/conf/machine/qemuarm64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index d310445a34..f086729641 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -20,7 +20,7 @@ QB_SMP ?= "-smp 4"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device virtio-gpu-pci"
-QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
+QB_OPT_APPEND ?= "-device qemu-xhci -device usb-tablet -device usb-kbd"
 # Virtio Networking support
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
-- 
2.43.0


