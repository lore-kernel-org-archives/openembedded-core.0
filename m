Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE683C83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 11:02:52 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.54517.1752404567690030516
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jul 2025 04:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ABGg60xK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso3530498a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752404567; x=1753009367; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dnDTTgLJ9d+4o1Eo+5zwz1d3ccwXZlq22pn3yeLrW8=;
        b=ABGg60xKhm6u1CY/T7cc5mgzv583ToaB9iDovp+DKejnep/Ixd+V9MingJuNGo0zQg
         6l9PthFOKfeUKuALeUMJsBG3xJc+iQTnHJCxiAW9QzTQELzLxAG1TzWgSJGOBQoSvf9K
         D+wbDVfAUt65aQqCb0yOD4IEXzkWEAlvt77A336TxfZnfy4CQep4h/fSYdhqsus96S5c
         uiMjCp/nwAkTLm7G6QiVNiribDbiuluQcHeoL/Rgbuqt7iyZB/WNK7o3+3CLZ6jXejgK
         Jg5nSnzsHcISSNY3fVPnkFAwBE/SoaUmTNRJ77UE3+xRouMXK62CDp+G6b77OZWCw5mR
         pOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752404567; x=1753009367;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+dnDTTgLJ9d+4o1Eo+5zwz1d3ccwXZlq22pn3yeLrW8=;
        b=lFhkDK0psm+bQvE08++FtN0FQWkiueffdmRgq2Fs7LOBVblhwyw2bXKMX3oaYCXoYG
         67zjI4xUthYAjtuz4c1yqeaiCgsaNHJXhd2ymqTVAVxgCojstxXRE0NrienGbzsPuuGp
         Fh0z757yeGn/MPXfhnbYxD0oyMLMbZL/eLxJ9h1DfZMvjZhK3O9AS/rxrQDQff7igki+
         4bEasmv80f/7qdPI3wBV7qjj8a9lQVR38AaoA/8n6M3BZVGhcxRvHJNbRRPIFTBTUbX4
         Pnc7TowSL8zRU0tAGMzSi88UAWvEUIP9E6OkAzCgeBc5GK87JaqftFxpRlYdrinhBu+Y
         8/uw==
X-Gm-Message-State: AOJu0Yzipg1EPCJz3NiguO/B4hNJDZ0LxwlmCFWAb6A99Ph6GumlMjgC
	RIdW5u92+qECEtuWo3P3tf5mUJRII9kN7zY87XCUh+9B3RumFe5ipF6AIGlEov9N1cGQUovxBdn
	f2+pJ
X-Gm-Gg: ASbGncs2rK79c743paddlp9xcqroy7o9S0L/Vpha7hFR6EoYYfGfb5OlC1B7S6gkAAD
	67T+sy/g07aW6t8013fsXYC5QTjb2rIlxmDakn0zcXcWN5uO35KnLv1FTPYNCQxGp2aiUeotJ1e
	gFnMbuFeuzbo8Wrn7BQXJhAUv6UA2zlTUlo3+2cb3r/W6UjCmishivIB0vEpQnOp02B2qSAQCdQ
	mA8zvvpO4VdnzUI9cTcie+5x8dfGegnisI19YtEzmcQq2MmY4SLqkphYbC1mdv9i+qCAtw00Aho
	v26XUFTa2OL/c/EfweqYbQFVapXg28qPv1drM6gHp8Lo2eF7fJIwnoZpvWb+8Ag6p9knVLdsPcV
	FhnavxF96WSO7Li8urSw6H4QluWA=
X-Google-Smtp-Source: AGHT+IEdxayyonDDquz5vrJZlkIjWtqnuvSuM0wxlC9/UHhOhuSi7+Ij5cSMspxzkxk7yqTWsvAHfA==
X-Received: by 2002:a17:903:1ae3:b0:234:bef7:e227 with SMTP id d9443c01a7336-23dede4407cmr126199365ad.18.1752404566602;
        Sun, 13 Jul 2025 04:02:46 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de434c9cbsm81024355ad.202.2025.07.13.04.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 04:02:46 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D109F10038E; Sun, 13 Jul 2025 01:02:45 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Jul 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 13 Jul 2025 01:02:45 -1000
Message-Id: <20250713110245.D109F10038E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 11:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220201

Branch: master

New this week: 2 CVEs
CVE-2020-1171 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1171 *
CVE-2020-1192 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1192 *

Removed this week: 1 CVEs
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *

Full list:  Found 28 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2020-1171 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1171 *
CVE-2020-1192 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1192 *
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
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  python3:python3-native: 2
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

