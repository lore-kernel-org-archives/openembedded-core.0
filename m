Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3F7C02199
	for <webhook@archiver.kernel.org>; Sun,  9 Feb 2025 11:21:09 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.27579.1739100068468820266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 03:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PZ1OpTFz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f7f03d7c0so10485005ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 03:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739100068; x=1739704868; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuITJ4D38788tbMAMSCKfIr/3U06j4OYBMigk+UZMas=;
        b=PZ1OpTFzO0ZsMFlSihKPh79YEfXG0mOoHwLw7knOwf2ji8lMKQoWqVbD+Ov+ta2m0u
         Z6gkX2EMLgRVekjCiLtgzq86AW8bgsZ+Fiz1Sk27a1Dn0RonuAUsyLh+EI+wjVPfTpr9
         dcNLjYam59/7rho/EaAv4/65A5VNeXGvnfhMwVo8zRQAi1LU8bxEYn2AAKkKLV0AR52d
         UpXJKCj4lLBHDlSvXJI+cCTlJxFoqPLcdFc5HLK+kZIswMIJzlIlBe+i+PSzUZYnRVYa
         s8UAj0H0csvxWXY1WpSoXhZecuNg9Msyld6ajInCyNv+Tx/A+DO0OtU9iqMi5ZEVqfuR
         zRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100068; x=1739704868;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JuITJ4D38788tbMAMSCKfIr/3U06j4OYBMigk+UZMas=;
        b=jzL2UtqDTLg7W3B5XTvE99V/f9O7BMFUtSwiy+V5tJvi1k5kI5vr/nTSwoylZhPuoS
         ULXF7uPZ7sEfwLm/ra2kxPvNoMhesJ34R0DYZDFIWtqwaltphviD7zEdY7714atx+/Hg
         89uC2agaR7a/h/XbPOZ63Yo2sQAIJVdRSpVJRSQHfonjzys3dAl18fy7YFH2KZKnzoBg
         /jWUe0An5BvNkEQMV/A1ZHR4mSnzwsypVy93a+oF3/j6+FFU88C4GdTj8Y8fkFh4ulWb
         UdYVr7J26eQplQ4s3+YaDS9PUS7TldcK/bYSOpvpS1kAn/ytsQ2hJ+K0FyIq+3NduEhs
         iXLg==
X-Gm-Message-State: AOJu0YyefnhevuWhy3DDed7nLPZD6PQv+1hGGNCV5q3MJnZ8HHdKSYE1
	62C0PNUyhFvBLpw44wYTPGi2SSIcYSah8PAvO25NJKxnvR+95YUdDUOSvW0VIo7dXVLAilJpSu5
	V
X-Gm-Gg: ASbGncuVLC38v64qebIBc1aqq8QldBb5kwpGa8capIrYxUsZXMtoSmdKFzgyH8brNBC
	8vyYtECIrIigj89EjXAqRXiidBu0+lY5CgQRkKagviZETi2YQnVR+SfU9KqEHfkYNX2O1fP86OX
	eRGOlmDUdTqlf+zTySHdIHsbRcjCsuhIwI+GX5dFfONUcYKrA9Ij74uh4wrc2WgWfqlcskNgY+z
	AmN7vF1TvW0fnGyF87qMeHU4r73c9TTEYXTMwT9vbLHaPtcxg96xiJx8BX4Zxk/1LV5KwEyE2J6
	vE1/cEAVpPrrOXPMbVnP
X-Google-Smtp-Source: AGHT+IG/hJTDbZaepr85Foxb2Tj2yLLTSNScjn+qyfTikMqbSGdv5Bi0+moSgg2C3pvCAIYOazYIzA==
X-Received: by 2002:a17:902:d491:b0:21f:89e5:2712 with SMTP id d9443c01a7336-21f89e52baamr16538375ad.39.1739100067558;
        Sun, 09 Feb 2025 03:21:07 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm59322575ad.28.2025.02.09.03.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 03:21:07 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 9F2EE1003AD; Sun,  9 Feb 2025 01:21:06 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 09 Feb 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  9 Feb 2025 01:21:06 -1000
Message-Id: <20250209112106.9F2EE1003AD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 11:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211047

Branch: master

New this week: 1 CVEs
CVE-2023-3079 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *

Removed this week: 0 CVEs

Full list:  Found 19 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3079 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

