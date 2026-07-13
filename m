Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64219C44506
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 07:16:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5617.1783927010054801328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 00:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VSX2PNFu;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c733f15aso27111715e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 00:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783927008; x=1784531808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ucJCHwLUu6laeFd4phjBbYSzW0jM5ljUpiKYmxPJpB8=;
        b=VSX2PNFuywYYDTTYmHUYwc8YxsTHAHQvlMHaBvjqWnnppsPbMf1ToQxBVBhbwUnB2T
         fsAf4QvgoBxkLxl/Yeg24sF3sQosCJL7yJr/t1PMqkxl32mMkoSpwu90iUvXBSeg7Xik
         1lGjP5AJgNqMxfonqiJIqqFmEDJd02NBCR+uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927008; x=1784531808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ucJCHwLUu6laeFd4phjBbYSzW0jM5ljUpiKYmxPJpB8=;
        b=VvaS/W8p1sN//rsIl/7h0UGpkymPe3CIZNNyEK/eCo0LiB1wFMh0vBlQh9zSjBy30V
         QiHY5S8yPTvseiJiAhs5rCZPI8MconOeOKMDfR7kxXlgSvKFG55jZLAonXpdIYknPQ8K
         FlfOf9JoUhdVM577DwOnHju7S6Uq9BUvhbBLKEQLn4pPggZEhHmEt/q7jfVdZLaKOKFb
         R/veQNi+UHR+mdPF9TjLPgryEA6KNd1sCl3J39lBBMcz+RmsmsJejER0s8LveXkWffoo
         +eW9Xc5NBcbLyhGA3aw9jZmjW/9CfafYDGSxyKA2Au9j4v24eouw02fOqCo+RHp2mPow
         CsuA==
X-Gm-Message-State: AOJu0Yyj4DKktcqJZH+6lRgA9BSlc37G4QKDl7C720LBF6bsT/uxsGAJ
	hw1K4fzhrkvRTPjuGMWDOjmMbaC5MrwetBgTVZ1YLGfcsx7pbaM0jCUXroSTxp6jLONE6vOWVIc
	HxDS6Zu0=
X-Gm-Gg: AfdE7cm33A6UpEUVp86mULqx8Rsg8bn1pMrU7DYcCht2owmPlqLmYGHqTlGTZC7u6Wy
	TQLRn3ct0WYboCBytcHNJvtvMb264W0iKSdb0b1NVcVhYHuB9A8qlRsJG2KaRXOeZ0Zqcfk10zz
	CRqa9qcvkL/Hl9WnRq8B7DDhiYKD1D9wHuNNSrLL20BYJG2O3zWcX6PBplRIUcY8wCVzrQxcSr/
	IZslgNRlfMGbKRPFFZawZYgbY7nS+3c+U+SjBxo62WJl6u71JYRKH2ghNFq5K2C5HsSFt79Nwfq
	gZexbcExEXF0fC/RgsyqwVR1gOyrfOCh5aFHFhCzhgxa+cDB8G48MdsXiKaxk30izzh7Vcgbut+
	SJxwuvb+wRs9DRH4brAHrCseuLGm/Cd87jOX9JN0hUQlVLkI2SzHrAWxdDTegKTVz7WUcuITKeT
	YtHpe9HbVGrlmLVGt8XeI/tc2eaA==
X-Received: by 2002:a05:600c:8718:b0:493:c1a1:68f0 with SMTP id 5b1f17b1804b1-493f881f0f1mr75223635e9.20.1783927007916;
        Mon, 13 Jul 2026 00:16:47 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f744e8d7sm210235785e9.15.2026.07.13.00.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:16:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Jul 13 02:42:35 2026
Date: Mon, 13 Jul 2026 09:16:25 +0200
Message-ID: <20260713071625.366132-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713071625.366132-1-yoann.congal@smile.fr>
References: <20260713071625.366132-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 07:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240830

Branch: master

