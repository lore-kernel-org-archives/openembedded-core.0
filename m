Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152DAC3ABC9
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 11:55:15 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.28965.1747569305373126717
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 04:55:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CWOgJ0IS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23229fdaff4so4221615ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747569304; x=1748174104; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUuRxjNNvf2L12vbx1EyLbHaAuf1gbui6QnoHjZlmj0=;
        b=CWOgJ0ISyOZG330Vz5KbF5Ee4xqsPG4yae9l7trYtdwAoBiYR0vkbVhOz6qNQ225wB
         JgXPR0hyU4VDL5F/IJhQsUgkV+VdWBYmuJnFYK3vn/xj2032IdVS9VMj5ARy5c0FWnvM
         SPCVIFL2n93ULuieKsh185CiVu5Ez2qLCMaJgRQXvgseqdZvvcIaXRKa5BpK4P1Lz2IX
         mX3Sgiq1tYPmGhKmjv+SxNj9hdDeQyigSyJH+G9Li3NuC+1GKtXd7+T0EANXW9s8kVVS
         an/5keHNqRuuVafBzOGVue+mS4DE2Yr8oFyvJICVfi7YNxN4hCiJ27s/RwEy1rdOFe5G
         y+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747569304; x=1748174104;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUuRxjNNvf2L12vbx1EyLbHaAuf1gbui6QnoHjZlmj0=;
        b=gxc6GhAwqFy8hnqHS8S6wzJU+Kwf94XipyjsZ067tbSzbuRcvx6vsA1pXprh7Md87g
         oRxh7aLOxW5Vvx/YM05FxZAIQeikwfBDyi1zICmEnLC4imiJaYsKuZGcpA5kaFHzrw1j
         7/gL/+e80LP0uQIiDLwyfDBxF0Adferh+CG98DmOTEiIyHEApTWaUKY5EnR46EkGUHor
         yUZn4/0uSe5hNmEy5WDLFaO1691EeMI/mGLIOjy3aPIiDUuIRHvigxWxe+nSDjqjgLsN
         HraKiOGPK/yYr1X8gR1W8uR+qPrrunlkgH59ZCrybO81AdH10mCguvjG9S+V3s0vfXjs
         CI8g==
X-Gm-Message-State: AOJu0YyllVCf/st25QgKWtOUBahMpia/kiNpZ8CiM6+56lohU5p2XrbC
	hu6x6aid5R2prVAu0srZUBQUOnbTTGUENpqXbENJFefdQawvV/6necbLYbFOt6SbmhZXuQgPaYd
	TGBj1Gyc=
X-Gm-Gg: ASbGncup2+Cwn4C3IRqZMs/NrxNkZE5PmaOK4sJqgJ5Gn17SL5FlcCGEMZp+3EEdYiQ
	XEImbu2hxlPkn3/Yzp77fDMBBWIlgiln1Cye7m/Gx/5Wx7OECwVLYmMlY7jxZHRT18pm9BBARzA
	6I9uYr+wy0xxpdR+MORgOT5bzGD2ObAxRQ871NEdSwKN9Up+r5MUEZao7Gfdt2/EBMRKW1i1rWq
	/0puIJAXBJ8qTE1SsQwSQ/7rh7iumu+Jex0A1OyyeKVHzii2TdsDfSLRrDohz6L763lnwNK2dKd
	TSI8FbO1vYc1JbG+96cE+Ngh5Nfftn3kiFPZerAZgFXVm4EcXwAQh1zf
X-Google-Smtp-Source: AGHT+IGS87mDpPaqBU/bAjupHDZQbWrbQMnSBQtG7zubasMtt9Uen2/roSV9ez+dfCQwECI3ps+n4A==
X-Received: by 2002:a17:902:e803:b0:22e:50f6:b95b with SMTP id d9443c01a7336-231d438b517mr140683395ad.11.1747569304573;
        Sun, 18 May 2025 04:55:04 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adba85sm42835675ad.73.2025.05.18.04.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:55:04 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C05CF10033D; Sun, 18 May 2025 01:55:03 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 18 May 2025 01:52:09 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 18 May 2025 01:55:03 -1000
Message-Id: <20250518115503.C05CF10033D@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 11:55:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216778

Branch: walnascar

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 32 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56406 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56406 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  libxml2:libxml2-native: 2
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  perl:perl-native: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

