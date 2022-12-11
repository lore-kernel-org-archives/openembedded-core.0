Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE95C4332F
	for <webhook@archiver.kernel.org>; Sun, 11 Dec 2022 12:02:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.15520.1670760150139585726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Dec 2022 04:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=76avmcfk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id jl24so9337793plb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 04:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mppZTENRNkp7W9ID0ALpgC81DV3uensXdZzk8Ub4cAE=;
        b=76avmcfkGymf7TYwu7cuGkpmS7tB1pWyX/e5iqMnKqCYEs1IuFSCntcCtdERwruo9t
         iSGWeoG/6f66/qZB+K0T3PPytK0tzPLwUWC33ZRQ9jYk8xO08M7c8Och/Drd0wfbI6E6
         LFYbJNUry0SwLXkS1kPNuHB6siwEkfJbP9RLl2UNKU7j+4/YkP0VYJpWsGvIwE4kbbaM
         LdnZN4Cv2V1Xb/sQLMIIMAJXRnrwISIVfAKE9gwiiXCysaxmpwR60Uy0AkUlcsCo9HlK
         bQc6EgQDMDUtLftGRExd6HuebSpnXxO29+24geJCZH/rB5rtl43r97oPgSNnwT7U1veg
         EwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mppZTENRNkp7W9ID0ALpgC81DV3uensXdZzk8Ub4cAE=;
        b=o6yRW8189M3tLfnFb7/v/nhUami5pdKdL2Utk+HYI0rAucc3GgRdRIHyEZpSBjKi5N
         PKUxEGonH3EvP28FxGi9S/EmXKgkkgDHj5Kx+U1cVHjLlirPyIP/YkCeXW3SHk0teJjF
         M9e3m6qzb4GYWg56EJcZcV4BCbdEmVuy75xAQc+Z5OVQLxNfDEk7gLHgeJnJsxxaW+E0
         9eWShtPAd36x8mkLoTb6GEt36qhBzzMbVhcLl/UKoaMcggLfVJzr031HKlwVyH0+Ai6h
         5W6lf+jQOjXxGkubMKzDWB98LgT4dKFGaR5/Y4QIILJ3p4LTWv5qxq82ZwpopaiwHL9l
         BUqA==
X-Gm-Message-State: ANoB5pk0r0N5SlVv+yRSsVCjjqdUQWHSZ6V3+a9C0Pl80tDc1WvgaGae
	gegILyP/vhDckOvOajjlt3DDsbGRXkjJOpU6Xaz+BQ==
X-Google-Smtp-Source: AA0mqf6acDvrPxUQMPZ44aia2XKc/EqoldGb8rsNICwBeVlucwjjQWzU2shrb6gh4QRP+GrVYZ9Kvw==
X-Received: by 2002:a05:6a21:e207:b0:ac:705b:d931 with SMTP id by7-20020a056a21e20700b000ac705bd931mr15386015pzc.7.1670760148822;
        Sun, 11 Dec 2022 04:02:28 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090a7a8900b00217cdc4b0a5sm3702988pjf.16.2022.12.11.04.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 04:02:28 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 739E19602A7; Sun, 11 Dec 2022 02:02:26 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 11 Dec 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221211120226.739E19602A7@nuc.router0800d9.com>
Date: Sun, 11 Dec 2022 02:02:26 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Dec 2022 12:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174471

Branch: master

New this week: 0 CVEs

Removed this week: 4 CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *

Full list:  Found 4 unpatched CVEs
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

