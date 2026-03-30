Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30AAFB3D03
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:35:29 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47913.1774866923790069067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KnY5VqnQ;
 spf=pass (domain: linaro.org, ip: 209.85.215.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c742723c863so2795406a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 03:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774866923; x=1775471723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/cvIhn9mdyrnb4cYjmATxqF+u8fMvIWquuGy7zS2Xw=;
        b=KnY5VqnQ5sLeSJMkj3/l6CIZeBGPsmEt9/duZOJlmVj3JXnEZWUQ1ZvIDOWAGdlxiw
         U7wcvG5d7JueFSmzlzBdjKH1KqToeVuj/iqM9IHLbhuL/facF3vGGOaZ4hgrZxLrFPIM
         iIGGlqdNl+t0ThzxTUvlmlScHtjULoDgz9z2y8kabcgKO/OI9svvDUHojoprEIxksU2o
         8CyeL2lAew1mMF0Vd+mxbtxxbcL4Tk08ldb5EQAG4ifmnF5+qt4J4Ar3/vwX37qnN8Lz
         5PXH0yV96ezd/7r/vbIFk6yRi2u4R1pLmx4SnpxYiq+fmw6qPhOlL78AsflJt5GIae3U
         mK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774866923; x=1775471723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/cvIhn9mdyrnb4cYjmATxqF+u8fMvIWquuGy7zS2Xw=;
        b=mTYsmBihdwuZjHtlk9vZi/u78Ciwzu5o7Dmh40O7qsVfk8qBjRgDhGG9hIlKRy0mc0
         Xh5IJ9gp8q1S1JSa6oi9LwqCqUjh2MtJbm77nVx1Y4zsEeEOL9gX8SSRPc251wVOK45E
         32Hv370WoqQvze29f90IdM7QkRXxWt6VunTwNWlbMD9ghamEUHkx54ydCnE9tyIgmVpA
         2p4+ccuzW8UMt5UE/528vt7NUwneUrcjF5LlQpzAnLEVMNeJAhqqYT8DjK6uHFO8mjmS
         QqmxUSMKmGZQeSBlFccSx1Hf/PN3SyV3yW5ATP++tgi6CPOIFuLyH/9CNnzSi7qsa8uA
         5fDQ==
X-Gm-Message-State: AOJu0YwFWQfjXCrM7+dVSlMs0RWfPckdfD4iZ3BY8DhXAQLTe7+N2bQf
	c0VWxG79aV6Hzt36fJt22ya/ZCqWXiw7Qrs6AzSOPdTxWnl+DzCBlQcsg+F1oSyQt5Bi5tw9GAD
	tB39w
X-Gm-Gg: ATEYQzx2uORhnV/SMItDxFUdVpBR0wel4ETbFdy4UA6aNVLLuVhFgXfLV6ybKdzBd/K
	COBkZIjLSNwdZ8kF6TbSzZrMMPFJ7U2v+LcZnoRdF4QIc8Pp1hRqel6bunN9ZtCL5ulBeQUamuf
	9BafrCdYZFQ+/seDRtkEysa4aEYO9Ola6cP/TAOgi9eRz4hFF3erTqQx4DrZ/2CVDlpJctSQ7dr
	mG7guAuLeHkxJN9DwzgrMeP/bVUoLc7gN2fdedxitq4aKIQopEbeyjtd55QCEwa0/Jx1px0K3om
	D2KZHkk7EZBpv6EZdyAA1FN4CInaUBUsa52vDI/mG7xHzLAlSYcsu+s6AQ4M6kJDUrMB/SvUgCr
	fNAH9SiGoo5JAbXdvKCaAj1C9o6y+2GgI0ohm5Fun8p25Hl8VVn2uGSTR+0mEhDVCQFijNWoloY
	4OPPBVnq01pYI13QXEWV4f9XrJfGaTzmivfYrljE2wSwLMtUxWpeOdLwC7iqhY91tyleICVr2x
X-Received: by 2002:a05:6a20:729e:b0:398:89b6:1b41 with SMTP id adf61e73a8af0-39c87ac322fmr13472853637.32.1774866922873;
        Mon, 30 Mar 2026 03:35:22 -0700 (PDT)
Received: from nuoska.taservs.net (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76916baa53sm6085621a12.5.2026.03.30.03.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:35:22 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Jon Mason <jon.mason@arm.com>
Subject: [PATCH v2] uki.bbclass: fix UKI_DEVICETREE usage
Date: Mon, 30 Mar 2026 13:35:02 +0300
Message-ID: <20260330103502.168286-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 10:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234224

Set KERNEL_DEVICETREE to empty string with weakest assignment
if machine does not set this. This changes UKI_DEVICETREE
to an empty string by default and fixes genericarm64 uki image builds:

ERROR: ERROR: cannot find /home/builder/src/core/build/tmp/deploy/images/genericarm64/${KERNEL_DEVICETREE}.

Also remove UKI_DEVICETREE setting in wic and uki oeqa selftests since the
class now handles it correctly.

Tested-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass     | 1 +
 meta/lib/oeqa/selftest/cases/uki.py | 3 ---
 meta/lib/oeqa/selftest/cases/wic.py | 4 ----
 3 files changed, 1 insertion(+), 7 deletions(-)

v2: weakly set KERNEL_DEVICETREE to empty as suggested by Richard,
    remove setting of UKI_DEVICETREE in uki and wic selftests as
    suggested by Jon

v1: https://lists.openembedded.org/g/openembedded-core/message/233870

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 326697a06660..938f0f80614b 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -80,6 +80,7 @@ UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
 UKI_CMDLINE ?= "rootwait root=LABEL=root"
+KERNEL_DEVICETREE ??= ""
 UKI_DEVICETREE ?= "${KERNEL_DEVICETREE}"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
index 4265a40e9e11..fc31fb767a64 100644
--- a/meta/lib/oeqa/selftest/cases/uki.py
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -47,9 +47,6 @@ QB_DEFAULT_KERNEL = "none"
 # boot command line provided via uki, not via bootloader
 UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
 
-# qemu provides the devicetree at boot, do not embed a dtb in the uki for selftests
-UKI_DEVICETREE = ""
-
 # disable kvm, breaks boot
 QEMU_USE_KVM = ""
 
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 644247684576..3b61c3295e0d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1580,10 +1580,6 @@ QB_DEFAULT_KERNEL = "none"
 
 # boot command line provided via uki, not via bootloader
 UKI_CMDLINE = "rootwait root=LABEL=root console=${KERNEL_CONSOLE}"
-
-# qemu provides the devicetree at boot, do not embed a dtb in the uki for selftests
-UKI_DEVICETREE = ""
-
 """
         self.append_config(config)
         bitbake('core-image-base ovmf')
-- 
2.34.1


