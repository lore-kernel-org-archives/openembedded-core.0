Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B7AC10F1A
	for <webhook@archiver.kernel.org>; Sun, 12 May 2024 11:18:42 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.33272.1715512714720990311
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 May 2024 04:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MNX7AIcR;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.182, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-439656c1b50so22536421cf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715512714; x=1716117514; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPzhDCmp4ZO6mzFmGGlimY/kJK8c04EWthu0RQm6abc=;
        b=MNX7AIcRYZwL0y/WaG05L7zrXIbnfSBVrU8j4RW/XhPcg61ffSTJH0rKuPeM/cbncP
         ANQzG6xefQQUFTR7uqalVIKRxRw/aQZq6UM8ZAIpv78LleeCuuSlf8EunjNAaZ/suRqF
         yyMLTVjT/QevyBKh5uWElghG/xOMOmZvGZr9rWMsPBy9YsBD+2nV1iGlOTKTykaN+Pfy
         53rFTRSKHZhGkyEN/ve8+FGXaU+K6duoLYzz//UKgXTcgbAWZbooTf/eSvlE/oJ4lm/f
         qi8anUukVrvAZU29pzZc1cx+4cPwiO37oKznKzkGs9ms5hHGD9MuWucgDYGoo78v3WSQ
         dDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715512714; x=1716117514;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPzhDCmp4ZO6mzFmGGlimY/kJK8c04EWthu0RQm6abc=;
        b=iJ5BZQulA/wQSGEJdGZgXEob7YC0R85EjFinhFMsCm2s3NkTDB5cUvFUAKqwcdaML5
         b9DYPLZobZLhqLpAcSwSzyAywHtLa/5gMXxa0otidboQxF/NcSpdLIu0M0ORPVTfBqeM
         dVfXc9OtnxJTumqnXSaBMRjfBGAkxvKYqJdnet+nt4/erzgNvHttzNeJZZfJHi/2JjTg
         QmhoqP5WyDk6dxZDygdqRdfJWHXa3Jl6ZJrbQdJkPFDJE5ey7jeXOafecdiqXntGFUBL
         O9sW1Fgfq0yvWNsz6YCyDoKaINmBluiYeCHwTHsxjXtu97H+UIsH4X2PiUcsE1geBkA/
         O37A==
X-Gm-Message-State: AOJu0YyCdhs9GcQ+KrAE67rU4As7Prlqp9B9kMW7y+jxTqTxZJz8EwIL
	hwQ0FXbKGDy2UlGBWLXKEmXeOCeSwkGeb1b2dyHRjnjwWD3xaYG5IX/vjsTSSOlTSY1Iv6OevbB
	u
X-Google-Smtp-Source: AGHT+IE5IKSvLrIAhNdFR9mdRPUj7vHnkhaDilZN0QF4s9O/Ertv93U8vW4ENUs6YyHdV+wIlEorTQ==
X-Received: by 2002:ac8:5708:0:b0:43d:e8b9:b53e with SMTP id d75a77b69052e-43dfdadfff5mr82451521cf.32.1715512713611;
        Sun, 12 May 2024 04:18:33 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df56e25eesm42704061cf.94.2024.05.12.04.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 May 2024 04:18:33 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 0D18F100444; Sun, 12 May 2024 01:18:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 May 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 May 2024 01:18:32 -1000
Message-Id: <20240512111832.0D18F100444@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 May 2024 11:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199215

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
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
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *
CVE-2024-26596 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26596 *
CVE-2024-26900 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26900 *
CVE-2024-26913 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26913 *

Summary of CVE counts by recipe:
  linux-yocto: 24
  busybox: 4
  cpio: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

