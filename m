Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96FCC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:23:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22697.1786335789733291022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rv3gxemM;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so8069515e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 21:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1786335788; x=1786940588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1pADkbKZ4xYket/i2fP8i6aw+7C07UmZCALsxzwtG6w=;
        b=rv3gxemME/lCTZ31l2SwEE5DJbNUyDNCvAcE6SsiWZmLdXHuWOm9IWV+DIyMZDBlbN
         KkQ8id7J811pSIO1O/uZCx1xooG9Jewx5ALyBl4x6qFNqCZIVsku8B88qTiNvnAX+nOR
         Thn5OHyxZM+VtGQJfs3x67pXfwes8DbXKp1+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786335788; x=1786940588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1pADkbKZ4xYket/i2fP8i6aw+7C07UmZCALsxzwtG6w=;
        b=OsMKa0lF/o15sRZF4y6Tnpq/BiVfK5nBtXh+O8I/OHJQulXBY90hNFaU0BHH1m8piI
         xGqZxKUfoYQEX93pot9qDFTe8q/L1jr4UVdmiI2xMOZIq4rZFsk96B9q0pjZUjD03RWK
         9gnah01KVehFale+4q2VHE01dRKnkhEWcjv8OnXlGa3PK2ULSm2zCvtLdepXzuAaCasX
         UBzUbL/XVuC8mJ3dANL/oWD1Owny6BtuyQUhRuIw1iVow8zB30eGxHd00KzExkxueT8E
         RdePRasYb4w+x7SB7dYD+kXEUIrU2BO3kwCEjASWLQGaPQkPyJ2ewerjqxA6wTzMLX/n
         1uOA==
X-Gm-Message-State: AOJu0Yw7XcIcgrWpSUjJ1+kv1/WH3gZcif7ozi+OT0AFxIufG2XhhIH/
	dZbWmgb1V/u24I9d9nChcvLLl2ACdMgeeIOIm3YNBg1/X/cXWZ/u5DD4YrovMY28sIwf2LIpDVD
	WEA3u/TY=
X-Gm-Gg: AR+sD10QvdhhvpDYAj26dihRESkZYXEkZFFlxotz3fSF7ajG4NjPv+4ztQFfIRdIzVL
	WVkouom3Xjam8MEknPcXBdsU4b9ksCq1FcZuOD5MXswGyVgOpUPnnQQacXJm4bJ4ut9pwqJu9lJ
	vUBCNBRBAkuiJADqqJJ9mNmsh+JTYQapopANh841PdqPEZHGVNrcaBUc/WYv8tTTizQ6BYetPvy
	8LOk2PY5X7vqHpou/jqZ8Y0GRBTtXKSVvQDYamRvyZG5qaKgAD+Id7fBVhYRTwPlvf4hqAFWmW6
	EJaRW98LWAXOjj2lgT5uORNzdEqob7d8EMaddHyjnKbm+bI9xC5nhk6wlTcq5CBHAkXWelUz/B9
	tQeJ1I8wMUQg6IHW1CxZSjAvx0dDLL2zOrk98371bfsUMBkaoXIcli2QLKM2wtYt8LeF0r/UJSq
	LAyjfXIn4yvzl1SQzrW6Xco8BPGw++b9GuLKGG7sAldDdWu8r4uAahJlaKKBEPCy0/M1+VUjfqz
	gyupIW4rVAuI9IMxfOYliM+RSjMCAaT5VNyu5J5/NLZt0svvAA+oKv2d+5G6l3k0BHpHfrhkZBO
	0LimgLg1y/4IUkSoAezFxRNauTwFr1rO
X-Received: by 2002:a05:600c:4513:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-4996198373amr196731005e9.10.1786335787505;
        Sun, 09 Aug 2026 21:23:07 -0700 (PDT)
Received: from runner-glrt-sin-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm31344406f8f.14.2026.08.09.21.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:23:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for wrynose on Mon Aug 10 03:04:58 2026
Date: Mon, 10 Aug 2026 04:23:05 +0000
Message-ID: <20260810042305.20-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810042305.20-1-yoann.congal@smile.fr>
References: <20260810042305.20-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243091

