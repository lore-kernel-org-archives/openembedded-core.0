Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05DB8EB64D9
	for <webhook@archiver.kernel.org>; Sun,  2 Jul 2023 11:20:05 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3813.1688296798527724440
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jul 2023 04:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sruXjfK1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-263253063f9so2512188a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 04:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688296797; x=1690888797;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdQ3ipbf5143kFY6yFLMFXIYBDAtAGqW7owR7LipIpM=;
        b=sruXjfK1azyX2ItrxQ/CAahDjp9+DFCNLYbjpguMEiIyDhsfo++Xr2PTtsPUyEMUI0
         +L5nCS5dTSH29rtHAkCbSWU8WQvak6gUDNG3HAbsyp2KloRNp2+mRh18yzlxMGWD44p4
         u30Uchug+8wuomgHMKaBoiS/w1cOkNlAOw4MRY21i+ItC4vNREzYSNik9JtVsPIvIz6K
         hMNp7NpxC1eJyM5EqDhWwVKpWb0fGIWFEv8Y6+8kLknsMHoMa6EKtd+IixxznwObMJMh
         ZuolUPpT5ILRtR5wzr5pdMY5w7k2wchHB36/N41iPnvlhEP6s/S5Zi4/Y5pXm4qfWHDg
         1JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688296797; x=1690888797;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdQ3ipbf5143kFY6yFLMFXIYBDAtAGqW7owR7LipIpM=;
        b=M6amaDDeNs9/3B7aAe4uSEXd2Y5FKpK6qetj5Olt5BoaZc3hgqCUvA39TE9OZwjIBX
         ghuIOrd1M8fsMunEiRmd/pvfnvxDiau6cbglRyWiPeQT/j0pHucenbqlWH7hQjKwaKXQ
         YaS+Di5zr8V94/KlAvk7dTNRSWP6LvaJZc9zDzKxqFrxlZOSRQwUKrdk0IAt+NEOflTq
         u7eOxYUXGNZyPT+zRffEYKO++mTasTsSLBFQhdYa1hIFVxsRl+K6+1nj+Ri7lAW3e7c4
         0Hj3B1DJxrDdfHbYtkBhS+r5jklNbKkx0BDk8pGNEUgOzxzJg+IOE43I2NWX0Q3XL0B5
         MAcQ==
X-Gm-Message-State: ABy/qLYiG7naeDbX1LarlWQVxdPDzC9QoB1EfZdrTVqgZE+Sy9SzGzth
	Cigx8fwLBys6gu93EWdWhxGVveozbQzzmf/mqd3hyA==
X-Google-Smtp-Source: APBJJlESkbeWttppsYuskxQD3plJCk9HRFzUv+oR8Q+tlmYfmLOGD118Z4IHJ6fNQEx9biSqqxG6Tg==
X-Received: by 2002:a17:90a:de90:b0:263:1d18:886a with SMTP id n16-20020a17090ade9000b002631d18886amr8198042pjv.1.1688296797215;
        Sun, 02 Jul 2023 04:19:57 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 18-20020a17090a199200b0024df6bbf5d8sm7779855pji.30.2023.07.02.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 04:19:56 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 0879396048C; Sun,  2 Jul 2023 01:19:55 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Jul 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Jul 2023 01:19:55 -1000
Message-Id: <20230702111955.0879396048C@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jul 2023 11:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183777

Branch: master

New this week: 14 CVEs
CVE-2019-18910 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18910 *
CVE-2020-11935 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11935 *
CVE-2023-25435 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25435 *
CVE-2023-31486 (CVSS3: 8.1 HIGH): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31486 *
CVE-2023-3220 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3220 *
CVE-2023-3268 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3268 *
CVE-2023-3312 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3312 *
CVE-2023-34241 (CVSS3: 7.1 HIGH): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34241 *
CVE-2023-35823 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35823 *
CVE-2023-35824 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35824 *
CVE-2023-35826 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35826 *
CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35827 *
CVE-2023-35828 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35828 *
CVE-2023-35829 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35829 *

Removed this week: 1 CVEs
CVE-2023-26965 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26965 *

Full list:  Found 38 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2019-18910 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18910 *
CVE-2020-11935 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11935 *
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
CVE-2023-25435 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25435 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-2898 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-31486 (CVSS3: 8.1 HIGH): perl:perl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31486 *
CVE-2023-3161 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3161 *
CVE-2023-3220 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3220 *
CVE-2023-3268 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3268 *
CVE-2023-3312 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3312 *
CVE-2023-34241 (CVSS3: 7.1 HIGH): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34241 *
CVE-2023-35788 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35788 *
CVE-2023-35823 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35823 *
CVE-2023-35824 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35824 *
CVE-2023-35826 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35826 *
CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35827 *
CVE-2023-35828 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35828 *
CVE-2023-35829 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35829 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

