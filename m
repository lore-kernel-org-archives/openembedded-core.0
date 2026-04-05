Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D7BE9D828
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 22:12:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43883.1775427120762151405
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 15:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=q0kljK2l;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1909309f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 15:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775427119; x=1776031919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/w8BIaL0q5R71H9p4uB5xhi0XVSdFVxbMpDwibW/PrQ=;
        b=q0kljK2lUk1GHoHAl3KvFuq8xR2w2dQ4AR0Y8iXHbbJpFUC9ezgWYaZU7fvk51ytWF
         FLYXmlP6+Egd/bNtyEN165rJfCTI7azr++ODnxNi7WxwPCwvbEL5aQqr7RR0lFwMiPOF
         A1qjoAz0UyumB038PBc9dMbKHDZIsc1TE25vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775427119; x=1776031919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/w8BIaL0q5R71H9p4uB5xhi0XVSdFVxbMpDwibW/PrQ=;
        b=Raik3PWend/va1cePg+iL+bT9j9cwrqFwear86XPK9rdvFG5RfxjKTbEjtha2KgAiD
         fzOBElOSSehdUOF+U9FYYnq68D/FQ4QeoTpL+TEMv2ftxGlvyFiP5/vdJS3TK2GfqLs3
         XEEDLUILBiI0BkGrSJxiBpoM31AqyIS8/B2CiJTIrddg5TodOOSTg8XC6D3VKABe/83p
         psB7tUmYev+vIIDEo4r5MzbgOEmRIv8A0laoCDKjMy9RubqqkfjP10bDCQqUMYXcNX0W
         p0T0590utvPykUfwaJT7MNswROHAIuE6G/0p0H/cSAwMWbupUGTTbYtAEF4kzo07hyEw
         ZGuA==
X-Gm-Message-State: AOJu0YxvzEp5pG+T5GnQEFDGx8IE3C5BHw8IF/nSZiOFWB9/RLq2QE8T
	cG3PCSLpBpJruhxISq6IpcfE/c5MsN/D5SJmjxgFpdy95Niihqy/PnPCN8jZVuSUR3PQvYGCWT2
	aSNqFl0E=
X-Gm-Gg: AeBDieuTezvytOEUH4bZAYUUSUsdJAw0HKDSCd+1Z0d9Ni1UXwYZPKYLcDtSjkFSpEL
	YpRWdsIFnKIoeofQGaonI9MiNCs3d2u1FQBdToZ3QpqaxmzeNblKc/i8F3E359Rjz8uyoPav/Ne
	+olXWNaQDdBBcT0NIiN+XXxAEyzx0NkyKW54SnL5gU674DgSTa6tgoCrmn9Vyp+e6R+jEST5S/z
	vbRVGaBmFA2lgHmL9LP8cFsQptK4s3ffgMG9l4NfPYnVH/mg9QdsZIeTpg789irBsMIPsKLH6/A
	hE/g4UstVyAOHDD2Ybt3AxKuSx1XtoR0WhFRtYiNnxwI1Qjsfx1O96QhbrvmxXx7t+PNd/3+vH1
	FMQeqJmPmp032ZKz4Uw9eNGNgJFGlx/6ZonYBmLkvn3o/gAX3Kxi8XDu8TwAHpz46oKhD9Bkh0T
	ee1r5Rg5BttmCO83SetBgR/gsTDDpHupuxwTOqmUQ1ErEjPUlV8h1ZhBdFuCoHolY4EznRHmcYx
	hj8u7tXPH7Znyn8H+6iSkuO3GY=
X-Received: by 2002:a05:6000:310a:b0:43c:fc5c:a9fc with SMTP id ffacd0b85a97d-43d2929dcd9mr15738753f8f.21.1775427118625;
        Sun, 05 Apr 2026 15:11:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5016sm37877306f8f.33.2026.04.05.15.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 15:11:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for whinlatter on Mon Apr  6 00:06:36 2026
Date: Mon,  6 Apr 2026 00:11:29 +0200
Message-ID: <20260405221131.514270-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405221131.514270-1-yoann.congal@smile.fr>
References: <20260405221131.514270-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 22:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234640

Branch: whinlatter

New this week: 6 CVEs
CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25645 *
CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33416 *
CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33636 *
CVE-2026-34714 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34714 *
CVE-2026-35414 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35414 *
CVE-2026-5119 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5119 *

Removed this week: 0 CVEs