Branch: wrynose

New this week: 46 CVEs
CVE-2025-49506 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2025-49506 *
CVE-2026-15534 (CVSS: N/A): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-32327 (CVSSv3: 9.1): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-32327 *
CVE-2026-34191 (CVSSv3: 9.1): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34191 *
CVE-2026-34501 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34501 *
CVE-2026-34502 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34502 *
CVE-2026-64561 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64561 *
CVE-2026-64562 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64562 *
CVE-2026-64563 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64563 *
CVE-2026-64564 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64564 *
CVE-2026-64565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64565 *
CVE-2026-64566 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64566 *
CVE-2026-64567 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64567 *
CVE-2026-64568 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64568 *
CVE-2026-64569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64569 *
CVE-2026-64570 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64570 *
CVE-2026-64571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64571 *
CVE-2026-64572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64572 *
CVE-2026-64573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64573 *
CVE-2026-64574 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64574 *
CVE-2026-64575 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64575 *
CVE-2026-64576 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64576 *
CVE-2026-64577 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64577 *
CVE-2026-64578 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64578 *
CVE-2026-64579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64579 *
CVE-2026-64580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64580 *
CVE-2026-64582 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64582 *
CVE-2026-64583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64583 *
CVE-2026-64584 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64584 *
CVE-2026-64585 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64585 *
CVE-2026-64586 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64586 *
CVE-2026-64594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64594 *
CVE-2026-68081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68081 *
CVE-2026-68082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68082 *
CVE-2026-68480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68480 *
CVE-2026-69247 (CVSSv4: 8.2): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69247 *
CVE-2026-69248 (CVSSv4: 6.9): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69248 *
CVE-2026-69249 (CVSSv4: 8.7): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69249 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *

Removed this week: 0 CVEs


