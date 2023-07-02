Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979C0EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 13:30:35 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.5585.1688304632475905341
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 06:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pnupBti6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b7fb1a82c4so19597785ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 06:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688304631; x=1690896631;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4wi4go/7I8vlMLME+VZcvJ1BQ9TvCX2FQAau40AoJk=;
        b=pnupBti6D26JAOWFoqDkB4xjBaA3Ua/QT6eCDq+udXmV9PSAo9DkoKwZxskg4SrrrZ
         c2qXJtoqmkpYdaVJcMqOv+4MB4fcumM9WY40ZO3qRyiBqAq5r8MP+GPUWPMLqEhJU1rT
         LgAfsRaVo/i1iRUOFc9JeeHWEnEma2E2G5Zw2WDWYEPzQIPRhSmTSIsprMlSzlx29Tnj
         usLq5r1QQIPNauRzbmOENuJDx9gsz/JPE+apok9yCE8RxxINuG6DmfUzHLoVVPfzTBv1
         249QH2iJcRUHEChccEOjlYmy6JD/MgfWkzrYMepHGzcKQD987j3ADYYODXE2/0p0mk/1
         0FgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688304631; x=1690896631;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L4wi4go/7I8vlMLME+VZcvJ1BQ9TvCX2FQAau40AoJk=;
        b=XmgGIuKqnyjF3pNYnYccfWhhD33SmAv/ItohYIhg+27rgNNghg2K/XnYnxN4KEEEnV
         uI/YG21Ii/Dv+ZY9smvbAc/JiIJgX3sUJTSx3jneE6seTb+FWNkb1i9beO/4dI6IsP67
         O4FHec2mrUddAVFaF6+14lcJHVN+mkFD2AbFG0ACwDx2BaUBoAYcIt+TWBzAHycp1urU
         WkYQwuEAc0rw29m/wfrlXJ94nuJOMEhDUO3oDllPX9Wl8ajuoKPdc3+q3fdpOGUGh9Bs
         5D2Fnhue5f63VFH3hfj9JeBSlXV1mkWw9sX3xxGLxZEbbFWUxf+WZd84hQxrcya4QBSd
         InZg==
X-Gm-Message-State: ABy/qLZelmT6KPifZh2TSygUAH4foa7ZuRBWMCaSAOP4okKycw5/0BB7
	QxHvvEQxvMSBynf+q6DABccNh2psHbuSVkV++kENcg==
X-Google-Smtp-Source: APBJJlG6ilmFFQf64Z+Vg663M7zFDFRERN+l2dKXela5P7cELijfnL7S+RNJefM9+0G42A2+HXSSyA==
X-Received: by 2002:a17:902:c20c:b0:1b0:6c3e:363 with SMTP id 12-20020a170902c20c00b001b06c3e0363mr6110025pll.0.1688304631439;
        Sun, 02 Jul 2023 06:30:31 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ab8500b001b8573384a0sm5519965plr.59.2023.07.02.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:30:31 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 561FF9603BA; Sun,  2 Jul 2023 03:30:29 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 02 Jul 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Jul 2023 03:30:29 -1000
Message-Id: <20230702133029.561FF9603BA@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 13:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183780

Branch: kirkstone

New this week: 1 CVEs
CVE-2023-34241 (CVSS3: 7.1 HIGH): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34241 *

Removed this week: 6 CVEs
CVE-2021-4336 (CVSS3: 9.8 CRITICAL): ninja:ninja-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4336 *
CVE-2023-2602 (CVSS3: 3.3 LOW): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2602 *
CVE-2023-29402 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29402 *
CVE-2023-29404 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29404 *
CVE-2023-29405 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29405 *
CVE-2023-34969 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34969 *

Full list:  Found 31 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
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
CVE-2023-2603 (CVSS3: 7.8 HIGH): libcap:libcap-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2603 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-26965 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-34241 (CVSS3: 7.1 HIGH): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34241 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

