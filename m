Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15B1C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:03:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.89037.1675789416161051901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 09:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=papPj0Gb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id k13so16342488plg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 09:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugSNdozdkIhJZ0wLT9FyMW4WHAgPESS6FxId+uSBzrw=;
        b=papPj0Gbgodr/ryoBBfsUs+U4edlTJ/7e60xFNJs93k0zn50pt+MP6R173G+704ha/
         qhNP8w4+f0GhomCJW5J6n5Tq9BU2Xmm3Kwo6KURdt8ZiZa1HYBDn+ExMB8xOBmvCUCta
         u3W7GykXDQDTtVIerE+Wpwku+nGCG1Fm4uLcUwmVa2xXx5a4l+2CYhL9ZsV7sbmVwqqG
         YHcw86Pl4l1d2bTAqgKsXqFML6oYT5a4Mlz+pWmYY82dZ0LkGgEXO2bM5m97odmw6FAl
         UeDtNcBDg3T5yQPCuGtBPqov9+lTxfCFpVREmMZJz30pBEp7sQUBVON1m0k0gb3biLrt
         8+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugSNdozdkIhJZ0wLT9FyMW4WHAgPESS6FxId+uSBzrw=;
        b=wGB4DOG1EeTnt+23TBLRG/EqRIX5MjoQw3SGPp0x8RxlGQs/2E0NgGPQUl50QV2fMR
         3xbiFGGRYNj4hZHIqDEx7O71askUA+qNtvTXTVJtrabNtLrVuJPXiH13tDlIKPxg8VOL
         JVju2kDwgKEBiHSD+RlsQEE4XhNbXPNbgr2g6/JmKfpU177YCfAjSeEmGNT0ZtQUk8BM
         ZA7wY1segzL8cfZo4cwaWAp72XsUp5aIiB7dr3duXTNt/KQt+atmN7xMCp3cwOU0j+5n
         axEWGaj52zDd/uqu19WAnQkmCBjOKl5VHuBDPzXmvDAoDZu3PGDgIWYLEKq67Tb1UYHR
         xarw==
X-Gm-Message-State: AO0yUKXqm3/auizAmj9tZ76T59C6x2Bx3SwCUZ1mevfNQgmgMKEdPozL
	CyDJ2zq4vTMkeUaXcrm6G1h2Zo8EJT3KImC3j2k=
X-Google-Smtp-Source: AK7set+ThNP/F59OsUmzyc1yE+c79B8c11ct+OKY/xIwEuYie4gTKXv3UbHVSWrZg+R9KyaebDnppg==
X-Received: by 2002:a17:902:e351:b0:189:a6be:85db with SMTP id p17-20020a170902e35100b00189a6be85dbmr2603613plc.39.1675789414886;
        Tue, 07 Feb 2023 09:03:34 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a170902e8c300b0019602274208sm8535958plg.186.2023.02.07.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 09:03:34 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B95909602F6; Tue,  7 Feb 2023 07:03:32 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Tue 07 Feb 2023 06:59:29 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230207170332.B95909602F6@nuc.router0800d9.com>
Date: Tue,  7 Feb 2023 07:03:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 17:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176825

Branch: langdale

New this week: 7 CVEs
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

Removed this week: 2 CVEs
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

Full list:  Found 25 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

