Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518FFC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:21:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.16817.1739370107390551993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aHs8vJmm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f6d2642faso109907585ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 06:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739370106; x=1739974906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4DRjRcWjp2yBk2pYoDZynUe3oqlaVUYRJJl5QEAwIs=;
        b=aHs8vJmmFSjYdDmWkTH3cAZaGY1Mniyfe2pcWcK6CwM13SMpL7JSqn3+s1e4PdXtFh
         9M3H1PQUEpkDFM+G66nqDA/EAbZil6qV/IdlWbUJUq/ievpN/huU0rnfOfpYePM9eaVH
         YT7vX3AG0gyDWS83+vtAmbUQLe+1+/+Drm8E76I1nOaJ61PTHlkc/EBQ1XMjGYABdTR5
         fkcRveFxH+54AW0ta1sNS5rKTJGBn7oxU9pZmoFLaxQCTylRfROwpjE09uB2rpbxqgvd
         YAAF8mx/qX6y5IHKzGeJMeGAMNENOIBqnbW1pccbyNHisDoybJHqUSVx6lVMrnkM0ICV
         1fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739370106; x=1739974906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4DRjRcWjp2yBk2pYoDZynUe3oqlaVUYRJJl5QEAwIs=;
        b=r+hWMYfmBfg8wdhvj7Rr0nlswytRuhHtlqRCTDpcgCvgDi5PWpFl81RZSpSA24Nlv7
         7gP/2T38lDuDHXI/eGHAEEpnNaK38pNypnLssIydnPrt/vCsms0cUPdhDWDUJ/Bly44D
         P5r1+7ZtaZTXqq0A5AT86qtEbjOlTca76b8DUs/x+6m7XrRy5zjRz3BiiyblAhe8Nchb
         Q3/7f0NsCTwuuRkBWqi2vFsm0l0m+NDHj/osgDh45NU1Pd4YHIAV1tQRQpQpezZ8tmBr
         MaOnvdF/PL13kbrIdPBwfyAqyU2pg0iQU+L7RjOZ06Wbkrxo+Q3Z2/INuIcoJZWV/pqy
         qf5g==
X-Gm-Message-State: AOJu0YwWuvXwBSdQ5tcwjwaWhGFUqoP0UbZDhuc274BT2tDDcLOJRbQt
	gHwvb9StCTtEANxUuPoEhPeQ0FOdBd7ERlgRYZL3bfRX4l3GHi4IjecxGyp409MMSDPBM/j5z7m
	z
X-Gm-Gg: ASbGnctDoS9QZEpwG+XYQU9Bpz0judDEQFg1WMxRoXNvYG70eNp0467Yw4PAbRsm8pW
	TX2IfyWo5azKnFJD6rnLBWllxrXHoawrZ2G7kAOutkNub3HY8ccVr7LtTwS7zTtiZ757AEGPMce
	iZr3EtnPBf2wcr0RMq4pFrWj6GKb+gzpuqUV0Je+rGAkTxW0JBF6OnRuu4TbUsioIFe+p5pvxlI
	LAWsNSRv/5yGtsbAUaNUymch79ii9n0uk+Al1aU6VDVcP7mH/YHmIy9FTegO+Rh10b22cKKGx+J
	IcDs
X-Google-Smtp-Source: AGHT+IHfdVTcSxpoJTteMejKYo3Vo0wovg2KXqZY+EbLJ+nRWLN/PH1UxQOQnY889dn8fg1gKHVeqw==
X-Received: by 2002:a05:6a00:1c8d:b0:730:9860:1240 with SMTP id d2e1a72fcca58-7322c39c33bmr5164407b3a.13.1739370106262;
        Wed, 12 Feb 2025 06:21:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73079facc59sm7445260b3a.123.2025.02.12.06.21.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:21:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Wed, 12 Feb 2025 06:21:30 -0800
Message-ID: <cover.1739369945.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211234

Please review this set of changes for kirkstone and have comments back by
end of day Friday, February 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1001

The following changes since commit a397c152abf4f3da1323594e79ebac844a2c9f45:

  glibc: stable 2.35 branch updates (2025-01-30 08:17:32 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.176
  linux-yocto/5.15: update to v5.15.178

Khem Raj (1):
  python3: Treat UID/GID overflow as failure

Nikhil R (1):
  glibc: Suppress GCC -Os warning on user2netname for sunrpc

Pedro Ferreira (1):
  rust-common.bbclass: soft assignment for RUSTLIB path

Peter Marko (1):
  cmake: apply parallel build settings to ptest tasks

Praveen Kumar (1):
  go: Fix CVE-2024-45336

 meta/classes/cmake.bbclass                    |   2 +
 meta/classes/rust-common.bbclass              |   2 +-
 ...press-gcc-os-warning-on-user2netname.patch |  61 +++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-45336.patch           | 394 ++++++++++++++++++
 ...e-treat-overflow-in-UID-GID-as-failu.patch |  40 ++
 .../python/python3_3.10.16.bb                 |   1 +
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 11 files changed, 520 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-45336.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch

-- 
2.43.0


