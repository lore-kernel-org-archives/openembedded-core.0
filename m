Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6D7CF6499
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 12:19:21 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.31316.1727612354324361760
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 05:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KXcQOx9S;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.177, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7a9ae8fc076so392277885a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727612353; x=1728217153; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qq9ObIUCJnqHWE2P0NZEp8I3kN00jwzP0CpRgAorkYs=;
        b=KXcQOx9Skcsc+5dh5fgLVSjzYcLbIJxpxvylJJpVjSibOV3Xep2u/ODfj8mG5bmBN+
         0i0MVS3ry03XIYQ6UvLtagnQsnybVrA0bOCY9dywSHhJBgbotZ/0MpZoey19GDHlIuh3
         qIw5jNAkTiu7uSMMT/tsUQ87xi+YvAtbHhfR/g67Jb0a8i8aISaFUchErNvsUl3dG8Rf
         rJJVlk9NDX0AiO6ruXWkVerqIT2ZZ5rmKLaDJeMax24iG97XW6bCtfG9K9fiJEJm0/lS
         S66gk2mgy/wslnFRlLRWsu9/4dMgvvnsfs7YaOF/aGnw8x9viDWlMIMETgvp2A4tFfi1
         mIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727612353; x=1728217153;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qq9ObIUCJnqHWE2P0NZEp8I3kN00jwzP0CpRgAorkYs=;
        b=EFUlUBcHCxl2/nyTDMp/RSiwO0+Q7MunaugMibi7awXxER7vtDuoO+vKKikBqQgRnC
         Naoox/JZzTPsTrad7oIjJFHo8ZJN+5DP9lWmSh+zARFsodA95IKHVHScx9Wo16u3Lq7x
         1Ib7r9AYsTgyygAWV4AGTbPSp/3cvOTEcmwKAQ5GB5WulrqI1wXRKsD6o9/coiuLFQm/
         eTAtIZCkuWYkHmESsAOIPO0HJra5hdlwymIviSTkRKR2eJM/C3Q+m+mwHYiCyqc8IJ0K
         Jn7AG+7kA7mFL83vX1QeNGJENoYpL2xXSH/Rec/RgT7K/DI+eyh9KprqKSNEbxEOKy47
         D1Uw==
X-Gm-Message-State: AOJu0YyQ2wpb+tf+wR3z3AA0/50jdgFE4rEVM9+E9VWrNLXgN/PipspF
	4UbJ8KK5PSwadJN6iyGryGxv0ZA7S4MpcrfkH59LnkbvwNCLnVbYS0MDBjH/7KD3vZYgqUo1NSj
	2Jck=
X-Google-Smtp-Source: AGHT+IH+uXK3VpBqRGtKOscnUcEsde/d8pDW8z9VmpGCYn1op7MS2Wcq5spY8ZVYL9tZbcAnsUwOZw==
X-Received: by 2002:a05:620a:4512:b0:7a9:ae1e:1055 with SMTP id af79cd13be357-7ae378dc7f6mr1388521885a.59.1727612353115;
        Sun, 29 Sep 2024 05:19:13 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae377bc953sm308983785a.27.2024.09.29.05.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 05:19:12 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 81BA51003B0; Sun, 29 Sep 2024 02:19:11 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 29 Sep 2024 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Sep 2024 02:19:11 -1000
Message-Id: <20240929121911.81BA51003B0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 12:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205051

Branch: kirkstone

New this week: 4 CVEs
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2024-6232 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6232 *
CVE-2024-7592 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7592 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Removed this week: 2 CVEs
CVE-2023-7256 (CVSS3: 4.4 MEDIUM): libpcap https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7256 *
CVE-2024-8006 (CVSS3: 4.4 MEDIUM): libpcap https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8006 *

Full list:  Found 55 unpatched CVEs
CVE-2020-14409 (CVSS3: 7.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14409 *
CVE-2020-14410 (CVSS3: 5.4 MEDIUM): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14410 *
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
CVE-2023-28204 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28204 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-32373 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32373 *
CVE-2023-37450 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37450 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-39323 (CVSS3: 8.1 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-4001 (CVSS3: 6.8 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4001 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-41993 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-41993 *
CVE-2023-42916 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42916 *
CVE-2023-42917 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42917 *
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
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *
CVE-2024-29508 (CVSS3: 3.3 LOW): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-29508 *
CVE-2024-5290 (CVSS3: 7.8 HIGH): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-5290 *
CVE-2024-6232 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6232 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *
CVE-2024-7272 (CVSS3: 8.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7272 *
CVE-2024-7537 (CVSS3: 5.5 MEDIUM): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7537 *
CVE-2024-7538 (CVSS3: 7.8 HIGH): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7538 *
CVE-2024-7539 (CVSS3: 7.8 HIGH): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7539 *
CVE-2024-7540 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7540 *
CVE-2024-7541 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7541 *
CVE-2024-7542 (CVSS3: 3.3 LOW): ofono https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7542 *
CVE-2024-7592 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7592 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  webkitgtk: 9
  ffmpeg: 6
  go: 6
  ofono: 6
  qemu:qemu-native:qemu-system-native: 6
  python3:python3-native: 3
  rpm:rpm-native: 3
  tiff: 3
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  libsdl2:libsdl2-native: 2
  cpio: 1
  expat:expat-native: 1
  ghostscript:ghostscript-native: 1
  pixman:pixman-native: 1
  wpa-supplicant: 1
  xserver-xorg: 1
  xwayland: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