New this week: 18 CVEs
CVE-2026-12549 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12549 *
CVE-2026-12892 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12892 *
CVE-2026-13757 (CVSS3: N/A): p11-kit:p11-kit-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-13757 *
CVE-2026-15146 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-15146 *
CVE-2026-15308 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-15308 *
CVE-2026-39822 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39822 *
CVE-2026-42505 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42505 *
CVE-2026-43414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43414 *
CVE-2026-53363 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53363 *
CVE-2026-55999 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55999 *
CVE-2026-56000 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56000 *
CVE-2026-56288 (CVSS3: N/A): patch https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56288 *
CVE-2026-56289 (CVSS3: N/A): patch https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56289 *
CVE-2026-58469 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58469 *
CVE-2026-58470 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58470 *
CVE-2026-58471 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58471 *
CVE-2026-58472 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58472 *
CVE-2026-59890 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59890 *

Removed this week: 36 CVEs
CVE-2026-11940 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11940 *
CVE-2026-11972 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-11972 *
CVE-2026-48914 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-48914 *
CVE-2026-50219 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-50219 *
CVE-2026-52860 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52860 *
CVE-2026-53166 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53166 *
CVE-2026-54369 (CVSS3: N/A): acl:acl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-54369 *
CVE-2026-54370 (CVSS3: N/A): acl:acl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-54370 *
CVE-2026-54371 (CVSS3: N/A): attr:attr-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-54371 *
CVE-2026-55693 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55693 *
CVE-2026-55892 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55892 *
CVE-2026-55895 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55895 *
CVE-2026-56113 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56113 *
CVE-2026-56114 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56114 *
CVE-2026-56116 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56116 *
CVE-2026-56117 (CVSS3: N/A): dhcpcd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56117 *
CVE-2026-56123 (CVSS3: N/A): socat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56123 *
CVE-2026-56131 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56131 *
CVE-2026-56132 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56132 *
CVE-2026-56403 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56403 *
CVE-2026-56404 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56404 *
CVE-2026-56405 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56405 *
CVE-2026-56406 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56406 *
CVE-2026-56407 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56407 *
CVE-2026-56408 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56408 *
CVE-2026-56409 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56409 *
CVE-2026-56410 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56410 *
CVE-2026-56411 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56411 *
CVE-2026-56412 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56412 *
CVE-2026-57062 (CVSS3: N/A): gnupg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57062 *
CVE-2026-57451 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57451 *
CVE-2026-57452 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57452 *
CVE-2026-57453 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57453 *
CVE-2026-57454 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57454 *
CVE-2026-57455 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57455 *
CVE-2026-57456 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-57456 *

