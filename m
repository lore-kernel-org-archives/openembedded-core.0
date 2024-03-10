Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F42C54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 11:18:22 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.32019.1710069493572500564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 04:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WU+6HkbV;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.173, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7884a9a404fso180069385a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710069492; x=1710674292; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z67n1AIuen6DO5QCBkJQ6/ycHcH1Li8dtFeiWmcbQ+4=;
        b=WU+6HkbVGcCu3gj+81Iojv+GUXAFLaCll1gB7PiC8obcFKZDOAi+RrkKKniTzQZzEO
         fj532TPEW8fftGzOj0WrN8FChftuC6+VhgTXphXRDX7eVMxmDQP8cwlWUfY9/hH/WmyC
         hSIhL/5xmowkqCVMcUXGXfZLyn2peRb8JcI2sdHe8ODcM2/mxdehxelMk8IrHKsvypOh
         2wnBiUsIzcYEMtsG3dZ4JO+xeLj9ofutV5CHeQmUayGPzru93tNjQLtQoruweM0rUmQl
         kYde9VYL59FCc3gYkC897xPe0fOieTJPV20a8D3l9jSjZZGgZZPuP/cS+kTY6WBkk9XD
         E+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710069492; x=1710674292;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z67n1AIuen6DO5QCBkJQ6/ycHcH1Li8dtFeiWmcbQ+4=;
        b=cve5VoVSqMoObAActtRwKe9Bl5NoWIPfXBjUgt9bWZwTQKZFZYPzSTkrzXXsgdMVnW
         jj2imF0UkSuVicozGjeGe4YiyKhhvmzp3JXlqrcds58eyD1gpQWyjLvKme6jjS8BMR20
         a8Z+3GsJQ20fHtqDOwOQz0xo1TIuDmfb45jtvqGargXJUknoPtyapUrx9ZJSrom5XMRh
         96LgujE6P80nbnZJKLKKqjRQFlZ2f/1HZC7pAsqKBCDtIV76s919OhrFzhQytYvQfW7i
         IEgvUclCtC6+d2dkBxCdJXCnf0PSHgPbae8AwbiuUDCecO7HpLuXvbyoSw/OWllZjLNh
         FEEg==
X-Gm-Message-State: AOJu0YwWDIkqx66JocegfGcgD0H2WsUjIC9/U0bgqNgBY1VF0txlgYza
	ixvLiLDx6Mjb8PLEKzHYndoI+5nOTWbzRuZxVdkdsc58VTUa1zaRemjhZYVDLE1H6hUsr8ExOV9
	uZXs=
X-Google-Smtp-Source: AGHT+IH50kqIe85d4uR7tQHrrV9V+lVa8TxTKmud4EU/SNW8L7TzRUgRPjc2W3PiWcb6Oim99AaZ0A==
X-Received: by 2002:a05:620a:5e45:b0:788:1556:58e6 with SMTP id ya5-20020a05620a5e4500b00788155658e6mr5340777qkn.41.1710069492431;
        Sun, 10 Mar 2024 04:18:12 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id m18-20020a05620a221200b00787b93d8df1sm1739702qkh.99.2024.03.10.04.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 04:18:12 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id EC2D8106901; Sun, 10 Mar 2024 01:18:09 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Mar 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 10 Mar 2024 01:18:09 -1000
Message-Id: <20240310111809.EC2D8106901@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 11:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196878

Branch: master

New this week: 0 CVEs

Removed this week: 4 CVEs
CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6683 *
CVE-2023-6780 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6780 *
CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-0684 *
CVE-2024-25062 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25062 *

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
CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-7216 *
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

