Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54540C3ABC5
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 11:03:15 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.27216.1746961387218124023
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 04:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PpBDxu9V;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d8020ba858so41715265ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746961386; x=1747566186; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5/yAkjy4V13pF/RLav8WJBSXIa6ijk700jDJ/O3lD4=;
        b=PpBDxu9VC2wg4p4HNHUpyS6S4dl8mUf3IXIRgAQRjTQCaHqlrh8XQhONpjHJ7N1TJN
         eAIvPCzZP1OcjiI7uEslcjSv2HEmsDaXIDEDZ0fWtL+BpyEWJ7KU3mpwnNeRShqYHkiw
         wYkbYCmI7AJKW6bDALsMsoZWwq/FeK93irTFigrDNFdk7s6SEiGzwGfUhg7fAB5cGupA
         Rpva4KQLWG4SF/Lxw4PKC8v75CdX0OwPo5U1aDGlGlS0cqqzscsWuymifpjLTF+nmspG
         NyzqLncyRgi2xzTTZvnCXQMURJKhsOh4G4FejOqLB60dWeaCX88gWQwnYUOc5YZaweDR
         3YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746961386; x=1747566186;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A5/yAkjy4V13pF/RLav8WJBSXIa6ijk700jDJ/O3lD4=;
        b=fa6NvytxmWZP2JRnpfozwbi+F5a/CQzvsymv2xF9tFoy8n/DHZRkh5zxLHajpUZ69o
         KztQj75Col8HQsYDL0GHYkaRJaBOECR3U+8PQS8grH2+huy6+biixcYQD/L0lDmnEFT2
         Z31z8g6XxY6ASSwQD03M58HKRp5NX/9t30Q1wS4V6XQ35cEihd+1iNAbVnQu/m32LxYV
         7UY/CP9shHDUOALROtWuiyDCp5Tj1xQm4LTGgik1qe8kSUEBMzCvl+7rigKTSMB4ppob
         rkKSHUzHHGTG9+IOOD5yJItVDrk+xntoxPhxEpsciOfmeddU+/wr51NFK7OfYvirJ/mJ
         ByQQ==
X-Gm-Message-State: AOJu0YxQ7r7Y/UxIGiVnO0OkPUHrS82x39nl2EBl06z7uVFVYQ+DJiY7
	J1aDkBmUYH+T7PEb3a5cnUXVwMvRHCk7pFZnvYb3BC3b08AqOVE5QzrQ0Wyq1OX/0wYBIS4sKJg
	CN/M=
X-Gm-Gg: ASbGncsIW//3Zi1jW3pIhXpgASHEbO4HR/3jmECvQIlls1ZGEDIIA4+T8d/woiPTXPc
	j/9XsIvpyv91vPgvyv4jjs6wlDqS1gkEC7cEQ1Ec20wczcXO72zyGzFiF1TDMlLizt35YYj/TMa
	Bkp/QGejMiCpWdNz85fsTBddTfYtc+9MNXCe0C63F9RyN9pt6Fhh7Kdrn5i7TYP8xH+7g74sYh4
	EKCB0R8IgXyuh6ykmVmdfEMztUdJEfsJjBb52u+IHPv6PPdynX8FCS/+oz8pmyBX/PmXWjblvgB
	d4AxpIdxGpqohB/83sszJzwj2KoYXxFF3aez1cioy3bA6UHix8M+u9ZdTJ3bDu3hmIA=
X-Google-Smtp-Source: AGHT+IG78eNFCALWGyn+qc/FWg19iaO0jTcUat6fakWVOnUy6deD4IFDjo71C2itkG1DGsTGqPSiTg==
X-Received: by 2002:a05:6a00:2347:b0:73e:23bd:fb9c with SMTP id d2e1a72fcca58-7423c038fb4mr12600236b3a.23.1746961375160;
        Sun, 11 May 2025 04:02:55 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237727b08sm4299045b3a.48.2025.05.11.04.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:02:54 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 43D1A100407; Sun, 11 May 2025 01:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 11 May 2025 01:00:02 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 11 May 2025 01:02:54 -1000
Message-Id: <20250511110254.43D1A100407@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 11:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216281

Branch: master

New this week: 1 CVEs
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *

Removed this week: 2 CVEs
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *

Full list:  Found 26 unpatched CVEs
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
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

