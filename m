Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB3BC369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 11:02:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.24450.1745751777953255368
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 04:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3gOdeRlF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7399838db7fso3838701b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745751777; x=1746356577; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzcA/WKwJaGicrPBhL7Hlc54N+zMLaY7+Xl9/ZkrafA=;
        b=3gOdeRlFO8t7S7b4q59r/gKU/Ge9whT2a1dsycQBYsG25zmPFhEJ1U8MWxdhIIIj/h
         qePsdOYKJtEEPkhg6GX6udQoVcqENTKVhTqQvry2eyONatb8cFrLWJkHXEBcV+rGkeoe
         OsNL3ugFJKc157aIilb7ZVFxN3sPN/dlKxDePRRjHqYfGj65OdZDww4ahttEKL7Tvh+u
         NhWJdT4knqfxaIMtSk28h6+ZugA9vfUFahzZ+pfXq9zJqhW7F/0EFtucpNmcBSyQqHkB
         zeKk5TKnozuxARyzpG8kitnxIxP0atccqCdFLBZ/Wu9Y7x7Z9mBjb+rtfV2dcxJpKPc8
         rFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745751777; x=1746356577;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzcA/WKwJaGicrPBhL7Hlc54N+zMLaY7+Xl9/ZkrafA=;
        b=ddUODn1rCpgm0g04/Rmlkjt6pD/Ve3rUlaclwgMpYQejqaXLD/VqxR15oBhJ5LFOMY
         LXZO0fpZrck3pY5qTSUAq1hVGHMPlqU10uqyu4Ism7iadU9mkxTjjsg2RuGdtNZT4UwF
         p54pC0pszalwui9TsYcCnntc72BnvP74oEecpJU4/vHDEfFGTcdzchje7ReW0YNCRtzz
         kUoDATqUc7VIO3ND3Eagq5rOaZRjClmLl4ErldkAS0wcHuMKi9oHixR9zzWvc2x8aJAi
         gnAsNWDPsZfFTsEyQHR11AJOLQBVeUJTrh/z0V9qRyoy7JLfvt77mT5kVtm9CNsARRXU
         EHZg==
X-Gm-Message-State: AOJu0YwbhL8pJRHrWrMwFfteEBKz6FVVr2uy2x1pboBwgAtdf6Qio7nH
	54h8mFuj86B319Zwkj73wVsc9i8COpb25Xg6yFGHn2NZkVuiwkTLKSi0TH7HfGn6+TUS1OiAVEr
	U
X-Gm-Gg: ASbGncua5dpl7MegXIEMGF4mo1zX9BYxm4KJ/JXHbvgO3jaduU0Do9HOegNBn+wPOlR
	zWsOy7fEJUMH0Lif8LAqRQNyCU+q38yfrynT8uf+U5T/U/wDAx34Olfai107GZ2kVBlyISuPsVI
	MwFYQ23sCUfhPWJgSIpj1GoDcJuP4tA2tffdEi48TrsKE6hsahz80ZaqonLMNYiixtZcxoCfEkP
	9krC1aLWgVacHbneMAGJEoKhI5ZHs/saVLTCmgSPKJZOGi49oYXlPUhKJkwOw0ycLpT68a3QubT
	gf2W6mdf0FGBNfIhSP0me74lORg12YdaGMzcDLXJmJ9k+g==
X-Google-Smtp-Source: AGHT+IExIAgoIC2oTmf1KJ4QzRfidLipg7MdEwTwqcSOLauN3afwSY2HvUvoPMlB5esguqSkbqqECA==
X-Received: by 2002:a05:6a00:6c98:b0:737:cd8:2484 with SMTP id d2e1a72fcca58-73e267e25dfmr19750593b3a.6.1745751776824;
        Sun, 27 Apr 2025 04:02:56 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259412e5sm6251162b3a.51.2025.04.27.04.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:02:56 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id DBAA2100355; Sun, 27 Apr 2025 01:02:55 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Apr 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 27 Apr 2025 01:02:55 -1000
Message-Id: <20250427110255.DBAA2100355@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 11:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215551

Branch: master

New this week: 3 CVEs
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *

Removed this week: 0 CVEs

Full list:  Found 23 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-32414 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32414 *
CVE-2025-32415 (CVSS3: N/A): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32415 *
CVE-2025-37838 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37838 *

Summary of CVE counts by recipe:
  linux-yocto: 19
  libxml2:libxml2-native: 2
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

