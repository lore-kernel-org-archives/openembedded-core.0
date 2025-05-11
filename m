Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0E2C3ABC5
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 11:52:55 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.27812.1746964365328143715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 04:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3eYgTzk2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-740b3a18e26so2771487b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746964364; x=1747569164; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+Wk+dstEc7Apex0c+px1bR5RfMaIijRZ5zeHSZm1Ks=;
        b=3eYgTzk2j9Jvl7v/yRL4j1xSsd/BdO8lf7pVbc9Ur/yiQDw1QZlgPHDG6AB8DTjKpy
         rUp2lHsVWuC3PfcyaQXzoSQPezcj32OaXCGdlJoNGp+LE0Eg3KaoMBSFQ8uiyh9czMwW
         5EAoWvyBpiwNjZLCqGAVJD0laW6J+N+WxoG9knqlGzZP/zYX9p+GsBsHycIzb4+TdXv+
         s5L4jB7mJjFHsZz90PWiytXX/A2koBQlXiM6ZIeruCN7suc7jWhm8ajftGNueEK9gpmd
         Uc5dCMvo+JhAL172TPDkSP+nXYq39V1pzvghIZkrMzViEN3z8YcvqT4+QIt1HGmfsBur
         NXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746964364; x=1747569164;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+Wk+dstEc7Apex0c+px1bR5RfMaIijRZ5zeHSZm1Ks=;
        b=JVZIrap83IUjLGFPlNlId7XwlnTnOonNDmwUjk4Fd1advVVvpgzzg/B694Nn8tNiZR
         mvNF10MpO5EHqdDMuZb7ThShiyr8zuXrpXOxFk+eUdmSmQTPtGSMOnaKoJbBxOW4rED1
         GIHiOfK6tMf1Bd+LRTWaSJA7zToSsg10wMPNZfk2FUhMl0GAhRAuJp6iV70MfpnrNCdW
         r45YnwABLp+zMUt2KfvGF5uXupLU1DEnZ+5LosUbPFbiXRR63BJlLpxK/TuJF4OXQ8xh
         nabxwfhm+JBM1uj3ktDJGtb6NuPKu+5X9AJGpp6HejTl9j9p4Mkdrv+loDY5VdWr96ic
         rhlA==
X-Gm-Message-State: AOJu0YzYdzHRXiLH5aB7WrvEYA6b2Au5F1G+++cKSOG6WzSuP5dnQw01
	ja7NhZVbVlqMTRPBQpiiyIUMEGg80/+SGJxDUwophh8mJuub/f2GrQ+xMU1u+GN9FfsKkabYFH7
	J3KQ=
X-Gm-Gg: ASbGncujfws3jYMK0Ns5zyn4T4fZ9V23Wv9Qe3sNGwe+++CdEwMCbqqum/+gWbLAJ72
	oSjLW7avGyT6Ou5Fqk96RFXQrO8UaluRrLcn8PKu6X0wmgVrC3L94IqIDoT38UDcPMlAa8wfjmA
	Eh2FjNz1DZ8ewt2usFNwferglmS2gcRM5Q17ANifjVGwOxXM1rClhxbb8I1YfSzbImrztrr0vEJ
	L+X4YfM0OXfi2saGVLCr4pRg2tI414GyP/v191OzCk4ctiPpHTVEWFheeBhq+c+FOEbQIZQ3qLq
	jbE7NuN1SZ6niF+22eCUXsxWQvPxYf+xX1KMRrkTQtzxwKCjNjOEasWk
X-Google-Smtp-Source: AGHT+IFWJbuxzG5PGAhdi/pU5rxjkdPZppgL/eUxmeOxk4raR2kOvlLshaMwLxlWaeJndI0mjBX4Gg==
X-Received: by 2002:a05:6a20:438f:b0:1f5:619a:8f75 with SMTP id adf61e73a8af0-215ababd87amr15480334637.2.1746964364580;
        Sun, 11 May 2025 04:52:44 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2349325e16sm4135001a12.1.2025.05.11.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 04:52:44 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D83E9100407; Sun, 11 May 2025 01:52:43 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 11 May 2025 01:49:49 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 11 May 2025 01:52:43 -1000
Message-Id: <20250511115243.D83E9100407@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 11:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216284

Branch: walnascar

New this week: 6 CVEs
CVE-2023-1386 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2024-56406 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56406 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *

Removed this week: 1 CVEs
CVE-2025-1153 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-1153 *

Full list:  Found 32 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56406 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56406 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  libxml2:libxml2-native: 2
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1
  perl:perl-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

