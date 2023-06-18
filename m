Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB631EB64D8
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 11:20:59 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.3879.1687087253366087317
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 04:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=afvuon0L;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-39e86b3da59so2048741b6e.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687087252; x=1689679252;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFgfvQ7TI3yfgOg6KERB+VfnmhtkRpTZSWtzbdVppG8=;
        b=afvuon0LYlseLu234Rd8hhaLULuOjFQRxh1MHXecjhDGbEDjNXdtyYF+pZ2QgC471f
         15qJjOaelfgVc6B7BN4vkgiPhjhQOA5W9R9SppvGg4EkRhTUqJiCxFv4IyiHjBceNTop
         dZs0rf4/AOO0y/HL7ar7pWwiQDfhCOwGht27opo0GpyGCn/FWTT65+Itx9R6Yy6AukjH
         paicfLveOVRRppfDtHLxtdxnZJ368ecKZKJCxfasiHi3vTEZSkiXqwWs0xfD0w18st84
         KVh70R8pJGwbglHMkcczCkuMDOXPziwNeuu1zrNZvWg6RhTh+O1nm0yM69NIvd8w07uT
         YANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687087252; x=1689679252;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DFgfvQ7TI3yfgOg6KERB+VfnmhtkRpTZSWtzbdVppG8=;
        b=VsT/+zQ1Vai8G3GG6BGmLRKd04TmvU4thVXfnayEw8f79LZqshQzMfXUHUs//dTkGf
         44RSHswAVSuWeNCs7QsI4mgfnfbi8VGs13Y2zV50SetGpQC25v3kkO3yxyeTV8bp9ACw
         0aSWaHf8TKyc/xiU4wu7LxR4Gp6HYifoT2o8cYyKp0EDKMLnLd/7qFq7/h0bsMx4seih
         8J3OfQnw+4RsRfky8BAPeE1moJCi8dri5yJLhjObX+BTE3kPXseghD+OlawNnjVh8EzB
         NnKEK+WfZ2NlRYbuMyE1bcvz7DsKWZAo5R5KqSS9o7ukgZ1ZqCqO7JYaHc+VaZvK0s3v
         FQdA==
X-Gm-Message-State: AC+VfDzNs5cIou2cyLA2xMroT49bqXTvxI8ieFwbvniYipkK+d/y1ScK
	Iakwgf0d3wtLW3ymiRhPs2N7Ryn8I9l/Af86n14=
X-Google-Smtp-Source: ACHHUZ52eaCGVVV58CipFM9sQOfGQUEKDbwN+twN750t/S1JBHZyo4HYpSjQ46sR8EApu9O0CsOXIQ==
X-Received: by 2002:aca:1114:0:b0:398:50f1:ad19 with SMTP id 20-20020aca1114000000b0039850f1ad19mr7703725oir.39.1687087252096;
        Sun, 18 Jun 2023 04:20:52 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j15-20020aa783cf000000b0064fde7ae1ffsm14898517pfn.38.2023.06.18.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 04:20:51 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B50679604C2; Sun, 18 Jun 2023 01:20:49 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 18 Jun 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 18 Jun 2023 01:20:49 -1000
Message-Id: <20230618112049.B50679604C2@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 11:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183059

Branch: master

New this week: 4 CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2023-3141 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3141 *
CVE-2023-33551 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33551 *
CVE-2023-33552 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33552 *

Removed this week: 15 CVEs
CVE-2023-2002 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2002 *
CVE-2023-2194 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2194 *
CVE-2023-2235 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2235 *
CVE-2023-2598 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2598 *
CVE-2023-28328 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28328 *
CVE-2023-28866 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
CVE-2023-2985 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2985 *
CVE-2023-30456 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30456 *
CVE-2023-30772 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30772 *
CVE-2023-31436 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31436 *
CVE-2023-32233 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32233 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *
CVE-2023-33203 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33203 *
CVE-2023-33288 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33288 *
CVE-2023-34256 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34256 *

Full list:  Found 24 unpatched CVEs
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
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-2898 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-3141 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3141 *
CVE-2023-33551 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33551 *
CVE-2023-33552 (CVSS3: 7.8 HIGH): erofs-utils:erofs-utils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33552 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

