Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D51BC54756
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.37976.1747603852183902187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LlHjrZoI;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74068f95d9fso3327863b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603851; x=1748208651; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYWbVm918YBw/OzyGR5inLsuZcbzRbNx3Vqz9R7h2Ck=;
        b=LlHjrZoIyUKSALghMtk/yr9h3afN1Ue4HXkqFbRq5Ylc4n+P2jX7iHk42oNE44A/m7
         mK9wzt01xi8WRtoTTZK6aL3DLYZaiIbHUxdB0D2BOhmthfc9xV5AVMOvKjRAXS26szFQ
         H7Sm9KeCc82Uwij6uMHJIfw8+C6JCtnELxO3imiiDRkDVSokror3lZD/lP6qiVHflOzU
         qiHmlILPtyt0g++j1OgqRvRAd9Kxr5oGOQ7e5+fIMJaLePgVuxruQM8b2+bfELMMBMPy
         vf6W5wUsvtYHvlm8ibtitv2p2opiU63Ip2Id4nT02Jcgn+HqKK5OhE45bL0Dgr48PtuY
         OmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603851; x=1748208651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYWbVm918YBw/OzyGR5inLsuZcbzRbNx3Vqz9R7h2Ck=;
        b=S1D+/KfFqqUUH+OAWacE/MfDD6QDPypL3V2A5bycAnW/a/C41VFABKqjRuVKgFuVnm
         YYv0f/sBLh1sf67w5LND44JIBiNpTt+jRhrq1d7K7i05KEaKd7JdqlMz+jEqoeZ1qx7K
         s8QseJqh1kDjiVBzXOtymQCA3bij5mTh8sUimVTHW7gSjf+aFeD1MNSNqa+1S6YTMU3h
         V/WMQXzcE7rqvrI0CnFhHg4CZ8Ny463dgVc/aNWvA8f4MRUAbjQl/hrmdgqAG4IlRkHa
         6kAZP9dSydKnnFiUpg1BJKety+4x96/MTCxfcAZQfxdDLktVo3E4zz4kRdnssAQnb9en
         4VWg==
X-Gm-Message-State: AOJu0YyVhB01UkugG6nm5VS4BleRQ1xIlw08zomQ6k5gkz3CH/h0qURB
	RjV3gWPt2O+ZpnC7g10tZy88aCs7MSN4Z2Rdqcii3Wm6wp9RlMm8hKPSyRKRRC09
X-Gm-Gg: ASbGncuaaJNUkQKiRFTLCuqky2xb55NZSOW0OD6hD+8kwiLHZQGjbMET3dGRM6dQjHD
	7iPlvgmwFbUzPubvyCVh2Azx41InFwxF3FBu9vGW72gRUrjCrLYn2Daz3bsNf2+RTO2jrsbGTBz
	JtjwY4HhsXAfLm7jMuFAT8/aT8k/Ba/NXuNasxQB2BOGXtfFgMhbd7ZGXiRRrLngXaCLvNjkmre
	3qhujtKJ43YhQortCsSDcu9E1jZTiTlHfqACUx6L0hYokq64tUQ10EV+2gltXlh141r8GT/Jcvn
	qFC7QYVtoo3pNmsfxAkZJK2BMJqiIE8QEOaK/IRsCQw=
X-Google-Smtp-Source: AGHT+IFY3iNKAERXfKMRExrg/S5lF2l4YgjPQnTJCA2HVjHwHQlb0boF63vTNkPpktnqoG79eI29lg==
X-Received: by 2002:a05:6a20:7f96:b0:1f5:7280:1cf2 with SMTP id adf61e73a8af0-2170cc66b99mr12950443637.12.1747603851333;
        Sun, 18 May 2025 14:30:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:37 -0700
Subject: [PATCH 02/21] default-toolchains.inc: Add a global file to pin
 TOOLCHAIN variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-2-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216786

Some recipes demand either gcc or clang, they can not be compiled with
both compilers e.g. glibc, gcc, libgcc etc all exclusively need gcc to
build and similarily, libcxx, compiler-rt need clang compiler to build

This header will contain the pinned TOOLCHAIN variable defintions for
such cases

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
new file mode 100644
index 0000000000000000000000000000000000000000..691570a7a9f28187a5c7f6d0a6ad80761c777e3d
--- /dev/null
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -0,0 +1,14 @@
+TOOLCHAIN:pn-gcc = "gcc"
+TOOLCHAIN:pn-gcc-runtime = "gcc"
+TOOLCHAIN:pn-gcc-sanitizers = "gcc"
+TOOLCHAIN:pn-glibc = "gcc"
+TOOLCHAIN:pn-glibc-initial = "gcc"
+TOOLCHAIN:pn-glibc-locale = "gcc"
+TOOLCHAIN:pn-glibc-mtrace = "gcc"
+TOOLCHAIN:pn-glibc-scripts = "gcc"
+TOOLCHAIN:pn-glibc-testsuite = "gcc"
+TOOLCHAIN:pn-glibc-y2038-tests = "gcc"
+TOOLCHAIN:pn-libgcc-initial = "gcc"
+TOOLCHAIN:pn-libgcc = "gcc"
+TOOLCHAIN:pn-libgfortran = "gcc"
+TOOLCHAIN:pn-libssp-nonshared = "gcc"

-- 
2.49.0


