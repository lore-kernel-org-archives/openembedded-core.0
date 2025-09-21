Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C80CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 11:48:41 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.28053.1758455318893663441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 04:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I/Z1KIe+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77f2a62e44dso715027b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758455318; x=1759060118; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax8p2WDz4HfE5xDHmdU0lJtz92NhJBESrbZfl9GoX/U=;
        b=I/Z1KIe+DFSfHlFlFPXQSFFJj8+vHq+G4mu4HVhpDAsOAvRa7Gzt1V8HQtPA1ciR1i
         I3ejGC6ZQ7yF0yuWd8Dz947o3abW4bZlC0lH+0d2qT3Ttlk20UZFwD5tI0LsgG6LgxJm
         0DRcAW59Jjf01LhQcqRVr/UAwxy0gJKfKgwVeJvo55PxB0Q8MDsrx/auRVXpBn3rPzm5
         4jqTP22zOVF9KhZbTstEAlglcLfGLkE7jSL21gjAGjN4TsV4ycYLxLkavSEsvdYE13gA
         cGM0jGFagzwzTOLYgAao5eeUafcJZv/0z+yrq/LCIuYR53oYD74576cGxWaP11uqYNe4
         J6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758455318; x=1759060118;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ax8p2WDz4HfE5xDHmdU0lJtz92NhJBESrbZfl9GoX/U=;
        b=qvgrw3/N3Nh2zxEZIG4iOXxUOp6PcKLurUHy4CSRuQMqIaavESKPlJeGY23ZpAuLev
         JwIU3KER5TBqaYkL9MYlZafmlLsGUcbqwU62xcjhBqU4FI39wz0454rtkOS9P3Bs6Pj2
         GFsxfpiwhwuHRqj8ydPklZLFmB6F8GJelKsiYlXkxS5/O+Gd8ndscfL2s7/iftr0dhd/
         PEtZBX+EM6fNtqfGIkoLOkd19SvnO8cuiWOSj6XsAHW2Q5sRuZka8wUoqHVUNo7QfDeY
         mBKhlp7nKf1w1UKnKt9S58L2YjvDIkwAcI0RyLoIIa/bCfjr36RsDvGiBHmYvZQngSr1
         eO8A==
X-Gm-Message-State: AOJu0YzfvVmbOmXNdAlMzWp289wlI2vjSbSNPdAgQ0yCD/3f/A8BTOaL
	4Ui9zZ1J0xThx+EMrSw+zrIn90gPnPzCOvirsojQK966PaV94WDQwQ/ZkIFKyTAOMsHUqVh7p7h
	lORcHuxM=
X-Gm-Gg: ASbGncv7inbY9kxrlDsW6adrjQ0G0T62xg+zCbrNedBq8ZliNFPKjpJG1q6mOnUadaG
	GuYCuQM4aYmuVm5CoA74S0RZ2LNGxNP6oiwYs7cs5Dj1GG4U9IszKA8bFP0BzVrmJ5aFMh1A+Z1
	jmOlgXTMFTb1sMbj5zKQpRa55/M9+SnjNSTWOlDPiaOZpcShRbE/X5evSB2kNu9Y1WBAJ39kXQu
	YN+39FrPl0Hs8428OZMIkjRTD+vq+Wh0z67ayIbjBEvwerlhy1jnQ9GgBIaIybyPU4Lp4hUauMq
	366LPDfYu1yli7qHhxoxXLldg4guZN76yTTnHVRDBJHQhnQJSb8OUwHnOktK6+iVcQxN5KkCon5
	K6gQHNN2CuocLY0kh8GvWyx5tn88=
X-Google-Smtp-Source: AGHT+IGco02OmbET1uaO0sJPQ5FXkXlFUMljhHQ1oiBX/2j8+FYp6PxSMAFL7r0awLKccV2dXHcn+Q==
X-Received: by 2002:a05:6300:8b0f:b0:246:9192:2781 with SMTP id adf61e73a8af0-2927154c9f2mr13135908637.47.1758455318171;
        Sun, 21 Sep 2025 04:48:38 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33060619253sm10378157a91.4.2025.09.21.04.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 04:48:37 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 73F9B100387; Sun, 21 Sep 2025 01:48:37 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 21 Sep 2025 01:46:09 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 21 Sep 2025 01:48:37 -1000
Message-Id: <20250921114837.73F9B100387@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 11:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223793

Branch: walnascar

New this week: 2 CVEs
CVE-2025-58060 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58060 *
CVE-2025-58364 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58364 *

Removed this week: 0 CVEs

Full list:  Found 47 unpatched CVEs
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
CVE-2024-11586 (CVSS3: N/A): pulseaudio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-11586 *
CVE-2024-2312 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2312 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-2759 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-2759 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-3887 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3887 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-47183 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47183 *
CVE-2025-47219 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47219 *
CVE-2025-47806 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47806 *
CVE-2025-47807 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47807 *
CVE-2025-47808 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47808 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-58050 (CVSS3: N/A): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58050 *
CVE-2025-58060 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58060 *
CVE-2025-58364 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-58364 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *
CVE-2025-8851 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8851 *
CVE-2025-8961 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8961 *
CVE-2025-9165 (CVSS3: N/A): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-9165 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  gstreamer1.0: 7
  tiff: 3
  cups: 2
  grub:grub-efi:grub-native: 2
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  libpcre2:libpcre2-native: 1
  libxslt:libxslt-native: 1
  pulseaudio: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

