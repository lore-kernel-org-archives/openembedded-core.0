Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921A9CA0FF2
	for <webhook@archiver.kernel.org>; Sun, 31 Aug 2025 11:02:42 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.27319.1756638155054959509
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 04:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uWyDjwM5;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-244582738b5so31097485ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756638154; x=1757242954; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmrroaDUTMrSm9LMKGsqq2ccnfgEc+vw9ZHL8wIDZMU=;
        b=uWyDjwM5RPVuI3QSAkfNFalft8ON6ltxEsAG4dK6YCtURR9QB2FIiwaT2ed0yaVng2
         18KdzaXll/G4jzoc30rBrkq1vPLwVE+t83uZ4TMbBCgZCGV2PhsBVVUi1XRYktxmld6J
         tJS5VK99E+gkGV4ktHCxy06nP9SddmwXnz1CI75qeVFu6NiThtrl6B0z7BaaOj7sG0Cp
         Ia8jlUDVEdbRGNjEArS79LDw/hufvE3fL+N9d0YVqoy5I0/Pgl53Qtv0tNrcONcIjGoh
         tNc06ecuQjohn4Uk0A6DesWYUzs3X7sv2cKLuxhYZjy+ZObRrhnIk5QwoalRHSjvj4Bi
         90qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756638154; x=1757242954;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HmrroaDUTMrSm9LMKGsqq2ccnfgEc+vw9ZHL8wIDZMU=;
        b=shW78P+lpij4/gdepMYqqMSwXKXomHY/QHiFdq0wWBE7keiolcFb0pGw0DMD8Z45F3
         TSJq+vxv/yh2qnAPQKsvqddevqcxTrrvYR4Z6tAsTkwHSSLQiap1Vh8uCJYjCRbrMEvJ
         O1t1Yfwv4671MUROuWrVxjR68vvx122XIVR28VG+/x3uqcMOTiVT8DpF0A3VjvvUj/vH
         vlduwLlVDH3n2wgc83t+GwTluT4Pf257/bYEXDwM+3dI2zhJ00SZtRhxw8hd8iw70a1N
         wBlvTIhTr0mdqHrhjZEgBftS5m4r+HZAAJdm4jHeBu6VI+6S6cBSwdngbOmeThH5Ic+S
         IfCw==
X-Gm-Message-State: AOJu0YxNnYngIfJfRt8QqeLh/0xaQun9cEm3eXZ5Nks3W9PA6Lv7PIzU
	Bpy8MzTXg6oD4qUuz778iKCFPwdQWkFICby2CpasmOR9lJWcm5M10KjUp8qQKDkdNRVXmM7figg
	ozlvNEgM=
X-Gm-Gg: ASbGncvWCIHW4fXP/h7OfD5Io+oFwkxmY7BX93WM+UAjmXAJV/JBzPksRCQokGHgOEb
	7Ya3Xk7gk4q04+p64qk/x/OpSm+KbTCIVoSkpDuC5p7EOlqM2LO1GrXxV/WSw2cblPojvBP2UnP
	+E6dgAvwXNCAh7buy4b2M8ET72EjASici4IBFvb9z2aVR70CVqaczg5aw+InkW7bx4XzoyLtE3n
	t2QDhYIpCG15cvg9ZWT185jcsO9PiCn4OpkYKr8hHJe4ErUkaSmpIINmSDFVv8WW0JTugyk7o3W
	F2A+8eOmAoyrjGxuaIpIIMgRtNW097THtFlqbqYs9v9DN/wbUpq6yhNG8Pfrnwb3nbhNfARiq86
	bbxf0knZGp1v4PXs5JMHux7Ol9ELbZrUx/GlqVA==
X-Google-Smtp-Source: AGHT+IHcc6dgaq6l6U2kQtFEOjjqRm1E8kJXQZXYK+KqM2tTptPJm8fr6X53/k83hiR+AtxSnS5U6Q==
X-Received: by 2002:a17:903:2f89:b0:246:c816:a77c with SMTP id d9443c01a7336-2494488b157mr53931125ad.8.1756638154057;
        Sun, 31 Aug 2025 04:02:34 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037028d4sm75438755ad.21.2025.08.31.04.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 04:02:33 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 3618D1003BD; Sun, 31 Aug 2025 01:02:33 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 31 Aug 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 31 Aug 2025 01:02:33 -1000
Message-Id: <20250831110233.3618D1003BD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Aug 2025 11:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222630

Branch: master

New this week: 4 CVEs
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Removed this week: 10 CVEs
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-5222 (CVSS3: N/A): icu:icu-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5222 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-6170 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6170 *
CVE-2025-6297 (CVSS3: N/A): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6297 *
CVE-2025-7545 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7545 *
CVE-2025-7546 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7546 *

Full list:  Found 35 unpatched CVEs
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
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
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
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  sqlite3:sqlite3-native: 3
  grub:grub-efi:grub-native: 2
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1
  libxslt:libxslt-native: 1
  pulseaudio: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

