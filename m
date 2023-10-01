Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434DDE748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 13:17:54 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.59499.1696166266412021016
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 06:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=At3rn+pE;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.51, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-454765b589dso1362690137.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696166265; x=1696771065; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAcTDap5zKfc1mj0FeqWcn/PXAGa5wNCXtpV7BUZk6g=;
        b=At3rn+pEE3CqpBf56fcSd2PawPez3O0eBdNuwA1thoSmibmxekQ0NgcqBcSGYGXeLU
         OCYfb9c68iXwUJmRRB3PL/uWHSKHCC2wDPeewNrSe6H9FmTcBbfnfi0oOD8e0NXh6NI/
         WRAneofcDpukaWf9cN28vPlQ2r1MuSh1FKVejEVDknhUraiJyerHEptIZj1cBZ3IfcmG
         okndXzOGiftnjKNiSQFapzixrtCSZgYGZBjuw/p3qF4Q/NkXivzebUVQKuVX1Rq96WOi
         XIcp6MZJRPR2RsHu//03A2jeZJkrV9wjHZL50G09xU5F8VqMZBTIiViQtP5nChlrmxcw
         Zm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696166265; x=1696771065;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAcTDap5zKfc1mj0FeqWcn/PXAGa5wNCXtpV7BUZk6g=;
        b=cGWYnFw5ZV/N0neOyl7NjoBmnQRDzdurn9XlV3i8Pdk/Ji+dG/EV09hPAbjKrEwt+H
         Q0Buo5VPF9arAhfV8rqNCkgqAM1IT3wutw5XeO+B0fDZmLeF1951Y5PUL4M9FJBmgtVi
         KLuIClHb4CmvEwcvg1IisGq85NT+tY513w/Q8rJiOCiZ8HiFf0d7/uX1LJE19CPYcQHG
         WbZ74a2bIQxqQ88xFD3He6CAcuPVy+M0w11yKkiWZhHO7//uVB919bJl81ElDU+5wY67
         L4oHbTkeKq08vBG1iSK+O3pF5F/kfQGNb9/VE9XGFm4hYTC6nmAkc5ux0QS1XZ4e23bB
         obFw==
X-Gm-Message-State: AOJu0YwDAS/V7OAPSmuc3dafbJt72lsoJckn2fq7+pBUnMzkY8mAB94Z
	w1NzfAQOxMy2Ctw2Z5f7LxrGAn7jn3IVmVp8hJ5sfg==
X-Google-Smtp-Source: AGHT+IGM/m7vrknugE7oFKMAqb6kggNOe4LqnlyXPr2tojXZd7DaslY/TFKjtDU5jE8iketqOhylCA==
X-Received: by 2002:a67:fb1a:0:b0:44e:a9b6:5290 with SMTP id d26-20020a67fb1a000000b0044ea9b65290mr8038266vsr.19.1696166265054;
        Sun, 01 Oct 2023 06:17:45 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id b10-20020a0cc98a000000b0064f43efc844sm2616119qvk.32.2023.10.01.06.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:17:44 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 7607B1069E7; Sun,  1 Oct 2023 03:17:43 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 01 Oct 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  1 Oct 2023 03:17:43 -1000
Message-Id: <20231001131743.7607B1069E7@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 13:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188484

Branch: kirkstone

New this week: 2 CVEs
CVE-2020-12762 (CVSS3: 7.8 HIGH): json-c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12762 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *

Removed this week: 8 CVEs
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-3341 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3341 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-4236 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4236 *
CVE-2023-43115 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43115 *
CVE-2023-4807 (CVSS3: 7.8 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4807 *

Full list:  Found 44 unpatched CVEs
CVE-2020-12762 (CVSS3: 7.8 HIGH): json-c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12762 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-40090 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40090 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-44840 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44840 *
CVE-2022-45703 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45703 *
CVE-2022-47007 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47007 *
CVE-2022-47008 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47008 *
CVE-2022-47010 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47010 *
CVE-2022-47011 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47011 *
CVE-2022-47673 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47673 *
CVE-2022-47695 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47695 *
CVE-2022-47696 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47696 *
CVE-2022-48063 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48063 *
CVE-2022-48064 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48064 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-2680 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2680 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-39533 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39533 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-4527 (CVSS3: 6.5 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527 *
CVE-2023-4813 (CVSS3: 5.9 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4813 *
CVE-2023-4863 (CVSS3: 8.8 HIGH): libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4863 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

