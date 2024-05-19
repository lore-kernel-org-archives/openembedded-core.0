Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616F1C25B75
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 11:18:38 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.37288.1716117514251161787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 May 2024 04:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bfTVWoMZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.176, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-792b94301eeso194308185a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 04:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716117513; x=1716722313; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQntrr6IAPZK6piSoPBEFDTZkz2OwaxXgDh4eeN8qtM=;
        b=bfTVWoMZPLXAtC59o4sb/G/gD0pkemM4mZ5j5cFeHUCzmgErn1iOyMOH8LDNWD/lLs
         fNvh9pcPEiB6YbfbQ2LrheSDhB872e6DEh49/JK67hL4DfpWlYHRtCpmEylhyYPW9koZ
         aI+REAxtd9K08o0LG6W/+3pojl/4kQO88AVklFqplMQtgzazyeN0w5D6rIrVdPQvmwqz
         M19ZJk1uG+NTh1pNF2hk6T7C2VDav52HD0Dl8JEHXo6xeOmlo3tjwpddu+iam+e7GCEP
         S4YdnYe1h6vAWJrBVwTds6rljfEQWtxO/VyHCvbzM8idvbuOr6fP71U5SBfL+bE8BLO4
         2hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716117513; x=1716722313;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jQntrr6IAPZK6piSoPBEFDTZkz2OwaxXgDh4eeN8qtM=;
        b=FTyyFuBH4Vw/ocAngmGiSIy/W6tBLJgVjLZ7pb22n8OPE8NCOHHeJmPSlfIKwTrm8X
         r3GcSM6cjwXN/M84C8NyBX6YMdUIfSSd9ZwUYczDBwHppW8/kAtKWzVqeBaUmUUS/8yg
         +ncjskn7qlSshIC+S1yM+MEt9dy3VG/5puNk5QFa5C6uqlNDmoA6gjrUOEQAFZ19c2GD
         MyBG1ejFikDn5d/qfpShEOTXEiCm89E3A1wWKE1HxGuyOuSoXUcojPfyG18VkViFjO1O
         +YkP2914Zo+U4kzgLFsVMP0+mpEVLaBFIRbHaRC2eoNapT1+IQ2T3wFn52kmsiHYPEWj
         WQNA==
X-Gm-Message-State: AOJu0YwdTJm+1P7MJVQOdAVbfCmlGl39PqyCi8iPkfTWOHFrWyA4sTtK
	bSB6P416qQUzWhKHE7633uxsyeWoyfIMarDD9CrOKN70qbpgq9mcUJ9v88LLHbalwsEDn+V8cDx
	PKbc=
X-Google-Smtp-Source: AGHT+IGWLmbh3R4BBgpn9IK87i3huJmUF+/Fg2C7CCcan1W7MUEHRJgQ6JY6Pjw2PHZDtpWiiwVV3A==
X-Received: by 2002:a05:620a:12f7:b0:790:f36b:5502 with SMTP id af79cd13be357-792c75775d9mr2756932785a.8.1716117512805;
        Sun, 19 May 2024 04:18:32 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792bf33b16dsm1083027985a.127.2024.05.19.04.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 04:18:32 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 6D4FE100204; Sun, 19 May 2024 01:18:31 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 May 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 May 2024 01:18:31 -1000
Message-Id: <20240519111831.6D4FE100204@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 11:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199549

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *

Full list:  Found 32 unpatched CVEs
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
  gnupg:gnupg-native: 1
  nasm:nasm-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

