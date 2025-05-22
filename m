Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E801BC54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 13:41:49 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.24220.1747921301557661802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 06:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bqte3ef0;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54e816aeca6so11182234e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747921299; x=1748526099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl7Gv72rNy8qeJ8HK+1ee82obvQkq1/VilSTPTii5Pw=;
        b=bqte3ef0d9dwgWBPInqezRHl927T6kqyoMSxgBsJlLw07PkC9BVYwJNLHwh+qb0vqk
         uFrsgFx4LXNRG0D6xmoO7tgIX+bTcesE6Gk75IqytHqX57coh1XjCL5VnfJAP6YU3k/W
         RECqCmE1996pbDRQH9uSAxvEUnNaqyBU3mwlzT4yAq3oMe3WmkF7L/YOyt9RI9yRFwXH
         gwvkA4vDrb43wVPOW2YC9jZD09Dwt63aSB+t8wXz8XJClOJQaLKNQLjyLgk5gx8zDOBj
         PgwiKq+bzv79h2Qhr7MzC+SqMKc3EMPq5ndKitnWsmb9aKeeZ0Bo74f+zvUZLGGFM36y
         W4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921299; x=1748526099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl7Gv72rNy8qeJ8HK+1ee82obvQkq1/VilSTPTii5Pw=;
        b=WiQdLF5Hm9vOynyqqAKnGZoTyhPwNJp41g6GBUg7FIgOJGjY4cOoFAGzajv01Rggvq
         K5ifUaQSBVhLcrZgfs3oErlPAlv6n8c5Fwf/f8ABLwU39GAudIjCN4cld+UbV9vkEsaT
         Am0r4sGvycuwRmKsSSUDKJ0W9BGDbvm3I/GECNkyTHT9IJxcWdCoGO13agEf7xfbk5MD
         iR4wWdpQIXy2NmrfgMfH6WjRuKgGudOBad2ezgl75CPzRtXfIkykb9kYKijFNxRKJm/K
         lENj9q4bA5Qyz4xGRoujG85tjkyF0jL33pi230UJx9kJ3yDitB9f6/XND3u3E0BZBLVl
         fUYg==
X-Gm-Message-State: AOJu0YwmbbwbmroYlBZ0l2wbxGqKgDeWIkQ3RqHng9OGjgLNktvVLt7p
	XGn+6QI+G44C6r4naBIh0UZXO8Phh6fUna66OHxEav92YZfeGQaYSBE3X86syCp6PsFpnJXxzR/
	JwllqwXv7riGF
X-Gm-Gg: ASbGncu7QEUCKfrKFxU+IgAwjj1vZIqMA3bR9MGW/QLcEpVGk9P82FaM7pV4fnRRQZy
	bu8hniGcTDwnc0HRaSUGyPYVu2pgfu7qOibLKhZUf2CZOnJ7cw93EJdWD1L83VhONv2Uaw/THXE
	ctgqsfENNJKeY3YcvkyGtjKDc663XV9Ce3QFGqN6xsAxDi5FN8B3KIhWv12WWlym+TcsdHmDPX9
	rcES4b7urY3pkYkUbWG09EPWRCbTUHJm/pHkBOvR+hsNnAvAT5PdTxyImPexf9GGg5AQJ7Zwod7
	1QHvV64F1l43v3sBOh1nmo8dQBJorsxE8GZ9J5e27QSOf9zVwv4+WEWZbjq6TeoZ9lrWpFz6LkU
	sJhVSbaujVfVvOIdgGinBH0Jh9JDQ
X-Google-Smtp-Source: AGHT+IHioCZTiSeO82SANN3T0XI8kW1PVpdN3Os4Kk9AL5ks0n7pgMP3RpVh5Uq3s6BqULQSkE/TCA==
X-Received: by 2002:a05:6512:438c:b0:54f:c512:89d9 with SMTP id 2adb3069b0e04-550e726a019mr7620168e87.55.1747921299517;
        Thu, 22 May 2025 06:41:39 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f15f8fsm3410312e87.37.2025.05.22.06.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:41:39 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH v3 1/3] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
Date: Thu, 22 May 2025 16:41:14 +0300
Message-ID: <20250522134116.254270-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 13:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217105

Booting u-boot on qemu with kvm is currently hanging on aarch64
build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
disabled as a workaround.

To reproduce, build on kvm enabled host where "kvm-ok"
succeeds. For example genericarm64 machine and core-image-base
should then boot with:

$ runqemu slirp nographic novga snapshot kvm

On qemuarm64, default kvm setup will boot directly to kernel
and is not affected by this. If build enables u-boot as bios
then the same issue happens.

Without this config workaround, the boot hangs without
any messages in qemu output but ctrl-a-c to qemu console
can shutdown the emulated machine.

This seems to have regressed after u-boot 2025.04 update.
KVM boot can be detected from speed, for example genericarm64
boots in 550 ms with KVM and without in over 5 seconds.

Fixes: [YOCTO #15872]

Upstream u-boot discussion:
https://lists.denx.de/pipermail/u-boot/2025-May/590101.html

Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg | 1 +
 meta/recipes-bsp/u-boot/u-boot-common.inc                 | 4 ++++
 2 files changed, 5 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg

v3: added u-boot discussion link to commit message

v2: applying to genericarm64 and qemuarm64 machines only
    https://lists.openembedded.org/g/openembedded-core/message/217054

v1: https://lists.openembedded.org/g/openembedded-core/message/217030


diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
new file mode 100644
index 0000000000..d01d3d12d8
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
@@ -0,0 +1 @@
+# CONFIG_BLOBLIST is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdd..a77c49cb8b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -16,6 +16,10 @@ SRCREV = "34820924edbc4ec7803eb89d9852f4b870fa760a"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
+# workaround for aarch64 kvm qemu boot regression
+SRC_URI:append:qemuarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+SRC_URI:append:genericarm64 = " file://disable-CONFIG_BLOBLIST.cfg"
+
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-- 
2.43.0


