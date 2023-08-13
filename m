Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78A1EB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 13:24:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.84979.1691933057262384230
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 06:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xxFVEp0g;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.46, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-646f0f6954dso4776866d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 06:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691933056; x=1692537856;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdiMiOrqmyyMgRfA9dOTlW3C8yX/jBZaQZmDlqooZeA=;
        b=xxFVEp0gs9GE29MEQmKnmcZvSxdPy+FeIRHv1hX6VxPxr50C5x54qwyAe6GbGReyDm
         kIW5oSZs306m005Yra9ByrqreqNqWSeQK8al+296pzG/EbYJlYu7tRu+M97bw3oiHzoy
         Qso1z9861s3yJPpRXjE1plV0QoXcZEgoTKxM9SlUfg9XYrvOsSe0l4UiRYr/J1i/MSOX
         XPLRN2c7tkqKafqtucDg1Ejp0Itpzcdvlfs2sr/DEjyf7PMEP08MEz7Qk9oXFdbjQJAA
         cVs9DXlr0kcRWk2z+KCLOKZKp1/EWfjGk6/M0ezciC1oUlKibX22g3Qlwkm27sDY4cHA
         5GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691933056; x=1692537856;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdiMiOrqmyyMgRfA9dOTlW3C8yX/jBZaQZmDlqooZeA=;
        b=XQzvFfnqhMro2jupgiWZLMuphTK3886oUjznIflnJJi/EaVN1aDduJbGW9KwdxdD8C
         Kn2FtRo6lw8mgLoTH+SIX5xJ+eOzXAFcOUg737DVd86FY1lLHtZLq5RZ+fC54ExLsXzS
         YhCfe/sQ7weU87X1ftSsWu3WwIbgMJVQgnfN1ltNAt3vC87+V85wvVmzNTL3+DfsqVFr
         qh6YxGbd2Lgi2BosJfX7LXZaPQuwu+wLJIPXc2Wd54WpD3OfqVK+R1d0F3IJTVgZXy6o
         cqKGMFn6+P5Y+Wu6ptccbcOJqv3ellxY8ps1cBzV+Uj+zPx+5l4BGttmAF0VNUnEQKNd
         xXcg==
X-Gm-Message-State: AOJu0YxbrVIuH/IJJ6eLs/YHQ5ZaJPV1Tw0aL8m6iYsdgut/6gvUN46O
	DmL15Mdt7Fwt0FtsGJ4KpB+TVqZ83n4SToVwY2ZVNA==
X-Google-Smtp-Source: AGHT+IEFn5Um/OPet8Ms4r/s0bIv6IejRh+QW1SWGFLG61G1Wr+LT5mayXwsPc593Gdewptuob2kGw==
X-Received: by 2002:a0c:f48d:0:b0:63d:12f:75f0 with SMTP id i13-20020a0cf48d000000b0063d012f75f0mr6855878qvm.23.1691933055667;
        Sun, 13 Aug 2023 06:24:15 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id w10-20020a0cb54a000000b0063d2b827bbfsm2632371qvd.49.2023.08.13.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 06:24:15 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E43C6106FD8; Sun, 13 Aug 2023 03:24:13 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 13 Aug 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 13 Aug 2023 03:24:13 -1000
Message-Id: <20230813132413.E43C6106FD8@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 13:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185884

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-29409 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29409 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4016 *

Removed this week: 3 CVEs
CVE-2022-41409 (CVSS3: 7.5 HIGH): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41409 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2975 *

Full list:  Found 35 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3563 (CVSS3: 5.7 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3563 *
CVE-2022-3637 (CVSS3: 5.5 MEDIUM): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3637 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2829 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2829 *
CVE-2023-2908 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2908 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-29409 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29409 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3618 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-38633 (CVSS3: 7.5 HIGH): librsvg:librsvg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38633 *
CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4016 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

