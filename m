Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A8BC83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:59:11 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.40510.1752721149119219695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MpU6dtcO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so332571a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752721148; x=1753325948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ll6hvTJGHTilnUIYh6adNsB/Rvdju0xyOt3Ii2WTyIU=;
        b=MpU6dtcO40ILmNTIhOHovl4fWWP+vT+LYptkes9SbNi1oqlP+TLhKSmrc/3R2fJQ5I
         B8fiL4KOvBLOhbM/AEoD0bEmdySNKyIDWT3PDokmIng3o4s/yainP51TwgFSWVT92fF3
         ca+LRDpq5qnHh/iOZD0vZ6sUHlJzalFJSSud9Rb5fbOaSEnfaW+bqjLYBvMnUKxstCm5
         62aA5PN85R9SnS5lwSQiJB1FHQMIouUExgwUW0/jjE+NI+wE9LOwWtr/9ubAjepF3Nds
         jTyuA9JPhfgE4Hq/N84GWVapL+Zhb4CvZmUK7gTFw+PMI3SL4C92bRuDMDsYrZkIxDqi
         lPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752721148; x=1753325948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ll6hvTJGHTilnUIYh6adNsB/Rvdju0xyOt3Ii2WTyIU=;
        b=Yw5cG7RvFH+idMxJFavMFNCE2Tn0Uxxrx5WDdi7tksgiDXzxpqM3mxxyiAmAfwSEAp
         7cUuD+o93jbJVvprsOFMNRuSwDoDQcTOdSOFL7BVBWfZGt+YSBA7SSVq53l99A7NdHy1
         RulRmqtqi1h2fBEZe/RlMoD+yOP2dEixLJYPjqdkWLCIE34P95WI9Dvu6YmJ1kP6kvH2
         eiCdfKlZaa/fZICSGdCvs/DSESBpNqHQtqLxemflIMw/XqL+YXfQ9K266+ecOsBX9sqZ
         umMxG2c885b9EAszviQyPdc5f1XbmbI5Z/kN0P5HiFmboDN/YL9vDB+/DqZyAzEbPO7j
         VaMw==
X-Gm-Message-State: AOJu0YwanAE+aU0VQm94i/iDa4vFJTA748PZ5KuiYdeiqvsiniBdn43Q
	MWanshI+ehByT61hApyCJ8J5RdG2xEOCKm1EFu6WKAOLqxaBfxiWNvakdeXg1nM8/KVoFaxQVvX
	SvO3V
X-Gm-Gg: ASbGncs7rDMDpG+NmfzGTql8ZZ8GiGTu8ojcglhtW1BlcuKMug2HBK+ZiFMyet+Gahw
	9E2is4HojCMUF2ke1u1Ywv2i5xIqWWtawjzhkEfouvpXnw37XCZj4nyEQyBNScA1ID9OUvbVedn
	wMFZoINiwM9oeMy7K1ntgJR9Zk/4NfiFXSiEkfln+JDom/V62O2FwEvp6k5FM0AbbVBo2FeUJbO
	kYbQ7MtT5zQHZkfqp9iQBksN+DZtaKljZon19cQSUSyBIbujXKsU5v4/FaEA6nN9pSOyiPsepXm
	ANXK5jSEstx5URYpg48hGb3u5KtPoxrgyFPgWqEkFm3BtaDG3f8fUiySh23vEJhHPq/m8r9NwwW
	EtTFq6YZkqCOucw==
X-Google-Smtp-Source: AGHT+IEKuVXkMvvPmZ1fMIb0cJS8NGf50OfaKWrays3FnZX4kLnVTq/Dqw/uvmn4brHhDeONiju2MA==
X-Received: by 2002:a17:90b:38c8:b0:315:c77b:37d6 with SMTP id 98e67ed59e1d1-31c9f445b00mr6660960a91.23.1752721148212;
        Wed, 16 Jul 2025 19:59:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e313sm2204547a91.35.2025.07.16.19.59.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:59:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/12] Patch review
Date: Wed, 16 Jul 2025 19:58:48 -0700
Message-ID: <cover.1752721028.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220500

Please review this set of changes for scarthgap and have comments back by
end of day Friday, July 18

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/2032

The following changes since commit 7a59dc5ee6edd9596e87c2fbcd1f2594c06b3d1b:

  build-appliance-image: Update to scarthgap head revision (2025-07-11 08:14:46 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (1):
  gdk-pixbuf: fix CVE-2025-7345

Deepesh Varatharajan (1):
  binutils: stable 2.42 branch updates

Hitendra Prajapati (1):
  libxml2: fix CVE-2025-49794 & CVE-2025-49796

Joe Slater (1):
  oe-debuginfod: add option for data storage

Michal Seben (1):
  timedated: wait for jobs before SetNTP response

Peter Marko (3):
  python3: update CVE product
  busybox: apply patch for CVE-2023-39810
  iputils: patch CVE-2025-48964

Praveen Kumar (1):
  sudo: upgrade 1.9.15p5 -> 1.9.17p1

Steve Sakoman (1):
  Revert "sudo: Fix CVE-2025-32462"

Vijay Anusuri (1):
  git: Upgrade 2.44.3 -> 2.44.4

Yi Zhao (1):
  kea: set correct permissions for /var/run/kea

 .../kea/files/kea-dhcp-ddns.service           |   1 +
 .../kea/files/kea-dhcp4.service               |   1 +
 .../kea/files/kea-dhcp6.service               |   1 +
 .../busybox/busybox/CVE-2023-39810.patch      | 136 +++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |   1 +
 .../CVE-2025-49794-CVE-2025-49796.patch       | 186 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 ...d-on-org.freedesktop.timedate1.SetNT.patch |  97 +++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
 .../binutils/binutils-2.42.inc                |   2 +-
 .../git/{git_2.44.3.bb => git_2.44.4.bb}      |   2 +-
 .../python/python3_3.12.11.bb                 |   2 +-
 .../iputils/iputils/CVE-2025-48964.patch      |  99 ++++++++++
 .../iputils/iputils_20240117.bb               |   1 +
 ...o.conf.in-fix-conflict-with-multilib.patch |   7 +-
 .../sudo/files/CVE-2025-32462.patch           |  42 ----
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.15p5.bb => sudo_1.9.17p1.bb}    |  55 +++++-
 .../gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch |  55 ++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |   1 +
 scripts/oe-debuginfod                         |  17 +-
 21 files changed, 657 insertions(+), 53 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-39810.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49794-CVE-2025-49796.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-timedated-Respond-on-org.freedesktop.timedate1.SetNT.patch
 rename meta/recipes-devtools/git/{git_2.44.3.bb => git_2.44.4.bb} (98%)
 create mode 100644 meta/recipes-extended/iputils/iputils/CVE-2025-48964.patch
 delete mode 100644 meta/recipes-extended/sudo/files/CVE-2025-32462.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.15p5.bb => sudo_1.9.17p1.bb} (52%)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2025-7345.patch

-- 
2.43.0


