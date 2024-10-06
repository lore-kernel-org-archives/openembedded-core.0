Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9DBCFB43F
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 11:19:15 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.29331.1728213550611800775
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 04:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EXpO9Cn3;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.54, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cb259e2eafso30267806d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 04:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728213549; x=1728818349; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAO7MwkryJEfzB7pSqEICs7QruaDcbrkTRKrEY0+7Dc=;
        b=EXpO9Cn3A7CogkM/zph7O+HR6XrN5g2aQMoNs/Rq+CF8m6ZGlGpkA4k2tKwR/NjMuM
         XtPbFGBJAe0kyURASqQfKjgMA8//0OMUI0UBP3t9NYA5eRo+qxW2WpjG7hRA6Oq2KIoT
         UIVZ7YcqeaYfYtkTgQX842PULzd86Wsxd3IvNTJLWZ5o2aBeYBQ+wMQ8Kfm2xgOxafsV
         BAy23Aheznlrj+OUHpsOtt2V3fYVWt7byn88qmntQt9gU+rO28JdJ+occ/nEQMH2P7Bn
         fAfMEUCTkpcqKYlGBr3JY8EUc9N4WtPbay2edcMtBYjiC2QkVul2K03CY3fuYz/bMoxr
         2XQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728213549; x=1728818349;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nAO7MwkryJEfzB7pSqEICs7QruaDcbrkTRKrEY0+7Dc=;
        b=HbHGUkIzounHU9dJB1ncEtUzKKprueMRd3hTI5+hpRb7Z9iJHIeGgPXnqwapNDDOzS
         83RBNArzMP+71JPZBqWlTPcfykVEFL1SYVxQ1HuSiDDf/3Dsepq/jllhVuxpBQDXdMIJ
         YMoPjjPS43Ocuj2OxDN9X06hvuQV6VeGbHGH9sGAF6L9lJqtGNR4iiI+X+/5Bs6ZkSY2
         eQh0u/kZfgGH72g9iWv8drDggS5gdLmu0M24q3tRzUhhdd003i4Yo5f1lZvitv09AIcd
         74t/xrNT8xwOFDwFV5ymWCcpC6dNXzOAi9NjvygDC2zmTVcGf2k4makgtkga0ymND4cI
         KNtA==
X-Gm-Message-State: AOJu0YxGrDg1bbEGY3/P2GxCIYxGYa1IDXWAwj1D8uBopwbZmYC21hRr
	fbbLHa9PRu0QwWCMbQ5kfzXlHH8tH84/388LhjdjDoIFQaWaewhIECDZc8dlBlHUW4wzJJmOuep
	+
X-Google-Smtp-Source: AGHT+IEoAwJjlUMRzCjV0/7LA6qYkjpl4gaoQDuYuByNfz5iWo+EBUUNwK7Yy0on2KIjqAwO/b/CkA==
X-Received: by 2002:a05:6214:5c44:b0:6cb:584f:ec22 with SMTP id 6a1803df08f44-6cb9ae07b6fmr123027856d6.21.1728213549282;
        Sun, 06 Oct 2024 04:19:09 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46d0fddsm16097706d6.5.2024.10.06.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 04:19:08 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 9120E10029B; Sun,  6 Oct 2024 01:19:07 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Oct 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  6 Oct 2024 01:19:07 -1000
Message-Id: <20241006111907.9120E10029B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 11:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205243

Branch: master

New this week: 21 CVEs
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

