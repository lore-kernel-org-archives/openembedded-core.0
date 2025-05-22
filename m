Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E804EC54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 13:41:49 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.24222.1747921303041044812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 06:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MIbLJ9S5;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54298ec925bso12506664e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747921301; x=1748526101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKqPhQkfjn6Clyy+kuTiPpKSNq3EXwgtEWm3XWqIWKg=;
        b=MIbLJ9S51tIQCTYPDjb8Bof2AJthwsqnhVB7m8gPKUIXMxEZmY5WB825KAMKqSO7V/
         aG2QnU9eNIO75PWZw2AUBfBX1VKblysT1y/FlWIXgn+NhKEABumqgGDxXmybI63i2xrq
         eAqpIKM80FPFzBBEwTgyK0rP/1J4lFKBrp+3KnvE5j6l0rniCldWXxaoC55vNdc/OiJK
         mO25JroT3WHsThgj2I62H402vX8Sad5q7KD8lDOkhVz2PdujUMJVVKvoYogJcEoM0qrs
         +Wb81+94vc+3Zo871q/MHjUS0m/lbDKsOibIyhPIbe+BM6Ry8c+kAYGQcA9FcxHdCtLT
         C11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921301; x=1748526101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKqPhQkfjn6Clyy+kuTiPpKSNq3EXwgtEWm3XWqIWKg=;
        b=GyRVA+dSR7yCk+dDbuCh4JGfTjvWrFnII6Re7M/gY38m5v03bePSljGMCUg+36lrIa
         woRc8KgEfWK5VoVBlBsx59kz2jZPAgAteD2+/VNrkOB6ZT8EDYHsocAyFtEm7t5W4JVr
         mVs0YvADG6QskDmC15bJsIXDzMxKhDUMKXp/BneWRtoWbBXhHz35kq8+2BFkLFljsJ/V
         cs9OjbAkGWjYVx3ZMA/kJN9ChDdbRthvIuPLZIWBcPszWf41tvXFHFky6agYycthU7fC
         2shgzr5wpO7laO8ASyIxhJK+lgw6MvrTgX2Kg2aK+G7fWHn9Rq+4IcZxvoUdF5ACNOS0
         CA8g==
X-Gm-Message-State: AOJu0YzD9mQVgvcKCfwzH3g+TbwgJtGpqzcqUdWiHnrZxzqfzaU0Q22N
	Vs85SDjVext5Ra9TwnWKE3B/4dy7eoIF4qH9vZCh6ysTktN+XcNmMKh6oLIGpsGHyvtP9fRVbjP
	XjnXT1u1alaql
X-Gm-Gg: ASbGnctBzvdtYeFHLBUxP9KsdubBCiVGnPnnqqekfl6P90rXFSvZkjvef0D4k/eBZX1
	NOHIOZkShby3h3eQtZpVZdoLm3FEgChi3HFOTatdDiGtXvIxNTyiM9U/70OsYs3Dnw6AAtKiZ+a
	fbyJgS7vjLidBQLTr1Iv7mnJ3mHOXDzmpd3YKWVJTfGiCeJ7LLWo8rVEAAVS99UpcxOQ50LMF7N
	xu2qPE1bx/3hZfunq2pVdwx/YR1oRC/H4g3LBoeSTgYI3duCVL8DVkRhtFcrbFOBdUiV3H98qMf
	FdGq80MLKVat74alOASdiGdhKyPxBb0GH25oVRKtETxcj8LOwsXeO6sn2vVy0KtbGotlfkHzla1
	0ak/312PCI3O7B2k0/vavBa1v/J8y
X-Google-Smtp-Source: AGHT+IFnsH7S9JkCbRueLhT99Kow9lnHfHqtos9qCiaCcQj/JH6jwAqP0iQwmyzgwGjDRkwyAraTYQ==
X-Received: by 2002:a05:6512:159f:b0:545:285f:cd7f with SMTP id 2adb3069b0e04-550e71afb8fmr8835836e87.14.1747921301070;
        Thu, 22 May 2025 06:41:41 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15f8fsm3410312e87.37.2025.05.22.06.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:41:40 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] qemuarm64.conf: allow overriding QB_OPT_APPEND
Date: Thu, 22 May 2025 16:41:15 +0300
Message-ID: <20250522134116.254270-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522134116.254270-1-mikko.rapeli@linaro.org>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 13:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217106

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


