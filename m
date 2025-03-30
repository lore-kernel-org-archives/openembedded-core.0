Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73201C36011
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 11:10:03 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.28289.1743332997061714997
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 04:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=axceIvQx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22580c9ee0aso74377955ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 04:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743332996; x=1743937796; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiOlvVTsJpc+d0o18+B1ABv4PWzGFwYxeFDbV9BRfQk=;
        b=axceIvQxsMY8x7TZe2A0EiMYhS7/Xytk1evPTP5dHtRSWmE7pkTmwFWwdsUIskJgRi
         n91Q7D4OzwNUZ81J9t8wegzurEETXJQpaP7ZKLJB6f90MLX0Nchw+9uSRI/EEYfgdRNz
         tgSQDXl7RTHt3FjazCXNHa2FZlQP5hXVEt6O3Yh64PNd16GkvJgLSym5rFo8ZPqGpYzp
         xu9JUOlJsGMFwrPnfWxgVlMAj03bCnPN5MBq4McA6Xf/NeqkiiTdNq8jSVUL+f+nZ8QE
         BwtwJUHdkvRpksYr/x1tuSI4rYYY+D0tzLCgrWl8DrontQYUPqgQAF8tLGLSuRlQEZVC
         S5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743332996; x=1743937796;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiOlvVTsJpc+d0o18+B1ABv4PWzGFwYxeFDbV9BRfQk=;
        b=Me51+7ux+hoDzCQFojlyU/Zm6coTlP27lpj5712aX3rxnboA8mhKcJej1iOtLP7O3M
         FFD/pRm68Xq+7PFr69xbaPVyoUUS0na4uB9zO/M3jAbYDP9GDAGWFCCJQ99FlbeZ/hfY
         S/ojybIMqHEyL97XkMUv8fgKZGG3giRX4kcGJbLwu+Rb8sZIR1qLtkt1gf9DAY2dFy0B
         fkO5nw1RugMhx6TcfWaH+0aCwej0TneEJ+9AHJjT23T8A9QWSzfPkXUxuvxLNDn+B7Ja
         +nIMSis5AGZwRYt61bSJni1xqjLArTWSR1epHuNsW5G78evuOHPCPjY9gIYDIWNL0PAs
         V9aQ==
X-Gm-Message-State: AOJu0YzPB70/rrK7PlJGvy+DGDEyuAcpHn7bBFkwn+UQk1gF+2jvgRF5
	Uo5g3jnQOJ+vJ1Sn7LxrIvIwSxs7ZAiKHebQcp+Al653jAUzbaikuJ9JV5+acPf+V7cY23/ne+a
	3
X-Gm-Gg: ASbGnctbHk3uKBKh7/OqEVytVncMe2k4DyOR2eiVAOihlaZPZ+qtZewP3K7ikoOgTsf
	fRW6oMGPm3AY7pFmzEI9sYTrdw0/20gT7O9I6JS7JNkf6Evk61Oo0Yuj+DIGX7Fn/evDvJYT6p0
	TptgHNAy+z6SOvQT6x8Ssy3Ako41tPcmzumUtO+0G8+5Jsy+/oXhYCjkWGEzq0TZ24Evkfu7JuR
	H8IK1dgfnsFSjGmhQocUgUAlI71LL3MfVG3NvgzP0jP8TF2/qZJYOZT0acHRnjG0w3x3l53Oejr
	d5xEi9BjaU7J329ByAsLZH+2UZQSt/0pYqZmr4mW4AsJmgSeSuwc0yOVfWi1
X-Google-Smtp-Source: AGHT+IE+zkWgdsp9JQwX1EGeb5Uhlb/We1fqdMRICmfdw7oTz4QESRjT1uyregyoPD2DkikPDV8miQ==
X-Received: by 2002:a17:902:f54a:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2292f9f2bdcmr77555855ad.42.1743332996198;
        Sun, 30 Mar 2025 04:09:56 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710acd6esm5137410b3a.145.2025.03.30.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 04:09:55 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 52FF31003A4; Sun, 30 Mar 2025 01:09:55 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 30 Mar 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 30 Mar 2025 01:09:55 -1000
Message-Id: <20250330110955.52FF31003A4@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 11:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213916

Branch: master

New this week: 2 CVEs
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *

Removed this week: 0 CVEs

Full list:  Found 22 unpatched CVEs
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
CVE-2024-38381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *

Summary of CVE counts by recipe:
  linux-yocto: 19
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

