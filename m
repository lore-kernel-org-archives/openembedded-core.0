Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70F7C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:52:08 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.11515.1747835523803316437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vSKIusyi;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b0d638e86so9903276e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747835522; x=1748440322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy9PjHtrgYkDctLF76I9HVeZsUYIGcNK/tBbf3vJMWE=;
        b=vSKIusyiXpKsqfHxHr1jd0TWm6QfcSQS5LSq7HLZ3EZIBrhgopcMEFB5DUokBtntJl
         Iu+7VJOlkL07ppsu9wIbex83/m8Z19i+ZC5nACWI6ngrm1Qe+M2B6tmFpzzqmrZ51r/k
         94x0llt5YHu1ivUIXJyHHwTrlNNlSz2VO5Nwr6udovLz36Jw/qIFFFAabT6IQQd/Lx7V
         vnEYzDSyBb285Oylu2P3JDt6M98o+N4I2wJG/TkJ3D4Km+Tj8sMQNj5wuZAGgsuN4z71
         3G2zczAXUSc+0YMkGmKDAl0QjRfBNRz7oYZCfapXbrJTTEM3hwh/8hHW0sH3seyQ/lx1
         diTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747835522; x=1748440322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sy9PjHtrgYkDctLF76I9HVeZsUYIGcNK/tBbf3vJMWE=;
        b=OrJWxqNa3W8b4SQkq1JQQ5goZGhpjQ2vQeToqueAaeELmHocYfuZiRho36l6W4lg1w
         u82QD8YetCu/9QnJsm4wxXyiCw45NZq9a5dDkIk2p1grMUjV4qnJ8brZg7jcxFs/B5Ca
         dWZsJ0ZzcVMAFzA7Yd8RlCjgAWghN5vSG+C697KsAF3srBxWqTpCxBJzeQa4iBB4nmAN
         rfLD1g1BFZHdhAdgQUbmaO/3nK1gg7d0XBDhuI6ZVhsGuvGIWW4cmoLgTlhnxJ5VDBem
         Py8yIMK9pwQmEol0FMhJ80mx+pPOT4+P9qQr5t8TNVsbtzMIy+o8yEkM2RcFKkJP7Uk3
         tuAg==
X-Gm-Message-State: AOJu0YzIsDlZLxraG/xjj7KmiTm8ME8Z7G3SNLmh8mwSBUVf5oUVC/bf
	MChiuLjiO0IhAD3XA+DSd8hAVSkcdgXdP65Yx+wFDGPw/1C4D7zSyOjrhLZstGaaF3CMWL6aZ9H
	13ykfl5Cu9Q==
X-Gm-Gg: ASbGnctHQKgHv93GkZ3B6CzGoipo4uqtmMIsvBaGbQcwX8G4A/n7jAWWqu+vCKAyGe2
	mro1JJaXxOi+DscsOsvefZKbYaBZGe5Hqj3pvRSW0OmVQG6kKgtkjQY7CGDBRjQekpqHD4x2vHB
	hvg/5qWJA1mT6LrRFkRMxIM+deqZ0eYSqlDFg+AObQTuExLL9uEBHcgluWH3wQR2DqxviGPKj0H
	d5eaJDTtp/Y2+nCNLJF71/miJ0/HDiL9wAe+XPO8zVXxjp9YwP/FFc2FJG/yOdXMf79KKRxHMET
	UbewkQrUWpIEDdAR58+xxlGVYAxbZ4w/IsMJIQxdPV8qPes/Za/TpVnzdvTjDSJ0nxAopvCXjrD
	D9h/wKUKUJ8CCM60j80j5aVM=
X-Google-Smtp-Source: AGHT+IHWt/nZ95rolclYgogXo2+IQSPRhChz3OtxGMI+9UYwKIg/Aaej/WoNjjilFxmxc0nbRn0Wvw==
X-Received: by 2002:ac2:4e0c:0:b0:54e:8160:d316 with SMTP id 2adb3069b0e04-550e9900747mr6636663e87.40.1747835521873;
        Wed, 21 May 2025 06:52:01 -0700 (PDT)
Received: from localhost.localdomain (85-76-8-228-nat.elisa-mobile.fi. [85.76.8.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f3666fsm2860825e87.104.2025.05.21.06.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:52:01 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH] u-boot: disable CONFIG_BLOBLIST on aarch64
Date: Wed, 21 May 2025 14:51:36 +0100
Message-ID: <20250521135136.166390-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217030

Booting on qemu with kvm is currently hanging on aarch64.
Root cause is in u-boot and CONFIG_BLOBLIST can be disabled
as a workaround.

To reproduce, build on kvm enabled host where "kvm-ok"
succeeds. For example genericarm64 machine and core-image-base
should then boot with:

$ runqemu slirp nographic novga snapshot kvm

Without this config workaround, the boot hangs without
any messages in qemu output but ctrl-a-c to qemu console
can shutdown the emulated machine.

This seems to have regressed after u-boot 2025.04 update.
KVM boot can be detected from speed, for example genericarm64
boots in 550 ms with KVM and without in over 5 seconds.

Fixes: [YOCTO #15872]

Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc                 | 3 +++
 2 files changed, 4 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg

diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
new file mode 100644
index 0000000000..d01d3d12d8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
@@ -0,0 +1 @@
+# CONFIG_BLOBLIST is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdd..d8c70da782 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,9 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
+# workaround for aarch64 kvm qemu boot regression
+SRC_URI:append:aarch64 = " file://disable-CONFIG_BLOBLIST.cfg"
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-- 
2.43.0


