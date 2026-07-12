Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFBEC43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:25 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.884.1783881804693884143
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=ZMPhiGTN;
 spf=pass (domain: underview.tech, ip: 209.85.128.173, mailfrom: vince@underview.tech)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81ea0b7d137so5016787b3.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881804; x=1784486604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUNYA/hFmr53NcH0LlWOULNRRXKWmYCC1OPxJM2/ppw=;
        b=ZMPhiGTNc29cCycKm/Ru2mcbnnUtTXGaJigi+D95M8CXaAIDGLARKtP3QGqzwtpphZ
         HLz1ESMQBvdM0jpeiVmaWHZ2qqLXPLWzewkY3gRUB6dBr55u0PB+3zc5TbGxnqGwVcv5
         pil4qcmTVriz0i08zx287RzNiEU7yWxZ+25geZE1gKM/CW8RJy9tFBTvePukORmlLjaa
         EDJ8fHTk2Y2Nz+rsz//1PiCamC2xC2rx1WUYMWExZd2lzhJe93enejKeabpcDvX6K4Cr
         MpCmKh0690c295JHZpESSlkd8q7UY4uUMeFGN1aqv42CBzTnqdymGY33V/cfHYIVH3Ci
         Einw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881804; x=1784486604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUNYA/hFmr53NcH0LlWOULNRRXKWmYCC1OPxJM2/ppw=;
        b=WGTkZQwrrVMUf9vJgHr8w0MNvwLsH1polAoS9mc3T+3funtxfzQ3a1oRN9cOFwau0n
         UnD2apgJzLEXDwAdyRKZ7QqoOy6FCSvjRXLRDpX1km9IE7kv5DWrYT470e1TNI2rneLW
         amgGvEqVb60I+XPYi8dIuNMHjTlnUpvzovn5aBkv+cLxF0So07H4fmyGPY8zaphvMAMA
         +igqJjAaGXmgh+VK9BHs167s5IqPYcbHRiIMrSWc3uuUMAkwoZX9r+1Hrqk0rKytAfGB
         27vF0IBb0LvyTLOU2kfVasPHAEu49KnaPEvv2fFYUG2kBufAwbSMaNeSNlBpJTfPNlY0
         Grbg==
X-Gm-Message-State: AOJu0YyQsXsVCjfqC0rDP440gl9w0HVSMuTDU75yYHBtpbMax2qgXNtK
	i9rgpNbDjdBkXFAS2TQEw0/bhNrv6WuQPyx5C2jD01qYzLcSsDjgpJEPiQj6x2ciJSblEA5O1ib
	t18n/d8g=
X-Gm-Gg: AfdE7ckx04dXRdsAz65slcyccm/NhVwyIr02lI7SCuoayFuAvZWO/VClO/2nuQBPxmm
	2B9BL/PZFr95gMsIxk0/pX3tmsw5BhIMERF9zbMsxsePiO8ubQs8OLFYOcSoFNJZUQSYpPzNUuq
	2WapJ5fFTdBKgzWzwwgdyg9cUFfypP0xPHACreahMlMKlPwcUbBJfCjEj+zd+On4IlKIDAGkRga
	D0ihbvJNDzmLm/pU8kfHBeDMtNHLXHEjYlag8q2C5FTpJkHC2ZMmsS0M1DceFgscE9MS97RiSPd
	S5RH26YvsijFooot86WtaR//O9Cq0mspvcjVpHMC4k2tgyVsR6EXkROO4O/27D8sneSvpQEyBhO
	1ppIR9USvIF0IIZe1zLhKhTHqJlyaxBD+j6Bhf0kroaKffn3R3krwSmWu53ejFMO/cyUfxjF92h
	Naq5MzIf3inzzCTw==
X-Received: by 2002:a05:690e:4181:b0:665:3dac:c3a7 with SMTP id 956f58d0204a3-667d7b8929amr4300995d50.61.1783881803690;
        Sun, 12 Jul 2026 11:43:23 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:23 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 07/27] packagegroup-core-boot: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:47 -0400
Message-ID: <20260712184307.3259642-7-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240797

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 5cdd161811..96c07aff52 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} = "\
     ${VIRTUAL-RUNTIME_base-utils} \
     ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
-    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} kernel", "", d)} \
+    ${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER} ${KERNEL_PACKAGE_NAME}", "", d)} \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
-- 
2.43.0


