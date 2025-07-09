Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8BCC83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:25 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.18413.1752074360536142218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mPNIjbA/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-315b0050bb5so84904a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074360; x=1752679160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uli1WAa4kS3BmE4aobdIOmqENMCbxD7Ad7zBX8dHlvY=;
        b=mPNIjbA/nlBqF0uY11C74oVOQStyGb86Alruw2qm6MCIlYBal1hrP2yRJytuRHPLvh
         O7ISieoyHKTyRmh/rmgcgcdMB3a+lca8gOy7N0speviPkj3NZAr6oz9Ugi5MLaR/DCix
         rxAGgGhZ4Dbhg2b+KKA1DXGUHm9supGJRBuqzfcLeQ28pgDY9VrRhgq/pR+y5Rxc+92g
         vpbJfhSIIG3xKh+dcd3WVu1e7d9gyYOJjypjjEFUwqPxKYFLHLHzxdk5fa0ftaWjtjjO
         mCj2KS+FyMOqU+ASxAAb7cIw/ED7Mfkhmf+ZlA9Us3Ak418sda0ftmmkI84uTYsE+5Js
         Zumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074360; x=1752679160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uli1WAa4kS3BmE4aobdIOmqENMCbxD7Ad7zBX8dHlvY=;
        b=rf/YCELRruX4Bz/kUqFabNKiI+SnnW18ckYDJ89xUEF/HwbivQU3/Ve43LsP7rAqyI
         61khzXJnxAn1iItiaX5shjyWlUpt60XlfgP/u61v24ttgyTTfrb/K31PLWlaciXv9lJO
         mcc0QTmMlHNpj5bzOOQPNJxnQvycNZNxbd7RUP6gMFPYzdKU4Pdph1ETmDTRmTfv4MUU
         8z3m+nY7W3l5MsCAlfmbLVuMy1uDGntoog97AxcsUTKJ9FbiQ2pqLAfuPsxQ/JEJPPCm
         asRwtOXrSsZlwKs90rA54wHj7bhXYA+gFThPjYKIi2IWyiaC2kqK5M2cQRGPcAZDOPnu
         v97w==
X-Gm-Message-State: AOJu0Ywd8qCAaQIdBLOVgCn5JYvR/yRCPRWWBfrCdxOGNV5ko99dtLTS
	DGzNG4SSumbZ7aBcjPgx94yY+7uGBk8KAa+Ov2MJ9gcOQTlb5Ich0g7u/m2Xuc//pvNBWNT6wVb
	Qln3f
X-Gm-Gg: ASbGncueRjDyAigUeu9BtRuoBtDr6Y0cvftrlXFsgOCDTYM8YYBfEsia98mitdJez6w
	8y3bC9Qx3HQI2ZgSscVxcysF+B+s3FTCPv1q8R2ChgHrvvcNaRs1WE28eMU2p8J6fX9E16H6Y7y
	RqSui3RKa8s8yXDvVpAn3neBkXrTqdMdkHH25N8oGb0SWVrlui/H5UI3ifNx0mUGgyfHmsQrznM
	fl0fKH3sKZ0UNEeBWPhYbLY8AXr5tawv1Lv1YYxLK0ldc0aYdiLeKDj/gmy2IQ5kMIx0fTnlDTR
	SWwTPlRw2Q+Ul3QH1M13PprNAjsDayulx6vdz3tI2Hv+SPy+opdRz9EX9hmbrCg7
X-Google-Smtp-Source: AGHT+IFvZWociJazetFKKCp3VZinclfh7JYPGqUBoO6+q9JUp/qZ3HoEohVVfH7T9R+qZIltgNvW7A==
X-Received: by 2002:a17:90b:3805:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-31c2fcee8b9mr5241493a91.8.1752074359349;
        Wed, 09 Jul 2025 08:19:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Wed,  9 Jul 2025 08:19:03 -0700
Message-ID: <cover.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220091

Please review this set of changes for kirkstone and have comments bach by
end of day Friday, July 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1983

The following changes since commit 78055e8b6a9ea5063658886c5b5d22821d689fc5:

  xwayland: fix CVE-2025-49180 (2025-07-05 06:12:53 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (1):
  linux-yocto/5.15: update to v5.15.186

Changqing Li (3):
  libsoup-2.4: refresh CVE-2025-4969.patch
  libsoup-2.4: fix CVE-2025-4945
  libsoup: fix CVE-2025-4945

Chen Qi (1):
  coreutils: fix CVE-2025-5278

Divya Chellam (3):
  libarchive: fix CVE-2025-5915
  libarchive: fix CVE-2025-5916
  libarchive: fix CVE-2025-5917

Hitendra Prajapati (1):
  libxml2: fix CVE-2025-6021

Yogita Urade (2):
  curl: fix CVE-2024-11053
  curl: fix CVE-2025-0167

 .../coreutils/coreutils/CVE-2025-5278.patch   | 113 +++
 meta/recipes-core/coreutils/coreutils_9.0.bb  |   1 +
 .../libxml/libxml2/CVE-2025-6021.patch        |  56 ++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   1 +
 .../libarchive/libarchive/CVE-2025-5915.patch | 217 +++++
 .../libarchive/libarchive/CVE-2025-5916.patch | 116 +++
 .../libarchive/libarchive/CVE-2025-5917.patch |  54 ++
 .../libarchive/libarchive_3.6.2.bb            |   3 +
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../curl/curl/CVE-2024-11053-0001.patch       | 340 ++++++++
 .../curl/curl/CVE-2024-11053-0002.patch       | 746 ++++++++++++++++++
 .../curl/curl/CVE-2025-0167.patch             | 175 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 .../libsoup/libsoup-2.4/CVE-2025-4945.patch   | 117 +++
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   |  54 +-
 .../libsoup/libsoup-2.4_2.74.2.bb             |   1 +
 .../libsoup/libsoup/CVE-2025-4945.patch       | 118 +++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   1 +
 20 files changed, 2093 insertions(+), 61 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0001.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-11053-0002.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-0167.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4945.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4945.patch

-- 
2.43.0


