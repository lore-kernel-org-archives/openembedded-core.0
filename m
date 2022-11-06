Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85199C433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 13:03:31 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.16031.1667739808857584116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 05:03:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZjI4Oabz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso8143167pjc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 05:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tb6ZK5AI1HsaeyXLjZjjH4aXA/39oHawOejiFbUyOGo=;
        b=ZjI4OabzimCdBQne9swj7tyTKR0qacBEjUfZ6EyJS+iypIE/zk3XyEd2Tw8qSTAlMm
         5n1ri0lNQXp/ovTgO8zipXNPD9upMeqodnwu+MwzTwn3onfe2dtdVoeFR54EA5om5XZb
         z3xvPh5gbLYwJ3mOfqNTj4SyBh75FSKclh7n2BTxyq12uqUPlQ8MJiG6XYDOjde8naYv
         u/Wtsm/3vFbkdPNI4LSmEwSLeHUqGLCfvKVcimvU5e7BnzbOvCAtDzT62nos0OSWxX1b
         4Vt5GXXNLPDwjbOa4wP1bzj8F0qpm9qvgnOg43QAsKrgPbqSRB2/vCEYXGCuUs5HeXjA
         arcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tb6ZK5AI1HsaeyXLjZjjH4aXA/39oHawOejiFbUyOGo=;
        b=gbtJMpa57TxUkx50wZjGM2CUZpnOHi9xvvE3FwMRN2UxkYm4/P9pJPHVHvfdltCta2
         BDZfiTYSsLLbUkpfLXtPYQYiKNmKw58sZ/j4miQOVEoPbU+Q60ewO8k6087YZ4qUq0Ti
         WG4dVXPDDDk7QMwYoQ50XjxB9DrrI4E/ETWN60B+kejgmegZarNzzoA1ZvrY5jLf5fZ/
         n7tZ0JO4qZg6Uj2GEYJnY5F/TOM8wGaNpthYi62gRbPpN03RLZR/xxQOP8OaczArjDpn
         irHG5H6HQeEzLrkn/6+JZ0E4jESN+mJFCPJSh7lNvFn6MifLYc7BedcqgsutY4j2zoKq
         6EdQ==
X-Gm-Message-State: ACrzQf0b5dO/iAUB55Wnir/ckDYKim4RDsiQhMeJcE2GdDrDRs5Qoh9O
	1PKSc5JFna/kg3nfWvsnknW4/oyHJGwbprPF
X-Google-Smtp-Source: AMsMyM6/7SQFE7Sd/aRkCGo40vXn8g3AvjRl6Ws0962Hx7UJXHcJRBGWdfwK5ID3sMNJMAPEEJ5BIA==
X-Received: by 2002:a17:902:c14d:b0:187:337b:ad9c with SMTP id 13-20020a170902c14d00b00187337bad9cmr31265081plj.35.1667739807825;
        Sun, 06 Nov 2022 05:03:27 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902e88500b001885dbe31dfsm3101973plg.178.2022.11.06.05.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 05:03:27 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9D0409602D6; Sun,  6 Nov 2022 03:03:25 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 06 Nov 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221106130325.9D0409602D6@nuc.router0800d9.com>
Date: Sun,  6 Nov 2022 03:03:25 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 13:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172764

Branch: kirkstone

New this week: 5 CVEs
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

Removed this week: 9 CVEs
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-3554 (CVSS3: N/A): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3554 *
CVE-2022-3555 (CVSS3: N/A): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3555 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

Full list:  Found 23 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

