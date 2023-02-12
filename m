Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1E1C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 13:03:15 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.10290.1676206991782284791
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 05:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KIJlzEo8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id bx22so9564556pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 05:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VleB7TsWFAGAsBO87RYT1k3LR1WOndTyawmPJP6bcsE=;
        b=KIJlzEo8Yd7NiZc/f3q1NVl024wfDQ7PwcgfKn60rC5mHii2911jBGEbJN1DchgN0+
         V5gfS4okj7kfeFniGS8K31xlkXUY8cSixfdjOrJ73Tje/+46ItjFlfH+5UgGXZXb6SI3
         1yD7ZzxX9/b7VB1KW6ndaFGBNNDZOTgWE3LbzVWkSJUdoCXRlUnWa0fsbBwFTCOcVmEn
         Ku6XNyakHOPuPoSrTBZCOHgxWsLKA49O/EOgIcZcvAVCTPY57v4bIH3xZpoCV4b8EPc6
         xc0o8r3iYC1BV9B2RXF2ba1hulEzyY0tEDwkyC2WLwvibMwKNGUylFOGKugcWqGWlZS3
         +YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VleB7TsWFAGAsBO87RYT1k3LR1WOndTyawmPJP6bcsE=;
        b=ebxc+fuPfJ1HwfJB9xCoZ4TUp2TwEsK7pHtN8qpp+tEmDPpsFwA9/pndZp27B5pecC
         3OrAh+m8B9rDnDJ0qksMA/v6wf/v55JkeYptaQ07cczN8sxIVrApMeIAQZhf9x7ZplCa
         oJroSnZWxNUNIeBcAqaqG7sfbhuBoYnzNHqapyQ1jOpj790+ogS7yUWp23sQtY+73ISB
         mT2RuhOe+NHGooQmKPSlwv9xSDALWHng2wqmNJVCgf9nuCu6P5mmYGxKeO3JjMX/WTQa
         vTre1bzt/KxKe8a2zsJFkJ0JBZKl3SqX+eYOePjgJGwzsz+5+YNjHLCUCAacRCyWENhd
         nQfg==
X-Gm-Message-State: AO0yUKXntmP8PTn0CS4jgUyA+h89oMuxiDo/zKTvjfGX989KbwSEBDNz
	VqEEsi/JnKSKdKVM7gTUfrBfBJe34pkQiMNFAKg=
X-Google-Smtp-Source: AK7set+1Wko9QU2XBLsDOttTxfPJtGbt/HPAx1qn3O8eI5nL0DOhd0HE7n1tdIjC0V1E9UXqkGj7+w==
X-Received: by 2002:a17:903:182:b0:199:14a5:405b with SMTP id z2-20020a170903018200b0019914a5405bmr25454353plg.44.1676206990694;
        Sun, 12 Feb 2023 05:03:10 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y14-20020a1709029b8e00b00198e6409d17sm6317335plp.116.2023.02.12.05.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 05:03:10 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 44481960403; Sun, 12 Feb 2023 03:03:07 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 12 Feb 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230212130307.44481960403@nuc.router0800d9.com>
Date: Sun, 12 Feb 2023 03:03:07 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177041

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *

Removed this week: 2 CVEs
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *

Full list:  Found 22 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

