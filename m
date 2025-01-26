Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A493C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 11:20:43 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.28293.1737890437514531417
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 03:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VClJoUIy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-218c8aca5f1so84406565ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 03:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737890437; x=1738495237; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+a3tye/PKKBYJO0s/k1aCVnxJgmEBKLb/mGe1hISxQ=;
        b=VClJoUIyFwS/UVrEXIYcFLG3jsfRpZAtv/WctXH0oE098xp6KanaKGAmb6I8A3gGNa
         egxzJRjOr8PZZ2Q826NmUTu6UCv/6O0aROxuwxyE02dWLta0KHU8MtbxHHYPRqoGHbIc
         cGkkeADHiiGiKwoKvcau8lqGyAUOyX2LRtf56XlB+3WSQa2sANvxXmLzLC97Fewj8TlY
         +bviQOnzJVai4cYD7ZSBAkaijwXXFrhR388W8pUbISqGj3C4wHSY++LAKycsglm+Eft6
         R58Hp/cKi07ftdD5tIZkzD91859nYwf0BSNsqErAWnqtFHQ9BS0hrTqckK5lDWgXpETr
         e+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737890437; x=1738495237;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+a3tye/PKKBYJO0s/k1aCVnxJgmEBKLb/mGe1hISxQ=;
        b=Sd/NugRa1ZLIdal5FVv1T6XuUxsSm6OnPtoojQPLh7KNx2sull5xUvyhHhzao0/npq
         KMUy/XGK4faltcGdI2NmxgdAvxw/JODePN0WTaRFJUFvaYIVFm5xCLOSN+3sPpZExaT7
         vc0rlQhWEprqagBppZiG0vXWb3FopJlKGAinCQJOwKFA/g1AzJ2It85jfZYCraB55wvJ
         HL/dF9PxnL7ZPBDBTQup4DUvWJMv28SsIHbfAFSWpwoOI1DHmuS2LgKjTXrxygjVOZMe
         vYB9SP0nCHZoJW394Tbbx1mizNBJdwfbXdEKMaqBEiunQVpyLqfBmrE5Po7Mnlg0zWvo
         TI2g==
X-Gm-Message-State: AOJu0YwLT7fHnmthJOTy9EKV0+sFshxgcdYQ453YXw7rBbsGQfhJH7oA
	wsUtJAVrkY7057ODYNVXxC8emxb0zEYupJnFbHyWmIye4wgyHXNyVnkgn0h4hwdYiDr++OBXMQZ
	7
X-Gm-Gg: ASbGncsxdZFjqK7rqrSn0nZG+fmNosu28daEABK4mZtz81QhGw1je+6umb1oS3b99vn
	9yLE6+5U086PDxkRfyvoI9SlXG5jMYnw2zYj3oQ2+4nMxUEPJ1MXJ1OITWs6D4J8t5u79hBwSCv
	qjn+utQbfT7nEph0Z7omdRRiruuwnybpUU7jlS4+/wlwKIo+klEgJUfJGb6GDIsv5icaJiavlvu
	KIHfKcvVddZ4U8o071s6ltqtZ63ASagpAM0vAMin+0kr0jH69RAfz1M8p4VPKEnQpzbkU0YhX5H
	g2ErDpeWUA==
X-Google-Smtp-Source: AGHT+IFvwIveGNOQaCfPj7f+3WLrwYZbkxrXfFA59XT6vBcqxdI15alGobm7n9tVGmsyUBeqjM484w==
X-Received: by 2002:a05:6a21:3406:b0:1e1:9b77:e237 with SMTP id adf61e73a8af0-1eb215dab81mr63498251637.40.1737890436634;
        Sun, 26 Jan 2025 03:20:36 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6a02bbsm5239420b3a.17.2025.01.26.03.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 03:20:36 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C9BF41002B5; Sun, 26 Jan 2025 01:20:35 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Jan 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Jan 2025 01:20:35 -1000
Message-Id: <20250126112035.C9BF41002B5@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 11:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210273

Branch: master

New this week: 3 CVEs
CVE-2024-57940 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57940 *
CVE-2024-57944 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57944 *
CVE-2025-21658 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21658 *

Removed this week: 0 CVEs

Full list:  Found 21 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57940 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57940 *
CVE-2024-57944 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57944 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21658 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21658 *

Summary of CVE counts by recipe:
  linux-yocto: 18
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