Full list: Found 383 unpatched CVEs
CVE-2011-3374 (CVSSv2: 4.3, CVSSv3: 3.7): apt https://nvd.nist.gov/vuln/detail/CVE-2011-3374 *
CVE-2013-10036 (CVSSv4: 8.4): connman https://nvd.nist.gov/vuln/detail/CVE-2013-10036 *
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
CVE-2024-43802 (CVSSv3: 4.5): vim https://nvd.nist.gov/vuln/detail/CVE-2024-43802 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2024-52005 (CVSSv3: 8.8, CVSSv4: 7.5): git:git-native https://nvd.nist.gov/vuln/detail/CVE-2024-52005 *
CVE-2025-15366 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15366 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-49506 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2025-49506 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-56005 (CVSSv3: 9.8): python3-ply https://nvd.nist.gov/vuln/detail/CVE-2025-56005 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-66382 (CVSSv3: 5.5): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2025-66382 *
CVE-2025-69693 (CVSSv3: 5.4): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2025-69693 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71306 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71306 *
CVE-2025-71308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71308 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2026-0864 (CVSSv4: 4.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-0864 *
CVE-2026-2625 (CVSSv3: 5.5): rpm-sequoia https://nvd.nist.gov/vuln/detail/CVE-2026-2625 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3184 (CVSSv3: 5.3): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-3184 *
CVE-2026-3195 (CVSSv3: 7.4): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3195 *
CVE-2026-3196 (CVSSv3: 5.5): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3196 *
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-3842 (CVSSv3: 7.8): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-3842 *
CVE-2026-4271 (CVSSv3: 7.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-4271 *
CVE-2026-4360 (CVSSv3: 5.3, CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-4360 *
CVE-2026-4873 (CVSSv3: 5.9): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-4873 *
CVE-2026-5056 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-5056 *
CVE-2026-5201 (CVSSv3: 7.5): gdk-pixbuf:gdk-pixbuf-native https://nvd.nist.gov/vuln/detail/CVE-2026-5201 *
CVE-2026-5435 (CVSSv3: 7.3): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5435 *
CVE-2026-5450 (CVSSv3: 9.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5450 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-5928 (CVSSv3: 7.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5928 *
CVE-2026-6238 (CVSSv3: 6.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-6238 *
CVE-2026-6732 (CVSSv3: 7.5): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-6732 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-6879 (CVSSv4: 2.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-6879 *
CVE-2026-7009 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-7009 *
CVE-2026-8286 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8286 *
CVE-2026-8458 (CVSSv3: 6.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8458 *
CVE-2026-8461 (CVSSv3: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-8461 *
CVE-2026-8924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8924 *
CVE-2026-8925 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8925 *
CVE-2026-8926 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8926 *
CVE-2026-8927 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8927 *
CVE-2026-8932 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8932 *
CVE-2026-9079 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9079 *
CVE-2026-9080 (CVSSv3: 7.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9080 *
CVE-2026-9539 (CVSSv3: 6.5): libslirp:libslirp-native https://nvd.nist.gov/vuln/detail/CVE-2026-9539 *
CVE-2026-9545 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9545 *
CVE-2026-9546 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9546 *
CVE-2026-9547 (CVSSv3: 7.4): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9547 *
CVE-2026-10723 (CVSSv3: 6.8): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10723 *
CVE-2026-10822 (CVSSv3: 6.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-10822 *
CVE-2026-11331 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11331 *
CVE-2026-11352 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11352 *
CVE-2026-11564 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11564 *
CVE-2026-11586 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11586 *
CVE-2026-11605 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11605 *
CVE-2026-11622 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11622 *
CVE-2026-11721 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-11721 *
CVE-2026-11856 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11856 *
CVE-2026-12003 (CVSSv4: 5.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-12003 *
CVE-2026-12064 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-12064 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-12617 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-12617 *
CVE-2026-12891 (CVSSv3: 4.3): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12891 *
CVE-2026-12892 (CVSSv3: 4.4): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12892 *
CVE-2026-13204 (CVSSv3: 7.5): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13204 *
CVE-2026-13221 (CVSSv3: 9.1): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-13221 *
CVE-2026-13321 (CVSSv3: 8.6): bind https://nvd.nist.gov/vuln/detail/CVE-2026-13321 *
CVE-2026-13595 (CVSSv3: 6.8): util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native https://nvd.nist.gov/vuln/detail/CVE-2026-13595 *
CVE-2026-13757 (CVSSv3: 6.2): p11-kit:p11-kit-native https://nvd.nist.gov/vuln/detail/CVE-2026-13757 *
CVE-2026-15308 (CVSSv3: 7.5, CVSSv4: 8.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15308 *
CVE-2026-15534 (CVSS: N/A): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-23328 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23328 *
CVE-2026-23374 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23374 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-23459 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23459 *
CVE-2026-28529 (CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-29518 (CVSSv3: 7.8, CVSSv4: 7.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-29518 *
CVE-2026-30922 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-30922 *
CVE-2026-30997 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30997 *
CVE-2026-30998 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30998 *
CVE-2026-30999 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30999 *
CVE-2026-31501 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31501 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-32327 (CVSSv3: 9.1): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-32327 *
CVE-2026-33845 (CVSSv3: 9.1): gnutls:gnutls-native https://nvd.nist.gov/vuln/detail/CVE-2026-33845 *
CVE-2026-34073 (CVSSv3: 5.3, CVSSv4: 1.7): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-34073 *
CVE-2026-34191 (CVSSv3: 9.1): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34191 *
CVE-2026-34501 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34501 *
CVE-2026-34502 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34502 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38754 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38754 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-39892 (CVSSv3: 9.8, CVSSv4: 6.9): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-39892 *
CVE-2026-40962 (CVSSv3: 9.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-40962 *
CVE-2026-41035 (CVSSv3: 7.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-41035 *
CVE-2026-41066 (CVSSv3: 7.5): python3-lxml:python3-lxml-native https://nvd.nist.gov/vuln/detail/CVE-2026-41066 *
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
CVE-2026-43617 (CVSSv3: 4.8, CVSSv4: 6.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43617 *
CVE-2026-43618 (CVSSv3: 8.1, CVSSv4: 6.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43618 *
CVE-2026-43619 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43619 *
CVE-2026-43620 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43620 *
CVE-2026-44432 (CVSSv3: 7.5, CVSSv4: 8.9): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2026-44432 *
CVE-2026-45232 (CVSSv3: 3.7, CVSSv4: 2.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-45232 *
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
CVE-2026-46727 (CVSSv3: 8.1): ruby:ruby-native https://nvd.nist.gov/vuln/detail/CVE-2026-46727 *
CVE-2026-48863 (CVSSv3: 7.5): libsolv https://nvd.nist.gov/vuln/detail/CVE-2026-48863 *
CVE-2026-48914 (CVSSv3: 6.7): qemu:qemu-native:qemu-system-native https://nvd.nist.gov/vuln/detail/CVE-2026-48914 *
CVE-2026-50219 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-50219 *
CVE-2026-50256 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50256 *
CVE-2026-50257 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50257 *
CVE-2026-50258 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50258 *
CVE-2026-50259 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50259 *
CVE-2026-50260 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50260 *
CVE-2026-50261 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50261 *
CVE-2026-50262 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50262 *
CVE-2026-50263 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50263 *
CVE-2026-50264 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50264 *
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
CVE-2026-54369 (CVSSv3: 7.1, CVSSv4: 8.4): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54369 *
CVE-2026-54370 (CVSSv3: 6.3, CVSSv4: 7.2): acl:acl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54370 *
CVE-2026-54371 (CVSSv3: 7.1, CVSSv4: 8.4): attr:attr-native https://nvd.nist.gov/vuln/detail/CVE-2026-54371 *
CVE-2026-55693 (CVSSv3: 7.8, CVSSv4: 5.7): vim https://nvd.nist.gov/vuln/detail/CVE-2026-55693 *
CVE-2026-55895 (CVSSv3: 7.8, CVSSv4: 5.7): vim https://nvd.nist.gov/vuln/detail/CVE-2026-55895 *
CVE-2026-55999 (CVSSv3: 8.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-55999 *
CVE-2026-56000 (CVSSv3: 7.8, CVSSv4: 9.0): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-56000 *
CVE-2026-56001 (CVSSv3: 8.8): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-56001 *
CVE-2026-56002 (CVSSv3: 8.8): libxfont:libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-56002 *
CVE-2026-56003 (CVSSv3: 8.8): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-56003 *
CVE-2026-56109 (CVSSv3: 6.8, CVSSv4: 7.0): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-56109 *
CVE-2026-56131 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56131 *
CVE-2026-56288 (CVSSv3: 5.5, CVSSv4: 4.6): patch https://nvd.nist.gov/vuln/detail/CVE-2026-56288 *
CVE-2026-56289 (CVSSv3: 5.5, CVSSv4: 4.6): patch https://nvd.nist.gov/vuln/detail/CVE-2026-56289 *
CVE-2026-56389 (CVSSv4: 6.8): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56389 *
CVE-2026-56390 (CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-56391 (CVSSv4: 4.6): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56391 *
CVE-2026-56392 (CVSSv4: 1.8): coreutils:coreutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-56392 *
CVE-2026-56412 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56412 *
CVE-2026-57432 (CVSSv3: 8.4): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-57432 *
CVE-2026-57451 (CVSSv3: 6.1): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57451 *
CVE-2026-57453 (CVSSv3: 7.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57453 *
CVE-2026-57454 (CVSSv3: 6.1, CVSSv4: 6.8): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57454 *
CVE-2026-57455 (CVSSv3: 7.8, CVSSv4: 4.0): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57455 *
CVE-2026-57456 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57456 *
CVE-2026-58050 (CVSSv3: 7.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58050 *
CVE-2026-58051 (CVSSv3: 6.5, CVSSv4: 8.3): libssh2:libssh2-native https://nvd.nist.gov/vuln/detail/CVE-2026-58051 *
CVE-2026-58055 (CVSSv3: 5.4, CVSSv4: 6.3): nghttp2 https://nvd.nist.gov/vuln/detail/CVE-2026-58055 *
CVE-2026-58469 (CVSSv3: 7.5, CVSSv4: 8.7): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58469 *
CVE-2026-58470 (CVSSv3: 5.3, CVSSv4: 6.9): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58470 *
CVE-2026-58471 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58471 *
CVE-2026-58472 (CVSSv3: 7.1, CVSSv4: 6.0): wget https://nvd.nist.gov/vuln/detail/CVE-2026-58472 *
CVE-2026-59856 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-59856 *
CVE-2026-59857 (CVSSv3: 5.5, CVSSv4: 5.6): vim https://nvd.nist.gov/vuln/detail/CVE-2026-59857 *
CVE-2026-59858 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-59858 *
CVE-2026-59884 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59884 *
CVE-2026-59885 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59885 *
CVE-2026-59886 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59886 *
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
CVE-2026-64561 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64561 *
CVE-2026-64562 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64562 *
CVE-2026-64563 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64563 *
CVE-2026-64564 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64564 *
CVE-2026-64565 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64565 *
CVE-2026-64566 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64566 *
CVE-2026-64567 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64567 *
CVE-2026-64568 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64568 *
CVE-2026-64569 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64569 *
CVE-2026-64570 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64570 *
CVE-2026-64571 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64571 *
CVE-2026-64572 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64572 *
CVE-2026-64573 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64573 *
CVE-2026-64574 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64574 *
CVE-2026-64575 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64575 *
CVE-2026-64576 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64576 *
CVE-2026-64577 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64577 *
CVE-2026-64578 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64578 *
CVE-2026-64579 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64579 *
CVE-2026-64580 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64580 *
CVE-2026-64582 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64582 *
CVE-2026-64583 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64583 *
CVE-2026-64584 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64584 *
CVE-2026-64585 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64585 *
CVE-2026-64586 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64586 *
CVE-2026-64594 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64594 *
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
CVE-2026-68081 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68081 *
CVE-2026-68082 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68082 *
CVE-2026-68480 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68480 *
CVE-2026-69247 (CVSSv4: 8.2): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69247 *
CVE-2026-69248 (CVSSv4: 6.9): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69248 *
CVE-2026-69249 (CVSSv4: 8.7): python3-cryptography https://nvd.nist.gov/vuln/detail/CVE-2026-69249 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *

Summary of CVE counts by recipe:
  linux-yocto: 194
  ffmpeg: 27
  curl:curl-native: 19
  vim: 11
  xserver-xorg:xwayland: 11
  bind: 9
  python3:python3-native: 7
  rsync:rsync-native: 7
  libsoup: 6
  libssh2:libssh2-native: 6
  apr-util: 5
  python3-cryptography: 5
  expat:expat-native: 4
  qemu:qemu-native:qemu-system-native: 4
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  glibc: 4
  python3-pyasn1: 4
  busybox: 4
  wget: 4
  gstreamer1.0: 3
  perl:perl-native: 3
  libsndfile1: 2
  util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-native: 2
  popt:popt-native: 2
  acl:acl-native: 2
  libxfont2: 2
  patch: 2
  bison:bison-native: 2
  coreutils:coreutils-native: 2
  apt: 1
  connman: 1
  libgcrypt:libgcrypt-native: 1
  cups: 1
  git:git-native: 1
  cairo:cairo-native: 1
  python3-ply: 1
  avahi: 1
  rpm-sequoia: 1
  gdk-pixbuf:gdk-pixbuf-native: 1
  libtheora: 1
  libxml2:libxml2-native: 1
  libslirp:libslirp-native: 1
  p11-kit:p11-kit-native: 1
  epiphany: 1
  cryptodev-linux: 1
  gnutls:gnutls-native: 1
  python3-lxml:python3-lxml-native: 1
  python3-urllib3: 1
  ruby:ruby-native: 1
  libsolv: 1
  diffutils: 1
  attr:attr-native: 1
  libxfont:libxfont2: 1
  alsa-lib:alsa-lib-native: 1
  nghttp2: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

