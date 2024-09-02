Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C4FCA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:41:37 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.35074.1725270095802623838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=biIQ30gX;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5334adf7249so5211865e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725270094; x=1725874894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcHVDtH0IfbSzx6qkKsrfTFGIwIoRXgcmR98qW1/Ykg=;
        b=biIQ30gXdhc1zPqv1ld7GIeBWL7PzljRm994996/u8bVMOTE0sW0z2l1r+SZ6H680/
         OYeUDDTmzilKnGmYKj9jW9Y7908e7OlJof59GIvel4gBx8gZzuxISyuPK6j9lWBLxCMN
         L4as7TdelEY6gyj5e605EBRZpUIwlXvmiducCmX26J+qKD5VXVIkFYghpBQQ2qIdC+wc
         9ju2wBPfBdbGjCLYn+C2vHKKLWcGVgv+dafdij/5vcvybE/XFxMbUQP9Cwpn+QIbLJwR
         bXEoDN0gsuSoUEcZfD5Ro70YCpGQqHlhRe+m/DmEYyatS6tHfFHowESYbGFwxGpVq6pb
         Bryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725270094; x=1725874894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcHVDtH0IfbSzx6qkKsrfTFGIwIoRXgcmR98qW1/Ykg=;
        b=lMX5ShpE+eauatRgJazeSs0YbVt8JZ5UkrP17vpQRc54+oVjGUSrRA9N3hNBKwoUt0
         rq+EGNjIyF4siC/WoQCegbxYOhvvocAsd2wAOfcdpLlb9q/yEwqEUl6jA22/0+i8yPpl
         oObYzTNITgOCondkdFtVNHOZTey3Yv7zpZCW1oQoSyKO5WT+kr5UJRGF7820ehKgK4yC
         7lUOwb5csng1/BWwF00NL0Mf9VWuDERCDtQ5ouJbFFmbkcx7GEY0JPBTi+jhbgAHnHVi
         y5apH6ykbWVyqolSu6MyWkAn6D1j3VLquXf1G5ZOTzVMLmlFQ0avGC6ylIvBoV4CNx1m
         rgmQ==
X-Gm-Message-State: AOJu0YxvOOTpGlnIjzT4UD824j2iYm3haFWAVHUzN+xbqmaRxzCFTu0L
	egscxHN/I0n3ClodRDFF0et7+SjZzTmf5ggZ93WC4wcimuP/+4CMgqIQnxQVc8zp5OazSnoS8j5
	J0O4=
X-Google-Smtp-Source: AGHT+IHq5WS1A5wSkHD3Lby74QwYYay/X/WTTohH/xjrvXA/j+B9aSBKaPN3ce+UsPTO8PFmM3D2Vg==
X-Received: by 2002:ac2:4e06:0:b0:52e:9481:eaa1 with SMTP id 2adb3069b0e04-53546b25d21mr6952895e87.23.1725270093222;
        Mon, 02 Sep 2024 02:41:33 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084176bsm1528853e87.219.2024.09.02.02.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:41:32 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/3] systemd uki support
Date: Mon,  2 Sep 2024 12:41:14 +0300
Message-ID: <20240902094117.31156-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204064

These changes enable building systemd uki images which combine
kernel, kernel command line, initrd and possibly signatures to
a single UEFI binary. This binary can be booted with UEFI firmware
and systemd-boot. No grub is needed and UEFI firmware and/or
systemd-boot provide possibilities for boot menus.
The uki binary can also be signed for UEFI secure boot
so the secure boot extends from firmware to kernel and initrd.
Binding secure boot to full userspace is then easier since for example
kernel command line and initrd contain the support needed to mount
encrypted dm-verity etc partitions, and/or create partitions on demand
with systemd-repart using device specific TPM devices for encryption.

Tested on qemuarm64-secureboot machine from meta-arm with changes to
support secure boot. Slightly different configuration tested on
multiple arm64 System Ready boards with UEFI firmware, real and firmware
based TPM devices.

Erik Schilling (1):
  systemd-tools: add recipe

Michelle Lin (1):
  uki.bbclass: add class for building Unified Kernel Images (UKI)

Mikko Rapeli (1):
  bitbake.conf: add getopt to HOSTTOOLS

 meta/classes-recipe/uki.bbclass               | 158 ++++++++++++++++++
 meta/conf/bitbake.conf                        |   2 +-
 .../systemd/systemd-tools_256.5.bb            |  41 +++++
 3 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-recipe/uki.bbclass
 create mode 100644 meta/recipes-core/systemd/systemd-tools_256.5.bb

-- 
2.34.1


