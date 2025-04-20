Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C51C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 11:03:01 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.7256.1745146972255655278
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 04:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MyDSece4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7399838db7fso3011382b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 04:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745146971; x=1745751771; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQsKgJ2bGFLC+6MjohbXWqsYmZzD//D5/B7bDKEhxoQ=;
        b=MyDSece4Y1BPljKF1UB9w+NYgmFeU25KhTzaqVLPoVvEg4ny4UknJzbdoKTms/cuDD
         9O2O/vNRVsmfBkqJJgkSvnHgCt5KKT52C3bcCkO2Wpmj5jWkkWamKMlijbJ2Hoa7UrCS
         /+iAkxs9KqNNRmJ6AgwtxrvZdJuFL8weM5MfKi/VY4NNNhgluGvUznxO/4luKWVk0KMu
         gMNEj1e1mndIDjpXEcHilYmaI39GB9NCHgUjyU6bdc2AQc/8VuRM0M05pOJixfc4qmKX
         jP4FIUa9dtdl/trm71moY08GEU2ygY2RXE8YB3GoUrzMjjUQ2T6OvkRyOLOaJ+X5Npoh
         uLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745146971; x=1745751771;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tQsKgJ2bGFLC+6MjohbXWqsYmZzD//D5/B7bDKEhxoQ=;
        b=boYoG11UDKPVc9aMiZB/NU53K3WiOJdlMx/wcb7JsDxAp+wOw9K3ggQ/PfRuIs+enR
         ESxLHCXh/26KYTuE18evoxqqkEjPUIUVHM27OFr1vNbJsyLRYFaLAwCzkkdCOeVpsDX6
         CNG3hsWqXpjSLWvHhTe33SFM/f9VjAO+CSIeGYbWXmB/TKAhEaRFjsjdZGpcRKLEQEjt
         oPC24oYVRpSuXeg9+XOuGUxhJIOJl2ekJlBuny+xVvlNnHHYbbREFMHz6f0BcLXlLc6X
         Bt/m2NBiGQl1qAM2VcO9PjRGYfXINE7f2ZdYyfE0VwA4Ia+xIFOTxkIxl8/Ophklr1DV
         wSjg==
X-Gm-Message-State: AOJu0Yzb2mKDeS2IafwTFMsrWgoRATLF18394TQOKemU4c9ovMfy8b3F
	urhg+fZdSAjrv8i91J5XAauEogIxm5nhT4I8sFS39xY0njOllKxePUKJFsdWuGqVtqeARVKMhua
	E0aI=
X-Gm-Gg: ASbGncverYvsUCTodU3RNGWPys7jyzXGoqaf5QjYOuQoisBzcaJpufO7zsOq8U9yN74
	i+Bk+Akb9cexdNqyUSsvVPCsUtt+mqcBPdll5Lvvdn3UQuza1kPTNMBimvaC+0JyBK6S2x5Ywto
	8XjiVsLfFJoak0w2jkT2r0R779J2zElFV7gsViC68aicGK421c45eeJacTjUxb24rr8CO3ro0Rn
	ApfxGk3fOPIe/bPR1R5NYp9TPmq9cyJlJ9kwYvYbOPSQFg1Ha9VU8yYWkOwWTTiUC5gNqiWuXq/
	LRzihiP8ndGipaxMWifFUXzZUUC2jjddcf8gPDCY+QKcXw==
X-Google-Smtp-Source: AGHT+IELb8zlPdju/TQ9PiYDNCSnwMZ3A9ls4Dr9fT5IF5AV/TuELG5sijTBTK6dUtOMEnhTHQm1fg==
X-Received: by 2002:a05:6a00:aa06:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-73dbe4e45fbmr13973208b3a.2.1745146971243;
        Sun, 20 Apr 2025 04:02:51 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm4547503b3a.49.2025.04.20.04.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 04:02:50 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 531A2100349; Sun, 20 Apr 2025 01:02:50 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Apr 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 20 Apr 2025 01:02:50 -1000
Message-Id: <20250420110250.531A2100349@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 11:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215154

Branch: master

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2024-38381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *

Full list:  Found 20 unpatched CVEs
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

Summary of CVE counts by recipe:
  linux-yocto: 18
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

