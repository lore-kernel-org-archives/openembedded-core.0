Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5C2C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 11:19:19 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.56802.1717327158667286927
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 04:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uWNOZ+au;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.177, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-79476195696so241710285a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 04:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717327157; x=1717931957; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfSjojSQE3dS47J6NjSktNJb0hq2tgEJXrT6odj6giQ=;
        b=uWNOZ+auIQRNKWgFmDyfYaGX5qeA43Yx79QOC7uaAsl+EZDQFlmp9Ow8wRyDhnzqDH
         PekEC4Dr/KbDpqZ+12lPzoM4wZBxcCRYOC24h1+X7SWL/DpMeZBU496tFxlT2kQuMeS2
         46xMmKYf/agrPX0UkucR8Nrk/Lj3Ig9/6XT+9fL+/S0odVE16EHyVZ5wlPkZBGHEcWOJ
         Dqgr4zOZiRG9k3bmkUeL0fNtFn+WbbX7xrSCcq6faJbAx/UiJPoDn5QbBoetedfk+S7G
         mLcn/CBhH1ukARNUIVSqAnUUSTCPnZCndGuXBPyN7tjksqVMoOf1Zq/fumuAnl0K/BLl
         JfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717327157; x=1717931957;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pfSjojSQE3dS47J6NjSktNJb0hq2tgEJXrT6odj6giQ=;
        b=ADwg1h84JhQITmTR/tYDZ0Xg0zh8DZgeNOken4H4MXT+Eb3Nq8FRHjyYiEQGhO4Nrf
         nlr9y4hk4Thi9ZSNwEs5+fLOzU3or9g4bMddcwiw5MPN4oea5KG8Kzih53QDODx6mNsh
         mbxtgr014Sl7ezAyMrETC5cZBL0iFOUB9VX3mUl+kJ7b0n23TRv8qJNkw84I2bBkaJ8C
         cV3RVa1zfcKv1fnxQBrDjvKAv2vyHYdqDes+zwoZWtJxfi5fW/PyHORUj4DvmwcaoYJ9
         padAIRFxwL7y0k2XqK49rBNnXOdW6A5MjNAcNxFabGR+I2TDqZ4tSNJvXNC1ObCPQn1o
         R1Jw==
X-Gm-Message-State: AOJu0YyZIQSYaj0TWQ/lJsJg4cjploeklBVjfCGp6bBp4XbFRg98HENc
	5vX1fLkmOH8a0K17MNnfrMTuV+QuVDQg4ry7RNe8kEjt0L1Gx+TPXBwUiCfrlNiuYgW4u6F7UEi
	m
X-Google-Smtp-Source: AGHT+IEnz3/aF8VFg4EYSuuA+slaSkj/7CsG9e+qijX/iQ2a64vnKb8Y+dv8QAQBP7LNcarX4/n0+Q==
X-Received: by 2002:a05:620a:8cf:b0:792:b70a:221c with SMTP id af79cd13be357-794f5ebdd16mr659962985a.61.1717327157410;
        Sun, 02 Jun 2024 04:19:17 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f305f533sm196997585a.82.2024.06.02.04.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 04:19:17 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 05CC310024E; Sun,  2 Jun 2024 01:19:15 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Jun 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Jun 2024 01:19:15 -1000
Message-Id: <20240602111916.05CC310024E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 11:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200204

Branch: master

New this week: 0 CVEs

Removed this week: 6 CVEs
CVE-2024-27022 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27022 *
CVE-2024-35984 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35984 *
CVE-2024-35990 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35990 *
CVE-2024-35992 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35992 *
CVE-2024-35997 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35997 *
CVE-2024-36008 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36008 *

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
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-14.1.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
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
CVE-2024-26949 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26949 *
CVE-2024-26952 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26952 *
CVE-2024-27012 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27012 *
CVE-2024-27017 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27017 *

Summary of CVE counts by recipe:
  linux-yocto: 28
  busybox: 4
  gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-14.1.0:libgcc:libgcc-initial: 1
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

