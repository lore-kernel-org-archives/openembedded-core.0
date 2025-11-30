Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA21D111A8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 11:02:33 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2224.1764500543386122153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 03:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dqDTU4Qp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298144fb9bcso31609505ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Nov 2025 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764500542; x=1765105342; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjkEXrms7iw/wznxGcI8t8J+OPTxXAeRhAchsO0NPck=;
        b=dqDTU4QpyudXCLhHuGW95gE6vVWJ/ZbNaq4YiCHfJ/pZkFrByjbDJdrEXmbqzmjTSQ
         m4IrODYI+qUNZTxCQKXgyAUmbv71YCYgmBtCrRlyVkswagfnUPu4DbnD18f+MuClmALN
         d8ecKgZcFfIguk2ro8Uq2RUhWdM9soDorkkWF4mHsY3LOg7RlRaqjuTxOZacTyg9afSF
         wRLPV0DeuDSAd180SHNB+hXE6zaO2x8s/R5U7JXyljs6m1AnIDqPDN1lonz0BdmtHRs+
         kDlCeJGEYb6Hi6VK2ECa7SWP/eDJrDDnkATYkW7/p8l/Rc+8MNRfbiYK9orfyaFvJm1P
         OEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764500542; x=1765105342;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjkEXrms7iw/wznxGcI8t8J+OPTxXAeRhAchsO0NPck=;
        b=fJgUFTPiYStSJ74qOks15hRmiuuH6HERQtz0iN8DnMhMFix5obpXEyBpVs0ZCxigcu
         IRXeOiomtU83VSGYmRgqh2qtIn+bJLKGf4BNxS/9O+kZm7i3E3MXg2+bCnVEKz27GMUJ
         Kpa8+kX4UxMXdfsZbovZKjdDei6bGFi4diT1CibHBHNBDMCA2byqWywvmTpYLjCH0UDf
         F20eNhfFNZSO5jk5C28Er+bjaYIZvYvsZ7/M2jAW1OBtIYeUPw96NJi0thMFUVuQJexV
         gFlvYCwBmsTXG/PERtaSY/oep+sOazjVVND/VjmSApJ5ff582dCDJdHmeahZfRJqnxf9
         CWBA==
X-Gm-Message-State: AOJu0YwHMbZbIHIt4f1kkw1XME0R8r9o7u461rJAOi9pd5lMOZYC/9El
	4lSz+H+E2hiMPchjOIExdM5HSB57HPQWhwECXzLDuvyI2oyf0GGsxMuUZCOEabWqeK/G89VwJkS
	3uSFV
X-Gm-Gg: ASbGncsRfSa8h0weZ4rbzqT4h5CZcof1b78YkY6SVevKp6g6u1qiPzxh36ZVfartyyU
	2d9KxfuNgHJNAJJ+6mmVcaM+WcFswsyObEJlFLfKPYu6rBF96QZRSr0LJA68dHJOAzPzqOlXEUr
	Bb/gAXUUsFSzzf55dshkrBb8Zt4Fd8ug5hFuiXfIGMEoLtQvnLqHnms6ABoPNZBvfMRWpL4Sa89
	IaNTUrqTj6EFGEeYdayKKK06FDkCYDMG8Zhek0V7H+JFDNvyA8fXhP/Bqx/W1t4szcO6IfReMop
	A2tw8YsUOJNFEiOQPGJKf86rJS64v5yTh+di1mxT8ZWB/nElLfDdGsL4PEXWpS2XN2FUrTOuQDb
	I00f4DbvoDrZaXxNkyf5uV+TQNOrTESsLETEimEZBhc8l6u5f8Uz9OOvVIGJxH4TJM57yrlX/DT
	Z+cqGA9NXY3JdDI2o=
X-Google-Smtp-Source: AGHT+IHxo3bddrn0UyuNpEEofUsXcMU9Xn9WMCwlBZB/xUtEofnxPe4D0didT1Jh9idiPQce4QUjqw==
X-Received: by 2002:a17:903:1acf:b0:295:3e80:9aa4 with SMTP id d9443c01a7336-29baafa939fmr224572695ad.22.1764500542212;
        Sun, 30 Nov 2025 03:02:22 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40aca4sm90702345ad.8.2025.11.30.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 03:02:21 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 33D5410038E; Sun, 30 Nov 2025 01:02:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 30 Nov 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 30 Nov 2025 01:02:21 -1000
Message-Id: <20251130110221.33D5410038E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Nov 2025 11:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226949

Branch: master

New this week: 4 CVEs
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *

Removed this week: 0 CVEs

Full list:  Found 29 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-11494 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11494 *
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libpng:libpng-native: 4
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

