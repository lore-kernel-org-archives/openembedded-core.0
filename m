Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9654CCD183
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 11:04:14 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.22321.1760871854361510863
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 04:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TFSR4OzB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b633b54d05dso2394613a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 04:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760871853; x=1761476653; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKRnUOox4Yv0ofo024invbMStMcPTLUx8jZ96aqPzdw=;
        b=TFSR4OzBIbOaImiG6NEA1BEzomWJs/Y56spWTlj7mL5reGjhWh1Q94GDQ1nxfXwffw
         XVVgZPUOP1at6cE86G/LwwsoHtS8XeLM1nsNaoy84wpLWe7JHwbzb77ODr/RAcJBB2RD
         a4BEBc+VfONVU9F7ghHDodSVVglPK9OQvTPyUdE/7u7/fpCRSOcm2fG8Pidq0pA67myO
         P1M34ivITrqUkDjujtUoNGQ/sKkx+qsLKhoV7p9qa/vMqqplVfhkL3DP7jJaBfuGX0jM
         2w1BYAv8mq8lQPj5e5cA5vXul1biJYBafj7oJfzlIoMFpT8uP53/oVG0j6xRTYIwpme3
         CjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760871853; x=1761476653;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKRnUOox4Yv0ofo024invbMStMcPTLUx8jZ96aqPzdw=;
        b=G7D4YSSLljCUXnsBS2l4la4wxKmThbnhSyWFULF1xl1zE2cZskBrXg3wRWsOWe/9Rc
         mA1DNMlQt6OtSKXblYFkO0XdP0dPUNiZ7+2zwhcA7irOLGNkUo68e2NEg4hh1Jtoz8nh
         0sdLSpJILAfB1R+yTqVyC0n93i1Upxhb3BRSkXOeO1grdOXv4mBoG9Sy0DposAosVJPn
         sr74TvEwljqmrjX5QUlWCiVG7jaaqCTD2Kj3QNJYx9gS6QBdDRbSSMgqTF+Ph9EPFHa+
         J2I9mCVQelvyaszUjXV3yslcyB7nmCAwgENanA+bdqfsmTAXl3bWHQ7OZTd6D2gVimZ4
         sINw==
X-Gm-Message-State: AOJu0Yze3928H1OFP9r0rAuBolOCz27BXSu9m/RFA5QE7gyFLLaFqXLe
	7wyQKgVLruZiH5MU/ynarF3ty3yyV4fPijF7H+lNiHjK+ryo+9TErkRQTujTKJzrS4xxdP6C06Y
	JAkE8
X-Gm-Gg: ASbGncuOrx7L9PCZHimon43R7s1WDvI9fJOO6zi//U98C3b4+aew5MKmUrTgllpgMmK
	Wjt0uUC4AMA7fv1xe+qH/W9o3KrxXl7dUnl9xE5yMMIrkwwswsr1+X7A2e+ZF1W/PXsfUk0GFai
	3iLYCtZbxQJV1bfXhvkzl857b0bjhcNm4C1bzV0DPN3RSOGvFPGKEOi8Q5YUGGkNoq+9hbjIriS
	PnrOzf7hn4CZP6Y0ZiYhm1rAVc5dkAhGfQTyZ1GfR0JN6FWs5S1y+Ho43CHtKmXgfFLMnHib9Tr
	Z/ol2SiYRdZgCYAMBHZptpuCrPqv/kFgCJ3SP7buvn1UDXGTBBG14vDhhda59vpaDnAcQjsELfE
	U2iJ5bUCd4mcnJ7AVUAp3rE8BEfgZFhUszSrPMpZyH8QqXMP8qF8FxlE93xsRoXf2HScRZeymjP
	Btoz5fsD6g2sjLYtDLm6xcJ6hs/g==
X-Google-Smtp-Source: AGHT+IFAPa8L0RO2/h+EwbmaJXio2yuvWC06xZFY6TIW1+uLA7YNg7QdYkKt41PzIfH+yK6s35pTmQ==
X-Received: by 2002:a17:902:f642:b0:269:9a8f:a4ab with SMTP id d9443c01a7336-290cb94ca6fmr109828405ad.60.1760871853209;
        Sun, 19 Oct 2025 04:04:13 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcde4sm50670665ad.5.2025.10.19.04.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:04:12 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 670C71003F0; Sun, 19 Oct 2025 01:04:12 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Oct 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Oct 2025 01:04:12 -1000
Message-Id: <20251019110412.670C71003F0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 11:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225080

Branch: master

New this week: 5 CVEs
CVE-2025-11412 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11412 *
CVE-2025-11413 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11413 *
CVE-2025-11414 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11414 *
CVE-2025-11494 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11494 *
CVE-2025-11495 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11495 *

Removed this week: 3 CVEs
CVE-2025-11081 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11081 *
CVE-2025-11082 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11082 *
CVE-2025-11083 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11083 *

Full list:  Found 28 unpatched CVEs
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
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-11412 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11412 *
CVE-2025-11413 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11413 *
CVE-2025-11414 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11414 *
CVE-2025-11494 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11494 *
CVE-2025-11495 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11495 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 5
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

