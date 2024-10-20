Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9D6D3C92A
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 11:19:10 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.22891.1729423141408874203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Oct 2024 04:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yOYZjpif;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.179, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b1539faa0bso220768785a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729423140; x=1730027940; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qfgm8zvvPRPIxGKRZa/6MDrZax/GWKExc0MW5Rolow=;
        b=yOYZjpifSWzdoClkgTsm8Qkl5EYwT5YmFaKBu+iJ8As2+YyVlbOwDSHoMbGdFvy2VO
         4AIxeNG+4vwT16tJHA/3pMTZFB7sjge4xZO+Gl9TnIf3ketL8e0x040mRUpMxDKUj8J8
         OyNZpLy//4jzY4jGF1/oEKl2PmtmiLS+ICljciRmoJuYqcX6PovJ+fel8B/KqtqxfmbV
         K5kpXUGtOduEzbtGCuGw403t8M4UMryVtgTIfLrFQAew0lJu3mH2UA4a5O9pOH/b8z9/
         DDw/t70oyMwoArGmb9n6dDeMFd19HcqQcmIJB8IfphaYVeBA8SndNN/9KuxVpG2cSSIG
         T+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729423140; x=1730027940;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Qfgm8zvvPRPIxGKRZa/6MDrZax/GWKExc0MW5Rolow=;
        b=a/FtMlNQ3InIYgZR/5uNFjUBIt7uF/9yZo35ui9T3ODqTk/KyB9hkEM0BUleg/Fy78
         kX4SxCOeGGgTfc7OsjeIafx83jE39ngdLYnA0vM1lfqk9QFT00wdAMMls0UzpKEN38CQ
         jOrgmMoZzoeeg/UDKv+GvOtFpxMpSXMIomr8SSZZXa8yjDoaR2Wj33jt5INwbhisF7Mp
         l9gizixzi0F2GV29AE/HCkVRTNccDAD1nHvjpytDqJVBzezJHzd2zDCOMbe65VdRmEMr
         jzcj6N5fiJMxqoSsx4mGuB/eajiL9x0w1nRnE/QLtIlmz1AdzrJbuA42TBKqrPlfUU8t
         KbDA==
X-Gm-Message-State: AOJu0YxLRSON2nkmSZka6UF7CRXssP38Xqi5b1ZP7mcM5ppQr/+TviK5
	dN6j3xp+wuFxrqvHONjugAY8gI1psZWDelqTjlQAOzdHnN8J1uicKZA/bw2cTovV1Cbr/tFC9h/
	k
X-Google-Smtp-Source: AGHT+IEtiyWcSkWTjR8lEVpPm1hBKWvbZcYLqJNWLNub6gfJ9Ad98c+FskDfuxPhRusY/EoMjUilvA==
X-Received: by 2002:a05:620a:172a:b0:7b1:527f:cf4f with SMTP id af79cd13be357-7b157be6c6fmr987272885a.42.1729423140101;
        Sun, 20 Oct 2024 04:19:00 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1659fee77sm64781785a.57.2024.10.20.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 04:18:59 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 58E56100415; Sun, 20 Oct 2024 01:18:58 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Oct 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 20 Oct 2024 01:18:58 -1000
Message-Id: <20241020111858.58E56100415@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 11:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206090

Branch: master

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2024-43402 (CVSS3: 8.8 HIGH): libstd-rs:rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43402 *
CVE-2024-46864 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-46864 *

Full list:  Found 19 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-45306 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-45306 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 15
  qemu:qemu-native:qemu-system-native: 3
  vim: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

