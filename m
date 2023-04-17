Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A970FC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 16:01:33 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.59554.1681747289658096798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 09:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=5W5b1Vge;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id w1so3359492plg.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681747289; x=1684339289;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HHqMQY5d4n4o6dy5Pwl41fGgVyw+mHh53JBGWm91+8=;
        b=5W5b1VgedbBFN2M7I1Z/In9nc4H3TjEbrRXIMjVVQXxtOd68AQ7bfefjID+fgYBL+n
         awyxu1PyKr9+3GN0jxL8a2ko1xdDVz0nO2Wt3Zncafg1LlYhClQji5YKJSY+gA5KeyNX
         xX5YaD3MWOEhw6OhK2+Qx25GwPGegS5Ffm3b38rFMH+I3VnY2oVc2qNVCg7D7jMcSEII
         bSVPFICfOnXmWe/1B5sQT08kRtzS21GfOGN2gOq+e7VG4wRq3/s8kvQlFXStpsFJzSg8
         sbU206ZdWduoYH23HIa544Y+i8XX54kDQdoPk2Y3cQLFcQNPmK0NOim/s3ZHaL64LlB3
         +lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681747289; x=1684339289;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0HHqMQY5d4n4o6dy5Pwl41fGgVyw+mHh53JBGWm91+8=;
        b=dzItdGFUrDYVL9ZpkuR2WUAJLjOlL6omokedoVA6oNn+m6h8AFsFnvmnYHY2RrrhW4
         jonIBScmxv9bDvYyX+wmcboZbM9oXZ1QIbdnw+80FrvrSihXstfe7bo2oamDc9dNN0Hd
         Gz2e0z15Ow9qw6FZ2vgK1lvaPFXR0qb2HiXnIFX5vcdQGhc3peKIzdYSmYbMXF1dYhnC
         8IP5YdH8lhOYVWe6vFCVZkfdyBmW6X8zbKJzstFhpCYsWKrpq2TPvPnVNwEtRLyijT0T
         oVdUqMy6L4ji+z6i4ALRssSCCOpWQFoseTanP1nS8wHlAQOIbxaoMmj8rn3Z1Vz4A/tu
         R5Pg==
X-Gm-Message-State: AAQBX9cyXcxM2mw4EYJbn4IpR9z/wxVwniSZnPUJEYxrFWxtsRjR7SmQ
	PI+e1WPz6EVh3kWf3mm0cZqUdgReRGFT1IP7+M4=
X-Google-Smtp-Source: AKy350aIV8azMztO0ASkptdfRnLDcWdSv5dubkMNuoX7QgkceQSuBBKVR8zW3O1VVgbH5OFvgE/3Pg==
X-Received: by 2002:a17:90b:685:b0:233:c301:32b3 with SMTP id m5-20020a17090b068500b00233c30132b3mr15287155pjz.3.1681747287658;
        Mon, 17 Apr 2023 09:01:27 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j5-20020a17090adc8500b00233e860f69esm9119484pjv.56.2023.04.17.09.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 09:01:27 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 56A29960155; Mon, 17 Apr 2023 06:01:23 -1000 (HST)
Subject: OE-core CVE metrics for master on Mon 17 Apr 2023 05:59:27 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Mon, 17 Apr 2023 06:01:23 -1000
Message-Id: <20230417160123.56A29960155@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 16:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180159

Branch: master

New this week: 7 CVEs
CVE-2023-1393 (CVSS3: 7.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1393 *
CVE-2023-1579 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1579 *
CVE-2023-1611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1611 *
CVE-2023-1855 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1855 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24626 (CVSS3: 7.8 HIGH): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-30456 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30456 *

Removed this week: 5 CVEs
CVE-2022-38457 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38457 *
CVE-2022-40133 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40133 *
CVE-2023-1075 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1075 *
CVE-2023-1076 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1076 *
CVE-2023-23005 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23005 *

Full list:  Found 33 unpatched CVEs
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3533 *
CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3606 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-48425 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48425 *
CVE-2023-0330 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-0615 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0615 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-1380 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1380 *
CVE-2023-1393 (CVSS3: 7.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1393 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1579 (CVSS3: 7.8 HIGH): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1579 *
CVE-2023-1611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1611 *
CVE-2023-1652 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1652 *
CVE-2023-1855 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1855 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24626 (CVSS3: 7.8 HIGH): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-28866 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *
CVE-2023-30456 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30456 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

