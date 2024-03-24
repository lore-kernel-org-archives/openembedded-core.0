Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED210CD11BF
	for <webhook@archiver.kernel.org>; Sun, 24 Mar 2024 11:19:04 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.27498.1711279135602459506
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Mar 2024 04:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JfKxKgnl;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3c3aa9ca414so2286658b6e.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Mar 2024 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711279135; x=1711883935; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVCgXlVDPMlAEk8m3V+nok8MZyHtl8NrY12D4bln5Is=;
        b=JfKxKgnlEJKLXJYehOQ+6ESXdI1IZWUNdUdF/5aPvI4ZFmgap9c+vawrox+XA0lLKa
         OFU8CELTi7ZsiM1QXfD63HlIAYA+S1G72vwQaIGfSZrsAqP83XhQArJ2/bW4gPWIABV/
         XFaOMEiuS6H3aYSQHM5YX5cTo4NGTTbq1YTjAtmo7E8c/G9Wg4jIAIhFr6rc0DUHj0ER
         r5SmVeUePBsRddRH9Hg5kDB4DWCJhmlsqcGQomob+RpNiGB+MfsCUTQwIEAWeMGQ78GS
         WDJo8fIIqtrc2IkzqaOcFweXCRJcqyAdieFEYf/ADSUnuT1VT2upS4mHgP16kbeM1yNs
         GFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711279135; x=1711883935;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hVCgXlVDPMlAEk8m3V+nok8MZyHtl8NrY12D4bln5Is=;
        b=H7rjt1+KLMxht0NZfJEgMGhT1PDvSdRBz8x6lItzZlqs7UCMyogj4FA3kXooT830JA
         ntW4s2ljbYiczNgGlUsU/563tfbPfPwvptB5k7DD0B3wiJZdbPScej4AB1y/GVhuGOQv
         CPHlreu0dfI7qSxrgQoSWQIvXznp60zaIlQG4pOsQCQi+jAXNEySeWXXBPe3UfsOyPws
         jJFtXG4kqecuW+bAU7ScUoOk3CwbVmt2lfL23oDx55Wznrdbq+acJD+GOawB9FxheuIi
         PjKRbfvw4GZ39Zz6gjpK3HLBEqZm/+vIwmXCPes8iKs4pEb/jmRYHGidwDDlAtC9tDkX
         xNMg==
X-Gm-Message-State: AOJu0YwmNCRO1f1AIxpFbvNdq0n+O+P+FXZA92JndAbd1OX3lQYzhXdO
	46S8oZosNAWijkjJ47W0hx5fJbANHjsilBmQMuPIpjhHHjvdmS/rEhQfIdVYeaNSblkbKFpi/nJ
	2SjE=
X-Google-Smtp-Source: AGHT+IGjzswEIVcJrH97Vg9WbY+MMdf7kxuQFHZTNpgggIY4Y6vYkp8MwIpxGDN8EFwbbDWc17WtRg==
X-Received: by 2002:a05:6808:99b:b0:3c3:bf34:60fb with SMTP id a27-20020a056808099b00b003c3bf3460fbmr4106590oic.51.1711279134579;
        Sun, 24 Mar 2024 04:18:54 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 7-20020a056214202700b006968ce99b7esm73784qvf.34.2024.03.24.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 04:18:54 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 237AD1068FC; Sun, 24 Mar 2024 01:18:53 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 24 Mar 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 24 Mar 2024 01:18:53 -1000
Message-Id: <20240324111853.237AD1068FC@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Mar 2024 11:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197473

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 37 unpatched CVEs
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
CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6270 *
CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6356 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6536 *
CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7042 *
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0841 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23307 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24861 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *

Summary of CVE counts by recipe:
  linux-yocto: 28
  busybox: 4
  cpio: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

