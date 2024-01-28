Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2627C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 12:18:59 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.36375.1706444331741681261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 04:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MwdviCHo;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.177, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7835aea8012so216895085a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 04:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706444330; x=1707049130; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0hRLPOxOWM2NDsAkOeG039mQPE8ADN9PoYjKr3McLE=;
        b=MwdviCHoyPW+ZrjKvEETG/RUiu5bzdeUDRXDZoZmqeyx3+52fFRq+UA+DvApKDpN5f
         NzoaZLvV/t2iojXtB2XTmu+6GBKrkXgC9Le7nUK/AiXZRZQK9nz6etSGnOOoKijsEHBA
         zgA7dRlmJlCLoBK5T8igDyrh85d6pLahmUVAJb/F4IVnVVpiZbtVPj/1GAhyokGSIV6J
         JSuLdy4UM6vQL6RjsOcD5QuJY2148bKqyTLso0n0AihgtwvFIsD/UXlKETdepbTZ7TZy
         AN7mROKIicvys3QsWWFrYiZ09Tpb/AesfAYEXyOnES9xMgxES5UZEfI3hLzRBKjA4Sx5
         45Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706444330; x=1707049130;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0hRLPOxOWM2NDsAkOeG039mQPE8ADN9PoYjKr3McLE=;
        b=nsOHUP7snrOqvOY5V0jnL7kJ4Zt+qXQhToVfOGanPVzqeQ7gQaBI8hx8YsWZ4xkKN6
         NT0O0u0fjBO+Njl1e45atGy+lEBHiDI3CrG7yuWurouaYzuUIlUYkV00htWjQrLlpDbq
         TB6pnj4Xt7aMx9CUsUb9Qk+TpTmfuu0iNykz6XM1SHmk02rjnRB1Oy6etpzhIDkUW6LK
         NSD0jHyrg22ey7K69VsavrUGNtk1K7/nVBGPqxi9g//MX1yNR4JI85+NwyPyDAQjzWDO
         Nt+WkBU1Q3iKXBRfP4vDgXeAGs4B1BPGUgLorjaiJDo197j3d+TtIQ5o0xe9TKJNGTaz
         aiVQ==
X-Gm-Message-State: AOJu0YxelLGZtivulcw6iHk+m0NTdtECIdLdea9EpC8ApAezoOVxbCkp
	jlf+mz6YN2b/FRolbr9qLlKGHC/eYWD1D8uXT5y4a8kGlKF/IKo4KRIsD+HV7FoUzp3L+uFIBtu
	fubc=
X-Google-Smtp-Source: AGHT+IEMXTWy1z8fhJqDK0l+NSmStzZYK9AKtQxHD8i4pfAt4gevHhXwFndO/taySp2IUa6TypQoBw==
X-Received: by 2002:ad4:5c66:0:b0:686:9698:a80e with SMTP id i6-20020ad45c66000000b006869698a80emr5260230qvh.66.1706444329741;
        Sun, 28 Jan 2024 04:18:49 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id qm12-20020a056214568c00b00686ac6401fdsm2364217qvb.13.2024.01.28.04.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 04:18:49 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 0DD5310669F; Sun, 28 Jan 2024 02:18:48 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 28 Jan 2024 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Jan 2024 02:18:48 -1000
Message-Id: <20240128121848.0DD5310669F@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 12:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194440

Branch: dunfell

New this week: 6 CVEs
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2024-0232 (CVSS3: 5.5 MEDIUM): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0232 *
CVE-2024-0553 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0553 *
CVE-2024-0567 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0567 *

Removed this week: 8 CVEs
CVE-2023-2861 (CVSS3: 7.1 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2861 *
CVE-2023-38633 (CVSS3: 5.5 MEDIUM): librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38633 *
CVE-2023-45287 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45287 *
CVE-2023-45322 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45322 *
CVE-2023-6228 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6228 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *
CVE-2023-6992 (CVSS3: 5.5 MEDIUM): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6992 *

Full list:  Found 109 unpatched CVEs
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27918 (CVSS3: 7.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27918 *
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-9948 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9948 *
CVE-2020-9951 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9951 *
CVE-2020-9952 (CVSS3: 7.1 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9952 *
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2022-0358 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0358 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2347 (CVSS3: 7.1 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2347 *
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30767 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-34835 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34835 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41724 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-44840 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44840 *
CVE-2022-45703 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45703 *
CVE-2022-47673 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47673 *
CVE-2022-48064 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48064 *
CVE-2022-48065 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48065 *
CVE-2022-48554 (CVSS3: 5.5 MEDIUM): file:file-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48554 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-25358 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25358 *
CVE-2023-25360 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25360 *
CVE-2023-25361 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25361 *
CVE-2023-25362 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25362 *
CVE-2023-25363 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25363 *
CVE-2023-26081 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26081 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-28319 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28319 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-31486 (CVSS3: 8.1 HIGH): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31486 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): gawk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-3255 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3255 *
CVE-2023-3301 (CVSS3: 5.6 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3301 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-42465 (CVSS3: 7.0 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42465 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-45285 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45285 *
CVE-2023-46751 (CVSS3: 7.5 HIGH): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46751 *
CVE-2023-47039 (CVSS3: 7.8 HIGH): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47039 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-5678 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2023-7104 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7104 *
CVE-2024-0232 (CVSS3: 5.5 MEDIUM): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0232 *
CVE-2024-0553 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0553 *
CVE-2024-0567 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0567 *
CVE-2024-22195 (CVSS3: 6.1 MEDIUM): python3-jinja2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22195 *

Summary of CVE counts by recipe:
  webkitgtk: 25
  qemu:qemu-native:qemu-system-native: 17
  go:go-native: 11
  binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native: 5
  epiphany: 5
  u-boot: 5
  git: 3
  grub:grub-efi:grub-efi-native: 3
  openssh: 3
  rpm:rpm-native: 3
  tiff: 3
  ghostscript:ghostscript-native: 2
  gnupg:gnupg-native: 2
  gnutls:gnutls-native: 2
  perl:perl-native: 2
  sqlite3:sqlite3-native: 2
  xserver-xorg: 2
  bluez5: 1
  curl:curl-native: 1
  dropbear: 1
  file:file-native: 1
  gawk: 1
  gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial: 1
  libdnf: 1
  ncurses:ncurses-native: 1
  openssl:openssl-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  python3-jinja2: 1
  sudo: 1
  wget: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

