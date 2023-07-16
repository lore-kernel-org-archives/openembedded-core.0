Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C391EB64DA
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 11:02:54 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.14437.1689505373549943143
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 04:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yicoJ1AI;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.169, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-403c0f12e77so22533331cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689505372; x=1692097372;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrup+h8xIih2+KPUnutHlSfqVdvq6ViHMuoxGNpMkdQ=;
        b=yicoJ1AIOAFeGRmjc6dZBmbb35wa3ljL72vN6zB3D+FfvAX+Ienn8l2TyBiJ7vMAoE
         yh7cFxNTrOUQh6IKz/zzXt/Cr80rjcVOqRzah1bDrcwoe0RVGsJkdjB41QaNhb90VsyP
         ffKvSE+cCd85T7HzoLr2ANlCV7pz9PuHJsDTTwLWCqb/K7gZIG6VnX9HlKDm7godfa0r
         Fw6sThR7He40XkiraEGe3p91DpKurD18wouiIxPI25hyMZcF0YYr65+hTaNzzpmCcWKG
         33Od47UxPi3M+sTmv7qMgjpMPNk03xrIhzFKPtU1MGo8ONYCeNwDoYgNhkwHJHlMfC4Z
         8Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689505372; x=1692097372;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrup+h8xIih2+KPUnutHlSfqVdvq6ViHMuoxGNpMkdQ=;
        b=jPHMMxbSGw340MPq5FX9/a/BIbw6pktgNKpkyH/m+8qNbZ97cm91AgF9BY+ci+rZbR
         KzgeBkG7G6AqJ5VZIa8mWu3jVsoRksyrEwaVXklUDCUgm4RN7h8ZrAI555fLa7qFTUau
         5vyeFLTBdEuDregLCW8C+sj2W6/UOl8pHXbdhhXi/4Fs2TPXJo/FgwB49PlLYqbKUTHj
         EjGG8njKRXpIsyC/pDBi8fBiZfH7kxgiNlvu4cY4Gwy17tS5GznAVvz7QORpFzANTGZD
         gD5qx88CoinQpUn+BmAFtWFg9vCxESGUVMsYnvhXXbpmVd5tqXTvC72hnQZKFzw/U0fq
         WX8g==
X-Gm-Message-State: ABy/qLYQAgd93ly1fBHp9DLF6f5yP703FXLs5RbI1UulPldtWW87/MOq
	zJGskyK4aChjQPd+7+OjoaNpPge/DDXji5wydhBYYA==
X-Google-Smtp-Source: APBJJlF8lvJdU7EK33blqU03eQzqH2DfnIN3NIb6Pfr2f2+iwh7jkr61zoGYSUQCrFGKvDF+qk+r9A==
X-Received: by 2002:ac8:58d6:0:b0:400:aaa0:a4f9 with SMTP id u22-20020ac858d6000000b00400aaa0a4f9mr13531051qta.17.1689505372098;
        Sun, 16 Jul 2023 04:02:52 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d14-20020ac800ce000000b0040327381dbcsm5526916qtg.19.2023.07.16.04.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 04:02:26 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id C7D7A104E06; Sun, 16 Jul 2023 01:02:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 16 Jul 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 16 Jul 2023 01:02:21 -1000
Message-Id: <20230716110221.C7D7A104E06@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 11:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184412

Branch: master

New this week: 2 CVEs
CVE-2023-37453 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37453 *
CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37454 *

Removed this week: 0 CVEs

Full list:  Found 31 unpatched CVEs
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
CVE-2022-48502 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48502 *
CVE-2023-0330 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-2898 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-3090 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3090 *
CVE-2023-3117 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3117 *
CVE-2023-3316 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3316 *
CVE-2023-3317 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3317 *
CVE-2023-3358 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3358 *
CVE-2023-3359 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3359 *
CVE-2023-3389 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3389 *
CVE-2023-3390 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3390 *
CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-35827 *
CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36632 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *
CVE-2023-37453 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37453 *
CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37454 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

