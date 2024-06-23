Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DA6C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 12:18:54 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.116353.1719145128986896193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 05:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g6AGApqi;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.175, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4405e343dd8so15334591cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 05:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719145128; x=1719749928; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI0G5xOxGDKYN2hbK27xqyPsIc+F/P+V57k2lEXKSJs=;
        b=g6AGApqitft/rL6ZM2xHLTR9yfzvGW5lTz3h4zMr22E+uHP9UpAXCqN67lxwAjYrXY
         fPm9BE8mzRMSL9XwHq5HM11hEJAKPcxzco/hRISqYm/HeCBIbprQxv5gf5MF8iKhyHfW
         J8/zPQxwHd2rggbvDSGxoaS2ArvSK6E9PpH8CjFKBG4XO3A33f4odHetdKoRYrszFecd
         DkIGcok7vsvLdeNpQHiZ9YlKuKkdbDoan4XmHqtVkKospyiqrLbIxg8FGkH1AYKtgWCp
         SdxlkqEFAEH155bPFnQsDZlWZS1EcroC8Pi1gPq4M8CJRFfIwBYbtIlYP8wEI+D6cl8m
         Yh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145128; x=1719749928;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nI0G5xOxGDKYN2hbK27xqyPsIc+F/P+V57k2lEXKSJs=;
        b=mhQ8qfwKwTi7XRmTn6j9jBA47rqS33mLLXIJqhQ7RaSBVMLVCoPGR4AHf8qiUB9Vqw
         MX/apLH2kTLvkwxlvCmH71+zudD16n/XbAHx7YR8MYoM1CbSDhGoYnfwlIvWfP/05NRV
         FrVCjo4+ppeUPtXjMeRB21gz4F8Sm8YFGjsbzZN9KfwfgVw/XC69s1vgjfOdXBns82Dh
         mcfEZ2wP7DSx16b/KMwuM1iS4sphZRGgkg/gULTfftfpc9qbyPRQ8jRJzwNfG9OBwVzL
         8M7Qk6GeP5RJHFMPF65QP8TWuncsR6VQoJdpVpCXc0kC3Tken3fsgoB983Z/S++2f05M
         ZBwA==
X-Gm-Message-State: AOJu0Yzdpf5bozegqwovNIdus5ruicRECYLLnzJNlSb3cIiaVpQtjFBZ
	k4pfTCjSc0yBPAzZW3rMDguQa3Fi5FJtKAyHq529Im88m8YgLXlQY4U9W+6pHxuAUEe3ebjHACx
	0CqU=
X-Google-Smtp-Source: AGHT+IEW5JoMga690/wOa4lJP0iEJvPRjuIIjHUV8j+8Lm5192Ae1pEUBV5M+nUc5dEHYFdPzg5AHg==
X-Received: by 2002:a05:622a:2a09:b0:444:e35f:a861 with SMTP id d75a77b69052e-444e35fa8dbmr1549801cf.31.1719145127844;
        Sun, 23 Jun 2024 05:18:47 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c2b68c8bsm31479041cf.35.2024.06.23.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:18:47 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 7CF8310039F; Sun, 23 Jun 2024 02:18:46 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 23 Jun 2024 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 23 Jun 2024 02:18:46 -1000
Message-Id: <20240623121846.7CF8310039F@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 12:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201052

Branch: kirkstone

New this week: 2 CVEs
CVE-2024-24789 (CVSS3: 5.5 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24789 *
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *

Removed this week: 0 CVEs

Full list:  Found 35 unpatched CVEs
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
CVE-2024-24789 (CVSS3: 5.5 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24789 *
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *

Summary of CVE counts by recipe:
  go: 7
  ffmpeg: 5
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

