Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51545C4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 13:02:33 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.117062.1671973346099275052
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 05:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yT6knUbY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso8752447pjh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 05:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3QOnrz8nk3c9xZZlXiEnMfbhQl6Lw1rwO3+E44A1e/4=;
        b=yT6knUbYnEUyQ6uTo3PXlpaOlFB2CC+Wj9aeob2ZwW4s7Q5VaqITCo+N1H2pATr3u7
         0klir0J9h2AEOqr/cF3yOPIwfvWw5r5oCdVE+gQhu90HtulR6fr8/sMvctkVcEeJY7eZ
         vxPvr/WL2nmaRnBiPktDUILbfj8fFxVvqEpCM4jwgGm0r507h+JqlSRW4GDV82xs6Ycj
         Td296blTgZImLP3vhEZtgbJ4WKdGO4T69E+fjdc2GdwF4KrIUnPCPFZLWmN5lrQxM683
         rQ8kNo9RAWwHMioe5YG7yiGZY2yi7SGmOUGb7wYxmsoDnuBhyy4wF6HNMHc+w3zlyF3F
         Bp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3QOnrz8nk3c9xZZlXiEnMfbhQl6Lw1rwO3+E44A1e/4=;
        b=eNFpv47+8vyW5CSgEuc9WqqKn4BL5mRV9bN2exoV0jEFk+tNGvBVg+tfW0vdn2pQgn
         tCbX3AslOjDSsqWrrBoZLJNKJp2p2G+4VWMle/tdtxHZ598GYwAB5GYaMjJuCKdH6p0o
         FFlyRi3n+UmrBBafsTvHMRgOOu+KEdKv4b4zKBpaG/258qawELK8rj0uzKiI2awYl0NL
         y+PAJzigpIxbTDxN/GALvmwu99qc7bYdVzn5p8vYVOeCtww88Y/eRr9tafZZEGupyB1d
         kfluDCaadZC9kCT/oTx5kJtfshpG3lmFeX6Q7IcjDji7F4oSqQQOz3uWk7ND7Dfidxtl
         Yj6g==
X-Gm-Message-State: AFqh2ko7+zX6pTBT+0PKeCpfm5AVRZXqcuy5YLYd0aGx+ocl59GTH+UE
	ULbDA5TJ/37xdbkmkNY0KxtOuQND5UjttTIi0GQ=
X-Google-Smtp-Source: AMrXdXukgpx5LuldkV1ulUfcLKDgV/dERm4tLD4sHB/DBkYt84LlDrMHXEZoHIGqNaVa0WpCpU2ziQ==
X-Received: by 2002:a17:90a:9f86:b0:225:ab78:dbaa with SMTP id o6-20020a17090a9f8600b00225ab78dbaamr16104212pjp.20.1671973344868;
        Sun, 25 Dec 2022 05:02:24 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g4-20020a655944000000b004792b557b1csm4830467pgu.87.2022.12.25.05.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 05:02:24 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 236559602C2; Sun, 25 Dec 2022 03:02:22 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 25 Dec 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221225130222.236559602C2@nuc.router0800d9.com>
Date: Sun, 25 Dec 2022 03:02:22 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174993

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

Removed this week: 5 CVEs
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

Full list:  Found 14 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

