Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A3FC4332F
	for <webhook@archiver.kernel.org>; Sun, 18 Dec 2022 13:02:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.28784.1671368556810554274
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Dec 2022 05:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kw98BwoU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id 65so4556458pfx.9
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 05:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iz9TFu137TQRmLHo2K1uqF0a5LcUHKP701iazvlWZhE=;
        b=kw98BwoUf9PXrSDZSWzpFNjAWCDdtHyRwaq36hRm/eFk+FDAL5ZFwiIHtHYGKlD3g5
         NPp1IE1JBB+tnegQ+hynfCoKttcbjv3o7UrLSOqtsrrl9I2uRKYaJcwOgvA0EvaY7h+k
         ttpQUvFwjHolDMocvPiMV9dAHJmUUTvyaanRUl1UwkM0Iq0N9drxggOLda6oN84VDoSQ
         Gxxy9FGlGNg97SLNMDNeupB36B43hZxB7EPx1n+YtQDPwFISonz3RecpbNyvqZOPkCyN
         xdqSiMYh0sTXcg1npeoQAEublW91m5GYWKn7DGURVnivCPZlV9cjZ7JFjm0SaDW1y85a
         qs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iz9TFu137TQRmLHo2K1uqF0a5LcUHKP701iazvlWZhE=;
        b=I7fKrh9qDdu6DQpvyctu27nuwuwlfvBMsNtY5jMgfJzwNu2YJOO/fzg/MR8DtEYLxy
         sCrENVTvvrZJX9qnSXtk+UU9S6P0lphku6LR04UtLgjp9hsuHInomJzB4ns1bjCyar0P
         3OYL92z+xZDtq15B3dSc3FNCHpZgmn3TSosB6i1pjpVrKFIp0Z53ttXkhse0wuW24HK4
         IjPBhnAwIyQjzYD9RMSVHuWQ2kLw3yPEx5N32u6ZUwdfiYXQiODXmS1FdpQ2LTRQ+x9K
         laLIqTTroRa3MaJzwSDNeIGPQvYAjBlv4cVQ9CgTumxALCCQVae5ROJBnfpwecj9j3zi
         M7Lg==
X-Gm-Message-State: AFqh2krkv7lqDo5wjvh0ZZq6PEHVgqgrt1n5aVi5cqNy07qDrkmLgZDV
	wbf+nejoUouC4G3ynTWK8X0iKw7udQFjvR8HK2E=
X-Google-Smtp-Source: AMrXdXtcTejagCpkwUqr04vLbGK3LNJWy+sWDU9ia0dQ4bYe0F5sUPyFgESksEdULSrXPj1M3Es1KA==
X-Received: by 2002:a05:6a00:d46:b0:566:94d0:8c8d with SMTP id n6-20020a056a000d4600b0056694d08c8dmr5465687pfv.17.1671368555614;
        Sun, 18 Dec 2022 05:02:35 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w80-20020a627b53000000b00576984617b1sm4571308pfc.60.2022.12.18.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 05:02:35 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3BE73960367; Sun, 18 Dec 2022 03:02:33 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 18 Dec 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221218130233.3BE73960367@nuc.router0800d9.com>
Date: Sun, 18 Dec 2022 03:02:33 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Dec 2022 13:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174785

Branch: kirkstone

New this week: 4 CVEs
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-46908 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

Removed this week: 7 CVEs
CVE-2022-35260 (CVSS3: 6.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35260 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4292 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4292 *

Full list:  Found 18 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46908 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

