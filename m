Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C635AC54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 13:18:52 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.35664.1710076731865531692
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 06:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cerOhcTI;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.175, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42a029c8e76so29976081cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 06:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710076731; x=1710681531; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVOxliKvCLY8ehUSWR3h5pBMQZGRxlQ5puu0/mErph0=;
        b=cerOhcTI4i5uigQQy9EjvnuOuwPCCWMgJRsWKsObouynAJxgrk0hLRUVmAuFMSG+FX
         fZpwQzL9H3gi7TFH5PLOf4y0Vzf0Ggu895vcUDBpDMua669+Rm8X13kKpuUHQwMI/8/u
         eUxIEcwjw6/xCIzKmzvtshJeRHtyEyDHhocnsjEP9urbR6f8YnfvhUy3soxoa+wUV16s
         dbStQByL17ac524d/w/GiBk9Tvr4GoeAMdda/iURMEcj6yFcpLyy5BKWruidYHOMifCM
         Vsm3hfaLuJ6Qgpv1blMO0FYntvf+cKt9JCmtJAEKvy7vjpGU/WZX4KUV3T+Vij20Zu8a
         tBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710076731; x=1710681531;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xVOxliKvCLY8ehUSWR3h5pBMQZGRxlQ5puu0/mErph0=;
        b=T7VPGboBdpEGF2DFbesfLNUqcyYd7dc1nayS/RgtLyuu9oxI40c/bkvTGQZUQJkOvO
         9z321YfJzqUq80NiUiK1U76CRtSILC8MdkVDX1UPTGb+QZ7BK/30/QlPr+3ZEIQZPcvQ
         K7OiuWxbqyQ1J5MHjSAXWTb+6guwiwqWqi33bnyooBhPHfUjUdBCQj29q1DgwugcHaLX
         fEnL3KpBRUGiu7hIDZrDsnPgu4EmkIM48SmtyBiT9G6wyyfRBn6bx7LEJEssEDRPuTiw
         uDKviQxx+NeAFs4VR8dcXkiIEO5MEtjIOvasqReriUdogIkWanc+AhlIdCw++2iqALaS
         ZsfQ==
X-Gm-Message-State: AOJu0YyYeJfB9bMP2eIn7kF/pa7lUPnhOhXghXstHJcRT68p5yJnb7vM
	HPTav8Shdsc8SOxPdssAtZ+0WrFtluubEI51b1CT0oaswu8nX2s1l3fF4Zu0aaVD4gkx3t1rwK0
	1APY=
X-Google-Smtp-Source: AGHT+IFLmfc99KP66byv7zR2Dor8b5TL/Lfatm6bndgfOnqr4X2fwH4ZG14yraqYUML/siCt3DRGGA==
X-Received: by 2002:a05:622a:2d2:b0:42e:ef0f:eb0 with SMTP id a18-20020a05622a02d200b0042eef0f0eb0mr5317798qtx.11.1710076730804;
        Sun, 10 Mar 2024 06:18:50 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id v18-20020a05620a091200b0078812f8a042sm1810945qkv.90.2024.03.10.06.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 06:18:50 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 5EF0B10689A; Sun, 10 Mar 2024 03:18:49 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 10 Mar 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Mar 2024 03:18:49 -1000
Message-Id: <20240310131849.5EF0B10689A@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 13:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196882

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 4 CVEs
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-50387 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-50387 *
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *

Full list:  Found 44 unpatched CVEs
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
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47100 (CVSS3: 9.8 CRITICAL): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47100 *
CVE-2023-47470 (CVSS3: 7.8 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47470 *
CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-48795 *
CVE-2023-49292 (CVSS3: 4.8 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-49292 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-52355 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52355 *
CVE-2023-52356 (CVSS3: 7.5 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52356 *
CVE-2023-52425 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52425 *
CVE-2023-52426 (CVSS3: 5.5 MEDIUM): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52426 *
CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5380 *
CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5574 *
CVE-2023-6277 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6277 *
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0408 (CVSS3: 5.5 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0408 *
CVE-2024-0409 (CVSS3: 7.8 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0409 *
CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-1048 *
CVE-2024-22860 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22860 *
CVE-2024-22861 (CVSS3: 7.5 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22861 *
CVE-2024-22862 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22862 *

Summary of CVE counts by recipe:
  ffmpeg: 5
  qemu:qemu-native:qemu-system-native: 5
  tiff: 5
  go: 4
  xwayland: 4
  rpm:rpm-native: 3
  webkitgtk: 3
  expat:expat-native: 2
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  cpio: 1
  go:nghttp2: 1
  libssh2:libssh2-native: 1
  openssh: 1
  perl:perl-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  python3-urllib3: 1
  xserver-xorg: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