Full list:  Found 380 unpatched CVEs
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
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-12801 (CVSS3: N/A): nfs-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12801 *
CVE-2025-40039 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40039 *
CVE-2025-40040 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40040 *
CVE-2025-40082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40082 *
CVE-2025-40149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40149 *
CVE-2025-40164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40164 *
CVE-2025-40251 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40251 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-68211 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68211 *
CVE-2025-68214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68214 *
CVE-2025-68223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68223 *
CVE-2025-68333 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68333 *
CVE-2025-68340 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68340 *
CVE-2025-68351 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68351 *
CVE-2025-68358 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68358 *
CVE-2025-68365 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68365 *
CVE-2025-68725 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68725 *
CVE-2025-68749 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68749 *
CVE-2025-68817 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68817 *
CVE-2025-68823 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68823 *
CVE-2025-69644 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69644 *
CVE-2025-69647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69647 *
CVE-2025-69648 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69648 *
CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69649 *
CVE-2025-69650 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69650 *
CVE-2025-69651 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69651 *
CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69652 *
CVE-2025-69693 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-69693 *
CVE-2025-71071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71071 *
CVE-2025-71072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71072 *
CVE-2025-71073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71073 *
CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71074 *
CVE-2025-71075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71075 *
CVE-2025-71076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71076 *
CVE-2025-71077 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71077 *
CVE-2025-71078 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71078 *
CVE-2025-71079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71079 *
CVE-2025-71080 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71080 *
CVE-2025-71081 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71081 *
CVE-2025-71082 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71082 *
CVE-2025-71083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71083 *
CVE-2025-71084 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71084 *
CVE-2025-71085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71085 *
CVE-2025-71086 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71086 *
CVE-2025-71087 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71087 *
CVE-2025-71088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71088 *
CVE-2025-71089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71089 *
CVE-2025-71091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71091 *
CVE-2025-71093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71093 *
CVE-2025-71094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71094 *
CVE-2025-71095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71095 *
CVE-2025-71096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71096 *
CVE-2025-71097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71097 *
CVE-2025-71098 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71098 *
CVE-2025-71099 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71099 *
CVE-2025-71100 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71100 *
CVE-2025-71101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71101 *
CVE-2025-71102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71102 *
CVE-2025-71104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71104 *
CVE-2025-71105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71105 *
CVE-2025-71107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71107 *
CVE-2025-71108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71108 *
CVE-2025-71109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71109 *
CVE-2025-71111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71111 *
CVE-2025-71112 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71112 *
CVE-2025-71113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71113 *
CVE-2025-71114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71114 *
CVE-2025-71115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71115 *
CVE-2025-71116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71116 *
CVE-2025-71117 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71117 *
CVE-2025-71118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71118 *
CVE-2025-71119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71119 *
CVE-2025-71120 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71120 *
CVE-2025-71121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71121 *
CVE-2025-71122 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71122 *
CVE-2025-71124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71124 *
CVE-2025-71125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71125 *
CVE-2025-71126 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71126 *
CVE-2025-71127 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71127 *
CVE-2025-71128 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71128 *
CVE-2025-71129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71129 *
CVE-2025-71130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71130 *
CVE-2025-71131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71131 *
CVE-2025-71132 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71132 *
CVE-2025-71133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71133 *
CVE-2025-71134 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71134 *
CVE-2025-71135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71135 *
CVE-2025-71136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71136 *
CVE-2025-71137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71137 *
CVE-2025-71138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71138 *
CVE-2025-71141 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71141 *
CVE-2025-71142 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71142 *
CVE-2025-71143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71143 *
CVE-2025-71147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71147 *
CVE-2025-71148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71148 *
CVE-2025-71149 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71149 *
CVE-2025-71150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71150 *
CVE-2025-71151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71151 *
CVE-2025-71152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71152 *
CVE-2025-71153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71153 *
CVE-2025-71154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71154 *
CVE-2025-71156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71156 *
CVE-2025-71157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71157 *
CVE-2025-71158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71158 *
CVE-2025-71160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71160 *
CVE-2025-71161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71161 *
CVE-2025-71162 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71162 *
CVE-2025-71163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71163 *
CVE-2025-71180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71180 *
CVE-2025-71182 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71182 *
CVE-2025-71183 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71183 *
CVE-2025-71184 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71184 *
CVE-2025-71185 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71185 *
CVE-2025-71186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71186 *
CVE-2025-71187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71187 *
CVE-2025-71188 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71188 *
CVE-2025-71189 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71189 *
CVE-2025-71190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71190 *
CVE-2025-71191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71191 *
CVE-2025-71200 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71200 *
CVE-2025-71201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71201 *
CVE-2025-71202 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71202 *
CVE-2025-71203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71203 *
CVE-2025-71204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71204 *
CVE-2025-71220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71220 *
CVE-2025-71221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71221 *
CVE-2025-71222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71222 *
CVE-2025-71223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71223 *
CVE-2025-71225 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71225 *
CVE-2025-71227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71227 *
CVE-2025-71229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71229 *
CVE-2025-71230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71230 *
CVE-2025-71231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71231 *
CVE-2025-71232 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71232 *
CVE-2025-71233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71233 *
CVE-2025-71234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71234 *
CVE-2025-71235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71235 *
CVE-2025-71236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71236 *
CVE-2025-71237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71237 *
CVE-2025-71238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-71238 *
CVE-2026-1467 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1467 *
CVE-2026-1536 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1536 *
CVE-2026-1539 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1539 *
CVE-2026-1801 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-1801 *
CVE-2026-22976 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22976 *
CVE-2026-22977 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22977 *
CVE-2026-22978 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22978 *
CVE-2026-22979 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22979 *
CVE-2026-22980 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22980 *
CVE-2026-22981 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22981 *
CVE-2026-22982 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22982 *
CVE-2026-22984 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22984 *
CVE-2026-22985 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22985 *
CVE-2026-22986 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22986 *
CVE-2026-22989 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22989 *
CVE-2026-22990 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22990 *
CVE-2026-22991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22991 *
CVE-2026-22992 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22992 *
CVE-2026-22993 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22993 *
CVE-2026-22994 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22994 *
CVE-2026-22996 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22996 *
CVE-2026-22997 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22997 *
CVE-2026-22998 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22998 *
CVE-2026-22999 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-22999 *
CVE-2026-23000 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23000 *
CVE-2026-23001 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23001 *
CVE-2026-23002 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23002 *
CVE-2026-23003 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23003 *
CVE-2026-23005 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23005 *
CVE-2026-23006 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23006 *
CVE-2026-23007 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23007 *
CVE-2026-23008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23008 *
CVE-2026-23009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23009 *
CVE-2026-23010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23010 *
CVE-2026-23011 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23011 *
CVE-2026-23013 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23013 *
CVE-2026-23015 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23015 *
CVE-2026-23017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23017 *
CVE-2026-23018 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23018 *
CVE-2026-23019 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23019 *
CVE-2026-23020 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23020 *
CVE-2026-23021 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23021 *
CVE-2026-23023 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23023 *
CVE-2026-23025 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23025 *
CVE-2026-23026 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23026 *
CVE-2026-23060 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23060 *
CVE-2026-23061 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23061 *
CVE-2026-23062 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23062 *
CVE-2026-23063 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23063 *
CVE-2026-23064 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23064 *
CVE-2026-23065 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23065 *
CVE-2026-23066 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23066 *
CVE-2026-23067 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23067 *
CVE-2026-23068 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23068 *
CVE-2026-23069 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23069 *
CVE-2026-23070 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23070 *
CVE-2026-23071 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23071 *
CVE-2026-23072 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23072 *
CVE-2026-23073 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23073 *
CVE-2026-23074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23074 *
CVE-2026-23075 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23075 *
CVE-2026-23076 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23076 *
CVE-2026-23077 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23077 *
CVE-2026-23078 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23078 *
CVE-2026-23080 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23080 *
CVE-2026-23081 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23081 *
CVE-2026-23083 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23083 *
CVE-2026-23084 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23084 *
CVE-2026-23085 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23085 *
CVE-2026-23086 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23086 *
CVE-2026-23087 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23087 *
CVE-2026-23088 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23088 *
CVE-2026-23089 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23089 *
CVE-2026-23090 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23090 *
CVE-2026-23091 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23091 *
CVE-2026-23092 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23092 *
CVE-2026-23093 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23093 *
CVE-2026-23094 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23094 *
CVE-2026-23095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23095 *
CVE-2026-23096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23096 *
CVE-2026-23097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23097 *
CVE-2026-23098 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23098 *
CVE-2026-23099 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23099 *
CVE-2026-23100 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23100 *
CVE-2026-23101 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23101 *
CVE-2026-23102 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23102 *
CVE-2026-23103 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23103 *
CVE-2026-23104 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23104 *
CVE-2026-23105 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23105 *
CVE-2026-23107 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23107 *
CVE-2026-23108 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23108 *
CVE-2026-23109 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23109 *
CVE-2026-23110 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23110 *
CVE-2026-23111 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23111 *
CVE-2026-23112 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23112 *
CVE-2026-23113 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23113 *
CVE-2026-23114 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23114 *
CVE-2026-23115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23115 *
CVE-2026-23116 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23116 *
CVE-2026-23118 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23118 *
CVE-2026-23119 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23119 *
CVE-2026-23120 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23120 *
CVE-2026-23121 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23121 *
CVE-2026-23122 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23122 *
CVE-2026-23123 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23123 *
CVE-2026-23124 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23124 *
CVE-2026-23125 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23125 *
CVE-2026-23126 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23126 *
CVE-2026-23128 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23128 *
CVE-2026-23129 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23129 *
CVE-2026-23130 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23130 *
CVE-2026-23131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23131 *
CVE-2026-23133 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23133 *
CVE-2026-23135 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23135 *
CVE-2026-23136 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23136 *
CVE-2026-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23137 *
CVE-2026-23138 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23138 *
CVE-2026-23139 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23139 *
CVE-2026-23140 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23140 *
CVE-2026-23141 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23141 *
CVE-2026-23142 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23142 *
CVE-2026-23143 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23143 *
CVE-2026-23144 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23144 *
CVE-2026-23146 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23146 *
CVE-2026-23147 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23147 *
CVE-2026-23148 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23148 *
CVE-2026-23150 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23150 *
CVE-2026-23151 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23151 *
CVE-2026-23152 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23152 *
CVE-2026-23154 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23154 *
CVE-2026-23156 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23156 *
CVE-2026-23157 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23157 *
CVE-2026-23158 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23158 *
CVE-2026-23160 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23160 *
CVE-2026-23161 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23161 *
CVE-2026-23163 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23163 *
CVE-2026-23164 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23164 *
CVE-2026-23166 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23166 *
CVE-2026-23167 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23167 *
CVE-2026-23168 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23168 *
CVE-2026-23169 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23169 *
CVE-2026-23170 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23170 *
CVE-2026-23171 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23171 *
CVE-2026-23172 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23172 *
CVE-2026-23173 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23173 *
CVE-2026-23186 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23186 *
CVE-2026-23187 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23187 *
CVE-2026-23188 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23188 *
CVE-2026-23190 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23190 *
CVE-2026-23191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23191 *
CVE-2026-23192 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23192 *
CVE-2026-23193 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23193 *
CVE-2026-23195 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23195 *
CVE-2026-23196 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23196 *
CVE-2026-23197 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23197 *
CVE-2026-23198 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23198 *
CVE-2026-23199 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23199 *
CVE-2026-23201 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23201 *
CVE-2026-23204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23204 *
CVE-2026-23205 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23205 *
CVE-2026-23206 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23206 *
CVE-2026-23208 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23208 *
CVE-2026-23209 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23209 *
CVE-2026-23210 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23210 *
CVE-2026-23212 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23212 *
CVE-2026-23213 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23213 *
CVE-2026-23214 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23214 *
CVE-2026-23215 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23215 *
CVE-2026-23216 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23216 *
CVE-2026-23217 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23217 *
CVE-2026-23219 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23219 *
CVE-2026-23220 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23220 *
CVE-2026-23221 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23221 *
CVE-2026-23222 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23222 *
CVE-2026-23223 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23223 *
CVE-2026-23224 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23224 *
CVE-2026-23226 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23226 *
CVE-2026-23227 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23227 *
CVE-2026-23228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23228 *
CVE-2026-23229 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23229 *
CVE-2026-23230 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23230 *
CVE-2026-23231 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23231 *
CVE-2026-23233 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23233 *
CVE-2026-23234 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23234 *
CVE-2026-23235 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23235 *
CVE-2026-23236 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23236 *
CVE-2026-23237 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23237 *
CVE-2026-23238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-23238 *
CVE-2026-2443 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2443 *
CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25645 *
CVE-2026-25749 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-25749 *
CVE-2026-26269 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-26269 *
CVE-2026-27135 (CVSS3: N/A): nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-27135 *
CVE-2026-28417 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28417 *
CVE-2026-28418 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28418 *
CVE-2026-28419 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28419 *
CVE-2026-28420 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28420 *
CVE-2026-28421 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28421 *
CVE-2026-28422 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-28422 *
CVE-2026-2920 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2920 *
CVE-2026-2921 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2921 *
CVE-2026-2922 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2922 *
CVE-2026-2923 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-2923 *
CVE-2026-3081 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3081 *
CVE-2026-3082 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3082 *
CVE-2026-3083 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3083 *
CVE-2026-3084 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3084 *
CVE-2026-3085 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3085 *
CVE-2026-3086 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3086 *
CVE-2026-3099 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3099 *
CVE-2026-32776 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32776 *
CVE-2026-32777 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32777 *
CVE-2026-32778 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-32778 *
CVE-2026-33412 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33412 *
CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33416 *
CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-33636 *
CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3441 *
CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3442 *
CVE-2026-34714 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-34714 *
CVE-2026-35414 (CVSS3: N/A): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-35414 *
CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3632 *
CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3633 *
CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-3634 *
CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4271 *
CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-4647 *
CVE-2026-5119 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-5119 *

Summary of CVE counts by recipe:
  linux-yocto: 325
  libsoup: 11
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 10
  gstreamer1.0: 10
  vim: 10
  expat:expat-native: 3
  libpng:libpng-native: 2
  libsndfile1: 2
  avahi: 1
  ffmpeg: 1
  nfs-utils: 1
  nghttp2: 1
  openssh: 1
  python3-requests:python3-requests-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

