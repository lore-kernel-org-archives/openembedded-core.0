Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FECC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 12:02:55 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.64087.1677412970488956222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 04:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LxR+n6/l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id z2so3957903plf.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpBvZLfF+NQIzjqjP4OemKQSf+Dc0lgk3ELPSkycLyM=;
        b=LxR+n6/lASszKQo/LKZiKqkJ1sOn+8NS/HnU8Vb21YNZ/nd3OqDl1Im1SCnstb0brV
         Jx2UfxbkYdSnzuOGPQmCLLA9bJHUnNfFhSYCFbvEmiNzMI6oEhRsTwFonPB2+QTYFe/H
         p5mr0X6jnGJg5QhfIjG0jQSXoHVFbWulQjCwYqKgGHw8YgU+p6Pky7V7dMY79LR3UCv+
         YCDTbF7c5zkrkClNQ6un7+HpMNGrCMsAxSUFKwz2zkP/tEO+z+DC6WeCIr5vl8Qva/id
         EMoXin8R/9LA1y443HXxryJLSEVhQ2G1si6UXi3qsUy0K/QMpouJPtFtJg+s1caELe9F
         bbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpBvZLfF+NQIzjqjP4OemKQSf+Dc0lgk3ELPSkycLyM=;
        b=o8WxBmgW8LH5+MawwuUBMvDglOQRb+17jbygrWImCBH7dvtnZdToA2zIfRiIvstzMa
         IJjzDHqlBUSau8IHzAqyJ1LoqpMed9zf0oAXL3kRG/Wfhku6pZPq6pu2zmtY94E3dd7S
         jOOwfydGHLxbSXtk5sH5EaFKNXA2TfD7iGAkKFerELGR0tHeTRPu8PXkQsX7Dq+y4HLa
         2mGSrWQoRKwQVyoSf/RIdnnyYVKP2ev0+6k6btnvPZeRElomNNTngaiwxCS09QsQV0IK
         O+0EZDXnhLN5OiKbDi/BmFD05H4Vyn0q+AQTuDmp23oCThqi7q0aHjE98IEQzoj++pBj
         AF5A==
X-Gm-Message-State: AO0yUKWzSup2m5RVGnTb+ZRqWhEnD/zVVwYoh2MUPoyQfklaIeDDaKJE
	SxNp4FY55BIOIRX2YTei5bO5vgfx2jNniZGYxiI=
X-Google-Smtp-Source: AK7set9tl73SI+C8PA8w6QuoJY3RL640aI6lSGKFKEyt/TZh0J1odgIsLOU6RrNG4wYEol0R5q+hQw==
X-Received: by 2002:a17:903:2cb:b0:19c:b7da:a880 with SMTP id s11-20020a17090302cb00b0019cb7daa880mr12812554plk.11.1677412969083;
        Sun, 26 Feb 2023 04:02:49 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b00194d14d8e54sm2545129plb.96.2023.02.26.04.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 04:02:48 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3769B9632FC; Sun, 26 Feb 2023 02:02:47 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Feb 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Feb 2023 02:02:47 -1000
Message-Id: <20230226120247.3769B9632FC@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 12:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177732

Branch: master

New this week: 0 CVEs

Removed this week: 9 CVEs
CVE-2022-4450 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4450 *
CVE-2022-46663 (CVSS3: 7.5 HIGH): less https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46663 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0215 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0215 *
CVE-2023-0216 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0216 *
CVE-2023-0217 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0217 *
CVE-2023-0286 (CVSS3: 7.4 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0286 *
CVE-2023-0401 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0401 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *

Full list:  Found 3 unpatched CVEs
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-25139 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25139 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

