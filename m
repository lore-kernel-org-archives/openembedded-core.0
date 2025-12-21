Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4072E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 11:49:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59196.1766317763593103463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 03:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NT8IuBrQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so2888799b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 03:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766317763; x=1766922563; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRg5UIkNOJZCy6ltNqR44+eUvjMM+bj3pTIFPMdCrWU=;
        b=NT8IuBrQwczRodrsUtceYbXWgORrB6+w641VgdPNDX/bi05n/F59XQQi3oRrRE05kz
         BAskNYYTRbwAjybhDgYuG90zqW3Jealy2hsrXwV7/MXh9SZXu1E3aqYXFknJU3tkuWo7
         Q0qy6lSmO8qra2IYsFL4zpPopLnxP660nkPdpjelZxxEvoaKZl7OQBcRdcn8AceDrgwK
         PDlLObX4laPR3HdJRax6hm1XmH522LGdMKmErnwYQJ/1Wg002YgHCrL0U4HbBQbM3Lu4
         HVA0IbWjPdXSloSQfPGdA2RqMY5iYZ9tD/A7dP6vXOZml6kUWKyfens+kKvWmCKO0VJf
         VrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766317763; x=1766922563;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRg5UIkNOJZCy6ltNqR44+eUvjMM+bj3pTIFPMdCrWU=;
        b=HxecrKKIhpF/EgV1z7QO7zLQc6ycR7FDbeDQSCDSg9xwWsOX9UvrIdCUKc/3kIz2Gk
         vp/dgLTpkDoO0sZJ3TzjXytaz/Iub2WB1u+lTCuOrhbACmtunT4o5Ld0EoG7S/eABfHN
         H/8nzA+HHAPs3RJ7sjz5lHCFMS6F9xEiswvTi7/UJfogCHUqTXUSgdT/bGrIdzyCBNad
         XNLZUThn4UXsx5y0E4cCX4Uy/rdp/LTYZjILpQBnDK19HKchTGxhBr26p4UPzU/Ihueo
         PvwrJFfj0jCTJe4NeMlDxcNpk4rKtBSD2Q1Svz+ogalfDX7ZztRnH3frb80ygFBFF9HL
         a8qg==
X-Gm-Message-State: AOJu0Yz7BTDVqEF3lz2WHPnVR5sAYoaYXU++tGYjJ0CMN66xDA/fEkFY
	+8dM9awjZY3mF7at6XIHT2FraXHGv6ySfEWqxYvwOenh3ognYVovTONqMhu9raG/JFQ1VbgJiPC
	wDYj6JHk=
X-Gm-Gg: AY/fxX5f8YtRIUwvv77xZaK+0Wl2zCIra6RAzfD1Hhpd549Q7sSqX3Ij+brOPl+f856
	2QTyF+vJkEMcH4jIerM7sj7fzjVFfhyrUZ59iwS44cH+JJB8B2J+eVmSL5TL/QwsMYLNGSVENfM
	fGtdZ2ScHP7SCAbd2gMV2QGQ0SCSZtsKLVybRjbKfKpgZseGZrQRX6WJI9qk403FYWNMrnXLoyD
	dDFmt0E1ZrtkUzPVuroZXPx2ruPlfAG4Fw9scbhav8uPxJs/oaL4bcRKrXZkEAwFKDNGbWYQn8G
	Yoq8RYV8kLY4D8UlGxYf7kjo03lGUgvcP47ZV4iRkSeHAL2KnzpjQhHfraBq+a+jGmWurJfW4SW
	wciLMm4je0PqmXbmaSzl3idP890RqD7uLajJL7nFfwDn9oegbHrKoLP9tEAHiAEkF+8Jp0G4MZ4
	eyEwgbhFmjkfbX6Go=
X-Google-Smtp-Source: AGHT+IEewvj4jD4XJkGOtClUeiwrRled/3e4wcc7y6x9f4SHyotqdiIWQJCiRAT1QJndgKJfIA3E3A==
X-Received: by 2002:a05:6a20:2450:b0:371:7666:6476 with SMTP id adf61e73a8af0-376a85cc638mr7337332637.20.1766317762761;
        Sun, 21 Dec 2025 03:49:22 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d4f7e2sm10125288a91.2.2025.12.21.03.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 03:49:22 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id CE34D100435; Sun, 21 Dec 2025 01:49:21 -1000 (HST)
Subject: OE-core CVE metrics for whinlatter on Sun 21 Dec 2025 01:47:18 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Dec 2025 01:49:21 -1000
Message-Id: <20251221114921.CE34D100435@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 11:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228256

Branch: whinlatter

New this week: 5 CVEs
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-61727 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61727 *
CVE-2025-61729 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61729 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *

Removed this week: 0 CVEs

Full list:  Found 38 unpatched CVEs
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
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58436 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58436 *
CVE-2025-61727 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61727 *
CVE-2025-61729 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61729 *
CVE-2025-61915 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61915 *
CVE-2025-64505 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64505 *
CVE-2025-64506 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64506 *
CVE-2025-64720 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-64720 *
CVE-2025-65018 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-65018 *
CVE-2025-66293 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66293 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66418 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66418 *
CVE-2025-66471 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66471 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  libpng:libpng-native: 5
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 3
  sqlite3:sqlite3-native: 3
  cups: 2
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 2
  libsndfile1: 2
  python3-urllib3:python3-urllib3-native: 2
  expat:expat-native: 1
  python3:python3-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

