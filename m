Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE014C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:23:39 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7737.1787732613141312601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JVcteOYO;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so4362235e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732611; x=1788337411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZzNWbD01y24yv4R7P5LohG7Tdqsstz6LRC4hpJMYyyQ=;
        b=JVcteOYOfn1dCAGR9OOFN07cFwZHhSE4dLbYzsrbQu9uu4X46cx3G2bpdk4bu//8Fn
         UXi/bk/5rMc1E9AQ0dOpBhRJ2lnlj4c0OEx4+1snig8tENXl+czJWOZ6qhsVP7C4kDhd
         k+kLX1XzeJFq7Vml2bF7Iyl14kSzuaRAFh1mNUtfv4FEvvqP2AhuougtWmww7MCvmCQ9
         IwfGz6o+W21BRL7nVCEorC8NVskS0xWithW90mDjdTli8T4Ikm7GkvZEMUFXQ7LJQvIh
         4ILzrFrC5crDWB6kaX6T4BTj6tN7ONnZUV1JLLN+oCNncpjCScN/PVzV4OS3NlwAW+7V
         qWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732611; x=1788337411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzNWbD01y24yv4R7P5LohG7Tdqsstz6LRC4hpJMYyyQ=;
        b=sNe1ac0o8oTEQnYs/UaPcCZ0D0CHv5eMcbxvqsoiNrMwLhQ7qhK8uFT5syAeHmO8+v
         BffW5AV8doi3vR60ULRWhSjVBJOQuAoW1z3oiV2eb2//XXHRahSgKbhffrDaB3m/l3dm
         V4cIfNv2Y6rxNtjmhinD96QF1NXdI2GgtwEYx+w9+RRtVv/6Y+nXBykPjXIuRo3MekFv
         DtNf+F/cFjyH+tzbgMpDXrlCdGObF2IkJ5r2TRceTDvNWiwPecL6HFqeEBYXpI7eeh+I
         FNfFWWuFzZy1aZGbytP+P7AxPad3rq59n/fjQDCpuaOe7HxH5d6ktxtc1uXatjUVBhuo
         Qq8w==
X-Gm-Message-State: AFuF++nPR55vb7yAMxInNNMNp5TEOWfZN943GhCh3ktC8tahlF/UYqoW
	kFSrM4KaTSIWGsSh3czzClnLEzF/uyMPfOLFS63Efjx21TrAmuEi/FMfr4gFV9R48AE=
X-Gm-Gg: AR+sD133v1e/LKUNu/NPc2EWr5hYQi26b5FBo43bPpeLtYzbebAIa/Njcd3pBxj6+8F
	bdmefSHVh+LosnB+0BN8gIWno6vj6ZpMRRF9xAECWTDJFFPzWV0FR8usHUEWr4rEacbVLUfiP0T
	x3XnSNz0fJZ1xUiNFfwIFAwc93onCXUXg5IGz+noula3Q2dbz0zBIcPijnSY8rGYLVPZWVSZybH
	Bmgf/jczggk3Zq3Ntur1Q6vVirWaGrJjh6VBtvWIExhR9XM4KZzdf5BXWB4lncCK1iZziYoLRQa
	JdejpKzu0OrvWOTzAL18Z1gTpSIQlO6y9qC+jTWjW0kiYEZ9ohGS88eWtIZ1IpuAEMgTVDWzINq
	q1JyoqVZFMFxw+khntyMGCsBfvEpchcX2g6JjvWGwD38HA/Um8yUPBAKDrAKCHkmmS1Bc1n0LP/
	65BxsLSVrHYS/3n6C+dKk9P+uLibHCeZ36lJjiKmDgQM/bg0jtuAO4ikEsNSmQ4SaiVpsqZSXdV
	6b/Ew3GyAq1/Js9qz3dBUMazmVUSxt7ip9nzaBR9Gm0cI1eu1OQO3YPMRN1muvFZkYENMU7Gvlo
	SCEx9yjiOZM=
X-Received: by 2002:a05:600c:4514:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-499dc64a671mr29836325e9.1.1787732610968;
        Wed, 26 Aug 2026 01:23:30 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8b84esm17933655e9.1.2026.08.26.01.23.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 01:23:30 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	antonin.godard@bootlin.com,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v6 0/5] Make signed kernel modules stripped
Date: Wed, 26 Aug 2026 10:23:16 +0200
Message-ID: <20260826082321.22104-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244359

- Re-sign modules after the package stripping process.
- Remove the package-stripping skip for signed modules from package.py.
- Add KERNEL_MODULE_INSTALL_PREFIX variable

Note that tests have been made on core-minimal-image for in-tree modules
and on crypto-dev and lttng-modules for out-of-tree modules.

changes in V6:

    - Sort KERNEL_MODULE_INSTALL_PREFIX variable documentation alphabetically

changes in V5:

    - Adapt signing function to out-of-tree modules.

changes in v4:

    - Re-sign kernel modules after package stripping process
    - Remove package-stripping skip in package.py
    - Add MOD_INSTALL_PREFIX variable

changes in v3:

    - Fixing rebase issue.

changes in v2:

    - Use the conditional INSTALL_MOD_STRIP environment variable to avoid
      duplicating the oe_runmake call.
    - Use `scripts/config` script instead of grepping .config file.# Please edit the description for the branch

Anis Bougrine (5):
  kernel-module-split.bbclass: add get_ext_mod function for module
    signing
  kernel: re-sign kernel modules after package stripping process
  package.py: remove stripping and splitting skip for signed kernel
    modules
  kernel: centralize kernel module installation path in one variable
  documentation.conf: add documentation for KERNEL_MODULE_INSTALL_PREFIX
    variable

 meta/classes-recipe/kernel-arch.bbclass       |  1 +
 .../kernel-module-split.bbclass               | 46 +++++++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 12 ++---
 meta/classes-recipe/module.bbclass            |  2 +-
 meta/conf/documentation.conf                  |  1 +
 meta/lib/oe/package.py                        | 26 ++---------
 6 files changed, 58 insertions(+), 30 deletions(-)

-- 
2.50.1 (Apple Git-155)


