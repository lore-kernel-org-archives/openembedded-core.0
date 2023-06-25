Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF68EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 11:21:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.9683.1687692067278204724
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 04:21:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qLwy0rb1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6686c74183cso2148232b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 04:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687692066; x=1690284066;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGW+LFvNeokDQxETM1crwA3RPIScpWX44O9RV52n9Jc=;
        b=qLwy0rb1R2I4Q/lUBSLdRH7N5Y6j/sddEYSVS5OkUZkY8BOfNYAe5zJvI9By6XEUyf
         7jInCYgIhMSArfBh2JEfz+dp0NX+r1InnLpstGE0fK5UJF8EgWeg/EmrHp9ztdRHQHhO
         2P1tKMLyJiCs5xC/3WkgB00uPa779BWFUOzkwB/OncdmG7aEfxjVBf3tmsr/zprTwZwq
         dptbKlytGFHqa7lEM9JDEcgPQ5FDCxHZMI2JuWawtrOdk0cWFVvq5ZmX/l/x9gVesYzJ
         7cWMTN+X7o1v52N615bkf4AJYuoDci5CjybESB5IyERd0I0CuK9sikiTG22T4WmweV38
         o3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687692066; x=1690284066;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGW+LFvNeokDQxETM1crwA3RPIScpWX44O9RV52n9Jc=;
        b=heXUfbQCqFVdF3Gimwn+KzK6Gd2K3zft2YEwafsjIL12/CgURWZKgQuwHVHl9zdgVz
         hyIr8Elxhke1iFzFAP/+yKUKuuqEq57nUllWKgxc7LXMGxmq9EAtCqltLDCgkR7anwrZ
         jW5QN2zuDK31m4GMLOQ/IG6ON5HRNjxVeZmkCB0+3BPKUPQOyCay1WJ//Roe82+e/wfF
         iOgxruIUyaEKxQj81VsuHUCqt1UBNbVtrhX3cJZrLCDa2qau+BVVljOPGucp5pzQAXWi
         wYa/oZVUYP1p+C9x3+nQccX7CqmJrhu8svCdQfFyJGRDDkkHewwOIjfAdeWk2WMev0xh
         1LXw==
X-Gm-Message-State: AC+VfDzfrxvcO4l8MROpJtMhI6LK5Xr9GOnM89lxGDNWixpS0KOcLLcd
	bTbe1eXYPMV6/0i41vAFXlYFqH5RLlK93qA6QRE=
X-Google-Smtp-Source: ACHHUZ4+nRfkOd3XL2eV10k2px5COmZavM4s+s7siI+q5WmGsWqMc/yZ5M4jkYeAWqvI0VAIQxQsDQ==
X-Received: by 2002:a05:6a00:844:b0:66a:4867:346 with SMTP id q4-20020a056a00084400b0066a48670346mr15785754pfk.3.1687692065981;
        Sun, 25 Jun 2023 04:21:05 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p22-20020aa78616000000b006689ecd0ff4sm2119347pfn.208.2023.06.25.04.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 04:21:05 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 42C7D960522; Sun, 25 Jun 2023 01:21:02 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 Jun 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 Jun 2023 01:21:02 -1000
Message-Id: <20230625112102.42C7D960522@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 11:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183370

Branch: master

New this week: 4 CVEs
CVE-2023-25434 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25434 *
CVE-2023-26965 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-3161 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3161 *
CVE-2023-35788 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35788 *

Removed this week: 3 CVEs
CVE-2023-3141 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3141 *
CVE-2023-33551 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33551 *
CVE-2023-33552 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33552 *

Full list:  Found 25 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3533 *
CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3606 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-48425 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48425 *
CVE-2022-48502 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48502 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-2124 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2124 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-25434 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25434 *
CVE-2023-26965 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-2898 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-3161 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3161 *
CVE-2023-35788 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35788 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

