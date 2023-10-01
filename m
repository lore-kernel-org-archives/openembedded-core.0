Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B108EE748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 11:57:13 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.57906.1696161429032485937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 04:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mhZke9v3;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.181, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-775810b032aso272207885a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 04:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696161428; x=1696766228; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckgw6TqqwyhwH6SP/T0qQ+DrznO7BDSv0jGwQiOH7g4=;
        b=mhZke9v3RER54aFGl6jOtCTRH9KEVD4ByXlcCMBtsx9IYcwLZAMnrN70PtyXRvQYJK
         OXEnuQ3Rqb9xhxKfSoXomHzLhU/0EMWEeMu7we89Ciq8k2IVIdveRKTRqYca611duB1a
         6os9aCfvVUZBMYA7AheA8rH/B+yruMhcUEc8977I05/xatIiZA2Lb61G24a4iyplIwTX
         4Fb/z60x35LiUrUUg6VQKY7JnqsVBW3JfPReG4YuCv3R29EG+3mVPRxdp8W+X0wFUrof
         AjTcDt7E5gd9JJqiW3H34cuo6CZt/pznFH2dWTykNkvMG8NYnKbZBCUjRVdOn8g15zSI
         yHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696161428; x=1696766228;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckgw6TqqwyhwH6SP/T0qQ+DrznO7BDSv0jGwQiOH7g4=;
        b=gMN+T7ZAUO0+5PzCkSX5ih266ic/OKqVaDin+jAVOQpQwmixFkuqCWGmIBYgV6ApGP
         PziSCZHoGnXif3NLIC6vBSUWbJyp+mck8mzKyaR6NXR86oOybuPoPTyoRiOjEvbZQdD5
         MUg4c7g8RjK2Mx95uPmUv5DSCkmtRda+x9mB5YV6eg2sYOUKWurBh0L8ci8O0mJGy26v
         CMvL9kcv/fdMQ3MIwHu63g+L3T4UsIw8h4/yIVAADAITiZwstEguP1zWjG93Gnovp4mM
         B/vWOU2Z/LWDzwT6Yn7X3ti6BOONyCpTjHO5YUgdcx6F6bRiIHNkMRgv5TAuNJHgiP9l
         Raaw==
X-Gm-Message-State: AOJu0YyheTzRs1AAygw6YCRBDMDn9FUD8Rl5CcLD8Z2xiAyhO7ewpc/K
	j6WdDmkvbAMR14AYlm0nTnoGoD4rOaoEi2fq/F/uHg==
X-Google-Smtp-Source: AGHT+IF2hQe7UtpVdGaL9mfVeDUz8MBPmxAxf1GdWcCPDcvxhoEfnq5ruMVzf9hRQwu0dmrLs3nF8A==
X-Received: by 2002:a05:620a:4101:b0:76c:bb4d:97cf with SMTP id j1-20020a05620a410100b0076cbb4d97cfmr10256415qko.24.1696161427714;
        Sun, 01 Oct 2023 04:57:07 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id p4-20020a05620a056400b0077412ca0ae1sm7805622qkp.65.2023.10.01.04.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 04:57:07 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 7EFD6106A6F; Sun,  1 Oct 2023 01:18:12 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 Oct 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  1 Oct 2023 01:18:12 -1000
Message-Id: <20231001111812.7EFD6106A6F@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 11:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188482

Branch: master

New this week: 2 CVEs
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *

Removed this week: 8 CVEs
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-3341 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3341 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *
CVE-2023-38039 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38039 *
CVE-2023-43115 (CVSS3: 9.8 CRITICAL): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43115 *
CVE-2023-4527 (CVSS3: 6.5 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527 *
CVE-2023-4622 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4622 *

Full list:  Found 29 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25584 *
CVE-2023-2680 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2680 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38559 *
CVE-2023-39318 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39318 *
CVE-2023-39319 (CVSS3: 6.1 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39319 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4921 *
CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5156 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

