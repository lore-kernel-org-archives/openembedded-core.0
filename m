Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0720EC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 14:46:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.10400.1744209966783810411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 07:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cjouv9AN;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54b10956398so1016709e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209965; x=1744814765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7JVlFMc7FvOhU+hstLkqJQ3rNNHVw5es5KX2nXj6mU=;
        b=cjouv9ANULu8vRweabXuaYWBWFdqOo9PDdh+z22WNv62VusfHzN+mtYQJ5jliOEPiL
         0xThVpzP7a4fJENnNSIRX1OZih1Gz7xl6BZMv2gKOwaraEyY7rUuAbBbQiNypt5pka9V
         atYXpzAu+gsjl2ZtkHO+5JDF0c1B9AtR2x9tbsySS9gIuEhNYsQTLakzY3g7wtAOQu6N
         Z8U3DRGDTQdOZHznmlEu3FAqRUGDec4jDIAJlmF7K7lqccRWcsp6URbgHav1Z+c/gK+B
         5TPdJLXixqRifvEFjz8pd1C2+S7bAJWAzNPjceH/4rDye+I08t7E78q0Zl6AHWU7ZTfs
         qwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209965; x=1744814765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7JVlFMc7FvOhU+hstLkqJQ3rNNHVw5es5KX2nXj6mU=;
        b=jX2m3gdPbrE9oZCAqsi7SdecplP0BJNAfSVyVebniFMQfrURDtgYNp2BENDHMndnsY
         kkSAgR3Nno+/cn0zCM0wl6Cn6Tavuya+b02JWJ0pJeAHlrILgNLNuRVuwDPiDO5kdh6q
         HR/Mb1Z1BwEbKtahkVbk2HQgKQIzgfplOpsZwITBeTeCFLyAHkYo0YY2a1SEZk9UJn0I
         PTBEntZ6b6Bz2m29WrKHEJo2LwLWFH+awVDRWCUZLDhrTUT4lmwMbg0OnXoeXkI5KwyM
         z2YjOjzRHU7GcRksyyQGm3bdQh9NXW/nhxcYYfiSMwxMdecoaFvLoPsRvL6yvi3tDnUG
         oGwg==
X-Gm-Message-State: AOJu0YyEBqnE8fzghfrIJkm0k5D2nsW8/9WOuv2Q0EcJB9SgH/uz3HLj
	/ErxyBtODLZKcMHUQJXG5pbWk2fSIU8y2TvYttp0glKsz+C6esu0moyY59wkIGWxpOwvhOtaYsH
	NB48=
X-Gm-Gg: ASbGnctoRyQUFfVClRRyoEF19MzYeosC07k86/OF7qMJSphKY678XOJZOlIW+LUPAit
	iPwMiLqX4qJBO2GqpgY+9Md4eaRNDmEHwnC+hHOb+91Vz0oyM1tkbjDUsHsaBJN283AGBCcXvh6
	T73oCN70Sgx/R1hllHJqMSCnUafqi6BtO9qQqM59V/ZVBmfprEADNCL8yLGQ2CAWoHDJAsI9OHx
	/0m0lP6qyMeLxiMnFsTp+oS+KFm9FOS0i/N2XsFJki7m1j8/SKG1nYS2Enm+zm2MTPJiVgaJVKD
	/yNFxrfOMbwNrX2xaxg4OjQbWoKKqcfGnfmwftbpXhhYTISIbC1sOHDATbYzzZR9GfoJnRQBJdi
	eiapxjPULeT5dqQLadw==
X-Google-Smtp-Source: AGHT+IFqdd/KvwhwXU6Qoh63QeXkulVwnOQ87P+ufViKp0BsdoVzZ9L4ep0cgfy6Z4BhpRFiKQjUCA==
X-Received: by 2002:ac2:5e39:0:b0:549:8b4d:bd47 with SMTP id 2adb3069b0e04-54c3bb90a41mr2305844e87.9.1744209964869;
        Wed, 09 Apr 2025 07:46:04 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cd9c9sm1940971fa.42.2025.04.09.07.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:46:04 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Bill Mills <bill.mills@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4] uki.bbclass: drop serial console from kernel command line
Date: Wed,  9 Apr 2025 17:45:46 +0300
Message-ID: <20250409144546.249367-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 14:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214593

The kernel will continue using console from firmware which is
much better on HW when we may not know at build time which
console HW and drivers are available, e.g. like on
genericarm64 machine.

On AMD KV260, genericarm64 uki boot is currently not working.
Target shows only the EFI stub messages but both kernel
boot messages and agetty prompt are missing:

EFI stub: Booting Linux Kernel...
EFI stub: Loaded initrd from LINUX_EFI_INITRD_MEDIA_GUID device path
EFI stub: Measured initrd data into PCR 9
EFI stub: WARNING: Failed to obtain seed from EFI_RNG_PROTOCOL or EFI variable
EFI stub: Using DTB from configuration table
EFI stub: Exiting boot services...

With this patch applied, both kernel and agetty start
and serial console login is possible.

This change has no impact to qemu machine boot wich
shows kernel boot messages and starts agetty correctly.

This change is also needed on walnascar branch.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v4: improved commit message, no changes to v1

v3: https://lists.openembedded.org/g/openembedded-core/message/214353
    no changes to v1

v2: https://lists.openembedded.org/g/openembedded-core/message/213458
    no changes to v1

v1: https://lists.openembedded.org/g/openembedded-core/message/212834

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index d9a7fb0e6f..fedff222c6 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -81,7 +81,7 @@ UKIFY_CMD ?= "ukify build"
 UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
-UKI_CMDLINE ?= "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
+UKI_CMDLINE ?= "rootwait root=LABEL=root"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
-- 
2.43.0


