Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CFAC76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 12:21:48 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.43268.1680438104156665219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 05:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xWgMTrCT;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id s19so15951520pgi.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680438103; x=1683030103;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vJhxJQhtyLLgkadlGQYCldrNi19Uem75DaXIs7KtS0=;
        b=xWgMTrCTYC7ZY0B4OKfoP/XGNPEjnfZDiGcgy8H61uzYur8Qjr7g4aWYuzFq7M5/8R
         wxYS0aJk+SHLmkfyR7JJQmzHmuZUJKcgk5BidJkRISzoqVyoB/qnj6i+kOvEybxjLzXJ
         KZqGG8wWqDiSw7pNML0shoBTXLbcdwWxnxQXSx/WvGhdxTnZxled8VrvBv1zbvnLSehO
         Oi+/V/kajzQNzKjooV3oJwol9600hJCkV4t4CHaGbUVznWp587sd4gqKUngLJzXXCKlJ
         CvamweV7VZFf92gnAt20BQ4D73KKIQQ9+yP1f/4l6sGD5gHH6C/tZzdZ0xT4LZYepkkz
         LoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680438103; x=1683030103;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4vJhxJQhtyLLgkadlGQYCldrNi19Uem75DaXIs7KtS0=;
        b=T351b9mjuAAeZGhhtShqTsPf62dSkdpr0ROXMF2AQqBbr9jIaEWNvJElbPqLcA298e
         Tm1ox/9DMCPt60O5JMupnihX+kJdWqsdtzuL/2m+2FWZCrptQny2TkuhKVmsNGd/G3p1
         42dBY3NHSE5ji4gYVrLnz12m9F1oiw6vJt3SS9kXg+a2ikHuvweCGhYCwXDiKqO6/8f5
         IWFqkCP3EpTB9dbHPlC7Ve24OjxeL2CUyxxATQBtTbTeh4cJzwQoXWLp+yQWcboDuYZs
         HPkpqtSHCXtRsEhVMi/q6Ou8dWz9QZR54JgnR7HLgh1cALK0FydTicgXKLaSbpDKBBSV
         6e8w==
X-Gm-Message-State: AAQBX9f1ZMlUTZRKOcqSUzajPrVCB4kiKpbnVcdYMu6a9uCCxWbgTXe3
	EUk5DZ4HVeFHsXibQOU8a3Yuf9FD7QPvlCVCQnc=
X-Google-Smtp-Source: AKy350YYAG6R9vYPKvmJW+no5EJoT7OH7KoRTB9OS7/SOpmiNiRFOI/O2heoZDu5UCjcPiWh8J4t2Q==
X-Received: by 2002:a05:6a00:1345:b0:62d:c459:bc52 with SMTP id k5-20020a056a00134500b0062dc459bc52mr14326487pfu.11.1680438102945;
        Sun, 02 Apr 2023 05:21:42 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j6-20020a62e906000000b005907716bf8bsm36751pfh.60.2023.04.02.05.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 05:21:42 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 90F92960320; Sun,  2 Apr 2023 02:21:40 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Apr 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  2 Apr 2023 02:21:40 -1000
Message-Id: <20230402122140.90F92960320@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 12:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179576

Branch: master

New this week: 2 CVEs
CVE-2023-1544 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *

Removed this week: 3 CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

Full list:  Found 6 unpatched CVEs
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0330 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-1544 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

