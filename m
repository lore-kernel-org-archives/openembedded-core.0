Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62694C3DA49
	for <webhook@archiver.kernel.org>; Sun, 28 Jul 2024 11:19:26 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.32818.1722165557909714848
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 04:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1r9EVi3m;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3db1e21b0e4so1414216b6e.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 04:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722165557; x=1722770357; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyXI+c3z5clErZ6rSUk53nwi41ZK5QqG2nufSYf93bM=;
        b=1r9EVi3mAuysRZlHCEov7J5Fw8H6D5qEurYOWfs/cFC2iWNVSSjRebQoagsTTTSYW8
         k9PD2cYFnsxq9Ry7kzipSSj1BMr5yxHOc+6+sR8fghEutjvQSPHkx0ExLt4yZayX2vjs
         Vp0Ugq5I56AQ9APcZS3k8N2WHXzTyNBVZosKX0cFf48DqXq/gk62yAIcC/fefhwy5Xgo
         mN3FioymVuTF2/BTnwAAVGTGJZWYcfZFOeuSmEJcRseSxA+mIBCDdfTeq6zl90V3eqCL
         DySKGPr1wmZ+FW4fdekDHmshD1PII5JlsMyP1a/Qs1/PjzGoM5vaWv8XjH1TOvfQS1YR
         uMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722165557; x=1722770357;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UyXI+c3z5clErZ6rSUk53nwi41ZK5QqG2nufSYf93bM=;
        b=i9sAaqgP/nZHHNHnGeMsCYAx7I0FVa4NgRvXAmGKscAtlLkl+3HHdF/XEpzO2QvvwI
         XVsUDm9b18kbkDrOsiMmwhoPYBgBZel0N4uEjM5zV3DgK5JyTme/hVEuD+RE+G1qzGiT
         jOOHIablW4Jg5GJvBS6ZjxUCjYjE9HYTQ4tG/fXcMwrOHxOPkcR0BN67urFERaMtG6TI
         rggtNt0uMWeV2izlJUSn3Tixu7xBybgDSNWRnm7CYUOOjzkvyozuKxDFMtvVUIz9+6OD
         H7i0vLh4vnnMNtKaj9xC3qNsRwPKjy9O/71gJfM7bQ0qfcgQsLkl+9xCU5L26LqT7QHg
         c4RA==
X-Gm-Message-State: AOJu0YxMK1o6qrw7HhHmZs4+AKQ0wrow8PN2LEw0ETGSPZucmIXMOW92
	lsjtBDTVYYsju5iZZZN0PrIf9oJQYoZW0kklrfAqgXVHKjvPrME3mwWssXi0ymwaJyL85UHqiWU
	l
X-Google-Smtp-Source: AGHT+IEq4x66RIuKcHhGvnLcPFnVeMiQGcfWmJmJHu06w7mnaKO+UrWkgxxHp9wzm20HtPukglzyPg==
X-Received: by 2002:a05:6358:52c7:b0:1a6:b009:503a with SMTP id e5c5f4694b2df-1adc0695563mr661437055d.4.1722165556718;
        Sun, 28 Jul 2024 04:19:16 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f8d8296sm41688376d6.13.2024.07.28.04.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jul 2024 04:19:16 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id E432F1002DD; Sun, 28 Jul 2024 01:19:14 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Jul 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 28 Jul 2024 01:19:14 -1000
Message-Id: <20240728111914.E432F1002DD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jul 2024 11:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202565

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 39 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
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
CVE-2024-35328 (CVSS3: 7.5 HIGH): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35328 *
CVE-2024-36288 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36288 *
CVE-2024-36971 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36971 *
CVE-2024-39472 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-39472 *
CVE-2024-41007 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41007 *
CVE-2024-41009 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41009 *
CVE-2024-41010 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41010 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *

Summary of CVE counts by recipe:
  linux-yocto: 34
  qemu:qemu-native:qemu-system-native: 2
  gnupg:gnupg-native: 1
  libyaml:libyaml-native: 1
  openssh: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

