Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28F2C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 13:04:36 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.35806.1686488674460932831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 06:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sk8Bt2nH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6537d2a8c20so2717740b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 06:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686488673; x=1689080673;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtYeqdSX98tOby7ScwS8xGlCEyyFlSoWCL+4o1wOe2w=;
        b=sk8Bt2nHvKM83EuN5uG3TBCqhngRASUuW6KiZkr2ncuqwwOwQaJLu7Dl5GBTiGKlkc
         OYATAN+GHsLukQ6nOPxus9wNFqz4blWHFtmZsHEJuadaBaJ69t0itDaNwxVKPcNMK0fg
         FVYblsFErBQsq73BVLzydhLrDVsGhqEbnFaOB7sBweljlBS7SoELntoKgNxNpHRihRuD
         ti3bzB3quVYOGs22duzbUwxkBTvzJWAOVua+6R+4D9t0byDD7X6iBau940AuuXA3y5Op
         X3/KsrsvunnHU1FRuZLnQiDUAAoia7kRb8wDrseow8l5+e2xF99sDC3uUyjbBvo0pQL8
         /QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686488673; x=1689080673;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CtYeqdSX98tOby7ScwS8xGlCEyyFlSoWCL+4o1wOe2w=;
        b=LToOGqvVK2JxFDwt/6JMp51CCAh4WCvQk1+gkYm6c1G8bPGrX2Es6lhhkV9Ac+dSA1
         LtaSxnRcyU15uJRdamYuOsyOBSdVHOzPh+P41nizTZhEU9OlHnD/QNYkj8+hKttxaYe8
         lpMXq4UZ+Bi5niE4I/+baxQVQNuHZN8f2ECxYEdlH8GeqLJTzghfkXe2J8DK7i2hA2yE
         o2PyO1Tdoyq7DLvzSFFMUkm6PCWp9vzCY+U7w3dtJCvmXng5rz2PYWQYBmrgmdr0F1YG
         OdFgay1Ude8jGUeFQ/Qu+XhFi1+jHv3A0eKLDN9ZWjrNY5SNBcqtcs+zdw6YB7WBM0PR
         gA8g==
X-Gm-Message-State: AC+VfDzblbPWiL1Fkq+VQUZt77s3yKSqMEEHFSFdv8s6+LWX9mjQsJcS
	cBAl9Wub3ZDtzyOI3MTDuXDuXGBwTSN0pf4RKso=
X-Google-Smtp-Source: ACHHUZ6UY3AgdlRMfKXOpVzhqG2VPrCtw8/e4J8C/GWAiE3el9xjwCO1ds3Gk+Cfh4X7bRptzDBcHw==
X-Received: by 2002:a05:6a00:80d:b0:64c:aa98:a69f with SMTP id m13-20020a056a00080d00b0064caa98a69fmr8514913pfk.1.1686488673410;
        Sun, 11 Jun 2023 06:04:33 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 25-20020aa79159000000b0062bc045bf4fsm5538222pfi.19.2023.06.11.06.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 06:04:32 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id CD69E9604A6; Sun, 11 Jun 2023 03:04:30 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 11 Jun 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 11 Jun 2023 03:04:30 -1000
Message-Id: <20230611130430.CD69E9604A6@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 13:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182618

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-2650 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2650 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *

Removed this week: 0 CVEs

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
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24539 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24539 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-2650 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2650 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *
CVE-2023-32681 (CVSS3: 6.1 MEDIUM): python3-requests https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32681 *
CVE-2023-33204 (CVSS3: 7.8 HIGH): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33204 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

