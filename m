Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34EBC55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 04:18:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36297.1785730696479266958
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 21:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kRSTE9xT;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f703a9d05so1675521f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785730695; x=1786335495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J24wIIXwJmDMAPGBmuNmO9RQai4KEchRfD0k5u5R+RU=;
        b=kRSTE9xTrs3MJmcIjV1C5+wuMxMDFkjvfDrG+OtxbKlJh2DwnEl+snUPQAFO/IgjyD
         NRakWSOvETCyVguzfGKbpqoNsMmagSo3uWj7PfhPW2hR/BASk2MmPeYNXOL/51vw4dqX
         r2FuOVbV+zlrpjXax+Z2xYUvPdhHOfa9uCUXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730695; x=1786335495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J24wIIXwJmDMAPGBmuNmO9RQai4KEchRfD0k5u5R+RU=;
        b=ZuS6uEv4FjF1wqA/wjaVAd+JrRd+/ZrXxj5Iw99Pn60PZk8RNcGvM24aBez3R16YMD
         M4AMmoWrCWYZQ+Qfiq1HB7mBkxwNSYZzRH52z+fb61SGoIKF88zm008Gbh/s+ZHI4NAR
         nepRA1vaM93Mx4EbRF+q+ktjvKTStoLgRC/bbmmMix/6ReVy1sT7ywAS9v1mALxJ6JyA
         s8Z7ALwyH8WYs8QV6O+WKdNXalDXbGGal/6fUiS11QmRD6bCuvNdeMkyXR3FI/sem7N2
         ZszsBtT5LnzfmAsi90snvey8AES1KL26dCWL0O2Hkigxbx1Ug0MsSC1OU3UlQ4hBqEiZ
         3nMw==
X-Gm-Message-State: AOJu0Yzq52ES88WTT7rnrOeq6U/ZnAc/mnPYT11KXhbKdgUM/NSQBKfJ
	LW/NWkEjt82v/TXWvVN3h1Xua/8+/T7+7lorFZ78C1F8UFwUpAavIuvIG1jy4pJixb8uPCCbNVh
	dWEFahFo=
X-Gm-Gg: AR+sD11Eps5SF04hq+5Zb2rYEfR4LZnR/uB4ZoPLdjhuznJ0EBWEAf5OL2PraOsmIPC
	m2TacssANayE7A0nzxbOj9I9dxjCtSF29C+DdNwED1HslJ5Qpm8KDrGBGEngy31XFpDE0EjgGuv
	FnTbRRiKfFztbpy5b8b480uoVaESCzhA1F8dCABb/fwEFVEaei9NTBUdMiuEG9B0VjdXX1XE3IL
	X5zFabMNVprWxnLaY71ArEM1LalX88YQYH+ZEtGlfSu6c5lgEu1D08qrShf4qtcXEOtiGg50rre
	P6bU+wG+Em2gooYVMJO4xblaRxpgsArK7w4FqOwyxfnBImGXnjTeWnev48Y9dhneKup/tHA5zKo
	MNSsD+lzE6g71B4HlC+silVlOfKRSB6moQlvAfenWunIfeif7xXjXFfwTwJcA0jYFJ06ssr1NpG
	Q/e6Uf08MkOVupUwa0gTpqi+2/hSxyk+3t9qBXgkThzmAfaTnEB+1tuf577k7rsWqMoM615Cemz
	7gH+DjaVIZXQ7Fpns6odKWd/WYGGmE2QdshEAihxqdMaZoXw9992sO8CWr2KDgnJlQjYiCz1JRe
	sI2//8IBomrEiqgni+/kIrQSKEJwFKb0
X-Received: by 2002:a5d:6e0d:0:b0:47f:8110:3073 with SMTP id ffacd0b85a97d-47fd72e1b04mr15246368f8f.24.1785730694093;
        Sun, 02 Aug 2026 21:18:14 -0700 (PDT)
Received: from runner-glrt-sin-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfde0sm27089008f8f.3.2026.08.02.21.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:18:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Aug 03 03:04:18 2026
Date: Mon,  3 Aug 2026 04:18:11 +0000
Message-ID: <20260803041813.20-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 04:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242598

Branch: master

