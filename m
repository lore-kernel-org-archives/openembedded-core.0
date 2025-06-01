Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C62C54FB3
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 11:03:02 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.25082.1748775778863648524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 04:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QcbenauJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7398d65476eso2426605b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 04:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748775778; x=1749380578; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LoR1BbQPtnbcOUaxP794qGxfRRKPWooVLIqr5u+0Ok=;
        b=QcbenauJOydx8kPJ0E0Whc8bfVjWtDz6Te2B2yxZPfgZIBLCH0mFnYxhZZqLwZ3uJ9
         gQr8deakWwESrq0nDbGc+WC/Cz8LVGmjq58NwSlebBKVwYJ3tBFyBbdMX2ijeZuMuPX4
         zDr+6l9JRIc7XUOCdEW6yeX9m7B5PD5FwyadI6ws2ZUFsxpuzrX2F1I8sktFqRDTFz7k
         ap5TR0/KSXKjE0sE0oqEeKB03PeJ8NDdMaEo7cQhXSow3PixNZhN/EFCQ50vArkxGy+F
         E/8f90fsqNlDFO5K0OAeKD2qf6h+e+mCS1OW2uI+vE47iyfWPUawwwJ1195EU4iAcgqn
         O/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748775778; x=1749380578;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6LoR1BbQPtnbcOUaxP794qGxfRRKPWooVLIqr5u+0Ok=;
        b=goEQ9pSTib4hET43HzMkFC2jCvtXi2E4hIRpDiZizoofPJLNDFesqdkPrM2QjSyX82
         KOJESYQvGLCK8qp2lTnLZFxEFGmlAwtj7K9+l2b86R+OadwIMVzSlgY8gSKM809yV6cP
         1o5SOKMee7wKDGz+1mhh+KF2fRXPyplQTUsSJi9mwnDCzETJXV2DjycH7EgHFPzKuqEZ
         25jhgvv4+PUDysiP4ka/3vEieqyT3rL3ff6dCas/C0rxfXPKSeJIYgYMaVCPfe59rTpq
         MEXWFA10VFBi2YG/3QMBELIw4183BZ5DbZGqufyT/3B83VcZnEPEQkWA4BXWTFI+0XFj
         O4FQ==
X-Gm-Message-State: AOJu0YzL3/gJWBRMC02KOtqyI7yA04j8bnZnu80WYzQz8nBU4zwSHnxu
	gDHq35zNlJb+Jl4pr59Y9HZtN8nUWPlCcrx8O47yaLW09BFSB0BxF/3WJu+3G+ZNJZdxke82ZS2
	3gRCp
X-Gm-Gg: ASbGnctm15sq//XozapDBzJpcNeEKFNthLaVoB4vKw6/PCmYself2exBWga/USAnTXm
	WGKNHAoLSuJYOOj0HLMrVtvQ5zIT/ABJGu/Ofd4y8kPy3jE13c1hRm9kPReNeSjEdqNIB7Q6fQ+
	hRoDCmhliujkyrxlaN7gx7DOgeW+tIUUARdYXIPOgWK6CklNnB9PC0kwMeozpRhWAqrdih9NjPz
	RPxBlfvR3xTSPH8o9K4XDLsFIJJqeQT/olxjI0Fb3NVy5zLdXCgrUrceyuHGW+FuOD6QIKxF/uB
	3UyZhwu5ACHdt+tQ/xJNa5dVDPtv0b8UoSUVdYDO8BiCMnJ99t3KCrE5
X-Google-Smtp-Source: AGHT+IGCfIUOzZV5rPNQ9di5HymIsHt5z2l6LmK1FoDTPE75rTXFJY6MPcvvDQX7IFiWWg1py31prA==
X-Received: by 2002:a05:6a00:854:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-747bdda29c0mr13631924b3a.12.1748775777791;
        Sun, 01 Jun 2025 04:02:57 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf497sm5764678b3a.125.2025.06.01.04.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 04:02:57 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id F0E6C1003B3; Sun,  1 Jun 2025 01:02:56 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 Jun 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  1 Jun 2025 01:02:56 -1000
Message-Id: <20250601110256.F0E6C1003B3@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 11:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217555

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 26 unpatched CVEs
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
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

