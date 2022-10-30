Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89341C38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 12:03:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.7686.1667131425710737494
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 05:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I2+c08Ah;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 128so8556394pga.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 05:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJ0fNRGPP3jQwftZDL/jQ6RWhutg9xf/nepHWUo7V5A=;
        b=I2+c08AhAFdifQYbKtHQbTFLzIVMH6dJVgoSNcsZ0r1vD00QpksOlYumoC8zbfETWg
         wT48ggjtMpPVoukNpuCHkWUlVtiss4vcewJX64LeMl+gXoXvfe3uGF3XkglupHv5g7va
         +dcBdB7ONSufnQll+WUtZbuL5gE/zAPh/oYwNxU76lNJvyvunvcdfb2VUd0MDzMb9GK1
         be+HN9w9ImPySkt8G2TyhZeVCnTwGAH2xwgKQne1wG+QsbLaBWcT718bQPesCJqSxCeb
         0LilRFwYpdP7HPAwvdA2YcC1UMqf3Mh84Q2B27z9RQUUeKk0pTt/Vt9Wrx5TQG5VMgXN
         1gJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJ0fNRGPP3jQwftZDL/jQ6RWhutg9xf/nepHWUo7V5A=;
        b=3ZBlnu01H9mfHvBJKAiDck+DAT3Xi/hfoo3WYQ1uskJxBldkei6CQZAQlHbNSBW/X9
         6KjMfwT4qi7X62hG/sKIdkif2WXJl7GgOcpDT346W+pTKsYUhSgvRLlYJ2vmKm1agIN0
         KIa3S7qnsYSmiiQGlIQWGmUuDsSx1ZXE5w3xbbv4KUNDYVtXE2zxktZ40KqngNmwjAIu
         kVUOTgOSiKNpmdgK+kFqVw2xt2Gklsfl/5Zzuw/CFJyfFc84qKKQMmq8C7eoBx0bUx2I
         6DC4UmO9TSohQoBRcHLow6KpiXD6Zi3Nb8c08J42Cg9tWMPI6odkia9B4fF5XpSb+bVZ
         mW7A==
X-Gm-Message-State: ACrzQf2Rg9yx5xP0gT0OLKnxz+LltPPS2GpLwvYVFcYiYbo1VbIuyxw2
	25QjEP/CDCaoTIc7ybP++C4JDobCZU1ps7P2
X-Google-Smtp-Source: AMsMyM5noi0qqxL8Ym06GGuHwMaQ0sED7CPPv6kehKq3TRKZS4k9Im6pVCLi/6xrfVs2c0sT756e1A==
X-Received: by 2002:a63:2f45:0:b0:457:dc63:68b4 with SMTP id v66-20020a632f45000000b00457dc6368b4mr7926808pgv.228.1667131424421;
        Sun, 30 Oct 2022 05:03:44 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b00172e19c2fa9sm2627918plj.9.2022.10.30.05.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 05:03:44 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id EB40996219F; Sun, 30 Oct 2022 02:03:41 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 30 Oct 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221030120341.EB40996219F@nuc.router0800d9.com>
Date: Sun, 30 Oct 2022 02:03:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 12:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172278

Branch: master

New this week: 2 CVEs
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

Removed this week: 17 CVEs
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3554 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3554 *
CVE-2022-3555 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3555 *
CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

Full list:  Found 5 unpatched CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

