Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA35CD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:58:48 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.36069.1725274721205225759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LEjI4ZXt;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so5321753e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725274719; x=1725879519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h85bIY9Wa+Y8FLH8VFWKaUnrV1nj/CqJMX64I8PXYo4=;
        b=LEjI4ZXt2Jbo7bCSOSZhCRbt4rbU3YXjwNCPDsfA300E/JlDjcug9c41cnwLjNX/p8
         cRvhWups4kRGYF7+MzP6yJ752DXrROrnNC0/NN8/3iCT6KslmbXfIyWQWjHzhPwRt3jr
         BpqOGfgnwIEZ9bTr7g2Wi4qkd76wq/h2nChG0F9Nm8gaTSZKCMgibbNNDbQW0FLkahZO
         Rl1X3fO5E/tmiCVDbcH49R6GmBzkylavmz0xiOxoudhCWFZtldbo+rwVYv1PnKbtYTkM
         NUTnEUWu2Tj2eMfpvqaQWnnwEA7Q/0IiCKPuwJzt4Gy16PEnsZXWOxmgmn0Srn9lhLA+
         mrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725274719; x=1725879519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h85bIY9Wa+Y8FLH8VFWKaUnrV1nj/CqJMX64I8PXYo4=;
        b=n2ah3L353RkxAVVy1xZBDcnw6QJmvPx6int9q2SYkK9C99LPnc9ZGAUbRo2G+hkVMS
         lStLSuVY6y+nVQGLStNB4K7zKk7gJKfTO06SKHTFpTEmjaqseKs+pkAqsA6/T0PbBDSb
         W1C/PXAnoJY+GHwE8tKp9US5OXsPr851oZ7WQ3fy0m+xykyK1ynXEtca6xTQ7Adhgbv2
         b4ji/2wakSvhGwNuw7NgrooGLj7fGlN3ONGX2/Ny2i4Y8NrvBQMQG3njZaIO/56fcyhx
         KgGlNN+ap8Ob2mEiyUuzkOuTQ7GRK2gZsdhLaM4lNINfVxdORX6E7AliNQftKLqAxWHp
         Rc2g==
X-Gm-Message-State: AOJu0Yxu6w3Db6a29jRyTgMR+hpx1gIFh0fa8K4awLy8RfBQAxZpG47V
	CP+jg1tl+eIv2xl2TIeMnC5uPxhbCJnIYLm6fvLzS/phnKSzSKAQ128GQpuK/6c9vYUWPLa5/PJ
	VB/8=
X-Google-Smtp-Source: AGHT+IEVGFX8BTlqsBa8VxwlOL9A3L8gNhjX23Bku5sa/KvEATrS8aFCO44x2731htE+FcI3/39wKA==
X-Received: by 2002:a05:6512:ea7:b0:52e:f950:31f5 with SMTP id 2adb3069b0e04-53546b1c55dmr6495679e87.18.1725274718659;
        Mon, 02 Sep 2024 03:58:38 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac5e9sm1599036e87.100.2024.09.02.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:58:38 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/3] systemd uki support
Date: Mon,  2 Sep 2024 13:58:23 +0300
Message-ID: <20240902105825.40177-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204090

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

Michelle Lin (1):
  uki.bbclass: add class for building Unified Kernel Images (UKI)

Mikko Rapeli (1):
  systemd-boot-native: add runtime dependency to python3-pefile-native

 meta/classes-recipe/uki.bbclass               | 158 ++++++++++++++++++
 .../systemd/systemd-boot-native_256.5.bb      |   2 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/classes-recipe/uki.bbclass

-- 
2.34.1


