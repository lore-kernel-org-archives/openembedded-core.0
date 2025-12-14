Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414CECFD314
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 11:49:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24040.1765712958296820984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Dec 2025 03:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DQCzUvFj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a087b2a9c0so15792745ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 03:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765712957; x=1766317757; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIkaSbuOgcq2qR0/TwQGKM625KW3oQaoyC4B+10G8Rk=;
        b=DQCzUvFjD0qFZFNRIrUbuer9YwWCx72oAY7dLPXdBau/BvmlyQ4Q5UQ0362G+pz4iB
         tz+ak0smqlJ6zwq0xxgo4bUxbHE8MvaLXSFZ1IpIS1NA0rEO5DKTMq5FperDgP2K225c
         JeVSbEQMRrNWtt8w+cma5EchWabKZOckxyOuxTU914QKEhYIRrJFXOwHjeBvaRwRAKJi
         jpe7F0orVL093z2qfso+7rw5vR7eJnwaDybiqBTtFC50oFHkSS9CY6e5cWQ1wtR2Xx1L
         DW0KR6kwfZCj8wctiW9wEwAAvVgSPA1w7nh9d0W3/ipxIa8Kp2P6nkFFSbOdEyjVSGNl
         7pKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765712957; x=1766317757;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIkaSbuOgcq2qR0/TwQGKM625KW3oQaoyC4B+10G8Rk=;
        b=Tkq1XMCSu/u1t8C1l6SRetrO7lLm+KCnuAaGTq9Qmgo5ziEsQ6q0uRo9BbYSB3Gcdo
         yEvbBIS1SHu+fX889zgzuBXhR9im81orWmGN0tg+xg5RJCHwt7YAqK3257IQoKVS/1IP
         nshpcnVW4PhQk3DdLf3wjitSJtQRY3A9mCvKO766ppr1L/tRlfPULk/fUww585mVl5+V
         lXM2LD7F/UDjZ9VMzFRz9YZ+m4hXPupBCZZS5EMiUAJjxG9HdWojKYiW7ZfZ4X5AxGVS
         yMaNt8Z0GgmJza4WgWoOTXSlBurg+PtgalGwXJtDhWPRHXe1dSScrapuofH3bfxPdW5t
         rXyg==
X-Gm-Message-State: AOJu0YyAC13sQw9Bz5TMpQDgbqCC4WpQxFXWZJFauWfn2qtbtmSMxKz3
	6BBD00PJ5CFWKsE/OxePoVFRudSUe/RjHEU8SWweKH1v2Jl2L/0w4ysN1G3ibscY8BHDoOwqa3c
	O0ffSC6M=
X-Gm-Gg: AY/fxX5bbufR1oy7/K+EIeemz+FhAabLEURSI2JxjgT1k8TVFwYON6M9S5ww7n43j3X
	RHd8kp3+MfNIdmOReCmd8IOre8YBp6ZdCciU1CVG4/itxGsEBd0yhXr3CvK7YUa50+ZH0usSMc+
	92hQsJoOkLGYu2sLOxp8fzVNdV6bmhtYbR4kPC4GQXbLu/blAL7R7s0ExwxjTxFd+x94tXBfadq
	SV4FB1giJR6zz/j8CFfQTPDF/5DznmrM0kkSm30JtYr1AWyhvuEVWqvwYfiuE59kU4BE4LlO4GT
	XUsguHhKGFzek7wIeh/uoU4xD88jkJjX+d+P+tSJ2DhidBDtTBkZvzM4sKHZDXjYlte8zxXeYej
	XUohLlcUWZ8k4Icixg2Nl7j+k7apvpxZvtvWNjL8kPJVsT+k1XoFh5tRRBJhmmO5s4fB+AqrGYg
	OyKdAb+B3JlZ85g9c=
X-Google-Smtp-Source: AGHT+IF36Hq/VsT32fFAkhV09T8Qbm+S8vrksOjFoW8PgLUCFzKbvKZUYN/Qy8r6S5y3hrjPWmRKMA==
X-Received: by 2002:a17:902:ccc8:b0:2a0:823f:4da6 with SMTP id d9443c01a7336-2a0823f4e6bmr44521855ad.50.1765712957520;
        Sun, 14 Dec 2025 03:49:17 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a095b251d8sm40377035ad.8.2025.12.14.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 03:49:17 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id BF6361004A0; Sun, 14 Dec 2025 01:49:16 -1000 (HST)
Subject: OE-core CVE metrics for whinlatter on Sun 14 Dec 2025 01:47:02 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 14 Dec 2025 01:49:16 -1000
Message-Id: <20251214114916.BF6361004A0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Dec 2025 11:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227695

Branch: whinlatter

New this week: 4 CVEs
CVE-2025-58436 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58436 *
CVE-2025-61915 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61915 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2025-58436 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58436 *
CVE-2025-61915 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61915 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libpng:libpng-native: 4
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  cups: 2
  libsndfile1: 2
  python3-urllib3:python3-urllib3-native: 2
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

