Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A952CF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 11:18:56 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.29630.1728818329117249442
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 04:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eatM1z5K;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.171, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46041d86566so17945751cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 04:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728818328; x=1729423128; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TL2gdLjY2AJ6r/w6TDWtLrvDJV8Y0JVyXoRLdR3Hrc0=;
        b=eatM1z5KES3YGVKK+41Ifq8Hg1WWV6oIe/mPs5OrnOd31CwD7oDyUaNLBVsnDNMsd0
         QLfCvgV8fZkU+/idvRTOtDMfpnwV2I/irDh2AcoaQc0z6SPg6EvEsX6TwUg1bU4ok/C5
         siJI8EsBnoyxbboAQaJ3kJ+18NG9fGZ+UURP6o5sYkoC7Gimyj8SldY/3bkyuLDctIyT
         jMmsKrPauyP0Vr98XTFjOld5loVDPrUl+FK2DFxSnAU15TfOznkJUGu1S1FHYPrHeW1Q
         PFV3Ka1LwhwHI/AK8quS/rntrRT9/bzZDOVH1CYWid5SIvK8sMtE4Z3N5k4wRmDmlVo/
         yoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728818328; x=1729423128;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TL2gdLjY2AJ6r/w6TDWtLrvDJV8Y0JVyXoRLdR3Hrc0=;
        b=lTBEzTh5EyXPw7Hl4Qgm0m9LTLMU20ysZvU/R4OoDc09Un1NWZd0/k1+5Aud+S0u/D
         HYa2xyxW9pthmqBPkG73rd3V4PtlDggYSsdatDXN7G/z0ucZ7OUFTtKzFYPdQQB1Jl+M
         RVCr2V0UgP/sKZBbCtgPL5oZ1iZ/I939WjRZdzVmipvjz5HkxL5g++9460+hdzIyQvAm
         8TS36+H0OUZ0VzIwLiiBCFuquDfD+Y9lbNBkyJX9UI4LXod9hGSyQ1FGYXTuONEWPGRL
         eqe3L67yKRvYqkFQwzakXFY/5JvfeiBMk1p1eU6a+1HjBbEbvoWCwq0lmFFbG9w5ZtkJ
         kG8A==
X-Gm-Message-State: AOJu0YxN7Oh7PSzdUbo1ehVliQO7K1+oLRTdH0eLLnbMq+2qoRJd6ZZK
	L+ohWSQrxiXWGOc15yk6WDTsv8kUA/u3xS05CIVztRaqCbkO1BhKFMBNFTz4PbS+GUvSLVpc1BE
	h
X-Google-Smtp-Source: AGHT+IFD8e1B/YykbyuBbPFHg7d0WbyMeLMXht2rBhq+y/oyZ2q3T8PKCmGoMPX+vkCOoJb9BNy3Mw==
X-Received: by 2002:a05:6214:4806:b0:6cb:c487:24b5 with SMTP id 6a1803df08f44-6cbf009970bmr113053186d6.32.1728818327859;
        Sun, 13 Oct 2024 04:18:47 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85d859csm34030556d6.64.2024.10.13.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 04:18:47 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 88F60100511; Sun, 13 Oct 2024 01:18:46 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Oct 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 13 Oct 2024 01:18:46 -1000
Message-Id: <20241013111846.88F60100511@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 11:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205718

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 21 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-43402 (CVSS3: 8.8 HIGH): libstd-rs:rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43402 *
CVE-2024-45306 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45306 *
CVE-2024-46864 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46864 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  qemu:qemu-native:qemu-system-native: 3
  libstd-rs:rust:rust-native: 1
  vim: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

