Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD8B1C25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 12:04:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.16934.1674389072275112982
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 04:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=liD5pq2N;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id k13so9080691plg.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 04:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDxo+uvmVfK2OsY9myZmMqWrh5sdZzZWC1Oaolu0zUg=;
        b=liD5pq2NDGiRQr2Q+6LbMHs4E+mJOm+x5cz0bvpr0OBkyVwmjYwsh3SY8CccWjlyXI
         fJcmctiIKo/IllXlZC+iuJ1BuRIarEwZ1+CQ2Bbow0WGY0pwhLT+AvHTTyS66NgopQQv
         ZYWeSBsuwnz1ZeZhirDWr27IrpCQns1eGBb+sSa0JaF+DqwbRtX5Fd2e7S9+q46raPc1
         VAfdBDpfmPkz+1YyGKJ7ThkBkqk01939Agb7TJwLxZd8A09fHzgE8+YP7cZ+STIVnzFB
         59Tg/usZPOIPbsBEulCt6S4mY5oy6AeuQr0BCN5RC4hLbUNGjISqDiELAT5IeIOJMvAt
         kF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDxo+uvmVfK2OsY9myZmMqWrh5sdZzZWC1Oaolu0zUg=;
        b=LQEVTNp6d6Hp/CCY3X/F0+6CyTVRJ+LCl4vlzChscclGhcoOl7Mdt0UX2xzEdV7c6G
         Bih0RSrZVxQ4XNCMSyYC1RFBheAvk6ljXlbitoH+SbNGmrNxmhyDpLMC6Q7YnX7JZJsH
         hUNaKuig0hlvOB96i37erLtgf1SHnlj9ZfsHiccxCmWGBwJpo2ajnDrFOXdHaAjD9tcQ
         XonM4HgM+DVzQDcyFyDG4z0vp4v8deSP4T/dXKcAAGqE2fj3TSux941l6GOmgTxDbxvh
         zJP8zgqu6CGDV+Q08f2BgNyTVqSjycr3XAUZd0AU153IAsEWNaFKYGTVM+Noyyxl7b7H
         EH3Q==
X-Gm-Message-State: AFqh2krj5EhEFXBmfAJD7vS1M8JJQJ1yDh8ciig72nNMrGX0q/F9gTLw
	NjIV6We+c4TLvHWQoSlqcBJ56P78qiEI2SbMd1g=
X-Google-Smtp-Source: AMrXdXuROGMH2OSLK6f77apTs5AaUeOqrPUb9uRyv6TszKVHkDBUh3vCyPF4MSHKR7qGm0VbFDMleg==
X-Received: by 2002:a17:903:328b:b0:194:cd07:a8bb with SMTP id jh11-20020a170903328b00b00194cd07a8bbmr12636709plb.30.1674389070917;
        Sun, 22 Jan 2023 04:04:30 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e5c700b0017f72a430adsm10471248plf.71.2023.01.22.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 04:04:30 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D9CF696035B; Sun, 22 Jan 2023 02:04:27 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 22 Jan 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230122120427.D9CF696035B@nuc.router0800d9.com>
Date: Sun, 22 Jan 2023 02:04:27 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 12:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176258

Branch: master

New this week: 0 CVEs

Removed this week: 3 CVEs
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *

Full list:  Found 7 unpatched CVEs
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-46457 (CVSS3: 5.5 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46457 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