Full list:  Found 326 unpatched CVEs
CVE-2011-3374 (CVSS3: N/A): apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3374 *
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-2236 *
CVE-2024-43802 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-43802 *
CVE-2024-47850 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-47850 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-52005 (CVSS3: N/A): git:git-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-52005 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-15366 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15366 *
CVE-2025-15367 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15367 *
CVE-2025-15661 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-15661 *
CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-50422 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71306 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71306 *
CVE-2025-71308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71308 *
CVE-2025-71313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71313 *
CVE-2026-0864 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-0864 *
CVE-2026-12003 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12003 *
CVE-2026-12549 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12549 *
CVE-2026-12891 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12891 *
CVE-2026-12892 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-12892 *
CVE-2026-13757 (CVSS3: N/A): p11-kit:p11-kit-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-13757 *
CVE-2026-15146 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-15146 *
CVE-2026-15308 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-15308 *
CVE-2026-23328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23328 *
CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23374 *
CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23377 *
CVE-2026-23459 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23459 *
CVE-2026-28529 (CVSS3: N/A): cryptodev-linux https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28529 *
CVE-2026-3099 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-31501 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31501 *
CVE-2026-31771 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31771 *
CVE-2026-31777 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-31777 *
CVE-2026-3184 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3184 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-35094 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35094 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-37555 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-37555 *
CVE-2026-39822 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-39822 *
CVE-2026-40930 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-40930 *
CVE-2026-41991 (CVSS3: N/A): gzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41991 *
CVE-2026-41992 (CVSS3: N/A): gzip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-41992 *
CVE-2026-42505 (CVSS3: N/A): go:go-binary-native:go-cross-x86-64-v3:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-42505 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-43009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43009 *
CVE-2026-43022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43022 *
CVE-2026-43042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43042 *
CVE-2026-43045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43045 *
CVE-2026-43053 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43053 *
CVE-2026-43095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43095 *
CVE-2026-43115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43115 *
CVE-2026-43131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43131 *
CVE-2026-43174 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43174 *
CVE-2026-43191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43191 *
CVE-2026-43204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43204 *
CVE-2026-43228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43228 *
CVE-2026-43299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43299 *
CVE-2026-43308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43308 *
CVE-2026-43310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43310 *
CVE-2026-43311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43311 *
CVE-2026-43326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43326 *
CVE-2026-43344 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43344 *
CVE-2026-43391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43391 *
CVE-2026-43414 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43414 *
CVE-2026-43443 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-43443 *
CVE-2026-4360 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4360 *
CVE-2026-45850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45850 *
CVE-2026-45897 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45897 *
CVE-2026-45901 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45901 *
CVE-2026-45945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45945 *
CVE-2026-45961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45961 *
CVE-2026-45963 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45963 *
CVE-2026-45991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-45991 *
CVE-2026-46008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46008 *
CVE-2026-46017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46017 *
CVE-2026-46032 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46032 *
CVE-2026-46054 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46054 *
CVE-2026-46092 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46092 *
CVE-2026-46130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46130 *
CVE-2026-46153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46153 *
CVE-2026-46203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46203 *
CVE-2026-46210 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46210 *
CVE-2026-46245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46245 *
CVE-2026-46252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46252 *
CVE-2026-46298 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46298 *
CVE-2026-46302 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46302 *
CVE-2026-46311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46311 *
CVE-2026-46320 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46320 *
CVE-2026-46330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46330 *
CVE-2026-46331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-46331 *
CVE-2026-52908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52908 *
CVE-2026-52909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52909 *
CVE-2026-52910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52910 *
CVE-2026-52917 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52917 *
CVE-2026-52924 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52924 *
CVE-2026-52929 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52929 *
CVE-2026-52930 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52930 *
CVE-2026-52935 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52935 *
CVE-2026-52939 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52939 *
CVE-2026-52940 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52940 *
CVE-2026-52942 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52942 *
CVE-2026-52946 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52946 *
CVE-2026-52947 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52947 *
CVE-2026-52948 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52948 *
CVE-2026-52949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52949 *
CVE-2026-52960 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52960 *
CVE-2026-52965 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52965 *
CVE-2026-52988 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-52988 *
CVE-2026-53005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53005 *
CVE-2026-53007 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53007 *
CVE-2026-53008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53008 *
CVE-2026-53009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53009 *
CVE-2026-53017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53017 *
CVE-2026-53024 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53024 *
CVE-2026-53025 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53025 *
CVE-2026-53070 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53070 *
CVE-2026-53089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53089 *
CVE-2026-53090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53090 *
CVE-2026-53091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53091 *
CVE-2026-53102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53102 *
CVE-2026-53106 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53106 *
CVE-2026-53108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53108 *
CVE-2026-53113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53113 *
CVE-2026-53131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53131 *
CVE-2026-53132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53132 *
CVE-2026-53133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53133 *
CVE-2026-53134 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53134 *
CVE-2026-53135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53135 *
CVE-2026-53136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53136 *
CVE-2026-53137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53137 *
CVE-2026-53138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53138 *
CVE-2026-53139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53139 *
CVE-2026-53140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53140 *
CVE-2026-53141 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53141 *
CVE-2026-53142 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53142 *
CVE-2026-53143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53143 *
CVE-2026-53144 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53144 *
CVE-2026-53145 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53145 *
CVE-2026-53146 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53146 *
CVE-2026-53147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53147 *
CVE-2026-53148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53148 *
CVE-2026-53149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53149 *
CVE-2026-53150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53150 *
CVE-2026-53151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53151 *
CVE-2026-53152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53152 *
CVE-2026-53153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53153 *
CVE-2026-53154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53154 *
CVE-2026-53156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53156 *
CVE-2026-53157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53157 *
CVE-2026-53158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53158 *
CVE-2026-53159 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53159 *
CVE-2026-53160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53160 *
CVE-2026-53161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53161 *
CVE-2026-53162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53162 *
CVE-2026-53163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53163 *
CVE-2026-53164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53164 *
CVE-2026-53167 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53167 *
CVE-2026-53168 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53168 *
CVE-2026-53175 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53175 *
CVE-2026-53176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53176 *
CVE-2026-53177 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53177 *
CVE-2026-53178 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53178 *
CVE-2026-53179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53179 *
CVE-2026-53180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53180 *
CVE-2026-53181 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53181 *
CVE-2026-53182 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53182 *
CVE-2026-53183 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53183 *
CVE-2026-53184 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53184 *
CVE-2026-53185 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53185 *
CVE-2026-53186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53186 *
CVE-2026-53187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53187 *
CVE-2026-53188 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53188 *
CVE-2026-53189 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53189 *
CVE-2026-53190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53190 *
CVE-2026-53191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53191 *
CVE-2026-53192 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53192 *
CVE-2026-53193 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53193 *
CVE-2026-53194 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53194 *
CVE-2026-53195 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53195 *
CVE-2026-53196 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53196 *
CVE-2026-53197 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53197 *
CVE-2026-53198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53198 *
CVE-2026-53199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53199 *
CVE-2026-53202 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53202 *
CVE-2026-53203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53203 *
CVE-2026-53205 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53205 *
CVE-2026-53207 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53207 *
CVE-2026-53208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53208 *
CVE-2026-53209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53209 *
CVE-2026-53210 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53210 *
CVE-2026-53211 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53211 *
CVE-2026-53212 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53212 *
CVE-2026-53213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53213 *
CVE-2026-53214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53214 *
CVE-2026-53215 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53215 *
CVE-2026-53216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53216 *
CVE-2026-53217 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53217 *
CVE-2026-53218 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53218 *
CVE-2026-53219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53219 *
CVE-2026-53220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53220 *
CVE-2026-53221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53221 *
CVE-2026-53222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53222 *
CVE-2026-53223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53223 *
CVE-2026-53224 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53224 *
CVE-2026-53225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53225 *
CVE-2026-53226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53226 *
CVE-2026-53227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53227 *
CVE-2026-53228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53228 *
CVE-2026-53229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53229 *
CVE-2026-53230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53230 *
CVE-2026-53232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53232 *
CVE-2026-53233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53233 *
CVE-2026-53234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53234 *
CVE-2026-53235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53235 *
CVE-2026-53236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53236 *
CVE-2026-53237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53237 *
CVE-2026-53238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53238 *
CVE-2026-53239 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53239 *
CVE-2026-53240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53240 *
CVE-2026-53241 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53241 *
CVE-2026-53242 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53242 *
CVE-2026-53245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53245 *
CVE-2026-53246 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53246 *
CVE-2026-53247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53247 *
CVE-2026-53248 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53248 *
CVE-2026-53249 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53249 *
CVE-2026-53250 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53250 *
CVE-2026-53251 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53251 *
CVE-2026-53252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53252 *
CVE-2026-53253 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53253 *
CVE-2026-53254 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53254 *
CVE-2026-53255 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53255 *
CVE-2026-53256 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53256 *
CVE-2026-53257 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53257 *
CVE-2026-53258 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53258 *
CVE-2026-53259 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53259 *
CVE-2026-53260 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53260 *
CVE-2026-53261 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53261 *
CVE-2026-53262 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53262 *
CVE-2026-53263 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53263 *
CVE-2026-53264 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53264 *
CVE-2026-53265 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53265 *
CVE-2026-53266 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53266 *
CVE-2026-53267 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53267 *
CVE-2026-53268 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53268 *
CVE-2026-53269 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53269 *
CVE-2026-53270 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53270 *
CVE-2026-53271 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53271 *
CVE-2026-53272 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53272 *
CVE-2026-53273 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53273 *
CVE-2026-53274 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53274 *
CVE-2026-53275 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53275 *
CVE-2026-53277 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53277 *
CVE-2026-53285 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53285 *
CVE-2026-53292 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53292 *
CVE-2026-53308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53308 *
CVE-2026-53313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53313 *
CVE-2026-53325 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53325 *
CVE-2026-53327 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53327 *
CVE-2026-53328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53328 *
CVE-2026-53329 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53329 *
CVE-2026-53330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53330 *
CVE-2026-53331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53331 *
CVE-2026-53332 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53332 *
CVE-2026-53333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53333 *
CVE-2026-53334 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53334 *
CVE-2026-53335 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53335 *
CVE-2026-53336 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53336 *
CVE-2026-53337 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53337 *
CVE-2026-53338 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53338 *
CVE-2026-53339 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53339 *
CVE-2026-53340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53340 *
CVE-2026-53341 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53341 *
CVE-2026-53342 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53342 *
CVE-2026-53343 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53343 *
CVE-2026-53345 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53345 *
CVE-2026-53346 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53346 *
CVE-2026-53347 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53347 *
CVE-2026-53349 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53349 *
CVE-2026-53350 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53350 *
CVE-2026-53352 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53352 *
CVE-2026-53353 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53353 *
CVE-2026-53354 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53354 *
CVE-2026-53355 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53355 *
CVE-2026-53356 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53356 *
CVE-2026-53359 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53359 *
CVE-2026-53361 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53361 *
CVE-2026-53362 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53362 *
CVE-2026-53363 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-53363 *
CVE-2026-5435 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5435 *
CVE-2026-54411 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-54411 *
CVE-2026-55653 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55653 *
CVE-2026-55654 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55654 *
CVE-2026-55655 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55655 *
CVE-2026-55999 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-55999 *
CVE-2026-56000 (CVSS3: N/A): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56000 *
CVE-2026-56288 (CVSS3: N/A): patch https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56288 *
CVE-2026-56289 (CVSS3: N/A): patch https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-56289 *
CVE-2026-5673 (CVSS3: N/A): libtheora https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5673 *
CVE-2026-58049 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58049 *
CVE-2026-58050 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58050 *
CVE-2026-58051 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58051 *
CVE-2026-58055 (CVSS3: N/A): nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58055 *
CVE-2026-58469 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58469 *
CVE-2026-58470 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58470 *
CVE-2026-58471 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58471 *
CVE-2026-58472 (CVSS3: N/A): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-58472 *
CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5928 *
CVE-2026-59890 (CVSS3: N/A): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-59890 *
CVE-2026-6238 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6238 *
CVE-2026-6844 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6844 *
CVE-2026-6845 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-6845 *

Summary of CVE counts by recipe:
  linux-yocto: 266
  libsoup: 6
  python3:python3-native: 6
  wget: 5
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  glibc: 3
  libsndfile1: 3
  libssh2:libssh2-native: 3
  openssh: 3
  go:go-binary-native:go-cross-x86-64-v3:go-runtime: 2
  gstreamer1.0: 2
  gzip: 2
  patch: 2
  xserver-xorg: 2
  apt: 1
  cairo:cairo-native: 1
  cryptodev-linux: 1
  cups: 1
  ffmpeg: 1
  git:git-native: 1
  libgcrypt:libgcrypt-native: 1
  libinput: 1
  libpam: 1
  libpng:libpng-native: 1
  libtheora: 1
  nghttp2: 1
  p11-kit:p11-kit-native: 1
  python3-setuptools:python3-setuptools-native: 1
  qemu:qemu-native:qemu-system-native: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  vim: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

