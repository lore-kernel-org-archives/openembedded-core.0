Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF012C71150
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 11:46:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.7654.1749988003035390377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 04:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T1iYGBEl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4332869b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749988002; x=1750592802; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tn6M6Env52+MIsjDAdShFMAQ3GtJCxqRjsqqRK0LZ5k=;
        b=T1iYGBElxVlHDKhYjFoAzR/Wx/nexRbmLSKrQptodvY0/CbmWErjATiE1pcNvDyf6a
         5qcAb3+0zMPUvbQAD2jdz6UO8wuTyL/MW6D75QuntcPYgOa8f5S2hcGloT/36lCmF7st
         uqXk1wodmavKnkqSG+Tpngp/Lir2Gr++yDz1nsmHcqAEV7O8OrI3n80EpXM71qGtuLrL
         B4+SqpOBnh9BOEYoZwErpBVfSgmwy56kqo6pRRxsqj/0kn0CxqjTBBhuC0SK+4ImCETn
         irlMeY/eV/XG3ohWIdvkD8YrtXyiDjAPeIx6aOiPcws4St3d1sgRtm0M6iMzNZuu47+y
         9JTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749988002; x=1750592802;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tn6M6Env52+MIsjDAdShFMAQ3GtJCxqRjsqqRK0LZ5k=;
        b=oO4oVIdMZLByjlLuA+KPOFUOpSuzTTw8ohhITVRJYZKcpHqIPRkaF71fbU/w7LGDxY
         HTre++KQ337jCdkdnpgZ3DxbkzYLEObdjeTrU2F+8EQ6XyIVb1K7KTT8dlu0WyQcuv9G
         3t9x5z7o3QA1Ny7934QlxaUpaygWBkcPg6c7V7rxI164wA05ouAWC6fp9TfYX+UuvOP9
         JMoxA9KRTMundqqrMig7uwooiXgJg4SmCfjRIluzqqvF5IldY76bnnTvyy7GhwoXMYS8
         P3Twj+uJjmt/7QGmx1SM15GTIMquq/kUGzMpRb0ihoggKDJid03uKXK9lD1QFZP7ev42
         nKgA==
X-Gm-Message-State: AOJu0Yw3+DiRQMLL8Plb6WtNYGkf/Wa/lz8Y2v4SOhnkVlRtX9AhGnTc
	UKct9oROQJXp1ruzSqrVkbIvgEN9YUyHUiM5yYrSLWZFC7mdKVqLyLLEPucGmiDQbvpcndE+RIf
	TzwfEdcY=
X-Gm-Gg: ASbGncuLIBJoULEyEgxKJjyrowxlPnIrAkXEgKEnCTaGg4A5cg3zHb8Y2PvSR3okjQN
	wFhJO4mjGtjRGDWcDBWFSYW09biFwW68kqxfutu/M545fMpCLs5mYXfrDZof1wrwQVrz1AHcW83
	uQPqFrpl7Nglpjof7vY2u2LdKULv/srQ206rZGw5ist/7VmQLkrWp2Sgfx5cw0Z7RkTJiFbCZ80
	GtIBKdI0irAGhsT6KKXvmC1Oyx8FcfjgGESG1WcD8mJYyg3wXU6r+vSzbmZzOdCx6ckcgjXU8k3
	TKamtfywF6nQhLVL9UI3W+Sj3z7ZitEOEqdajyQM2dG+1CjsMQeFqqkUPQQhK4BEhrU=
X-Google-Smtp-Source: AGHT+IE1FYNnYOqDhICvAScGJR6qs6rZonjihVNVLlq8+reVQaf5Xw2KUVTUWxK7Y/tLBjn03SalKA==
X-Received: by 2002:a05:6a00:414b:b0:748:311a:8aef with SMTP id d2e1a72fcca58-7489d06242amr8416036b3a.12.1749988002279;
        Sun, 15 Jun 2025 04:46:42 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748a0666b1asm2557026b3a.144.2025.06.15.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 04:46:41 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 838751004D5; Sun, 15 Jun 2025 01:46:41 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 15 Jun 2025 01:43:50 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 15 Jun 2025 01:46:41 -1000
Message-Id: <20250615114641.838751004D5@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 11:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218648

Branch: walnascar

New this week: 1 CVEs
CVE-2025-47273 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47273 *

Removed this week: 0 CVEs

Full list:  Found 29 unpatched CVEs
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
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-47273 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47273 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  python3-setuptools:python3-setuptools-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

