Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0A2C10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 13:18:53 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.34734.1715519931363194015
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 06:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GCNxHiTW;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.182, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-78f02c96c52so227213985a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715519930; x=1716124730; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBy+6XwYDhwH0PKgM5Ul7Z1pXM6MgW8TUGoA6xrYhnI=;
        b=GCNxHiTWpXwSGtaSfLdtpbnKUwshz8H/bf0bmMkGmh8+4EUUVfXo9234Pwn8VUHYgp
         LPzBkVlf82t8KYJfvGg96mJxP9jjYhdrjrG+Wu7s1BhgKAPMONNoLI/QG58pCgK74ODl
         q4Uu+8aHFCJVkrE5MA6Lx1W445ZZnhdSk3FSG0OSYO/0WpTLhg35PrxgxlxhrSdFHFzN
         J2cGIp4TRGSYq67xKgJtQGpT3P3UWFSgloRSWUDlp/clt2JJ7tSUJO7lKgxXrJ1KriJ0
         tODfnf/hFIVuTzE2ZaoV4KW6ninReYKbFS47b2dO33SZvJnJj6ee0zkXZCJn+PmIXF6E
         IyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715519930; x=1716124730;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBy+6XwYDhwH0PKgM5Ul7Z1pXM6MgW8TUGoA6xrYhnI=;
        b=RXDgwOFzIUZ7teszo1qQ53igEDvaKxc/qZ2tUYiQTRncGuPgEPmSmJyv7zp1FKucoG
         qDSwBHky6KamRkaVATP8bvEiyyfP0LgsHnUp2L6QjpPWDtVKPTDy1z7U35jw+nV5dsCQ
         2XTvw6uxeJk15jzfAOaHujiL2dkqDYtxW375Jch4PDPAiYuSxZiInoidiaPjAmAGKWIU
         4daM53F6vMAGhs2i4QS5gOZ6N2h9FTur99Y8vt8Odr88NoormcPKoLUwv8Tyn9ahFZ2M
         MX5tig2zklPOYIaBCuvyk/1hPsVkCmdRKkNif3Mq8cjOZLwWxqpgXRKMeBdcfk97XOfo
         5WUA==
X-Gm-Message-State: AOJu0YxhTbtHAf4RSZLfp4uhslJ5MxfRNIrM65f7vWSPSFUQ94spRf+B
	2UhC0rKl2LnjDPwKaYSiucaavY/A6C0G7ZAa9EaHuTkbJtj6KUoAoz2DgDpjlAabP2UtcrSzyay
	l6uM=
X-Google-Smtp-Source: AGHT+IH149CK811d/Q3N9Ncsl+JT+RM1rqVYYKQgVCUUvoPotH07rBUa/w94m5c6s6OoFU0FjcfAuw==
X-Received: by 2002:a05:620a:9d7:b0:790:abd1:440c with SMTP id af79cd13be357-792c75acb68mr816462685a.33.1715519930153;
        Sun, 12 May 2024 06:18:50 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf310c2csm364419885a.112.2024.05.12.06.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 06:18:49 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id BC1CF100320; Sun, 12 May 2024 03:18:48 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 12 May 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 May 2024 03:18:48 -1000
Message-Id: <20240512131848.BC1CF100320@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 13:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199217

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
CVE-2023-52425 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52425 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-22860 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22860 *
CVE-2024-22861 (CVSS3: 7.5 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22861 *
CVE-2024-22862 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22862 *

Summary of CVE counts by recipe:
  ffmpeg: 5
  go: 5
  qemu:qemu-native:qemu-system-native: 4
  rpm:rpm-native: 3
  tiff: 3
  webkitgtk: 3
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  cpio: 1
  expat:expat-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  xserver-xorg: 1
  xwayland: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

