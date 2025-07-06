Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBF28C83F03
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 11:47:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.35543.1751802439283311336
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 04:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aNFLiCqZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23602481460so21694755ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751802438; x=1752407238; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rruj04vlYREz5zK6Q8Hrh+CVwRrSv7AG2KdOWQnjpcM=;
        b=aNFLiCqZnoQF3rYFVwbDTEY/sVq17jDpwHBE7Bt33JFsmteuBDsvuMgdifRgOBPIK1
         clbhtuzp4P0E5gBLaEGbzYmO6CZaRZz/47hjkSMmnyCypO9kN1d4hv4cOjYTQdCVMNI9
         TOdB6KxgTgTEE7XYHBFPg4oZiblwpHXNEEaXrjziEL0TEuYWmm2FLsgSJBeIS4llHK1h
         lKvdq3lHgkH3JgrfB8xCq7VOC/FpLa73tHab4uzM2/FIqusEpUC7Ly+wAYk9F4chrQww
         oQinoYOWgUsAyI+4WvXtsyGwODFfJpShFFmueT6kB/eZ4Jnq4Rame0gnR1bULIyYeO3R
         yNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751802438; x=1752407238;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rruj04vlYREz5zK6Q8Hrh+CVwRrSv7AG2KdOWQnjpcM=;
        b=G87z9PX8LowddtJaeX+zJzn3fJr1S8rgHBi/OQTxIzSzJdxdtVe2L6nE9aSnh++Spo
         D8zKIKQNJ9aqObbjfCj5cHg2bzXAdW0iVro6fqCRSBtWG74bZjECy55hRanmW2yUPE/C
         dUGRHieXWWudLCmrU7P5TOFVc1oPPP4mTf1bvIoWow6Ci1u+wOL36HAD4Yc0SOfI5Tf0
         1NkrjD1f4QLN330+SBzDXgdkW895ZXPbQDjeB74ZrGbpFHffgsF4n/dzizJwtVMLxQhe
         VgcINHfFwAtnDZkf2fliszwgwxWgdAnWwblCKI8OcH4nBvbHJgCepB+yF+SSbZrAGPh0
         FTAQ==
X-Gm-Message-State: AOJu0YwtgjQV6iQgpdt6EKZYq5FtHUcPRvQhhZcs5UKGj1QGk4py/wBh
	5Xz73MXHnSRr1pwJvHnb4mqSrsq/WwW+EDNbbNJw4nObT4uC55g3H4fgxDD6OTMo+19FsRjDMEb
	z6P7jmvs=
X-Gm-Gg: ASbGncv/Cyfkal53SYq6+kkTT8iQp6BMzU8zZiXvMuv/flntuLzmQOh2doiHpKGYMbZ
	I5ETm4waUscg6OkYC075ROo+OI62EwWci9UAl6sVuVrkmmJXjvC5+ZUXsppgGqPfh4DsgoyZWTg
	tzYNRtixL2yNV3G0Cx7uq5ZyyxalqK5xQa4fxFzjDdkQ+WUVQvt0Zfcj4s845iMCf1zEYbYS6kn
	fgFqhTzGmOhvypejVDp2pECdrDu/A9+UOvG+k/OQkn+l5Gn00P52Sv5M0a3bysCYl6motCDd2OV
	UldEIQpyh7Yark5/4hWHDlu6gKSheMBSESKm1NSSVWQA7eP6EzPdfQople1/wme5oVY=
X-Google-Smtp-Source: AGHT+IFrtID0oecV43RViy0SJMxHT8T1ULWzzWdHuf3ZDALI4FpS85SN1sx77dAVIBC31r3IsFhM7A==
X-Received: by 2002:a17:902:e78b:b0:236:6f7b:bf33 with SMTP id d9443c01a7336-23c91057f5bmr75758365ad.24.1751802438505;
        Sun, 06 Jul 2025 04:47:18 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84590692sm64608295ad.198.2025.07.06.04.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:47:18 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B7002100415; Sun,  6 Jul 2025 01:47:17 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 06 Jul 2025 01:44:35 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  6 Jul 2025 01:47:17 -1000
Message-Id: <20250706114717.B7002100415@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 11:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219966

Branch: walnascar

New this week: 0 CVEs

Removed this week: 5 CVEs
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-52979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52979 *
CVE-2025-47273 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47273 *
CVE-2025-5914 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5914 *

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
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

