Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720F2EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 13:30:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.11284.1687699802128848598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 06:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fjhVA+pP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-66c729f5618so1036395b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687699801; x=1690291801;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ag4RKv1RzCPZdbf5m9YG16ORtXFrMcGusk6JF0tLcw=;
        b=fjhVA+pPzhLTO4u0fnKSQsa50plSz60W1Zq4sk/Any3D773AK1AwjzU7S8HvnOE8Xk
         B9xhmcLx7JhmkBBHi/AP96yfuj91pvB9Qxgmne+bfQIoH8vX5KQ1Vs8loRzezo0BPThL
         7sT/P0rflilNSLu3PlG2ufAExDv9AvlcXwIup16o43dBa4hCdZi0ipdDgrwNcgy7vFg2
         ePzIP5fkKGQwhwRjX7PgqScpgaCm3z2b9seRVamM2P29DtBW0b6rYUw7hsiqEelmj4PR
         XoKRX21oJ5MzOYm7dbFOqdeUb2VYfRfvLY04l1/Z0eof3W2n1QLGv0oCK61IfE6e+YJw
         67TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687699801; x=1690291801;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ag4RKv1RzCPZdbf5m9YG16ORtXFrMcGusk6JF0tLcw=;
        b=L1vuST/mICh/iEVdU0VzPG5l7/0ay8z+xQUBVO+NXZvac93N4Cm5SlIiM/s5PSNuMA
         /PO6ACYKCOxeJf4mnBa1Gol0/xuGKtHaemb69/NbaET/Y2/omfvbV4Oa6bCyHjsbKAEj
         pYMwotjaDzjf0/j4KkvIZXSm6Btzm7MHtFEAS0UyMyErjJC642cWAvigeGLHOYSiKXD7
         nwCO+VjzFseVLpwmE1CMvtqPyhH7t/mR39ElNYcgHAWeqVY9RvgTrxdpYW4RsyrDSDCw
         vkmLLSM+0aJ07GPMk9Rqc3E7HhEKH7LIDUZjKW+t/D/SrOtQgj8vq/M3eWgqeh/FoG5L
         Wa9w==
X-Gm-Message-State: AC+VfDwn1R1XkKA+e3AsEXs6oQSMsHVC0Zr/yNX1/VzrXkx+1xPlv0xF
	roiBNphAdVkdhEqUOXGTeN6Ml0IhFCK/4AKEWE8=
X-Google-Smtp-Source: ACHHUZ6sGRz8rkcxcKaPCPp2TeQGxUyhj5zrt5nNwsHDL/8hq7VAZLR17hYzL8W1/j9A7JSe0Mpa3A==
X-Received: by 2002:a05:6a20:7d95:b0:126:676f:1f1c with SMTP id v21-20020a056a207d9500b00126676f1f1cmr5649959pzj.28.1687699800873;
        Sun, 25 Jun 2023 06:30:00 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 21-20020aa79255000000b00665a76a8cfasm2260938pfp.194.2023.06.25.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 06:30:00 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 72AD7960522; Sun, 25 Jun 2023 03:29:57 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 25 Jun 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 Jun 2023 03:29:57 -1000
Message-Id: <20230625132957.72AD7960522@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 13:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183372

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-2603 (CVSS3: 7.8 HIGH): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2603 *
CVE-2023-26965 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-34969 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34969 *

Removed this week: 4 CVEs
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *

Full list:  Found 36 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-4336 (CVSS3: 9.8 CRITICAL): ninja:ninja-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4336 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
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
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-2602 (CVSS3: 3.3 LOW): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2602 *
CVE-2023-2603 (CVSS3: 7.8 HIGH): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2603 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-26965 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29402 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29402 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29404 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29404 *
CVE-2023-29405 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29405 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-34969 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34969 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

