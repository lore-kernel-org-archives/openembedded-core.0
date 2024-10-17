Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509CED37490
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:32:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.48943.1729171925238777564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SsFzcl+R;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-207115e3056so7400685ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729171924; x=1729776724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+32Bjdo+eTuTQsBBlWymJI2Ok38xs/G4pmKlzmZFdTA=;
        b=SsFzcl+RgFlJc8Sz4iAp5LN1lZYPQwqoFymuGk3AfqSBC9xAAiOtFKCV+yh8eFGoOM
         ADJcnzJo68UtpNUpjpt+JuslGlgDT4sUnvGhkLsv9XsMKiL4JXB/2CnN2N0gBNHTrkQP
         oXtNELbjj/jX675nBSA1ugdnS/WiXcX+QcRVkp7uPa2tkOPjKnDm4RvBOzxBmpbZ50iV
         eL0Dp3P2gWn/qH6lphHqAmfCVJejGYFZsbXRnPCE1QBhmzp2L+QCJ/lc2MEE+sbCI/Yr
         lSWsiAU9XcQedCk3TMKpPfBb6xCdWaTtNCxddyDL6/CWztQoHWEVBY34YGN/nvgni/VJ
         ffNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171924; x=1729776724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+32Bjdo+eTuTQsBBlWymJI2Ok38xs/G4pmKlzmZFdTA=;
        b=CDJNBlmsxVq/7xoL1CfWgkxIAD2/XdKSXRj9MBaJl2ds38SRyJ4+9bNK0YI1Ebm7my
         i27DMAb32ZnFw/AI8SRHZmZPEfAY8Kjm6IF4Zmj8aLTA5sD53b91+I5o9UKKnFmpDKZd
         ZMZ6zUE4p01sJMyAN1jyGUsjaC7iGjBr/k9upFz0E4SdVe2/tj+dvWsgqZH0VFF5h4Uk
         w8cqv60SUUFlBh5U4Uuq0EfdzAyiaJli9nNIiw2EZDW96vP4ctQL843bokC/8KvCJ49Z
         JeJl8OTRhcDmVulUsIxdkBz+TNvD0ZFcjqCItYvpkaU08NpRloxDn+FEp5rvj+GzgL4I
         NU4g==
X-Gm-Message-State: AOJu0Yy1iPOqdpBD3PBRoyXGhOkPolvqpmGyRnrZKrgbFiAo1+IbC0hD
	oVMi/v5msE2xPiDxSpgiZ4xoSyYb6dfRGl8f5y/IHh2FQfOp2zOT+mhUtclH3JCY+B+yDKDvGQz
	t
X-Google-Smtp-Source: AGHT+IGheqPDYYtQri6DyZvTuwcm0HM0WrVNtjYj1DdpqeTIMRzQfKIPm3clhtVoMhjjhFWYC4jVsA==
X-Received: by 2002:a17:902:db02:b0:20c:bffe:e1e5 with SMTP id d9443c01a7336-20d27ea8667mr108133785ad.19.1729171924349;
        Thu, 17 Oct 2024 06:32:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b093sm44161595ad.254.2024.10.17.06.32.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 06:32:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Thu, 17 Oct 2024 06:31:52 -0700
Message-Id: <cover.1729170868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206020

Please review this set of changes for kirkstone and have comments back by
end of day Monday, October 21

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/283

The following changes since commit f09fca692f96c9c428e89c5ef53fbcb92ac0c9bf:

  build-appliance-image: Update to kirkstone head revision (2024-10-12 05:20:21 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Ashish Sharma (1):
  libarchive: Fix CVE-2024-48957 & CVE-2024-48958

Khem Raj (1):
  syslinux: Disable error on implicit-function-declaration

Macpaul Lin (1):
  linux-firmware: upgrade 20240220 -> 20240909

Peter Marko (1):
  gcc: ignore CVE-2023-4039

Randolph Sapp (1):
  kmscube: create_framebuffer: backport modifier fix

 meta/recipes-devtools/gcc/gcc-11.5.inc        |  3 ++
 .../syslinux/syslinux_6.04-pre2.bb            |  2 +-
 .../libarchive/CVE-2024-48957.patch           | 33 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 37 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  2 +
 ...common.c-do-not-use-invalid-modifier.patch | 31 ++++++++++++++++
 meta/recipes-graphics/kmscube/kmscube_git.bb  |  1 +
 ...20240220.bb => linux-firmware_20240909.bb} |  8 ++--
 8 files changed, 112 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
 create mode 100644 meta/recipes-graphics/kmscube/kmscube/0001-drm-common.c-do-not-use-invalid-modifier.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240220.bb => linux-firmware_20240909.bb} (99%)

-- 
2.34.1


