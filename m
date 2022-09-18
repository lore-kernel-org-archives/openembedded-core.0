Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96047C32771
	for <webhook@archiver.kernel.org>; Sun, 18 Sep 2022 14:02:51 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.8941.1663509762395614374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 07:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xiMThVyC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id t3so25719394ply.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 07:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=tVHYQa9cCa1CyqqOEooYAbyMjnj2Cng5/SVOg5Ise14=;
        b=xiMThVyCNSSMFgEEes0XMsEXUDRoHE6+SR1KgemqsWr6t6+KpgaWYYiL4713c/ckrd
         Q/+xOnaVi3zbdBBYnySenUjxJCI7OvI4SBkDSEp7j1nED/71ey3Sbz1uXLMNySTgDgdr
         1xSM/1TIktDooAPGZpweatteKHXEHIQdwCvbM8Tf4M4HBHrpZAcxKRgBbOvlhmsBDTDC
         3bm38SAs6QgX06Gkdt3HhTW3jgIgJYG4AqtaD7/CSvtvwsbjXc3Q56MNXgL8jO5RKCC4
         2B12JG3pVgAKb2kKvnp9sl9HEB9C99AWupsBJvglIafbdAzoAkRGaf2dpbC6Xi5r/6k0
         rgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tVHYQa9cCa1CyqqOEooYAbyMjnj2Cng5/SVOg5Ise14=;
        b=XIkc4cFLF2CDBycLtnPtAywQbpBszCj0tBd6PxkJHd1kMDhORssk8CGwam70zWv+EM
         noAGVGKiQFaXUSGSDr0izT0q6NlHroi1bHj7vou1p/VNzD78HMEiKz86Y9PE1x1/1Pd0
         AoEXnOjR5s+Ifa6oNevEC9ytLSxSIbSmE7WeEsc/ZLLYoMULAHnZUqz+kCvQEH1yKDx4
         3MuGFP1vb33dIqJMdIpMbxQ4j/3X4MyQ3uiSK0CSAMY5hpyElchF/koe0Y/qRU3guaoi
         6dUHNvY4y2kU8LVVJMnZt4RodmB/ZfR51EV7/IZPxeBbftmm8BinRpzhQO2zNOC1yZ2j
         Z+4w==
X-Gm-Message-State: ACrzQf1xnDnVcj51DQEYDJiSoSkax5LFWXx0JGT2iF90TWqqnTTMwoJL
	uc3+UMXllp7V8fzXovaldgsTgwUBr5g8Z1My
X-Google-Smtp-Source: 
 AMsMyM5PfIotU6ZeGAyYlNiWqJyaQj2IHqmxSy4Sv3zUNxPsBXB0ie53BrHza3TTEHRFsOQzL4wFtA==
X-Received: by 2002:a17:90b:35ca:b0:202:61d9:d2d5 with SMTP id
 nb10-20020a17090b35ca00b0020261d9d2d5mr26307496pjb.50.1663509761288;
        Sun, 18 Sep 2022 07:02:41 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a170902778200b0016c50179b1esm18442382pll.152.2022.09.18.07.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Sep 2022 07:02:40 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id C2B8096089B; Sun, 18 Sep 2022 04:02:38 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 Sep 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220918140238.C2B8096089B@nuc.router0800d9.com>
Date: Sun, 18 Sep 2022 04:02:38 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Sep 2022 14:02:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170848

Branch: master

New this week: 1 CVEs
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

Removed this week: 6 CVEs
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-38126 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38126 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *

Full list:  Found 10 unpatched CVEs
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4158 *
CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1354 *
CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1355 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *
CVE-2022-39046 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39046 *
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

