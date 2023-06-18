Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6947FEB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 13:03:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.5213.1687093427587630937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 06:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=S9AAiZRh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso697847b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687093426; x=1689685426;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kv/Gwp2rKkwZzGGInt2rQ2FLyHbXY2KVB3diDOe59Pg=;
        b=S9AAiZRhT60JarkPVCHystBkPlg5+jwgZg0SuIOxTxj2Ddlhod7lI2VyE6/xVpKbhX
         KaWZ4xtmvimz7JzNAMluoqWsE+t84PDjlmzeEYjG2MHUclE5M59EY+975m7oH+HphIGn
         UcZB8jO6vGT+mnXsO0zIpvYFfKAo1m8WgZ+Xtlj/UejrFFokja/Y1ZwvKCj18fviVEDI
         LL4Z9BdOYoE4qgL2ZBwqq9aVuuG2GagpoS9kq3xmiJ1P/S1FskiY3v1TNFgpooT4p/4L
         kPQFU5J4QENWUpDwpW2iYAEuVKyCk7NP/zSR727UzUEhv7iExROB7ukUdddu0AY/OVXi
         bKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687093426; x=1689685426;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kv/Gwp2rKkwZzGGInt2rQ2FLyHbXY2KVB3diDOe59Pg=;
        b=QG81kgSl8LlEOYGvHBXMXxFJkJmReZwgxOpzt3M/gClgnHgyG5H1rZWpGJKLF6qdea
         FGaHgLSmfrxDBsN1dmx/AAlwCNSuq2GFTw0TlHTLWgPRZ6nDr1EDoIA233SVu8WkJ4Pt
         KOHBsRKWg7BlLxdnznpTkJzbynnbPDV4avTCBlT3YEhQSKIEz/o4kFZRPkIZHEBv63Ko
         aIqegfayBkbYIJBBaHcKXx6RhBC6IrqnPLJjvAYwLXkhMToYmBHtq09yfRKJJGPmhpjC
         LMCaxsRFpU6gE2iFtZuA8KgCC66LAJmcddjLLPvd9chhjY95dTgG+MVmXfDa0nlmtBXQ
         HN8g==
X-Gm-Message-State: AC+VfDysJRqDS92RvLAKuliIDpCoCZFwthVcOsDMmdkfqVg/Vh8Vl1go
	KF2qeBrJMawWYYiOCt5zdicp2TJhZwkVXKxzF5I=
X-Google-Smtp-Source: ACHHUZ6pLOWDVkVj0wVarNNBXsMqc7se1SMyBP7Xsn7FmgiBurRkLsf8H6qzrYHgV10obkQHMlRzEQ==
X-Received: by 2002:a05:6a00:1401:b0:668:6c2a:c4dd with SMTP id l1-20020a056a00140100b006686c2ac4ddmr1237475pfu.21.1687093426384;
        Sun, 18 Jun 2023 06:03:46 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n15-20020aa7904f000000b0063d29df1589sm10964346pfo.136.2023.06.18.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 06:03:46 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 40A5E9604C2; Sun, 18 Jun 2023 03:03:44 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 18 Jun 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 18 Jun 2023 03:03:44 -1000
Message-Id: <20230618130344.40A5E9604C2@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 13:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183061

Branch: kirkstone

New this week: 4 CVEs
CVE-2023-2602 (CVSS3: 3.3 LOW): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2602 *
CVE-2023-29402 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29402 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29404 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29404 *

Removed this week: 4 CVEs
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-24539 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24539 *
CVE-2023-2650 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2650 *
CVE-2023-32681 (CVSS3: 6.1 MEDIUM): python3-requests https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32681 *

Full list:  Found 37 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-4336 (CVSS3: 9.8 CRITICAL): ninja:ninja-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4336 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-2602 (CVSS3: 3.3 LOW): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2602 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29402 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29402 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29404 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29404 *
CVE-2023-29405 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29405 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

