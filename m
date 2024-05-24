Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9623C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.14308.1716552872532042770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZSc7Ccvn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f44b42d1caso5169945ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552872; x=1717157672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=heFHDS5oPYqpCZlhS7XP4M2Th/Uwdi3lxIP7a3S5t3k=;
        b=ZSc7CcvnnvhbgK9aHyE3rkb0gBXJVqCzcKF7L5wzk+/Ot8/x5OQwIvHGYTGaXB0jpf
         9ibBp5aivWAtK4hV0DQc7QSfJ+veu8U0jhtZzB8CepvkwPHs4LVGmgVtKvpaHFebPR9A
         AqK5V/6qxlDKguNzCtsSqAlyibLHdXWCdBUgkQ9KNKyNq9h2QJzXhvfIgC9fzTIpYsVH
         ichnXjkzxdme3IpgCWbXUNvYF0nLngiJ6INML/og1wuNOTU5v4Va771TQlCRwMF8L4fk
         m4zIKuhfmSn2XnMw/vQD6nZQHviG9hyQRAB+TcdPc1+CiMySxQt1uCpsKr3VLLlytM/+
         ZWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552872; x=1717157672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heFHDS5oPYqpCZlhS7XP4M2Th/Uwdi3lxIP7a3S5t3k=;
        b=oqbc5YXKUfyGTwHWUOA+pF21Skf8BPa0zR4San13LU2PvkYx/6bEqAirAoP+Tvy7xO
         tbyivhIGnLbfCLfrVtqtBnXfaznbO7+6JdlmdpL2ZlAxV1U0FeozRy6I62uQLosWsLF6
         dorQx7WG9Ik0oeI8zKxExsg6+Hb1iWCMBuzHAaDplPTdvGq1Qcjajr+hwttPktgNwJpJ
         0StWvpNJW9B413Vs7MnmhKkq0gr5545uDNGY1LLMWzu4jvnzGRvtmsWDHzG8C+gHhW/k
         RAkrrlDHWA60cdMC8PtNir1Yd9oAc+hTKbtpYM2spt8PnghYGh1o8BPXCwS3lWYtQqM0
         5Ekw==
X-Gm-Message-State: AOJu0YzuzeTP5zQxQa9ekj5guXjkn+t36t6zaRqIV08xGvNXZFN6LRzD
	+fAmUoy/m+StQu8N3kTCH6ahZWQsfQvHf4EVSA8d0JunnTMHAMqnxxBG0RUIoP0l8zUbRxBn943
	1
X-Google-Smtp-Source: AGHT+IEPm4+Jn7VA8Zs8cQJpyFEWPHsMafRdXxkIwQaA4ssoJ02oD/GYhLtJ+Pz4XPOvqfJ7r3N0Bw==
X-Received: by 2002:a17:903:32d2:b0:1f0:6f32:e13d with SMTP id d9443c01a7336-1f44873dd66mr26409255ad.21.1716552871307;
        Fri, 24 May 2024 05:14:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/8] Patch review
Date: Fri, 24 May 2024 05:14:16 -0700
Message-Id: <cover.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199842

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, May 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6956

The following changes since commit f85d5dfc91d536a00669ca3148d8c3b2727b183d:

  libpciaccess: Remove duplicated license entry (2024-05-10 05:05:54 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bob Henz (1):
  systemd-systemctl: Fix WantedBy processing

Colin McAllister (1):
  initscripts: Add custom mount args for /var/lib

Dmitry Baryshkov (1):
  go.bbclass: fix path to linker in native Go builds

Joerg Vehlow (1):
  go: Always pass interpreter to linker

Peter Marko (1):
  openssl: patch CVE-2024-4603

Stefan Herbrechtsmeier (1):
  classes: go-mod: do not pack go mod cache

Vijay Anusuri (1):
  binutils: Rename CVE-2022-38126 patch to CVE-2022-35205

Yogita Urade (1):
  libarchive: fix CVE-2024-26256

 meta/classes/go-mod.bbclass                   |   4 +
 meta/classes/go.bbclass                       |   6 +-
 .../openssl/openssl/CVE-2024-4603.patch       | 180 ++++++++++++++++++
 .../openssl/openssl_3.0.13.bb                 |   1 +
 .../initscripts-1.0/read-only-rootfs-hook.sh  |   4 +-
 .../initscripts/initscripts_1.0.bb            |   2 +
 .../systemd/systemd-systemctl/systemctl       |  11 ++
 .../binutils/binutils-2.38.inc                |   2 +-
 ...-38126.patch => 0016-CVE-2022-35205.patch} |   3 +-
 .../libarchive/CVE-2024-26256.patch           |  29 +++
 .../libarchive/libarchive_3.6.2.bb            |   5 +-
 11 files changed, 240 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
 rename meta/recipes-devtools/binutils/binutils/{0016-CVE-2022-38126.patch => 0016-CVE-2022-35205.patch} (94%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch

-- 
2.34.1


