Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA534C4829B
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 13:18:38 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.36963.1707657512227799729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 05:18:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jR2Hw3Np;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.182, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-785d5705681so8729585a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 05:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707657511; x=1708262311; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoXrthgPuzkcW6NbkkdSWKQfi2DnAZ/uICLqAQTJB1Y=;
        b=jR2Hw3NppEpaEUOQKNypM6+R9FdzDCX4LGMiDYWaPVhxfe22NVtsDMojYTbM1J/WFo
         kXTG6ADoDYU68J2MZf+Vn2zeiwhDpxj29yu1sZonGOVmWNgomSDX9fsuCeJs1jjrsoO5
         V/niXspaXrOnILRoyotHnvE5C1BHr2lhUqf/+mJEKd71wwCE8/5S4sMfO1ktgOWGFiz3
         pDIn+DNaC66xNtcti68NnCjSdcDBKG2uuWrbORe9PP5CEdeVqjIGWgqTnob+1/kS2lSf
         0wN3Y24upzeXmqgCczXUXubd/WqBYEbDVMC4cYmiDdrD6WbVvv/X+sGeofNhyvymBXPf
         /1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707657511; x=1708262311;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PoXrthgPuzkcW6NbkkdSWKQfi2DnAZ/uICLqAQTJB1Y=;
        b=G8++F2uJZS5LKCc0y2DBfbWm0s8SQrNAmS6n2Bet7y7/0Iv21/RqwOiT90WU9nD29f
         GC2KGjVm9nllx9PfCQbV+mVE2ffc8b2P5THwe5gIZIkX3LKx1VwJelGMsFzC0X1OEcD8
         fGPU6KD99eDt49vZW7QSnb5+R+exzgiS9lpRMrrwzKbEWG1GG8wxopGpSQh3Xn0PDxv8
         juNoFFW1du8AM1LfdjDvkeD0OfgjHncaQjvH8oTkoKVpHCh1wzyIaoRR23ccGreGOja7
         sBhzszwkBlgl7wlltqNQsfl+A3+341UoB/kIKsBsMA0keU0o+Me4FeGyAJo/51Dyw57F
         XrQA==
X-Gm-Message-State: AOJu0YxdIP7uGjIUixUMxZ7GIyhfR8jIee5eGxVdHIuGguVRnq1cgpBM
	/qeIJssB1+5tAP88GhCD2rr3BboLRQkZtloSFHdeFuwYJR50aCi1lybMne5zSAU537bPiTYPiA4
	E6Wo=
X-Google-Smtp-Source: AGHT+IEhSVORUquPuDwHYvsUGSoP2/SHK+JJ8G9NjTX8asvcCQ5TXtIfJ+Wh8f8Ip+aWYRauaEZcpw==
X-Received: by 2002:ae9:f405:0:b0:785:c298:3eec with SMTP id y5-20020ae9f405000000b00785c2983eecmr6063836qkl.14.1707657511080;
        Sun, 11 Feb 2024 05:18:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS1OLECvvcuXVsq6yY7JB6ySsJNiwIUxD7FvZR5ZJImB/vbAyRGLwe6gv6dbvn9VeTapShomDZbtUUIeJsnWoHcm++DsQydHmMO924jrLp+Dp2/+cf
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id m16-20020a05620a221000b007858e7b4279sm1285962qkh.83.2024.02.11.05.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 05:18:30 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id BD4B21068C2; Sun, 11 Feb 2024 03:18:29 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 11 Feb 2024 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 11 Feb 2024 03:18:29 -1000
Message-Id: <20240211131829.BD4B21068C2@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 13:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195291

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-52425 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52425 *
CVE-2023-52426 (CVSS3: 5.5 MEDIUM): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52426 *
CVE-2023-6779 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6779 *

Removed this week: 7 CVEs
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42915 (CVSS3: 7.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42915 *
CVE-2023-6377 (CVSS3: 7.8 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6377 *
CVE-2023-6478 (CVSS3: 7.5 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6478 *
CVE-2024-0232 (CVSS3: 5.5 MEDIUM): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0232 *
CVE-2024-0727 (CVSS3: 5.5 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0727 *
CVE-2024-22195 (CVSS3: 6.1 MEDIUM): python3-jinja2:python3-jinja2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22195 *

Full list:  Found 47 unpatched CVEs
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
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-45285 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45285 *
CVE-2023-45287 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45287 *
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
CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6693 *
CVE-2023-6779 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6779 *
CVE-2023-6816 (CVSS3: 9.8 CRITICAL): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6816 *
CVE-2024-0408 (CVSS3: 5.5 MEDIUM): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0408 *
CVE-2024-0409 (CVSS3: 7.8 HIGH): xwayland https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0409 *
CVE-2024-22860 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22860 *
CVE-2024-22861 (CVSS3: 7.5 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22861 *
CVE-2024-22862 (CVSS3: 9.8 CRITICAL): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-22862 *

Summary of CVE counts by recipe:
  qemu:qemu-native:qemu-system-native: 7
  go: 6
  ffmpeg: 5
  tiff: 5
  xwayland: 4
  rpm:rpm-native: 3
  webkitgtk: 3
  expat:expat-native: 2
  gnupg:gnupg-native: 2
  glibc: 1
  go:nghttp2: 1
  grub:grub-efi:grub-native: 1
  libssh2:libssh2-native: 1
  openssh: 1
  perl:perl-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  python3-urllib3: 1
  xserver-xorg: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

