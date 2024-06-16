Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C918C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 12:19:17 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.32813.1718540355358002319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 05:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OOTejHT2;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.53, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-250c0555a63so1792654fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 05:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718540354; x=1719145154; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBy+6XwYDhwH0PKgM5Ul7Z1pXM6MgW8TUGoA6xrYhnI=;
        b=OOTejHT2pDMWeYLOyCCIfObsJ2FnMx4v4H1TMp/2NwrppMg1AWz4iSsr9TpScYRCkc
         dekJRfOIj6utHQVTGwYVBkG4QdeR/fk40TgmWGpz6nHbWSqF1XINmOhomIFeU8EGt24l
         2Lh+jFLPVqiiXjd4Rg3glwdMqRIQ+VvxK6GM7EeHTXrDT8Acp9MtdBTv4eU9fGMsrLgE
         /bAI3jAVyK2zEq/FRZlu25KRXqfVRzUoTfdMU5OrR5Qi5w/pLQwQJa/fDE/QFeghVfqT
         TkzWASBvnJDiimf79fZwKf54zZ7xdZQT+OF8LJwMMtoYXVpX5TAHhAIwwvuReiWzIyHb
         UvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718540354; x=1719145154;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBy+6XwYDhwH0PKgM5Ul7Z1pXM6MgW8TUGoA6xrYhnI=;
        b=dHzq6yqrwzcWrZBpc+JnHIvDB+L/Qf3SUmGlUVTH0MjommJJGrndKMUnI5a69k4WL6
         dIlPg7EVoWSIfkkum/gRDsOElB4VQ3DsBF4x2a3sin9E51qI6WvI9fhKe8JAHigeirVN
         t4iJv3CAy/nQUrvB/cM2TO3Mpdd52aDThOzz2s1qaDgN1/zWK9nVVi9sFqCJYnEFne2w
         eIDnLB0Aa2mh+Cv505kYH9b/1dz3AbYviyKBpug+KeYdcy9iIWzKyWZyqXxwzcfUJq5H
         k49tcN72zH4ewx/wHn8njSDmcxZsy/VEOUgANEWhtcjWu383ics0CMTn8m+SoQ5w3lfl
         F1FA==
X-Gm-Message-State: AOJu0Yx2vooT9rFizpeBQk8pJ26JEndLMf3O4Tp8WKGkpRWCRUrsIEcm
	TJEBtvvzuSB5Qc90s71YUdRY63R/qG+KMHJ6p17WLA/uQ/Q1Dyn5KgmajapWNwknii35+Gw85G1
	RuAY=
X-Google-Smtp-Source: AGHT+IHRm4HKpKRBjDaze7GotSHwHpST0ozNK+MhjzxvqbJrDfk2Rn3HCJqcA0hSaYhCMRg02Uqarw==
X-Received: by 2002:a05:6870:a414:b0:258:4ae8:4af3 with SMTP id 586e51a60fabf-2584ae84e4fmr6515438fac.37.1718540354279;
        Sun, 16 Jun 2024 05:19:14 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5eb47f6sm43063536d6.82.2024.06.16.05.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 05:19:14 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id DE92C100255; Sun, 16 Jun 2024 02:19:12 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 16 Jun 2024 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 16 Jun 2024 02:19:12 -1000
Message-Id: <20240616121912.DE92C100255@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200777

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

