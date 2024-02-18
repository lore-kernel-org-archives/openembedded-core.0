Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376F1C4829E
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 11:18:32 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.16052.1708255107988181590
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 03:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gDEhyMq9;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.169, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-607bfa4c913so32083847b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708255107; x=1708859907; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1mZYX5kaorfjWdH8FV54wSZU3qz7hCbYKBgT2fnd4Y=;
        b=gDEhyMq9ooYcghhn97cHJcH1F+8eLRj6LBhrpiJiL+66y7+u6YSaXOUiIaHJTX9xy0
         uYLTnlFxLdGAYIy54ADuriS4+ktO4zY7+3FoAaZT5iJdIVZN2444ArzsrNmpZBfs7Xrv
         6WhskA/+MXsPtBGwGb9IcsTmnPr40twoDztp7KbvCaqJ2E0Tv5VeaKWWBRpR9QPODLSV
         Y/zwTcZjcGIXeCN6uiK9y/KVyJ3WJkSLyC4PLcZk22cJ5xjBkh2jJYrk4IZShofmUqY7
         dVpKxHBxcX/ETPG8nGh2s6/26THl4CMXcgUtZou/QiCVR8oDAvZhgRWjWLavPU9O2oB+
         5oWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708255107; x=1708859907;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n1mZYX5kaorfjWdH8FV54wSZU3qz7hCbYKBgT2fnd4Y=;
        b=DrALu71iltNMDS9zLvQ5aN2O1AIvmfkYh8CZmxGBNkn+XWYS5/vCnZnNZBd9QR9MBO
         2hCfh4XoA3bs2aASxpXiUG5CATKv+T8wDYIi21ZwUbv+gq1ojSBzMESk8V0JcRD7QIp+
         HcgSQ2mmqDL4xdPnT5fuIISG6qw8sKvUtg+8hOuw2cLe7pRB+5NXTuy69j/zl27G1TCG
         dTnFxdWi0dQRPTZM0GHL/feJihOmkGwH1oFWBJHvU4ArOHH/9nVL7x/GdilCxuIPQbLW
         GtTOPdhDZZ34TQqN55RYnJQ6U/99thsClvCxB+VHwoypoY+0DfAkPK/JwlAFKv/rqdXE
         lmOA==
X-Gm-Message-State: AOJu0Yy3alKg/U+1IXiBTl0SKrYlGDEysrbND+Yka+8GHKjxfeDK/god
	VFEuF5Mzz6o06dmvPr9sWczN4sW+TTwmOpGGJkGQ30QVCbPU+GmDVzchCKZ1hgfSF3rYVpIHoYH
	8
X-Google-Smtp-Source: AGHT+IFBzOXE/sbi9EVLPcJ/3NUlCb6ES+m2UstzrTc8Z7o1/eQ6F2xjymJ47KTLOA7R7+D/m9M+Ww==
X-Received: by 2002:a81:ad28:0:b0:607:838f:8991 with SMTP id l40-20020a81ad28000000b00607838f8991mr8361289ywh.38.1708255106913;
        Sun, 18 Feb 2024 03:18:26 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id c9-20020ae9e209000000b00787225ec70fsm1539579qkc.82.2024.02.18.03.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 03:18:26 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 850BB10693E; Sun, 18 Feb 2024 01:18:25 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 Feb 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 18 Feb 2024 01:18:25 -1000
Message-Id: <20240218111825.850BB10693E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 11:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195825

Branch: master

New this week: 13 CVEs
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6356 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6536 *
CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0684 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-22667 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22667 *
CVE-2024-24575 (CVSS3: 7.5 HIGH): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24575 *
CVE-2024-24577 (CVSS3: 9.8 CRITICAL): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24577 *
CVE-2024-24806 (CVSS3: 9.8 CRITICAL): libuv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24806 *
CVE-2024-24860 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24860 *
CVE-2024-25062 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25062 *

Removed this week: 4 CVEs
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51384 *
CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51385 *
CVE-2024-23849 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23849 *

Full list:  Found 55 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3164 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4692 *
CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4693 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6270 *
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6356 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6536 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6780 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6780 *
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7042 *
CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0684 *
CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0841 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-22667 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22667 *
CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23307 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-23850 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23850 *
CVE-2024-23851 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23851 *
CVE-2024-24575 (CVSS3: 7.5 HIGH): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24575 *
CVE-2024-24577 (CVSS3: 9.8 CRITICAL): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24577 *
CVE-2024-24806 (CVSS3: 9.8 CRITICAL): libuv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24806 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24860 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24860 *
CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24861 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25062 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25062 *

Summary of CVE counts by recipe:
  linux-yocto: 29
  qemu:qemu-native:qemu-system-native: 5
  busybox: 4
  grub:grub-efi:grub-native: 3
  libgit2: 2
  binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native: 1
  coreutils:coreutils-native: 1
  cpio: 1
  ghostscript: 1
  glibc: 1
  gnupg:gnupg-native: 1
  libuv: 1
  libxml2:libxml2-native: 1
  nasm:nasm-native: 1
  openssh: 1
  tiff: 1
  vim: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

