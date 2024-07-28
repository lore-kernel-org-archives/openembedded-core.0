Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A884C3DA64
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 12:19:46 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.33954.1722169184980954511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 05:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eIiqGI0s;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.177, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44fffca4fb7so9044611cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 05:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722169184; x=1722773984; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7f94R/KNOelY2zoEBOKFa2BFl7nsA3nQ+GaLNlPXyHk=;
        b=eIiqGI0sR62hF0Vqe0JBEUzgIK0xvHJSmgkqkGrtOOAWbnX/81TwxuC1W8KBV5nrLl
         UcPOiUsNzZ4vvduJgI8ZXWZGNUIVmqFXyZ/9APwqF7aKQ7vU3lYMZutaGzgfU9DwWjcj
         xGZsPuDPLHvTO2BD8AUfbxdSINCCpXniG7yH2ldJiDxxyHRtB43IlxSReyfbHq23pJoI
         r+lIx/9D6rN3SpzXKVkEa9atSafr+Ag0f8B/4BJ66djBcSSHu6R+cFm6r189Qww3mu20
         oqMkpyERcAGvh7Nh0xerrlhuQ930nsiH6pW4s9wYoAVdrc/0Knr/+CRKDom78xsf+2iA
         W0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722169184; x=1722773984;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7f94R/KNOelY2zoEBOKFa2BFl7nsA3nQ+GaLNlPXyHk=;
        b=Qh/oHQOXVjZhJbOwzHuvpRepbY5jz4bBoOBBW0yL5T93QmRwMDVvXk/gI+AcOnT7Pl
         j8yRqSBPagdplK6fa/Lb/LDq404Hic5mnbi72u4y/U5BueV6vbQoyDSovqnkT8Zlicy3
         JxA6OHzG549ra4zjVDWONnTZi518igUl0MOYNsv38idyvmIvG7bG1Nv01ERL5h2M32hE
         0/snlad3xqV7IO1okgesz7nXlEA0MFFtf7sXtMj8NVz7ri+GKTLFCg1wKOMkyqotAIvE
         ere7KuG1v2Eug50om+vBjEhHL9IA6oWo50YrNm6IRmn8YBBvRk7qUJ+OYieHiK68yWIQ
         5Tqg==
X-Gm-Message-State: AOJu0Yx/RnP8rNZ2FSZ7AuviqM2AP6/mNg3idvLnwYKGd2o2LACca2FW
	kqKGj+bpWxkJl/eF8tnaDws//s1Oda3LfEM9qOQDwlwdM/0+xoEyjspF/5bebS8R7U0V38/xGTh
	+EIg=
X-Google-Smtp-Source: AGHT+IFhO0qxLwf1IFj9ZdUIDz5fLgtNBrSZYixOIYFXiJiVJpOOQsrMxQsKj1PnM72Tjo+tr6l21Q==
X-Received: by 2002:a05:622a:15d1:b0:44f:f06a:d6f5 with SMTP id d75a77b69052e-45004df9460mr74316531cf.36.1722169183677;
        Sun, 28 Jul 2024 05:19:43 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe7e8a2e9sm34252451cf.0.2024.07.28.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 05:19:43 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 4AC841002DD; Sun, 28 Jul 2024 02:19:42 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 28 Jul 2024 02:00:02 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Jul 2024 02:19:42 -1000
Message-Id: <20240728121942.4AC841002DD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 12:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202566

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2024-37407 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-37407 *

Full list:  Found 44 unpatched CVEs
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
CVE-2024-24789 (CVSS3: 5.5 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24789 *
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *
CVE-2024-35328 (CVSS3: 7.5 HIGH): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35328 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *

Summary of CVE counts by recipe:
  webkitgtk: 8
  go: 7
  ffmpeg: 5
  qemu:qemu-native:qemu-system-native: 5
  rpm:rpm-native: 3
  tiff: 3
  gnupg:gnupg-native: 2
  grub:grub-efi:grub-native: 2
  libsdl2:libsdl2-native: 2
  cpio: 1
  expat:expat-native: 1
  libyaml:libyaml-native: 1
  pixman:pixman-native: 1
  python3:python3-native: 1
  xserver-xorg: 1
  xwayland: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

