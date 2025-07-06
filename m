Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49EBC83F05
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 11:03:00 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.34791.1751799773652365273
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 04:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xf94OFVY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso2735826b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751799773; x=1752404573; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6BoOrkpIBwX8muyaycdsX1Ei0/wS4E66FS/zEfAvKE=;
        b=Xf94OFVYe2hBh/oxJrhNiwqwHU+eRmvx/hgiHBbtHsbIWO8jlTyU+ytGW/AefMfu3E
         W06r0kCIBB+K6r3vYM4Y82FBASKY50OoCSNH5ROb9lXG0Up9+w5fBESqnZH41EDjMtEA
         419iRS4dtyGJ+YpvnIprSKXRsUM9L/p+B0M3mj2U7ZvyzU4fyjHkseXxoiK35L4zk7JG
         /7LOUXhm1LgHn/qCjiv3s/Sks3YL/ATmQoCqITJ8QVSULm0+nuO6ZlPXHy+JsOttegas
         Knc9/NreNQ/LE7Ib0Nq5h9SdQo/btQe9zq0IKpWHxSCpjkn2WrpCXZ92rP2GMsUXVdrJ
         lBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799773; x=1752404573;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6BoOrkpIBwX8muyaycdsX1Ei0/wS4E66FS/zEfAvKE=;
        b=kAwh465V7H95edWn9+AGqtzEyMH5N9OZtGXktHBCb0c/gpu/XJoGkOtGLG749LUIia
         WAj9nB54kSrroLyPGPCsODxDUJ26+n+PxmODF9qpzARFOzR2jdqYt8Lji/7rycoJi/wO
         4Vt3rj9n1/WVbDgAZyivFmT8zkEmKnEkxrbcLRYMHx4/fjjYJ6WOwTqyCALZcDkrrliL
         Bg1yGr155A2nOwfpDrRTCDlTMLP4MhcwxzQiPxyo85Y0uqUWSnkzbtZmZ057dLqJowzW
         lNx1LGE4QvJk5iEEpCGvU0FZGvFJvQ50BqTb8OMF0gt2dWEXNDHL/+iUjvipSqNwEenq
         AQUw==
X-Gm-Message-State: AOJu0YwdTmNLdntGFcAY7aoEGi1JE/xQLqHk/aUCORW0KYgMYakP7NjK
	IpJ91+piZ5H+Hb85oOAuGRNO6pQ1AHfKcMxjGXex92Bsd3pmMfphYEXnr5xUCFXocsHcKvTMC7m
	X29BC
X-Gm-Gg: ASbGnct/YTO2wls+h2h7V4Tw0+lRxu1SM01Vr1yo20qGVIt4qc+VvG5N0UVBKFZmiz2
	2P7w4LIs9/gANT7XgIoxeD9uinFY16q6of/KHKXeKSfHBvlOgc+fn0wgtXFCf0I8Bx1Q4gb/j2y
	e3GOqf5H7ghuB28LZrzKk21ZDK5UzHbqtIvLmTyJhP92Rh4jJe5tgGR5wPaEU4kn/ixEvqUb5La
	YpwWwiZwZc2iTJ8DUqbSrrJi879hEjZuIIZtM5sLZI1fMbnovRTSUlcVUe1iTrkI+/6aMwS8HYA
	E8hiKdk4Q8d3lTT0jEaUtOrE7dbEFJES1RpiXPSAWjJV2yTpM05Krqm31kxpvvHb+Zs=
X-Google-Smtp-Source: AGHT+IFIxAtluNnYfFIM3/oDHlwaJsuIaOdSq+ZMGoNCdhF9u24w9eDygbusq79n4BfKi6Lb6aT+Ew==
X-Received: by 2002:a05:6a00:844:b0:736:31cf:2590 with SMTP id d2e1a72fcca58-74ce66867efmr11391431b3a.16.1751799772717;
        Sun, 06 Jul 2025 04:02:52 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429b358sm6272011b3a.124.2025.07.06.04.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:02:52 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C3362100415; Sun,  6 Jul 2025 01:02:51 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Jul 2025 01:00:02 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  6 Jul 2025 01:02:51 -1000
Message-Id: <20250706110251.C3362100415@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 11:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219963

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 27 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

