Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E70AC53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 13:02:31 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.44137.1673182950436044521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jan 2023 05:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ymFJ2Bfo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 78so4154109pgb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 05:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sh6eR50kVe67Id1I+7UriNm554TCoI8s2Li0IfjzM04=;
        b=ymFJ2BfoSFTukx6HCeuwyO/eyIDI/Jxdppc7CtDIfxxjdmLESFFIKrcSmAIeKkmCk6
         HmJKT9ITWl6ik5T8DWPM3GAsYoqFdoUVq2sVzye4aYtcpdwt2IHesHZoQkAIGDh9sjEI
         4jo4qIe0oYu9hBvdC1LL3wDvFZUHW0oIswqnoZI9Oa1COuBE8/XdT/xM/wW+/iESR5DQ
         qwMr3+Q4SsVM78LApA769qnbAr4UjBEfSNohGTumya8ZbRjK72LDLdGoQTor4E9Lz67Z
         1FQRCLlvke9WFkeykrUWWcqbjAqZu1m9CEAJogkRokb32t6phptHPDaxtrKSdZgUi/aH
         oZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sh6eR50kVe67Id1I+7UriNm554TCoI8s2Li0IfjzM04=;
        b=vJOboAh3Q2K+UPC0coGq9FFEcyy16BZewZQqW/JIXztReZHhKD4bqxpgIyQQ7/TknE
         NpRVILTY2KH4Ygj6lK+K20kliqCGVfSH7Gp7kxe25WqoZgxKzaShWTGdRwRrQkX1/+BX
         7CdncKMyZrDKleJ16xFdn9+a+VPSssXLsh2GaQfu1Ud9TPSlluwQ00UjbruQl0tHi4tc
         CVCWhibv9KCw6ksKxRANG6ycA7BjvwVjvLdXHp3z2qIrHzYF5nebi5n4R2yylM9l5nNS
         sJ3h/fH3jA4l1j7rOsD5u9b7OCXwSFO3Fo9hNpjYO2ih0YnNM4YAsk4D5DRn+LXJ6j3z
         4pRg==
X-Gm-Message-State: AFqh2kq9mOqDfiREh4rwp0zF1HJvs824OS5qV4tmMZ5ihELxzqHQCpxV
	9EPDoi2m7HnAR7Rw7kHzU/v3VIbwaJl2jr/+dh0=
X-Google-Smtp-Source: AMrXdXuRvGPvaXHanVxN3CsboLb+f5HUsaxPMIv8No3GuGGYdya9WkHbrUsD7Qu75MPyo2sp/CkV3g==
X-Received: by 2002:a05:6a00:1d1f:b0:581:ad48:d480 with SMTP id a31-20020a056a001d1f00b00581ad48d480mr36130231pfx.34.1673182949178;
        Sun, 08 Jan 2023 05:02:29 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z67-20020a623346000000b005809a3c1b6asm4152743pfz.201.2023.01.08.05.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 05:02:28 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9CB499602D3; Sun,  8 Jan 2023 03:02:26 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 08 Jan 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230108130226.9CB499602D3@nuc.router0800d9.com>
Date: Sun,  8 Jan 2023 03:02:26 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jan 2023 13:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175627

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 15 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

