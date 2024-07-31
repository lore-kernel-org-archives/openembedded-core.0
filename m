Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E026C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:02:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.41332.1722427331530865365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 05:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZrXIiVIz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-70eec5f2401so3059431b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722427330; x=1723032130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RALcfefNb0giWIu7osSyoYk2QqionS02i5QmZvnc2n4=;
        b=ZrXIiVIzFX41myeUzrUhvjoiKvlhGYSiTOEGhmLkh/aJR+gRYXcYMKKeqMw+lKk/pd
         bDiFd+qN6mTM7HnLGSolWcuNeLb1kR+8OompMl64U5e18L52vrQfKP/ktZDa8SaKnAXT
         d3ANuY4fvODYc/RhHYjbjJCoywR8RATfwEexci6G9p9N12jigVdQY+D3fPQAg+7XBJDn
         SgFbHVwcbd3jOx5d6rFD3tHum2NeyvstbdvhynSfr9myDBwQaNFGCKP5ewG936WFPcLg
         NeA7hMhRDgbcckpCp8DANXVRMofU+h7HxdAMSTJHtZj5fSjqcGyHre7jVpMQhEadp72/
         JUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427330; x=1723032130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RALcfefNb0giWIu7osSyoYk2QqionS02i5QmZvnc2n4=;
        b=Zh/1Ta410zIPbLEkSDsvLJhHX98BJqVmfo2/DOAO1LDlgz1On1VD4ltVorpzR/I6VX
         V1ZKZ+qVeC1N3L3Vz37BzdEcPQFcYlNUUtLg5QPO9z9kUrlQZGkv2Z4C28gj26V9zhHk
         0qIBLK4+rn3htqMUeDCRLmfoo/Rb/C5wHhy22So43S1dD17+MhBR5gTKwGDOOxZ0Wn76
         h3VpZqI4HuArvvrvy3JdiqBZxGjF9FKOUgNw0Ztzl9WuJxCUCcn/nO1MFbbq9UPL7tbq
         +fYZWijMHPh1znXVTe5DmyGNyE1Sx+wIc2eby6wvMdqdms1P5/wDhdec+FXHsNYuKyEh
         ePXA==
X-Gm-Message-State: AOJu0YysyiSrha1Km9s9LhWGMLlyTs3y0gvmH/1wzVwQKl8FVNzAksvw
	RzQValqXXUlcclZD+iHFiIEWgtqSLyqY/bt+GbSN4z9tQVMKihnkJ/C/LahO5NBFegqU55ldXD7
	3/tk=
X-Google-Smtp-Source: AGHT+IHHNx4aQOLaKJUznLNMBdzrQL6L17njb+0jKvpLJ9Q/H5z0qhrwQxbZCZJfSR2ifm9XuOsvGg==
X-Received: by 2002:a17:903:1c8:b0:1fb:a38b:c5a7 with SMTP id d9443c01a7336-1ff047dd4a3mr193715295ad.13.1722427330095;
        Wed, 31 Jul 2024 05:02:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d4129asm119048315ad.118.2024.07.31.05.02.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:02:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Patch review
Date: Wed, 31 Jul 2024 05:02:00 -0700
Message-Id: <cover.1722427225.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 12:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202703

Please review this set of changes for kirkstone and have comments back by
end of day Friday, August 2

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7193

The following changes since commit f6de96c9fa8d0b6c81c32016f342ad93c8940d9e:

  uboot-sign: Fix index error in concat_dtb_helper() with multiple configs (2024-07-19 05:44:22 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Deepthi Hemraj (2):
  llvm: Fix CVE-2023-46049
  llvm: Fix CVE-2024-31852

Peter Marko (2):
  wpa-supplicant: Patch CVE-2023-52160
  gcc-runtime: remove bashism

Wang Mingyu (1):
  wireless-regdb: upgrade 2024.01.23 -> 2024.05.08

 ...te-Phase-2-authentication-requiremen.patch | 213 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |   1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   2 +-
 .../llvm/llvm/CVE-2023-46049.patch            |  34 +++
 .../llvm/llvm/CVE-2024-31852-1.patch          |  85 +++++++
 .../llvm/llvm/CVE-2024-31852-2.patch          | 117 ++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |   3 +
 ....01.23.bb => wireless-regdb_2024.05.08.bb} |   2 +-
 8 files changed, 455 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-PEAP-client-Update-Phase-2-authentication-requiremen.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2023-46049.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2024-31852-1.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2024-31852-2.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} (94%)

-- 
2.34.1


