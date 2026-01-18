Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782CCC9832F
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 11:02:23 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12816.1768734134570179428
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jan 2026 03:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EIVCbDVH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1075504a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 03:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1768734134; x=1769338934; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y049vKVAlPlJixQhXJ1gjm7tUZowfcUnlrc7+6aBSc=;
        b=EIVCbDVHIiemN41fMI17LrNDJ+1udTFQ3HfOu30UPLt81BW/iZQidZBMDyrxgRpYR5
         XmNSKf/AyNewNZuDJBjOTBV6gvvPNrOjrKmuYkNvfjoc7Jft000NhNXfRyvKCVLZV85T
         CvRH0Says/jcp/tYJlIQzZ7Il7ygaMB6u4zA9+9JhffYI6TYUZ3+8WnnMqWJaUOHgJVG
         gVi1BgwbhlUara+GXTKjLiZf+mnC7WJqrmsawABBEhwiEGFDg37IrOvZAfcFs0RiKfLm
         ssY9XYXgDNXqNYGSTx6EeTVPGbkyY5tgaL/6M1FbNZKbfpb5siUuP2WAhq23RCFAc2R1
         ialg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768734134; x=1769338934;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0y049vKVAlPlJixQhXJ1gjm7tUZowfcUnlrc7+6aBSc=;
        b=uOA64EDqHvZAPuMf/BVBBkznbDp1i9zzCWFWQTCOSL/FhIAex4Jp7/G26rbfPAUYv2
         62y26NGvpdlMAQGc2WUivcv0N5hVmiLgf2y786SqXB3p8lcF9A6fGceyo1qTiqIYXxPV
         AFDq+tvmS6ML+D2T/Khgy6ktltZ0cR16WuDMM5mAWREQGAHgNq5wVAMxnABO0VdFzwZH
         A1/heP7XtTKjJdX3M1qKUl5uzPICNlbIc7oMrDhAThB19jHn17NPNXtFq6tQs36/5qic
         /D3vrT8GLhAHw5U/mpl1yiiCVFCC8d7yVDejmsm0gnn/fAcZDsP3hcacoFF1bUdp3KD7
         effw==
X-Gm-Message-State: AOJu0YyvoA2c7RJciZha449pZ8FnLGxhwLRLNorLj+Qu3ofvQYx9t+mv
	qXeH5O3okuIsr6eipkVGPqS5M6oU71ptVnng8NL39IhkHrNxrA8E14qeDgu/07HN2I2y7mtCXHF
	8b3Kp
X-Gm-Gg: AY/fxX7KKni6jZwKS5c9TiPNKhkDOeEd49mAYM9WdPaLrMjpEJFQnWZag2uS1uHOAXm
	9LZ45+waXR4/ZK48nWG5oSGcNv3H5DZLCdywRuXec8VKDoRTAeitiy6nS/y5AnYEYe6KGL8FErN
	oUdADP6+bmXU48oQOPnOxlYwex++ZwTdoVwFhOAU6yZJupeGhPf5QGFXHtxMrGioJs27FoNpUR5
	D4k72Z4LJe1KqRjVNhh4taHMDSiFCxgCjhlLWUbdphwFH/LgJqv8RI6ipHyUMALbMyWy2koM0CL
	BS0UAd3YA5kTyla2E11ROECQpJ2qV3NztQS09cUUOa3id601HmXBCk0RysQvMfxoA9DCs5Ce6kt
	90KsMuA1p+IyolmWzQ8NiwCFfxYso4onJsM5pzEWGFl6gjjSpOIblnONcuvjCejYHHXC+lVjGdu
	rKadWtXapj7VoMaQw=
X-Received: by 2002:a05:6300:2207:b0:35d:d477:a7d8 with SMTP id adf61e73a8af0-38dfe628ca2mr8274203637.36.1768734133578;
        Sun, 18 Jan 2026 03:02:13 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf2330d4sm6614764a12.5.2026.01.18.03.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 03:02:13 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id A0B6010039F; Sun, 18 Jan 2026 01:02:12 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 Jan 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 18 Jan 2026 01:02:12 -1000
Message-Id: <20260118110212.A0B6010039F@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jan 2026 11:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229577

Branch: master

New this week: 7 CVEs
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2026-21441 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-21441 *
CVE-2026-22184 (CVSS3: N/A): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22184 *

Removed this week: 1 CVEs
CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61662 *

Full list:  Found 35 unpatched CVEs
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
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2026-21441 (CVSS3: N/A): python3-urllib3:python3-urllib3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-21441 *
CVE-2026-22184 (CVSS3: N/A): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22184 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  ffmpeg: 8
  avahi: 4
  libsndfile1: 2
  busybox: 1
  expat:expat-native: 1
  python3-urllib3:python3-urllib3-native: 1
  qemu:qemu-native:qemu-system-native: 1
  zlib:zlib-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

