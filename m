Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E700C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.24801.1753041897799903815
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AdwJGrPt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234b9dfb842so29334555ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041897; x=1753646697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dawpselYDEumI9VhTSTj3R97rS01iU1CI+4j8Xa7Pd0=;
        b=AdwJGrPt4sY4FhnK4ZnSt0T6yJK+ihiOBVKo0tOfSDZU5byiVVUbHV6jTPCHDjLKE5
         eW5YmX57WrU4Ty2zE7Zp9Xge/FCP3HUvJbF8jwUwpeOQah528T4/BJHjLKp2MLQ5/o1O
         yK2Hv5Vc9ktiQ4Xa5M98FHkNpND/y1NjJF8690ac0b4AIPKgV0DONYiLmw25geMzzyUV
         e4Y521QrfFBs69KYTDl3iLPu23Uw/iN+9a1SmjvKid7idhCPo0ZA6i6SvoGz8MSUxFEZ
         XAWjMob+w912fD/0R9iy+X8pwN5PwhaOzilJ0XtGm1/OGFgTyrRs2n5trnx/w3qCkwaJ
         zQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041897; x=1753646697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dawpselYDEumI9VhTSTj3R97rS01iU1CI+4j8Xa7Pd0=;
        b=X64wiNPGukXRnyZeNmgGuV5nM9ZuFr0gBox9vdP9VTumP21VIORyfE/mpaS+JK6RqP
         j9J4pcY/SkB5opl4tmfcM4PN97HVSUFvnpIoPIhQ/qWVPfBySaLHxktpAGuzQO4lfCmD
         fk0kMgCeO8PXo8SJBeRN/C4ct6YrzAkKRC9agnlp12FbHzvSD0CC4ZToSRKhVuINNuFj
         SZePb5P4XwgYzVPFXDcyQTja4qVvFZ8gDv2bdhBUWU7Kmm6ojUrD5TZcXfDbXVlv06Oi
         jAKTbr5VJcB7TiyaM6SrEsO9gLaFT9NqIgZquz4XczG7+RICqBXKLyTlkgsDHQCUG35o
         pzOw==
X-Gm-Message-State: AOJu0Yx/J8Er4lDq+D1EKSWImPjORJuGYPJvczKzmF5Au8AUHY6nwMmx
	FuY6qY2Lfeo5M7rZhbThRQREtx+E0dkW0CxXGqpTp/ihBTQ6yIlISJnVyuuHVx7xey3KXAgx1Wb
	2hG8v+xk=
X-Gm-Gg: ASbGnctBCcPhQtMAdsUv0AeAVWHYmI3uOTJhYV4tppqYYcVVlKpo8Aesd6jjMFuX87F
	nIprqgvnl4weRguoDPzwcZVOW9viCyEr8uC5znrHnOx1clt6xukz+gbVWCR0D9681J+Rfyby1k6
	3SXjbHpQQf5uwP3N6Zj8CKjfT7fFb363EMinYEGU9S/J/hZjAo5n8Qqof6CkEXEA7CaqrTmq62o
	J14TRNlSZvuWxbJzt0QweT2CcAUpzjrgoXpqdDWNfq7E7/GzVq+HSCNoX0NBDwxj5Pi+ZbOjDrv
	C+X4+oLfhVSljAgYk0vzx7ZY/h7jFxWqT6YVYLc6eTZoaKUhteoObIcj9sqTFQBXpXGxAI2TkKW
	zXIaiLxVEiOCSpQ==
X-Google-Smtp-Source: AGHT+IFKgA0/fGrC7cM3hfvhnt/DnDx7VRSjqZiolosJBOv/IkZnqlJwdmvic4j7tgyzYQ9M0meuiQ==
X-Received: by 2002:a17:902:f545:b0:234:ba37:879e with SMTP id d9443c01a7336-23e2574547dmr261544815ad.38.1753041896670;
        Sun, 20 Jul 2025 13:04:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.04.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:04:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/12] Patch review
Date: Sun, 20 Jul 2025 13:04:37 -0700
Message-ID: <cover.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220625

Please review this set of changes for walnascar and have comments bac=k by
end of day Tuesday, July 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2046

The following changes since commit acbed746f321e1a42df9035d2b6f1029f5a6a6a2:

  kea: set correct permissions for /var/run/kea (2025-07-16 08:21:58 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Bruce Ashfield (8):
  linux-yocto/6.12: update to v6.12.32
  linux-yocto/6.12: yaffs2: silence warnings
  linux-yocto/6.12: update to v6.12.33
  linux-yocto/6.12: riscv tune fragments
  linux-yocto/6.12: update to v6.12.34
  linux-yocto/6.12: update to v6.12.36
  linux-yocto/6.12: update to v6.12.38
  linux-yocto/6.12: update CVE exclusions (6.12.38)

Deepesh Varatharajan (1):
  glibc: stable 2.41 branch updates

Mark Hatle (1):
  linux-yocto/6.12: riscv: Enable TUNE_FEATURES based KERNEL_FEATURES

Richard Purdie (1):
  linux-yocto-6.12: Update CVE list for 6.12.36

Zhang Peng (1):
  avahi: fix CVE-2024-52616

 meta/recipes-connectivity/avahi/avahi_0.8.bb  |     1 +
 .../avahi/files/CVE-2024-52616.patch          |   104 +
 meta/recipes-core/glibc/glibc-version.inc     |     2 +-
 .../linux/cve-exclusion_6.12.inc              | 10175 +++++++++-------
 .../linux/linux-yocto-rt_6.12.bb              |     6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |     6 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |    16 +
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |    28 +-
 8 files changed, 5851 insertions(+), 4487 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52616.patch

-- 
2.43.0


