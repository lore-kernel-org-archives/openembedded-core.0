Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA85CC87FCB
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 11:02:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.15415.1754218949339145472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 04:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PNLcpuif;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76bfd457607so196030b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 04:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754218948; x=1754823748; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ajs09gAyeh9gkyp8O/uqNQERBCvQxaMkSCnUaUpxVU=;
        b=PNLcpuifEn4la/da9MTJcWsA8h3Dav+yKJ2mnE+4KjaCKKAEjXVEjA0btvKrEVFOR8
         ltYTs7w5lGKxl1jzGljpOYUXh7+Zu2CCCaf7Q3C3nUcxlxyHNdnzaxRK3JszoUaseAbJ
         cBKQM0T+xvqeeFoN2W0YnPnRqOTdeju8ZzVXGvYNa2NIgUzS5qGonGEKwMqSbFNfKw9V
         Gk3yyZRXZRidpHg1NJPkg0aTJMhrWOuisvZKx9OQh4SnYHVV3Dlg2MeVFoFC+XW+8A0h
         EHDN4gxtCuWvRTVQTkPX0zAoKiuUeIm51nDj0ecmiwdV4pQ7kXWrct/nXGk3cjl5R9Ri
         Nu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754218948; x=1754823748;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Ajs09gAyeh9gkyp8O/uqNQERBCvQxaMkSCnUaUpxVU=;
        b=F3wzOs7+mp+Gf1v5dJ6JucnWQrBvsGL0ii00BZxAIoU+Sd8PSZPgiJKfFBgeaqL4fB
         Lz3zqCoq1stGjAAnkGwhlPqT6qZqxA24sUCjG6vDf/qXE6Iy8ewkQRJMXAdugZeREKpm
         tMj6TgFCKZVS2QRF6Vzb9ethOS80Na7px7mjXB/kVj2bQigaVqVK7aIb/wU5JcxY6UKb
         xDp2zPtWTZ6h/eUPvIxi9suecMtdzh5Z6KAdRqBfo9uTAvDKdphQoRSDxbkgNWQ6Z5KO
         xYQMcFxEO8Vl2ud2DMH0DQsMkQGDxOhOjpg0ApH7q4WyqpMnQMzM+BLiQamoba3EyaTK
         Lgfw==
X-Gm-Message-State: AOJu0YwLswyNgMZFeObyLQAqavh9wSN6GqfZ/faZx8tETAttOYWr38Ah
	v2AVOk0WGj7BxJYRwp8w1HTHFSdwCrPF+e/BDDZ8NjVHsOkXh+yl6Th4BVca6VZv5gsazrlrMmM
	sXmq+
X-Gm-Gg: ASbGncvFlx7nUKM24UzCwcM55LB2qn/EElkIGNg/QJ8qKu5sCAAj8UvbbExNnlOYP1J
	PGHhjROqn59ZxoN0R5eJgILKOPIEKd3PadhBP8mmx4yQXyPAkgi8aMrNxV6YYrJ6xyTZV1VrrKI
	+wheKfIlry6h/BtWUcFUEihhyLQsky2EmVPpPmCpPcPYerhn8nWtUdqPworHYGpfWSo3HxAlTyF
	zr1mveiMbexvveh7EOwZlFVhA1IdHizXvX0wtQhnaETn6s5/Fj5m3k3ZQ53r0RrmFkSBOronf1X
	BxqnrNHL8ZDlLbyQBIUOyKGMnDL+kmDePnBKV2i71geWglueebhJXgOmCKHTuUIB2fWnnbEfOKf
	qEwsZPabeQE+N+FlqDkOtRQDrtn/PyyJu4PmyVw==
X-Google-Smtp-Source: AGHT+IFxPDwvttIiQg3akX7Ec0E/Q2au2jDnpR4UugufUuszG+k2VwYtcdNdJ91St8V9q7nY/Ek6cQ==
X-Received: by 2002:a05:6a00:a0d:b0:751:6771:f76 with SMTP id d2e1a72fcca58-76bec48a84bmr7767879b3a.12.1754218948465;
        Sun, 03 Aug 2025 04:02:28 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbce15sm8161390b3a.64.2025.08.03.04.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:02:28 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 96999100405; Sun,  3 Aug 2025 01:02:27 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 03 Aug 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  3 Aug 2025 01:02:27 -1000
Message-Id: <20250803110227.96999100405@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 11:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221408

Branch: master

New this week: 3 CVEs
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-7545 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7545 *
CVE-2025-7546 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7546 *

Removed this week: 0 CVEs

Full list:  Found 30 unpatched CVEs
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
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-7545 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7545 *
CVE-2025-7546 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7546 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  sqlite3:sqlite3-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

