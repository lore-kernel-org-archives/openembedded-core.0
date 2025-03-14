Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA3DC282EC
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 11:20:14 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.11875.1741951207711611639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Mar 2025 04:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Fy6t6JIL;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307325f2436so19134231fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741951206; x=1742556006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuZJxZRkEpt8xsZxnwZl3yzeOAN2FOmvkLBErroOjUM=;
        b=Fy6t6JILzM7YRjGwB1H5GnoakT4IvXlhiWvrJM+txhC9/E2CXY3aNUfSFZfCX4BjHu
         g8LpcDkcWoxc85lgKYoctqJ2M4U49GKs2Aio4ag7gxXlfGoLfNknLG1y5e+FvrBzF1pG
         HGUmFq9dnv4boPuhjKcRlPH1CrcGxt0yYkzfbygDNd82TXvdYlt1SrnmgjpK4hnS7xiV
         NEEF9/eU5uq3Vd7ZgOVZdAN2uzK/6WQgyt4XYDplkYt8QBTXAuf0b1K+RXMWytfAhxDY
         BwklCa7BiTn95J22ERhBdnvYzfjncZMyvWUq0AMPMliUDVpScICS6GkJKYdIjDQckvtZ
         B8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951206; x=1742556006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuZJxZRkEpt8xsZxnwZl3yzeOAN2FOmvkLBErroOjUM=;
        b=iZY1bUxaKUuH3plD0OiPwO7wyfhcUgOT/2MYl5J+nKlDVya5ELI3FBiwXdkWrCLgI6
         +nA6d85rpx8ovOVAPJZC29OkyUirD/exGxyfNjBx6bhbdyr5IHO+7CID9sbhPfrnALW3
         tXfGAJLcTJIhLbfpzqjvl1ABFLQ6pij2y6wmEhG81X75U98cay4lOxPKsOnozxfLK6Z3
         qo/ujl1+AmGnLeiKMN36QYwhEXmiyEZK9R8KrSJsRXhEpRhhH2HYz5Eg5+YVfiyOWMea
         O7eX7C5mfVjgFTH4bJ3Q1C0UrApHDY92KzFTKuGKecAnGq9LndfF1q1T+47X/VKVZAe7
         HEBA==
X-Gm-Message-State: AOJu0Yyr+BxPe5AWxukiqkz/erjlOxJXMicxjfMHPrmf7O8GIwo/dXRX
	9ykSuiQCreUOurdAJDDN5Ietnq3CauAg3x2DyUOeq18vXJYp/dfAlZTHUP1TiA4T58hphx7Y4at
	9/GI=
X-Gm-Gg: ASbGncuIkUh+9FraQx8IsGeAUX7TKEFQy6XxI2TEGjyfIRS69FrisWUDlWQy9QkEEoq
	MrK7FzvkVwibgsqiz8acZ0KHH6sVvB1T31t/YAQomDPm0GYMXZ7LLCIOP2B+9m2FS4S0+CIJ8vL
	CBcvujVDkKTwJInQyf/++m1eopCrDnmz5jxSsE40XOwNijdJcxobnZbmnMheuPeZh+l/Cr58Pjd
	7eIvRA6daOuijaN/Fx6c55TLJdOkPJKm13AzdgGaNMsUQmkfmkUsGrGovkUA1C94djD3ghNPbZf
	bja6fGdQTZkOAWkHcXlltT7q2Tn8QBHPKOY1LeJ39dpUE+Q83JmIQbHDr2G68Dehqy7j2OPva0C
	6+PB90UaXIU42aA==
X-Google-Smtp-Source: AGHT+IFPd1lPW6iJ/CwElGoZHpeB3yB5axlyzfWW3h7hSqAK8rzqBVbDFmNEOgAo4UfXwltvLXX1sQ==
X-Received: by 2002:a05:651c:881:b0:30c:2e21:9958 with SMTP id 38308e7fff4ca-30c4a8edd69mr9139211fa.32.1741951205638;
        Fri, 14 Mar 2025 04:20:05 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d26e5sm5364391fa.20.2025.03.14.04.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 04:20:03 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 0/6] systemd based initrd and modular kernel support
Date: Fri, 14 Mar 2025 13:19:37 +0200
Message-ID: <20250314111942.304800-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Mar 2025 11:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212832

systemd based initrd supports more security, encryption etc features
than custom shell script ones but oe-core lacks support for it.
Convert core-image-initramfs-boot to create systemd based initrd
if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
for this initrd to mount rootfs via Unified Kernel Image uki.py.

Sadly the boot time is really slow, e.g. over 30 seconds with
systemd based initrd. One of the major reasons is the large
amount of kernel modules built into the linux-yocto kernel and
processing of their udev events in userspace. Thus add
kernel-initrd-modules meta package to easily install
subset of all kernel modules to initrd. The subset
supports "mount rootfs from any block device" but
doesn't include graphics, UBS etc support. Without this
generated meta package, initrd recipe needs to manually define
which exact kernel modules to include which breaks if
those modules are built into the kernel. Thus the initrd
becomes machine and kernel config specific and hard to maintain.
With this meta package a generic initrd can be created.

Separate changes to linux-yocto compile a lot more drivers
as modules but they depend on these initrd changes.

Mikko Rapeli (6):
  systemd: use serial-getty-generator on genericarm64
  systemd: enable efi support if in MACHINE_FEATURES too
  uki.bbclass: drop serial console from kernel command line
  kernel.bbclass: add kernel-initrd-modules meta package
  core-image-initramfs-boot: add option to build systemd based initrd
  oeqa selftest uki.py: add aarch64/arm test with systemd based initrd

 .../recipes-core/systemd/systemd_%.bbappend   |  3 +
 .../kernel-module-split.bbclass               | 46 +++++++++++
 meta/classes-recipe/kernel.bbclass            |  5 +-
 meta/classes-recipe/module.bbclass            | 37 +++++++++
 meta/classes-recipe/uki.bbclass               |  2 +-
 meta/lib/oeqa/selftest/cases/uki.py           | 76 +++++++++++++++++++
 .../images/core-image-initramfs-boot.bb       | 28 ++++++-
 meta/recipes-core/systemd/systemd_257.3.bb    |  1 +
 8 files changed, 193 insertions(+), 5 deletions(-)
 create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend

-- 
2.43.0


