Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C045C87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 11:02:38 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.24008.1754823750392814945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 04:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=faTsJHgx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31eb744f568so2908868a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 04:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754823749; x=1755428549; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LKLx3UcTN/H7NtYJddiNWuZzkm03vjY+qr+pIaw9oU=;
        b=faTsJHgxktqBkC4NBxHQZ9ja9084wlj+WF/63gnvr/2I6o78JUge9SmgFwLa4Xg+jD
         vxLk6sOLYHD2D0rEuNrFC+KylXf9l2sAMeLUcK2p6kEE4RGq1ipN2+CMasMk9pJ6hG98
         CJyR2G9rE/AdFND8RqJGLjjuYUq68OdiCodZdgQu+zaFkVY3vjdcfpvgPXMKf2yweDDU
         kglAuk3sd15ccJvrqw3Gp4DhcawYUsiOub9a2oD5Kiq0AvekPMHJWeySTi5WQdA81K0D
         zR1Mw6e2oStQrUHekKijMWLPACQ/8IcGnIUd8UgCIPwSdqeEv9hG2v+reVTu3CstFxhC
         zIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754823749; x=1755428549;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+LKLx3UcTN/H7NtYJddiNWuZzkm03vjY+qr+pIaw9oU=;
        b=pcBhJ4QNzntfLfzuaKiuGzKPHmJNQ3oWgDuEPF2jCDL1LtpWDZvkkIjvEf23sHGwFK
         wP4rLMx8C+JlB7LSoSOoun9Dl/4/Fzbco8gR6mBmGg/mi0ow6Onw3oTnONfq0FU8mqij
         3IWNmdiQDIygYfcIb/ovB8RyQavu+R8le1OIreqK3Qyl2jRbZMkmHLzLN2KA9xMr2ESC
         pMkNUzYAdHHeWeu9PBDcTqnarD1k1BWE+dcRz2pnChKcV4Dt7nlJzkfI9KmqjHvE0+5J
         G+NBr3Y3Q6GeG66delfVNvQ/oqrVUCVHnWm0ahSqIXm3pxcjIr3iL57K490L5yHquFcT
         AcLQ==
X-Gm-Message-State: AOJu0YwOXmhJ6goWVl6gCBV/aR99jwAD7pkY9mDKet7l8YcCu+upXO0K
	rDPH5y6OAHdjHdl92/GST/FvEH5uj9OL2vDZSVpMNmrY1NqmD/+eUOTtN0GuPcA9rFakSpR3aIx
	Nm+T0
X-Gm-Gg: ASbGncuBATptooiwvtVLZaMgKbXD8AyHjWRSNMu69RI65n0ejI9V+wmcPmTdhW/0iuv
	5gunIpRH4KU746dmULYs+h79vU3xeuTdZdliA1/zh827gJYSv2NlcDRIOJ7LXkoJ4uHDs8kzlQH
	Hm36FxuFwjWXOa7RzfUqXMnVQ/jdXI6QR+7lqaOFRgzuahYVK3i4v1bDP3w6JUBEcDNXXg+zHEH
	zxZnxJtA4/HMUkGctsU/KJ7GWYvH1jt2ym3xTHXU2F9+K/J1OgZaQsIrUFKnCFtjRytf+2W8YRy
	+G0xMKTVgmYjl0YZiwWApXNCMxVRVSQ3JnPSEz0cTkzQ5rS+dZBbFG3XKa8vPy7kZPg9nZyfwAI
	lKhV6oGvEGynEhsKCEZKFpttiWz4=
X-Google-Smtp-Source: AGHT+IGq1s2dxpBHbItSMb95SYaJRZoZey05/reISQeOAQriYjyjRnAK5ru6UpHzxdEPqOfiO1Hxig==
X-Received: by 2002:a17:90a:d643:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-32183e55c2cmr14614988a91.35.1754823749412;
        Sun, 10 Aug 2025 04:02:29 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb0be58sm20524581a12.57.2025.08.10.04.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 04:02:29 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 7F638100467; Sun, 10 Aug 2025 01:02:28 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Aug 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Aug 2025 01:02:28 -1000
Message-Id: <20250810110228.7F638100467@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 11:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221697

Branch: master

New this week: 7 CVEs
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-5222 (CVSS3: N/A): icu:icu-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5222 *
CVE-2025-6297 (CVSS3: N/A): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6297 *

Removed this week: 0 CVEs

Full list:  Found 37 unpatched CVEs
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
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-5222 (CVSS3: N/A): icu:icu-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5222 *
CVE-2025-6297 (CVSS3: N/A): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6297 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-7545 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7545 *
CVE-2025-7546 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7546 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  sqlite3:sqlite3-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  qemu:qemu-native:qemu-system-native: 2
  dpkg: 1
  grub:grub-efi:grub-native: 1
  icu:icu-native: 1
  libsndfile1: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

