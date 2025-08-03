Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27469C87FCB
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 11:47:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.15617.1754221628296414801
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 04:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1D5jI9nk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24049d1643aso24102595ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 04:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754221627; x=1754826427; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6H3rJIr3wI+kcrl2V6Wo73meVqYELwZcvTht9I0cyg=;
        b=1D5jI9nklDz3pntIIswx7u4OJrKAtpcCeonzuKHCfFoXqc1e1RJbLvdZJbPxirsaU1
         xC8CXmGAiF/MMx/agmeh1ySq6Q3SZG5WFwdpJW5TyO6RH0CR16S/MR+P/ZrCbeiV48gK
         za8X7UI1uvmjwuXwxfh+mIi+mZsSo9CesJ7VdUI4N+LW5EfHsXUep3o3ac00x3Ej0Krb
         erkUKVhxeB897PBGSRAgWfmaQSyXogZ6kZz1tERWfgWRTEGqoaKwTrpLqB4eprFUiAQs
         5dvIi4+EqOrUczMPtmztTnL1ZXLlLAg68E5VWpobIa+I96vu25193LJ+Z1wTNUMz4I5m
         hzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754221627; x=1754826427;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a6H3rJIr3wI+kcrl2V6Wo73meVqYELwZcvTht9I0cyg=;
        b=tl/COrWeAKEeGvL7PO/BLt9svQk93hyMpZf2LCtS9oR5Qj8cjGXnT4Yc2YQQGR7cCb
         +Et2VmAwm83fPRySkO9bSs9QvgWMakXKKbuEwOGiU/kK3Lc4JhbYNR8szdTfWHSuN/IA
         w85bnVLOqpie1Acg/ADd5JvT0HGw2vwFvHRJBStLJe+T+vMUERPRfcfVwrCFuLI4jeYU
         9lah4lLm6OBjokscZqazTLwlmzkjycRe3FoirCI4YtOsuLjWobQFzuKNhWtVykXcm5av
         9f8Q4MboI+FsRQeGjA0NTZajPRjI+1OVWE6oqygSv5d5dBxS4AFE8i6I7qQG9lZukNi9
         azKQ==
X-Gm-Message-State: AOJu0YxSoQeQW+0KeWYEoa26ow7TCWRNEs2QRtqtTzJZXsRmZmsQRAom
	JYAhJcOcREcgYG7PBUVadvHiBV5+RVkHsGaqVIt7p4ARpOdoC3W/wfbMSbpZcpFPnUA7zDRdkNL
	VbTL6Etk=
X-Gm-Gg: ASbGnctzZkTipI/wkXB5PngNFm2fLotrFoXQWrikRiHnNJERhg+YyfIkTaOTAsp86cS
	T7bbLp7DOyIREMV4u8NFRixkEk+kYg021o4aBI+q1kxFy4f4BJT0TfpgiGhgG7D5NhXz2RAYt5g
	cjZ7RgJGW//0E2wlKR4JhbRiLqQ4MD/gTdoudGoukmCLsXd7yU28CCndDvSh2vO5t1pG0hm1JYV
	fb8ktEnp2xOMwTOZIr8UZgEdnsryGD/mLHFldOfSRyeQgbcIZ4aRXFyXabQ1F5rYTvV2lh4GCKj
	DS4UCJcQswaKVK5LTUlpkS2PS0CMShe3p9rMWtP3zL/SkxqD32h1xtMxCCYvNWGiEd55Y/KRaMX
	4L/OGg17sXxp81GPutwPEapvUcNAvkybN5vDx/g==
X-Google-Smtp-Source: AGHT+IEYqgjgm33YWwrBPFrV+7zlWg+qvMh6xetnD5LfV4X2lUxtcm8eOG1ey46OR6HFjgu2y/h4sw==
X-Received: by 2002:a17:903:230c:b0:240:8fd6:f78d with SMTP id d9443c01a7336-24247065af0mr89800475ad.52.1754221627552;
        Sun, 03 Aug 2025 04:47:07 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef7d96sm85564435ad.18.2025.08.03.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:47:07 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D5E91100405; Sun,  3 Aug 2025 01:47:06 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 03 Aug 2025 01:44:40 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  3 Aug 2025 01:47:06 -1000
Message-Id: <20250803114706.D5E91100405@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 11:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221411

Branch: walnascar

New this week: 2 CVEs
CVE-2025-8224 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8224 *
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Removed this week: 1 CVEs
CVE-2025-47436 (CVSS3: N/A): orc:orc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47436 *

Full list:  Found 28 unpatched CVEs
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
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *
CVE-2025-8224 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8224 *
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  grub:grub-efi:grub-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

