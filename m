Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF45C636D4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 16:59:22 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.88892.1675789157632738370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 08:59:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=DDmpUiUN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id w5so6252159plg.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 08:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ig/88k9x7dSEfBDu1QSfawJK4HuVooWYXuTZ5lG8LWk=;
        b=DDmpUiUNlF2gHAa+4EM6WFpu7e7My9EmLDGCUZQxbVY+c5sQuWSb9VPT1N46sBbywe
         M8Sn4pEFikifNVvStN/2XPMLj9ruYa+yDgQCUJRyE5xaN4yW1nMlprAQe4QJ6+nuuw1/
         d+ao8UCYQY8c4mG1qkcwI7zfRzydyp28S3X0uInymW8RsD5OxDxrq3XGlogpF/MRPAyB
         Nu3/N+gCOJp6vldxbDXi4M1RE/MO2Dqs3ly3RZNh2f/5YxoVnJgVeNhajgHPSrORgqrc
         qMqJbIWm8kmN7flwgLSOTfBTaGi/iDnpprtaxLLcAkRjYXPcRxvh+/quMkpnxQySqjBz
         /mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ig/88k9x7dSEfBDu1QSfawJK4HuVooWYXuTZ5lG8LWk=;
        b=2900BQbN1IWRPi0ahtw3Q6rskrkcZxAeW0E6GULBmyWc9Jg/52bfamU1zW7yg4LlPm
         oqJvHczxV3J/85Mc3G/SM90Blem5h0jeD37UvvSe6qVPZPjhvpBagwcXjNl8enfQRC2F
         rlb/DdLPjLnmDrLdL3l8R935tqdnlZhI29wfmKmDyvGag4QZ2eMGD2GHJNKM6J30UmsN
         3bKSqnDN4eg6M1A3HYvHG+RRNCLsUNH7c0ePwdAkyES9OtVllXyMIveLVizXPNTV0hB1
         XpafV4MJRLOZu/IiLaQf45bjcm24uka3Jlip8qBTbzdAxkbppPM7SAbQzL6ZF7FK1K7c
         5+Tw==
X-Gm-Message-State: AO0yUKXRr1vXJCQDEtCWNz4XZynu3cQc0gIZFSaxytZ81NOCtZ+Xi4oa
	TU3zG87mX+ck1cWeqozrYi8y8czIAnB+pS7KTmU=
X-Google-Smtp-Source: AK7set9ECkycGvOUqs3lQmo9nTMFlmjaHFqdxbSB7qeuqIcc9YTBEFfacLwdOXurJpaBUfjzV+RklQ==
X-Received: by 2002:a17:903:2307:b0:196:4fe3:21b1 with SMTP id d7-20020a170903230700b001964fe321b1mr4433122plh.27.1675789156746;
        Tue, 07 Feb 2023 08:59:16 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902eb4600b00199025284b3sm5654054pli.151.2023.02.07.08.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 08:59:16 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 67E549602F6; Tue,  7 Feb 2023 06:59:14 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Tue 07 Feb 2023 06:55:17 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230207165914.67E549602F6@nuc.router0800d9.com>
Date: Tue,  7 Feb 2023 06:59:14 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 16:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176824

Branch: kirkstone

New this week: 7 CVEs
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

Removed this week: 1 CVEs
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

Full list:  Found 23 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
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
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

