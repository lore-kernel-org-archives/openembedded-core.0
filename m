Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86364C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 13:02:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.139345.1673787754390891599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 05:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=27efZVTZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id jn22so27751194plb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fqu7NRyrmlxPRi8rSBvql3RK8x51lTXDm3vE1p2gDxs=;
        b=27efZVTZAPFIMaepi5XS32gkjWEYh0M6dZF8fCY6MBuAZqX+sUavRnno1rvWQo7+ZE
         8PXmzhOs/izF70+sD26wiQs+QLUek2uHKTA97AQM5vPqk47jyuyML2SBi6ss9nslfWR+
         GRFLA+fErBlnls+cp8uH5o/KzZkEE3KsEW+0a+NRWj+F0ll8nRTuJZwsFYvZAZ+iRdC1
         1L8TUbj8yfLj8s0u2n32IW7vMISdaJFxs54qd1NQVeJvXjvTaNyvDqxJUgm15kqSfXiS
         lJzIgHWlnY89XG8KYsDyhmFGst00+pLy6bZ+DlAGf8kXbAzdF5Byr6Xh38QqYly4tT0f
         gcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqu7NRyrmlxPRi8rSBvql3RK8x51lTXDm3vE1p2gDxs=;
        b=bpRFSLha04nKCQOXX3WElGBPZyWW1G53+E0Oki7oBPIK/5U3SxhF2FwfTzGxBhDGEz
         PsUHie+IJpu+Y5BH4fiF3fvcvPTTGsXH8cdqPL+hP0Mhg+glU3yBkuoRz4vXmhgq5Ga1
         pgCc6JmJhuSwqe4x0+uROwBwDtvEO3jQonIQk9VrzpuDZPLwdz6yHIKFLUEDmehsWSOJ
         5HPtZY3wuwhybDD/72f5uFrNBPAf/XD4LEq5NoQYP3hy/BAoTJditKoXU6TFLK6IFriZ
         wclO1vQqYoWaUyiMfx7MykK/INH+MmMHBi1eSLbiQkhizYiANUeQ6AXObw7DTwsMhvW8
         FwRQ==
X-Gm-Message-State: AFqh2kqw6coaviZEPFbfESmMsfIpbkyeY3VsFx2H8JG8OFdOVt0IV0ek
	6NDaUnfVnT9nh8+Ybp5rIl8+CRpfzmA60Ji/qek=
X-Google-Smtp-Source: AMrXdXszYZPXIYIphm19Kn6bVh/pAAT6lrcyLpeTNndhUtaaSNH7ehHhh7uucdLSQsGh1KggVxz+Jg==
X-Received: by 2002:a17:903:12cd:b0:193:335a:989e with SMTP id io13-20020a17090312cd00b00193335a989emr23723996plb.25.1673787753202;
        Sun, 15 Jan 2023 05:02:33 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b001811a197797sm2710422plg.194.2023.01.15.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 05:02:32 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7E6829602D3; Sun, 15 Jan 2023 03:02:30 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 15 Jan 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230115130230.7E6829602D3@nuc.router0800d9.com>
Date: Sun, 15 Jan 2023 03:02:30 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 13:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175884

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

Removed this week: 0 CVEs

Full list:  Found 18 unpatched CVEs
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
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

