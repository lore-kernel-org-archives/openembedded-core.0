Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A23CCF9E5
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 11:02:35 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.8214.1761476552726783323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 04:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LD4iA69C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7810289cd4bso3622477b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761476552; x=1762081352; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG/Efp2hp9zQ5QDsZwV2GEZA0OiW8A4zHaCZkMdrA+4=;
        b=LD4iA69CEc8AngoPFhsMq4oPdL88GMWC+SYaEqCMh2rI9l55ReyvYMvDnWc69CfWZZ
         zOx30ifv1v/UpnnZLCvI9G6uE/bzG9QPL1Wq4/S6H4h6xKnkoWXRN9H/L48R9AzY7b12
         bZcPp0al9oDT0njHpnFJKjlToKnU4oj0lBOt24P18dewcxoUbuInFW+17fXY120fTrgv
         8Hq/0hUfzTSEiw+Gm7wbOvGnKAxypuT5DpuwZh82AgGsThfXElN0O+17gjICW5Mljhu7
         jiq0//G9rw84LlKsqId9zI6XSA+vj3qNWQp/RpoBnJnRJyLd0/aHfn7BIYFHgmU2ahv0
         hasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761476552; x=1762081352;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zG/Efp2hp9zQ5QDsZwV2GEZA0OiW8A4zHaCZkMdrA+4=;
        b=L5DRpAAxL4qmT/VT1F6EIZAOhVPbZHSq0iI7EJjW8rFkkh1IOdLls6LOOW0kXx8xZA
         +dsauRtTdASZ/cU/OcPiMXFOVD26C20ImJ/D6hwTxDsnDaGebOunw5fEqtj0M2IxDtuy
         HfQcyx51Pe3/P1DgqPDDqE0Ro6X44HwHQgxFfS7idQ/WHfoRKco3EUK7GpHAT7QloexK
         6cra5wcPXPHeQCMZgruQzP0kpTTK4rMRkOVhpD5yOERFs0n148GhFPTr/lV7via38AdE
         RKivIFJZr09im0mWHe9k7kAvLXfoMPK5+l+GWwMMG0uGvmd+zgYPiLaeM/UG2IJ7E3U3
         jurA==
X-Gm-Message-State: AOJu0Yyq+8YeW6X+ZF7hZqugCLdJcu+xcv+Y1Irr8pWawHGw4ClL6Atp
	zouAPS0bt+prsXOdz+nDPE4lDlz+BmGemX7QpJoMFdiwVstZKa27GyuKDla7r6RFFUJHQxKwx2V
	rHIQg
X-Gm-Gg: ASbGncs9Q1YLjAvhq3FgegYg3RmCLvl4mcb5ISUPU+Qgx7MU8lUgFE9L3rSZgrFillH
	YWikM3Mr5IUyjRIAhfaAz1JMid4LPvCS7bL5SfL8tfqeH/mhBmBzqBzcFN98GgywgbACBfExQAE
	rdRYLbvO0y5za5440JrmmBK5PdRqrf94dS+oivGsjNw/Jepc4fhZiimdM+VCUURJF+LSRBiXTKY
	Muiq9GL0ggwoRExbCpedn2RCQKdaFUPST7AeJfu5P1p7TT3OxRTP9YJciL5Pqbja4xMH3rRjtGW
	ER4w/wKHQRr2B14ke0gWFfWZKRU5BX5jHcoFM57t60ycfBd6/MEhQONGvdNOaGKtsr9imCBm0n4
	J6+R5seSQ1KqcQw6Bs+YKmsgpTawgS7PmAxZS5xMAM6OK2Tdw0cLy0G40X2tWEbC/a3tuYyYCrD
	xZN0y2
X-Google-Smtp-Source: AGHT+IFQBMrMzY1LBtiTz71hMj9ITkwxJEh6ICkX5TJEobQqYfvGAthJNSLqZf5zdZUrS++D0QFSNA==
X-Received: by 2002:aa7:888e:0:b0:780:f6db:b1bd with SMTP id d2e1a72fcca58-7a220a43782mr43426493b3a.4.1761476551504;
        Sun, 26 Oct 2025 04:02:31 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41402e554sm4680368b3a.18.2025.10.26.04.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 04:02:30 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 8A6B6100417; Sun, 26 Oct 2025 01:02:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Oct 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Oct 2025 01:02:30 -1000
Message-Id: <20251026110230.8A6B6100417@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 11:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225311

Branch: master

New this week: 2 CVEs
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *

Removed this week: 0 CVEs

Full list:  Found 30 unpatched CVEs
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
CVE-2025-11839 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11839 *
CVE-2025-11840 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-11840 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3277 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3277 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 7
  sqlite3:sqlite3-native: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

