Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235BCC02183
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 11:20:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.13692.1737285644685179275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 03:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2M7p/Oqu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21654fdd5daso60687635ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 03:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737285644; x=1737890444; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0rPyFlNQJ8xeolFu0uvF9/dAapPpf3SKyvyU24kijM=;
        b=2M7p/OquxGWTvCj5T4KlBwuhSMoQ3OP9hnu20RXukRWikmsaLc4w64JZNVYNmTKNmp
         ppY7mme5kElTZ1As3BI/9TUQS47u4SClxvw33n16tcYSFeWHmDW91fqCRY4ZMlbB51Gj
         FU0611gBNGXzErX165rpdQBTHFnI6qT22pxloAnBdKP4qZjkzp7zcE6GAiW0hTosdFyh
         C/kOcn1k9M/FU6LHHo9Ks5QJ7a+sTRx4uIlKS769UP7Vm9jllvH+XOI51vcEJF2lvd13
         fXbGeml/J6AxJqDc3y/X105lW9qT6o1tJJ8NyLpb5JyHl2R8WLps+cWJZvhv8p6i2rtt
         G+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737285644; x=1737890444;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0rPyFlNQJ8xeolFu0uvF9/dAapPpf3SKyvyU24kijM=;
        b=ixs6l9X6IhXgfOy8UR83qyoKmERaNOVTOq0axz1pX4To8b8/8v5ecIOFw48+H3JZ+I
         S1/kPKFG3hQcnpUQFUiaOT0tU9tPxmeA+SqRpZmHKEoOHPCv7zcMtkwwMcL9hqi21FyR
         WQhaxvwHYD05tmbshaT7Uiv/ExlCN/9OvAsrGT0P7Ff1ea7peonC9R+h+G7MJ5KvlvIu
         /cvZGZHvLPFMJQtOi2W5Zkb02RCfhs0VoT2R/KSR0tf8mBJ2vE8oG97OfGyFP5rdI7oa
         DlX7k6lVG7PrQYsY+yrkFrq8OhgGX440BV1V9zaPWWVs1OEJl1hA/7b9YBdk0+3ULHES
         Waww==
X-Gm-Message-State: AOJu0Yxn0uwZUqA/SxqXDPgk5TmhIS+Lf1C1qBwrrIxgZjBVxeY7hXJJ
	In04TNqva7BEk1v3L8XAf9kdLO9GF8TcRl3QXUgBRtrXCXyx6frwJurzVqATroPHOpGsHFON3uD
	7
X-Gm-Gg: ASbGncvrjNFb5RLgIMWuwGcZmcp9X4PYlS7nX2i7cgDl3vJ+4VjqoguuiFArrpkqZNC
	tvjAMGZ8z3V2wy4jW97DqHk2fqMtSWfb8CXtQyqBi2+SlLbu6rjRkvBtHyucTP+WoXcbw+YpZmG
	SWfZkKlyJ4FdI3tZ5abYP1CBXVR2qt2nvSg5fJVRaN57xaspkYwrCJdaLH1Fz0jOOTVm+OlnYfS
	5u7zc7GelnsYPJWoZY2eBbvt5GoUNjue8jMZY4XFkqaIJzYDa6QYOkhkipQzyM/crc6aXZl8us=
X-Google-Smtp-Source: AGHT+IHQ8SzQlodCuW35S2UIl4Nb5ZgdJoUODGM5GutGspW78RDuiqzC8mgGTBr8H4ZpEdtq4a1TnA==
X-Received: by 2002:a05:6a21:3388:b0:1e1:a8b7:b45d with SMTP id adf61e73a8af0-1eb2145ffc2mr13781027637.4.1737285643769;
        Sun, 19 Jan 2025 03:20:43 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab81530asm5187570b3a.52.2025.01.19.03.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 03:20:43 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D5E541003BA; Sun, 19 Jan 2025 01:20:42 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Jan 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Jan 2025 01:20:42 -1000
Message-Id: <20250119112042.D5E541003BA@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 11:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210003

Branch: master

New this week: 0 CVEs

Removed this week: 32 CVEs
CVE-2014-8139 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8139 *
CVE-2014-8140 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8140 *
CVE-2014-8141 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8141 *
CVE-2014-9636 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9636 *
CVE-2014-9913 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9913 *
CVE-2015-7696 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7696 *
CVE-2015-7697 (CVSS3: N/A): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7697 *
CVE-2016-9844 (CVSS3: 4.0 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9844 *
CVE-2018-1000035 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000035 *
CVE-2018-1000156 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000156 *
CVE-2018-10195 (CVSS3: 7.1 HIGH): lrzsz https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10195 *
CVE-2018-18384 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18384 *
CVE-2018-20969 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-20969 *
CVE-2018-6951 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6951 *
CVE-2018-6952 (CVSS3: 7.5 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6952 *
CVE-2019-13232 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13232 *
CVE-2019-13636 (CVSS3: 5.9 MEDIUM): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13636 *
CVE-2019-13638 (CVSS3: 7.8 HIGH): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-13638 *
CVE-2019-20633 (CVSS3: 5.5 MEDIUM): patch:patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2020-27748 (CVSS3: 6.5 MEDIUM): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2021-3468 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-4217 (CVSS3: 3.3 LOW): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4217 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38469 *
CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38470 *
CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38471 *
CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38472 *
CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38473 *
CVE-2024-50612 (CVSS3: 5.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50612 *

Full list:  Found 18 unpatched CVEs
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
CVE-2024-50613 (CVSS3: 6.5 MEDIUM): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *

Summary of CVE counts by recipe:
  linux-yocto: 15
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

