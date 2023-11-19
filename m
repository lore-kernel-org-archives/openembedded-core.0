Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C16C072A2
	for <webhook@archiver.kernel.org>; Sun, 19 Nov 2023 11:18:00 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.26190.1700392678781076685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Nov 2023 03:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZmXZlzUQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.48, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-462a1a2717aso32204137.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 03:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700392677; x=1700997477; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sA0PcM476K+jCfBusJmyjmdlpOnleit0MKDOAOVAdRQ=;
        b=ZmXZlzUQpE9Qmw0+H7MPwflhR/mZZCz4Ny6tdjGAsvSZSZrwTB9MpvCCnUMD/ewUbx
         EVPCxqbBG38XFTDWmAaYihytcR2qZ1zRAyURzOtTLcxfMmbNW/ReDB8NmGjq3s0WNyxr
         IJ6WlPRvPWhApENM4kMZ5OMcVH1sEWCPbt+dKHSnx6p7t1FOPAjxwvIvjg0gzYCTC3C0
         NdEsw8NeFq+lrxvvTgRCIA2WKLYcT6ouZD7mWwfH/oFVFt1s+i9kLPGA1BE1Dc3KEMS7
         z0ZXPgsiFT7LJvk27/6gNeyGlB7Gd+d35xOtK3WvKxf6jaBZB+dIZam5Ws10tGd/Wd3X
         e8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700392677; x=1700997477;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sA0PcM476K+jCfBusJmyjmdlpOnleit0MKDOAOVAdRQ=;
        b=hZIJUScp7xHyjmk3sivcaZYYj82a9I4xIAsoQyJZf/JR+tI4pQ67fOwcQItNHFO7PH
         SbSHWeJk1BKdb4LEXeaIszVxt+5EfsbB9h7tJxc49pC38lFG3PmXpoMNVFjydXn9VA/N
         NJxdidVXc8jXq696GcvvtwgfrJJAvV0sciUj+hvlbLYhY6gEQev+zcQml9NEqHJgnAq7
         zK5E5BmO5hJP1GpcfRaCntGpIB1zqkyqdPJaQ9WmQaJZ8pf/CtChuGCPDs8ztX/fbld9
         gMqjoQEW325Dd1DAq9JSQJXJTznpAx6CG2oiWcVtka0ItXno9CTVxzK0iSm7fffT3X4G
         ynMw==
X-Gm-Message-State: AOJu0Ywgg9J+dIKxVCKcD5sSQq0p7hhZKFVLTZz0QdS4Gh71ZjSDdjOS
	sDES04HqXMYoIQQhplTuI+cRE1Psy8as/G9k04S91A==
X-Google-Smtp-Source: AGHT+IG0HBAX9YW4LsGTwaV8GJQgoLZrH2hb+yp775iVoE+cB4MnjRn2T81JfUyXCfqDjqkUtTFByg==
X-Received: by 2002:a67:f5d4:0:b0:45d:91f6:2796 with SMTP id t20-20020a67f5d4000000b0045d91f62796mr3919817vso.26.1700392677073;
        Sun, 19 Nov 2023 03:17:57 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id g21-20020ac84dd5000000b004181d77e08fsm1884883qtw.85.2023.11.19.03.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 03:17:56 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 8687A1069DF; Sun, 19 Nov 2023 01:17:55 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Nov 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Nov 2023 01:17:55 -1000
Message-Id: <20231119111755.8687A1069DF@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Nov 2023 11:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190871

Branch: master

New this week: 5 CVEs
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-47233 (CVSS3: 4.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47233 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-5678 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *

Removed this week: 0 CVEs

Full list:  Found 34 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39928 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39928 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45283 *
CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45284 *
CVE-2023-46246 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46246 *
CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-46407 *
CVE-2023-47233 (CVSS3: 4.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-47233 *
CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5088 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *
CVE-2023-5678 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5678 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

