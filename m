Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8943DC021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 11:21:39 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.65021.1740309692020424201
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Feb 2025 03:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L/cEqZ8k;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc3db58932so5191595a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 03:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740309691; x=1740914491; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXzhxluw6pH2Pjzmkkwlz0EnzMk+qFhe+W/JEz142Pc=;
        b=L/cEqZ8kBh7bh2zJiwB0Dwndzg+gng6mMdqclZrtvuEOz/j42ZZtuxNyw4WNA3oD3E
         TLTTH/hPOFQo3sAJVI3SThq/CAUFrZ0K3FWMNqSZR13/R7mP0Dlb/VFR0s5gvUqy2/m/
         Ai5swlpvkT/2mAJ3hHFVIELyoKNsq2zOPwkuBo/80UXLgRLIfDKX72tipXskyS0Fj0/4
         Ik+j+LkgR93YRJJmipAVy/oiciYzAPuJOlOe/Yc3lW+R3Qz68+iCC1nv4kCrw7QB7aSR
         dZesgz8eBrFGgOi5oQtIf6gysSrlwRMTYyRhcPwrC754GeI/sl4pB3OVjS9AsKf8ykPz
         i4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740309691; x=1740914491;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AXzhxluw6pH2Pjzmkkwlz0EnzMk+qFhe+W/JEz142Pc=;
        b=IXLHRAo4cfGXww02etden/JiTzGvox50OZcTyjzo3hl8YxMsjEkcGXfyKTLJykR+k7
         eSryS1pqfz8uKHQsP/BVV9W/NuqVG3l7tpEBlCRpTBLnkwKVLi3R+II2rRoMNlfw2xuN
         ylANgnbkdlAIx59GavMCAFAg3wpkiOosjRARtjtL9mFNTABjJJ7f4t+RsaCfl/B/MxhH
         WycF+mz5xfhN+FerksNfF+TD7rQo+Mqu/dZBZNhfkNQYnoDV9GfA7rCEEn+a1rlLCgIq
         pa328Z+Km+1xXHVMcsao0iGiCXHquxpWaxC0QyocCyKRgUZp4iADCZogWSa/isdjD6+K
         EUuQ==
X-Gm-Message-State: AOJu0Yz3j1XhyStvCoyJVdYu7vKnj0ftgrR0my7TuQrTIhL272qlOX9v
	8mYZSzOMIykmE6gckCYUj0FTHj6PeTMJHEAAW0u5nSFbgwYAlWmf4jQsG38t0IhTQ9RfN7H3xo6
	i
X-Gm-Gg: ASbGncvSpQLTYViGHhYLF17fEKmeubbGfV3WeRw5mNBwalfCIMAYQSGnDroLxRMCl5r
	v9YRyqB2X6D95sZUNhmVvSW61E5llB0suyYNdCKQEnckLbPCtQ7vtislv0P+fA6E7qEUfvpCRgP
	G8awZWebg7mNvgoHWwxXuG2AnX/WzV7IZDpCG2Ja40p7qX8CWnOouIB8j0NQjBphKN1/fJBM92h
	cxyFLeEPZSk51xdP1cXwrSpt6wzAWxf+MSPOc+m2InRGbqJlnnXMU58JxqyYvhAsq73M8D5KKiu
	L7LRiywnzXieIuGcYD3oyO+FoNvkWvA=
X-Google-Smtp-Source: AGHT+IG1ppCIjXCMJn+SPQ1ACgD4wqMLOc4JAIo6uWnxjEfAgcCykDydfI7lzQe69N3Ys+dUZz8P+w==
X-Received: by 2002:a17:90b:3b8e:b0:2ea:3f34:f190 with SMTP id 98e67ed59e1d1-2fce7b051famr16391348a91.25.1740309691088;
        Sun, 23 Feb 2025 03:21:31 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d5e6sm162107615ad.173.2025.02.23.03.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:21:30 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B58411003D1; Sun, 23 Feb 2025 01:21:29 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 23 Feb 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 23 Feb 2025 01:21:29 -1000
Message-Id: <20250223112129.B58411003D1@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Feb 2025 11:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211826

Branch: master

New this week: 0 CVEs

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

