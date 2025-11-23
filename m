Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC8CFC518
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 11:02:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11617.1763895742799280419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Nov 2025 03:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t5vrCjYz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29586626fbeso41787525ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763895742; x=1764500542; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDaCj4mhVxHhB9xAN5wqFDxEuSgj7667RhNAUq6QyBs=;
        b=t5vrCjYzXZBVzKLXMMOCEPSwbY+UJYTcTKmltQOnl9Z2d/FcU1CUKouoi5SYE2l/YV
         c3nJ3KRE0GbQ2Z5mcTpXOZOAJycv/bxwKUaJF+yINg2qeKJXu2LuLovIM01V1SYNozVa
         +rI58JBwX0s0PTwZhoTOZKuj9+C0AY/4ncZI3UyNgsImjqP3/oLp8Gmxd4VeOxv0Fynz
         F11B0VZNRq+PN273sUnwyh/nM0PMS8cgBYLS7E0zncB/EHURHSosOmmn2XVPBAVIWnQ5
         lNPRk3wuXbCBOFlPcb46KquToD86AxAFu8yD0IITRckIHEQZiDhUqgBVl4tbLNv9LOl9
         xWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763895742; x=1764500542;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDaCj4mhVxHhB9xAN5wqFDxEuSgj7667RhNAUq6QyBs=;
        b=t3R5XiCZCPHtUfpPwH3k5t7kxfHG/Jn30tk8IhzrHGqIuT1vYOrfaHG8eXX98a+TeY
         HHNhV0Q8KFyHF50iGj2Ihg921WsZcOGmpAQeW0/pCaZz2+lk0T6bBUyKGTZkRb+f22jA
         MyZ0AfcZgaSyiAIsrilu99+DTEawmFHhQN+/MaCRso4Mk4hYeVCNhjTVq/72e026Kaew
         7NDFEOZH0rx08K+2IkNUYfXxy2bXcXWkjOFfG8+zGXvxjM57AA2V6FeB5+GXZgahSZR2
         cvpY0GrV1szd6TUuuzC0TL1D5qCT8wzbfBssh/LVt3bjjZIjrisCO0q3DHl2lGQprZT2
         XfOA==
X-Gm-Message-State: AOJu0YxKcBcxSbG0dz9KOpQZSmlgct2aC1YGv/NzOxBaHThiSr41IJar
	qXeT5MQFFyE97Esuu9j1svI53eKvPIsJotiRyvTYtm4kawyK1l0xf+ln9F3QEjf3rFgEMo9pXHc
	eNsKe
X-Gm-Gg: ASbGncu4n9meQkziZUJerlvlRAVdOKB41kUgtj+ShSB/FlRUhkhDt1lz6Zb1I3+qNQz
	F9l3hE2s8M6d/J10l+7rbGUagLAJpwxmYNLj3wsiMO/Ze72dz0TU9uerCSB4lqi6rfb+LCRTHcZ
	SHKwGxjv+k/uZ+VbJnrBhdwxCOI+fQ5GHKhSMUDoMjOCD3JY6x9INsILtfvrCw6WfkKpKfnMBN1
	baXcJxqQhTEH2EAb6xvJL4pcFygQ/EtBFkloKKbgw5DMFfExT5jKBKTCT4fwZiucCDbXdh9cW+U
	d0e0c+z1L+fbO+X/FWXzbnu4m8RM/3VBALZOULIwpmQ/eaKCYqoEAaMd+YagYPQ6GWtD6Rt62IZ
	RN5TQfXdl+epp4/Iqfebjux0PdRxzQRmJUyVWi0Xd8mYliUt3HxP3OBqJ7OZezI9yhFlSA66PMv
	TNizu+cSSLNBslAoc=
X-Google-Smtp-Source: AGHT+IFEEIjbT8yMrpJgOsr1B/ZPxfXW8NVm3zegUcegdY8C53VK+BavBLsHGuzc2PIw8NkjbzFBfA==
X-Received: by 2002:a17:902:ebc2:b0:298:33c9:eda2 with SMTP id d9443c01a7336-29b6bf3bccbmr93757025ad.33.1763895741857;
        Sun, 23 Nov 2025 03:02:21 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111acfsm106282955ad.19.2025.11.23.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 03:02:21 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B46C410034E; Sun, 23 Nov 2025 01:02:20 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 23 Nov 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 23 Nov 2025 01:02:20 -1000
Message-Id: <20251123110220.B46C410034E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Nov 2025 11:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226724

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 25 unpatched CVEs
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
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

