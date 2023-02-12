Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB81C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 12:02:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.9573.1676203370659908442
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 04:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gxnCqGx9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b5so10962308plz.5
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 04:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wim+iW1YuRnpC4XE3yUt7aFeGwYS7vLjzPYVHE6b8hs=;
        b=gxnCqGx9woF9CZ54RZnct88uDPVKQAP4fsMOinO5bFF7nNEaKgMrWmFG1nXkkSXCWM
         j3thRl68n1m4C6MClYduz5MAKg119tshS1xwzAnZu/h262ZlOpwMujIeGxgMCMFhkDfc
         l7Bo9N9thzv3gtLGZuBlSsYGvDLSH5cP40zhKn8eMpbr3yQ2HvoH7PfnJdo/2075C4uI
         anfyGZL62KSjiBgZ2kVEs1he78b6OqS3dA98Ka3SDnJlap9gi9WNPnInrRyphTd83ipv
         70uMRnGWLYp5i8NcUnjCObPIGMp3NS0wD8iU/lVI4lnwiuvccJTX0tGinRZdjjqZ8uMv
         Iidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wim+iW1YuRnpC4XE3yUt7aFeGwYS7vLjzPYVHE6b8hs=;
        b=UD/uQqrQGu/i5+D83doFTxEwus6oPJ5Knc1HqIEV4gFAy5mByA4qEENzyGHU+Y72X5
         19Lbv8Cla7B6+dFn5+yENm3TDSqeIqeEwJI17XrA2ryhLbYBazuCGB93/Hd7FwLPokYu
         wnAPa0fIwGx8xs6nJfX4A8kXvZQB4/y1FcCeIGCEB70ciLAGFywwwVpNw3KTBpMXG1x+
         a9/Ai8RmIZhC48iIujtjmcEPaCkS3vnTLAKVs6f+B6zdDcQYcErCg71ecusuUGgjrkgl
         Veok4XBev7Xeljdw1T6Ism4I3LSxvGPYgq3EIF5Yx1Yr58DK5raoZnK8xeqDis/oe6/l
         hlhg==
X-Gm-Message-State: AO0yUKUOu6qtdt/fAaAUhc9c+s3Rtbd4G/ye49nkgEuWRybLEbvSbBkB
	mNBoCLhDEprZBKOqMqbOhkfhAD4GD/8iuiSozYg=
X-Google-Smtp-Source: AK7set8V0i7UhedvY12M1zJmBD/lo+piXqAZ1UBhimTw2qRdfqFAQSWihRm6yoIdj9kwClV0GZpSSg==
X-Received: by 2002:a17:903:291:b0:19a:5f59:f100 with SMTP id j17-20020a170903029100b0019a5f59f100mr9666720plr.9.1676203369450;
        Sun, 12 Feb 2023 04:02:49 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id 3-20020a170902c20300b0019927ca0f8fsm1308039pll.62.2023.02.12.04.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 04:02:48 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 1E290960403; Sun, 12 Feb 2023 02:02:47 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Feb 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230212120247.1E290960403@nuc.router0800d9.com>
Date: Sun, 12 Feb 2023 02:02:47 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 12:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177039

Branch: master

New this week: 2 CVEs
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2023-25139 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25139 *

Removed this week: 7 CVEs
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-46457 (CVSS3: 5.5 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46457 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

Full list:  Found 7 unpatched CVEs
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-25139 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25139 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

