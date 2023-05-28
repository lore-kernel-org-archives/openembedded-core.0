Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B847C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 13:04:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.28321.1685279049359684643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 06:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FQApEWlX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-53f8daa1b6fso43256a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 06:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685279048; x=1687871048;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeD9dWbGcMs3H8Rtw09vUv8vx/vg7CLE13XZCvx20Uo=;
        b=FQApEWlXhQ5tYGNYnpUma5kcNmbI4j8QIWEBl/XMALm5GC4fT4xF0WUZl46WBjxHGx
         xTLg7/coxVrb40ZrU6Vcxvdzr42BzTqzUjj5rTueCmuTnQi1snDsGohH4p8o1SowhrQ7
         uTJag81nskimthWYxUvX8PgJ+AIcinGVXuBmGUm8mqVHpMAvKNdgRZJUtwDTGrA6KbOS
         lnxmOTn/0uQfQeJdvKqe7XWXURCzM4RXOxsEPV2qMQp9a+Sq9EhDHYe3UKNpMlRYKERq
         MPnkuI0jqVP6imvr9hssMHzauzsc0wGWZK7iE09Q7xTTUfS4EdXvttCGwUt7XpA7EuOI
         A8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685279048; x=1687871048;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OeD9dWbGcMs3H8Rtw09vUv8vx/vg7CLE13XZCvx20Uo=;
        b=Hevtcr5iqYvqofSt4Q/AfUesDs3vuyuVVnecyV6J/lj+M6d2F5v8md82FD2RzDnBp9
         S646FfkmGf5KHOuNevdrq68MzZusaQqHTA9Pej2ewlHxsFOFWH/n9Zm/1SIqgReikz+h
         m9MazsJXENDyBdpa2bbQnRhshABCP15EL0+2rqbpBJmB8+TXerjzQ6gRwy0xzYisq8L1
         wBWDblFWe/HHsYrE4yuVpfjHu9HlbUc+7z2KeIiHTNHdI8UPKtX4PDzorJ5SIIGRw6l7
         h07AwFO6TdQruaE87pBROQfGwK30fY6LOU0JfPe13OffTMJi6ZjoWneqEDjm096afHrD
         S2GA==
X-Gm-Message-State: AC+VfDwrkMhtzzAQh7rjPlT5ly6StdmoOF0hJnPqXU3KbggmsSTivuTE
	YpBQNgY9prqecgggXiOLRqfWk6gSQNqXggOtvAc=
X-Google-Smtp-Source: ACHHUZ7SjTlhb6aJ4msRpoiCLs34atLgxqwY95bI8J2LBm5gTmMEp2jruS5EUdZgD4UZhfpgGaTlfg==
X-Received: by 2002:a17:902:788e:b0:1ac:8db3:d4e5 with SMTP id q14-20020a170902788e00b001ac8db3d4e5mr6145809pll.69.1685279048282;
        Sun, 28 May 2023 06:04:08 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n14-20020a170902e54e00b001a2135e7eabsm6280803plf.16.2023.05.28.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 06:04:07 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B08D49603FE; Sun, 28 May 2023 03:04:05 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 28 May 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 May 2023 03:04:05 -1000
Message-Id: <20230528130405.B08D49603FE@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 13:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181819

Branch: kirkstone

New this week: 5 CVEs
CVE-2023-24539 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24539 *
CVE-2023-24540 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24540 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-33204 (CVSS3: 7.8 HIGH): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33204 *

Removed this week: 0 CVEs

Full list:  Found 32 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
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
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24539 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24539 *
CVE-2023-24540 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24540 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-33204 (CVSS3: 7.8 HIGH): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33204 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

