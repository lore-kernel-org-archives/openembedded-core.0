Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD6DC3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 12:02:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.138526.1673784173358872189
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 04:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WhGQRAUt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d15so27709515pls.6
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oW8wlv3XYuwCSIhSvtbDepvb/UcfB8DsRgfYBXfgOQY=;
        b=WhGQRAUtU3lPs141WBBi7L+hoiG50R7vB0BKT1tNiQSD3XPW5nS5UDK2FICMycJdqh
         P69qhWg6aOiJ9TrzB7y642QeFnXOgxNmvh7SILoyx5s3pWGH/eSG2gbXMIvWxp8rZeYI
         OAvfFoh/LR+R7irKis8L2QWqRicyfLb0ulk5cI5rXiBZU+pGsRP3Nw99j1xQFd4qDMuM
         PnswzAq9lYDyN+FixXagJSTF2zKH0O/erPCjIJ9avT2KnnDHKfxa1RvvXVawenQk5hpS
         uSMSHfA3M4jDkihDT7fZ32hUkB4+fJxX0vTt/OlZ3LlanoBJLeYGfNUAN9hbEBpcEF+Y
         E9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW8wlv3XYuwCSIhSvtbDepvb/UcfB8DsRgfYBXfgOQY=;
        b=k2gIPYLLZneGT1IQKVf/9dqfhhuaFBr38mtbh8D2dqv2sqGyLEIFtpVs8kqLgkciNz
         TjBSkwQqPJ1QrJRs8Clo6gQ35CCMeWWElERT3PmKKi9waxON0jz44StWVhJvhFOzMKPq
         x/QLbJWGZntSRCidmYpgLF4boUe+8WrTXfVdw5AxzgjPICEWQvx94YqKEt3SQa3EgJk8
         M1xE6JFHwYC68sIk/r36+duBgC6kYiT72nNL008sFNiGq9GinlT4tfT9rWnzgkZjl+EL
         sSMRKbrFV8pFeQdZgawp1fghVCUQUfAHnEhwlIFJL7RJTdalQLNvCKZfT7+Jy2wFg0em
         UlMg==
X-Gm-Message-State: AFqh2krwdqwbEZJrrlcagKTxWfleqwmXxcdI1Ey3NPJCHl/QF9qGq7El
	Ac+/d0ewq7m8AQPysn4RT/Cbu9Hl19lnK6WJCMk=
X-Google-Smtp-Source: AMrXdXtDi/P/Xvp5RHEE/EtRmqm3x26yBu2rQj6PZT3+gmG3oI39yURwokzW+eCFPUU9hQ91gGE3uA==
X-Received: by 2002:a17:902:7488:b0:194:67e5:3d07 with SMTP id h8-20020a170902748800b0019467e53d07mr11604328pll.53.1673784171986;
        Sun, 15 Jan 2023 04:02:51 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b0018971fba556sm17238921plf.139.2023.01.15.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 04:02:51 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 712619602D3; Sun, 15 Jan 2023 02:02:49 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 Jan 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230115120249.712619602D3@nuc.router0800d9.com>
Date: Sun, 15 Jan 2023 02:02:49 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 12:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175882

Branch: master

New this week: 5 CVEs
CVE-2022-46456 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-46457 (CVSS3: 5.5 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46457 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

Removed this week: 1 CVEs
CVE-2022-3970 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *

Full list:  Found 10 unpatched CVEs
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46456 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-46457 (CVSS3: 5.5 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46457 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