New this week: 34 CVEs
CVE-2018-20225 (CVSSv2: 6.8, CVSSv3: 7.8): python3-pip https://nvd.nist.gov/vuln/detail/CVE-2018-20225 *
CVE-2026-4647 (CVSSv3: 6.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-4647 *
CVE-2026-5056 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-5056 *
CVE-2026-6879 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-6879 *
CVE-2026-56389 (CVSSv4: 6.8): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56389 *
CVE-2026-56390 (CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-64531 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64531 *
CVE-2026-64532 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64532 *
CVE-2026-64533 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64533 *
CVE-2026-64534 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64534 *
CVE-2026-64535 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64535 *
CVE-2026-64537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64537 *
CVE-2026-64538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64538 *
CVE-2026-64539 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64539 *
CVE-2026-64540 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64540 *
CVE-2026-64541 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64541 *
CVE-2026-64542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64542 *
CVE-2026-64543 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64543 *
CVE-2026-64544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64544 *
CVE-2026-64545 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64545 *
CVE-2026-64546 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64546 *
CVE-2026-64547 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64547 *
CVE-2026-64548 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64548 *
CVE-2026-64549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64549 *
CVE-2026-64550 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64550 *
CVE-2026-64551 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64551 *
CVE-2026-64552 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64552 *
CVE-2026-64553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64553 *
CVE-2026-64554 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64554 *
CVE-2026-64555 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64555 *
CVE-2026-64557 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64557 *
CVE-2026-64558 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64558 *
CVE-2026-64559 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64559 *
CVE-2026-64560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64560 *

Removed this week: 25 CVEs
CVE-2013-10036 (CVSSv4: 8.4): connman https://nvd.nist.gov/vuln/detail/CVE-2013-10036 *
CVE-2026-4360 (CVSSv3: 5.3, CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-4360 *
CVE-2026-5928 (CVSSv3: 7.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5928 *
CVE-2026-6238 (CVSSv3: 6.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-6238 *
CVE-2026-10723 (CVSSv3: 6.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10723 *
CVE-2026-10822 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10822 *
CVE-2026-11331 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11331 *
CVE-2026-11605 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11605 *
CVE-2026-11622 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11622 *
CVE-2026-11721 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11721 *
CVE-2026-12617 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-12617 *
CVE-2026-13204 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13204 *
CVE-2026-13221 (CVSSv3: 9.1): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-13221 *
CVE-2026-13321 (CVSSv3: 8.6): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13321 *
CVE-2026-16768 (CVSSv3: 5.3): gdk-pixbuf:gdk-pixbuf-native https://nvd.nist.gov/vuln/detail/CVE-2026-16768 *
CVE-2026-35094 (CVSSv3: 5.5): libinput https://nvd.nist.gov/vuln/detail/CVE-2026-35094 *
CVE-2026-55653 (CVSSv3: 6.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55653 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-56288 (CVSSv3: 5.5, CVSSv4: 4.6): patch https://nvd.nist.gov/vuln/detail/CVE-2026-56288 *
CVE-2026-56289 (CVSSv3: 5.5, CVSSv4: 4.6): patch https://nvd.nist.gov/vuln/detail/CVE-2026-56289 *
CVE-2026-57432 (CVSSv3: 8.4): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-57432 *
CVE-2026-58469 (CVSSv3: 7.5, CVSSv4: 8.7): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58469 *
CVE-2026-58472 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58472 *
CVE-2026-64400 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64400 *

Full list: Found 235 unpatched CVEs
CVE-2011-3374 (CVSSv2: 4.3, CVSSv3: 3.7): apt https://nvd.nist.gov/vuln/detail/CVE-2011-3374 *
CVE-2018-20225 (CVSSv2: 6.8, CVSSv3: 7.8): python3-pip https://nvd.nist.gov/vuln/detail/CVE-2018-20225 *
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-4010 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-4010 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-6519 (CVSSv3: 8.2): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2024-6519 *
CVE-2024-43802 (CVSSv3: 4.5): vim https://nvd.nist.gov/vuln/detail/CVE-2024-43802 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2024-52005 (CVSSv3: 8.8, CVSSv4: 7.5): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2024-52005 *
CVE-2025-15366 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15366 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-56005 (CVSSv3: 9.8): python3-ply https://nvd.nist.gov/vuln/detail/CVE-2025-56005 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71306 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71306 *
CVE-2025-71308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71308 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2026-0864 (CVSSv4: 4.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-0864 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3184 (CVSSv3: 5.3): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-3184 *
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-4647 (CVSSv3: 6.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-4647 *
CVE-2026-5056 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-5056 *
CVE-2026-5435 (CVSSv3: 7.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5435 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-6879 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-6879 *
CVE-2026-12003 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-12003 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-12891 (CVSSv3: 4.3): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12891 *
CVE-2026-12892 (CVSSv3: 4.4): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12892 *
CVE-2026-15308 (CVSSv3: 7.5, CVSSv4: 8.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15308 *
CVE-2026-23328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23328 *
CVE-2026-23374 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23374 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-23459 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23459 *
CVE-2026-28529 (CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-31501 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31501 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38754 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38754 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-43009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43009 *
CVE-2026-43022 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43022 *
CVE-2026-43042 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43042 *
CVE-2026-43045 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43045 *
CVE-2026-43053 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43053 *
CVE-2026-43095 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43095 *
CVE-2026-43115 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43115 *
CVE-2026-43131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43131 *
CVE-2026-43174 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43174 *
CVE-2026-43191 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43191 *
CVE-2026-43204 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43204 *
CVE-2026-43228 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43228 *
CVE-2026-43299 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43299 *
CVE-2026-43308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43308 *
CVE-2026-43310 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43310 *
CVE-2026-43311 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43311 *
CVE-2026-43326 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43326 *
CVE-2026-43344 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43344 *
CVE-2026-43391 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43391 *
CVE-2026-43414 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43414 *
CVE-2026-43443 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43443 *
CVE-2026-45897 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45897 *
CVE-2026-45901 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45901 *
CVE-2026-45961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45961 *
CVE-2026-45963 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45963 *
CVE-2026-45991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45991 *
CVE-2026-46008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46008 *
CVE-2026-46017 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46017 *
CVE-2026-46032 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46032 *
CVE-2026-46130 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46130 *
CVE-2026-46153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46153 *
CVE-2026-46210 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46210 *
CVE-2026-46245 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46245 *
CVE-2026-46298 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46298 *
CVE-2026-46302 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46302 *
CVE-2026-46311 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46311 *
CVE-2026-46330 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46330 *
CVE-2026-52949 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52949 *
CVE-2026-52956 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52956 *
CVE-2026-52960 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52960 *
CVE-2026-52965 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52965 *
CVE-2026-52988 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52988 *
CVE-2026-53005 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53005 *
CVE-2026-53007 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53007 *
CVE-2026-53008 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53008 *
CVE-2026-53009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53009 *
CVE-2026-53017 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53017 *
CVE-2026-53024 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53024 *
CVE-2026-53025 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53025 *
CVE-2026-53078 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53078 *
CVE-2026-53089 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53089 *
CVE-2026-53090 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53090 *
CVE-2026-53091 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53091 *
CVE-2026-53102 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53102 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53108 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53108 *
CVE-2026-53113 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53113 *
CVE-2026-53124 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53124 *
CVE-2026-53178 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53178 *
CVE-2026-53222 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53222 *
CVE-2026-53257 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53257 *
CVE-2026-53260 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53260 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53292 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53292 *
CVE-2026-53308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53308 *
CVE-2026-53313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53313 *
CVE-2026-53401 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53401 *
CVE-2026-53910 (CVSSv4: 2.1): diffutils https://nvd.nist.gov/vuln/detail/CVE-2026-53910 *
CVE-2026-55999 (CVSSv3: 8.5): xserver-xorg https://nvd.nist.gov/vuln/detail/CVE-2026-55999 *
CVE-2026-56000 (CVSSv3: 7.8, CVSSv4: 9.0): xserver-xorg https://nvd.nist.gov/vuln/detail/CVE-2026-56000 *
CVE-2026-56389 (CVSSv4: 6.8): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56389 *
CVE-2026-56390 (CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-56391 (CVSSv4: 4.6): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56391 *
CVE-2026-56392 (CVSSv4: 1.8): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56392 *
CVE-2026-58050 (CVSSv3: 7.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58050 *
CVE-2026-58051 (CVSSv3: 6.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58051 *
CVE-2026-58055 (CVSSv3: 5.4, CVSSv4: 6.3): nghttp2 https://nvd.nist.gov/vuln/detail/CVE-2026-58055 *
CVE-2026-58470 (CVSSv3: 5.3, CVSSv4: 6.9): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58470 *
CVE-2026-58471 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58471 *
CVE-2026-63811 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63811 *
CVE-2026-63839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63839 *
CVE-2026-63872 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63872 *
CVE-2026-63879 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63879 *
CVE-2026-63923 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63923 *
CVE-2026-63941 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63941 *
CVE-2026-63977 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63977 *
CVE-2026-63978 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63978 *
CVE-2026-63979 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63979 *
CVE-2026-63983 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63983 *
CVE-2026-64013 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64013 *
CVE-2026-64019 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64019 *
CVE-2026-64020 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64020 *
CVE-2026-64040 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64040 *
CVE-2026-64057 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64057 *
CVE-2026-64067 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64067 *
CVE-2026-64068 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64068 *
CVE-2026-64070 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64070 *
CVE-2026-64079 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64079 *
CVE-2026-64082 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64082 *
CVE-2026-64117 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64117 *
CVE-2026-64146 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64146 *
CVE-2026-64154 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64154 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64192 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64192 *
CVE-2026-64210 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64210 *
CVE-2026-64227 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64227 *
CVE-2026-64283 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64283 *
CVE-2026-64287 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64287 *
CVE-2026-64292 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64292 *
CVE-2026-64325 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64325 *
CVE-2026-64341 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64341 *
CVE-2026-64349 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64349 *
CVE-2026-64352 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64352 *
CVE-2026-64353 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64353 *
CVE-2026-64361 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64361 *
CVE-2026-64371 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64371 *
CVE-2026-64375 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64375 *
CVE-2026-64388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64388 *
CVE-2026-64389 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64389 *
CVE-2026-64390 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64390 *
CVE-2026-64421 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64421 *
CVE-2026-64438 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64438 *
CVE-2026-64441 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64441 *
CVE-2026-64472 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64472 *
CVE-2026-64510 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64510 *
CVE-2026-64523 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64523 *
CVE-2026-64530 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64530 *
CVE-2026-64531 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64531 *
CVE-2026-64532 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64532 *
CVE-2026-64533 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64533 *
CVE-2026-64534 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64534 *
CVE-2026-64535 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64535 *
CVE-2026-64537 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64537 *
CVE-2026-64538 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64538 *
CVE-2026-64539 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64539 *
CVE-2026-64540 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64540 *
CVE-2026-64541 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64541 *
CVE-2026-64542 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64542 *
CVE-2026-64543 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64543 *
CVE-2026-64544 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64544 *
CVE-2026-64545 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64545 *
CVE-2026-64546 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64546 *
CVE-2026-64547 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64547 *
CVE-2026-64548 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64548 *
CVE-2026-64549 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64549 *
CVE-2026-64550 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64550 *
CVE-2026-64551 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64551 *
CVE-2026-64552 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64552 *
CVE-2026-64553 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64553 *
CVE-2026-64554 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64554 *
CVE-2026-64555 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64555 *
CVE-2026-64557 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64557 *
CVE-2026-64558 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64558 *
CVE-2026-64559 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64559 *
CVE-2026-64560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64560 *
CVE-2026-64830 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64830 *
CVE-2026-64831 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64831 *
CVE-2026-64832 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64832 *
CVE-2026-64833 (CVSSv3: 7.1, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64833 *
CVE-2026-64834 (CVSSv3: 7.5, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64834 *
CVE-2026-64835 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64835 *
CVE-2026-65703 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65703 *
CVE-2026-65704 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65704 *
CVE-2026-65705 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65705 *
CVE-2026-65706 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65706 *
CVE-2026-66032 (CVSSv3: 8.8, CVSSv4: 8.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66032 *
CVE-2026-66033 (CVSSv3: 7.5, CVSSv4: 8.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66033 *
CVE-2026-66034 (CVSSv3: 7.5, CVSSv4: 7.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66034 *
CVE-2026-66035 (CVSSv3: 7.5, CVSSv4: 7.7): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-66035 *
CVE-2026-66036 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66036 *
CVE-2026-66037 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66037 *
CVE-2026-66038 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66038 *
CVE-2026-66039 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66039 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66041 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66041 *

Summary of CVE counts by recipe:
  linux-yocto: 165
  ffmpeg: 16
  python3:python3-native: 6
  libssh2:libssh2-native: 6
  libsoup: 5
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 5
  busybox: 4
  gstreamer1.0: 3
  libsndfile1: 2
  xserver-xorg: 2
  bison:bison-native: 2
  coreutils:coreutils-native: 2
  wget: 2
  apt: 1
  python3-pip: 1
  libgcrypt:libgcrypt-native: 1
  qemu:qemu-native:qemu-system-native: 1
  vim: 1
  cups: 1
  git:git-native: 1
  cairo:cairo-native: 1
  python3-ply: 1
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 1
  glibc: 1
  libtheora: 1
  cryptodev-linux: 1
  diffutils: 1
  nghttp2: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

