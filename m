Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903AEC5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 12:30:18 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.10037.1748953808670242761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 05:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=x0fGkmuM;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55320ddb9edso5991706e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748953807; x=1749558607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2rBzkwoUwxF7MDCsbFiQPiG2SBjDYeT9ZvuuEAkYZE=;
        b=x0fGkmuMqoJ3HjVp7Mk+FgmfRq9VcDJBSrCxidcZY3ZRj7lIGjThb94XC0vi7goqjX
         b8t+jpVL2DA0XOt+ck1I3dfotzTQBhAiLKpAyB7V1RDvhKm90LPMCESrjSAvwENXeVqQ
         bFU0Rm0qy2WW5aW4AlvB3iIvyIf20JaMV86uYbEzx9GQ7gK91gYG8hLdgsxwJm6BZmR8
         jeb1Lmw5ohrzBDA2jsuz6dQTqRQQVapW3kINuaO/dUMGsHSW+TYAHMM45c0OSXudoOH/
         Ac0JZfJn4bZPtdqKez3jMywpIBKV+W4BhVGuyVk946ZbckTcD2Oaug64pMG5saRxohGj
         IHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748953807; x=1749558607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2rBzkwoUwxF7MDCsbFiQPiG2SBjDYeT9ZvuuEAkYZE=;
        b=QoMOxbJlmKyJ/wAXJdzCOBrP6iCyegEHeBepk0aay5bM+8Gzs3epfIEXJvX+hKRcrs
         EvMSmztD1vJtbb0x1JOXMFYoHPPJU8ZzAkeS69C81rNT6yrSggzFJ2tr4/sTs/NXCEeJ
         Ftjv+iVRIHaXKpd829mA+RHBTuicLPREZOCIhTQ4Vikst2CADK0z3JycNEZl20cnFdkc
         bM31wzk/VRC89Jd/N0qEw38ow1UVarxGZX8AD8QJKpYJ+snpbAcy4HgAGj+ktITp+COw
         HiRsjnekw58FN80pvd20wLKCMf//AfWbs8vDmL48a7njSrwRC+BjiOr6zqblDWEd+2BM
         xn7g==
X-Gm-Message-State: AOJu0YzTypWV/+uVOYc8PbnidxKpPCV32v+Xe2QsNkHPfytroPZwQYca
	2ziKVTKkWSYnJQUt4zRMPmPLiReFwvPmo8xKrBUuUwWxC+4KFv0b277P6FPVIn95WBGmaLdoiDa
	LQUm3vMo=
X-Gm-Gg: ASbGncsQ7W7dY4sd7hR8pl35EquP5VGiyZsZHMXpDCAoKvEoc7L4L5pKAtnswJk0X/3
	4gaVsN7wsqqHNmYwi3pOKpyZobCjFU9f7OqGe5vWsHySyflEwwwfT7QkKc0LDs7cgpDP0OVRDpx
	odSxfbWKXfj5q8klKcm2ckYg+EJoXMWG2wYTNSXyZdJrcGQG40OdFBTueNnFImDJypKZb8y+eB2
	c9I2efIE8crTyA/IdEWoAbaNbQcgWuwJ5LKhja/sBZTm98KDiZZXVOUmpjjptXvSOz/tvlkCgS4
	XKb+Bv/SLueqZ27+5z1pf9hOVv+VXi/TskffYSAmO6TaZQpsHT5m+FXVbSA8kVx5ECHtVlAuaDs
	TXQlQdK2swGLrGH50vIP9alH4rj6uHHqJ4JZgBvI=
X-Google-Smtp-Source: AGHT+IG982ZpG+vOHdmG3oZrzrHSZCcMfWw6ofe9AL0bdmu6rpFz3FkF1o4B8pXSGP0Ge3Dg1Xg92Q==
X-Received: by 2002:a05:6512:39d0:b0:54f:c101:4c04 with SMTP id 2adb3069b0e04-5533b92e392mr4789069e87.46.1748953806633;
        Tue, 03 Jun 2025 05:30:06 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d0bcsm1920295e87.208.2025.06.03.05.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 05:30:05 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [PATCH v6 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64 and qemuarm64
Date: Tue,  3 Jun 2025 15:29:36 +0300
Message-ID: <20250603122939.1027947-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 12:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217810

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

v4, v5, v6: no changes, posted together with selftest for feature

v3: added u-boot discussion link to commit message
    https://lists.openembedded.org/g/openembedded-core/message/217105

v2: applying to genericarm64 and qemuarm64 machines only
    https://lists.openembedded.org/g/openembedded-core/message/217054

v1: https://lists.openembedded.org/g/openembedded-core/message/217030

diff --git a/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
new file mode 100644
index 000000000000..d01d3d12d86f
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/disable-CONFIG_BLOBLIST.cfg
@@ -0,0 +1 @@
+# CONFIG_BLOBLIST is not set
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fd1eab5cdde6..a77c49cb8b7f 100644
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


