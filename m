Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38DEC54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 11:55:52 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.25690.1748778943552916514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 04:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vY+/raTf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2349f096605so43235545ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748778943; x=1749383743; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQMYtrBoDXk78cSeMVnNrw01Pw6rKOePyqGXsTNZCM=;
        b=vY+/raTfFmA5WoKrlm3s+mouZjr4Y3gfUBhlydH2uvu9nb1iKQu3UF0sYeeWDsH+2y
         mFj7R0LSJbHFBn69cGRnVHh3dPLIP+LWVu7zA9Lzrqjkoxg636AA00MaEP1nopzSJd6V
         oZT6Bin8MWwnckKj/y9ucQsnzhoJd7FEQCAbA004R9gS/F7DRXcSeOEpsQiJ4G1ZAuuH
         ewwp9BLaSLTMdg+B/TnLVyG3i4i/IR3iBPK8NFJQGVVC+wXVcCev0tKdZO5F2r/rU4Rp
         kyR5EU23LV8BNhsG9iWbvVctRCvStYlNJnGsvLhi6wFbd78t2WtkG2DpvXVT+7jkZBwt
         4V9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748778943; x=1749383743;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKQMYtrBoDXk78cSeMVnNrw01Pw6rKOePyqGXsTNZCM=;
        b=quXZf0LAuRcxyqFItF/ZyFlYh1EZXChCjhU47F/+cWa7ZRwwUpQdKXlJrGgsZ+47fM
         0zfUdjt7HaqvE/j7oyfhthshdR3XC7neI3flptxv1IGeuE3myXCAqu2TJt4OGMP8j7aG
         S5xu3ZXvyFOKDnO3aXkl4COci5ST7FPWibR+lpp+z8IhbogpUza0jWsR8IMm18CbOtiR
         H7LdRfnOcNBdd5wOYZo17XSkUiBa6SmU1vqdBOjEIEHa1rIFkg2HMVquZcgKxP3QAhhw
         2GJKubEDsmBMc2hIpNvBaZmCJWjCSfzTfmCyAUnMZasBc3ynlaw/VIAJO0VjwxzPLoci
         7BRg==
X-Gm-Message-State: AOJu0YyLRHbRYXLb1OPKESqswcCCT2yweENlov9C2n2HrbPnwCAlZnLL
	w3XJk0IQS9G2IHLpWYZKjMBKSb8sA5ZmpgjlyHk4iAVtdNYCztiN3ZtpLqnK7tUQiRyas3Ziakw
	SudfCyjQ=
X-Gm-Gg: ASbGncuOfRiDli82jrV3D9d1VYP2ghwCg9AVfPlDnTIJFLo5CuIrHojf84DvHdGB1sL
	5UgXVST6RVCmGKfgnA/Rp76eKUv5sPH7POpK+IYp+jNRGMATeG43CUWC5cKboQAdEhwOmLcGBqL
	4WNod63XyXbYi6nOOTlK+KI4wlQnULopxruiM04mj47YmkcEmcE64tCq6Dwy85UnhlPWEeds7y3
	7DJCEI52q3oxbgJc06PnaytcszUGep86F2CbonILh2XmxGbXyj9k4ddFanSZtb309TzVqrxWyyg
	O8EIKv8vcAvcpPwWh0nVkt5lUdWaded9xLo4eGjUcqUtyVoa0ZjfVhYm
X-Google-Smtp-Source: AGHT+IHWKA+mrLAAfwhtjx1+BRjx3lsYBnxqUW41YIidDQfm04SqP/fLJjZsuc9D5MGnYx889/qW9Q==
X-Received: by 2002:a17:903:183:b0:234:8ec1:4aea with SMTP id d9443c01a7336-2355fa0044cmr68072405ad.52.1748778942880;
        Sun, 01 Jun 2025 04:55:42 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14bcfsm54389495ad.236.2025.06.01.04.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 04:55:42 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 326261003B3; Sun,  1 Jun 2025 01:55:42 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 01 Jun 2025 01:52:49 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  1 Jun 2025 01:55:42 -1000
Message-Id: <20250601115542.326261003B3@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 11:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217558

Branch: walnascar

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 30 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

