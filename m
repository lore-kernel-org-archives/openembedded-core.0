Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B52C77B7C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 11:22:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.63597.1683458539861998790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 04:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2ghTxCnF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-643ac91c51fso1441434b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683458539; x=1686050539;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDoQ44EENyGxmyF9LEYSVYkoMWfXRa9yVwFkqff/REk=;
        b=2ghTxCnFS2OG7yKnOxFaAeU+KF7915qMCD761nFSyE5qJ51zbD8qwNoicTt+4kke1w
         uQ/7+6UQZ2Fo+rkrhF+5Sm4L9EDk8eryNKcqf8NNKzysfbReQBx0dPKorgQ0TqqSp5b5
         ocR5r6yWX7xe7hITmt24p4m+c8KUG7rYDr8UKSa0MdyCsaKy0RMeNPDQoaWpQxyKj2M3
         5jIBjd51zMemWZIbQMfebs2Vi5cJh4vzbAJzLSwA7iWf6CANv5GVb7rq1aPaWyW8qYjw
         ztE+TC8OoYI1FkLxfrCMFNL7sBUifNQ0wChIorgZI1u74JnhRb4oFmYplGzVtYBt30K2
         QnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683458539; x=1686050539;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bDoQ44EENyGxmyF9LEYSVYkoMWfXRa9yVwFkqff/REk=;
        b=Ync30psVVYUXuhnYfObhk4dJih1dJRT70ABwJMDUNDcybmoU0jlWR9YRrsyUjuy59J
         DNlivkUhySHrnVHoNn31Zibh4mml1vxKGXSHRa8UMbiUUM00Thi/oVyinvTDNZ3SbAS0
         oqdGy8Jv1pOrYyv6CDwiINLnGe5xnxrHEpRx7y8AxLHO4eHsSlvXamdQ+Giiw5F9bDis
         +71hTqGeHBfUOb+F7hblyfciOE9ip22rIPZ2lcrUsHvmHztfbN285fP3dqTI6gojttpm
         yeGmzi6X+BbhKCWBYep0dDEpOGGhH6LNQPmC9t7uInQ1FGh7XXYNqjRjyXfuEKGwXqB4
         gheQ==
X-Gm-Message-State: AC+VfDwqnWCgHGS5w1RVgRuTLPTTQ3ka7nYVbwcHEqftmKTLYpC7rViD
	eiXZkviFvWjx6yPxq/rMDURpQ8AjKjqEPiPTqKk=
X-Google-Smtp-Source: ACHHUZ4C2+hOA0O3Iic2Zt0Qs1dc0GyKOyJCGv2ISDM8WdpLiDH2DgohDqvax6Ynr5ADXaefdyIo5Q==
X-Received: by 2002:a05:6a21:338e:b0:100:5851:d4ba with SMTP id yy14-20020a056a21338e00b001005851d4bamr467086pzb.54.1683458538573;
        Sun, 07 May 2023 04:22:18 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i24-20020aa78b58000000b0063d2dae6247sm4280467pfd.77.2023.05.07.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 04:22:18 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3C1F79604C2; Sun,  7 May 2023 01:22:16 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 07 May 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  7 May 2023 01:22:16 -1000
Message-Id: <20230507112216.3C1F79604C2@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 11:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181004

Branch: master

New this week: 7 CVEs
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1998 (CVSS3: 5.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1998 *
CVE-2023-2235 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2235 *
CVE-2023-2248 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2248 *
CVE-2023-25652 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25652 *
CVE-2023-29007 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29007 *
CVE-2023-31436 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31436 *

Removed this week: 6 CVEs
CVE-2023-0330 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-28488 (CVSS3: 6.5 MEDIUM): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28488 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *

Full list:  Found 42 unpatched CVEs
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
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-0615 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0615 *
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1380 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1380 *
CVE-2023-1611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1611 *
CVE-2023-1855 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1855 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-1989 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1989 *
CVE-2023-1990 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1990 *
CVE-2023-1998 (CVSS3: 5.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1998 *
CVE-2023-2162 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2162 *
CVE-2023-2194 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2194 *
CVE-2023-2235 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2235 *
CVE-2023-2248 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2248 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24534 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24534 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24538 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24538 *
CVE-2023-25652 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25652 *
CVE-2023-28328 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28328 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-28866 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
CVE-2023-29007 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29007 *
CVE-2023-30456 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30456 *
CVE-2023-30772 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30772 *
CVE-2023-31436 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31436 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

