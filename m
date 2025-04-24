Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FABC3ABA0
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.9646.1745479255228389240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MH2fBIJw;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c3407a87aso10839845ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479254; x=1746084054; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=MH2fBIJwnzMqWbCikBo6U05zEu6Bs3MwiwPP/ulP/WU0S6/EEhXaPD6ywoHx4eK9QP
         0yJV+Y9zn9yVSWz6AXoI3vQMcnroc2a5qo6ZnZmu7xRwxMrx40axdI/Tuu/yi2B9ZX+I
         r80bVTu8lgL/Q70VA2mY4CDgnUN+uyNWF5hHP91b9U8pitjDXcShQxF65t+5HpiNj/At
         yHTl041LpCyvjnMywLUcDTcv9/CVSGiN/rH+SC4AYp9CG5uNa4eNvd9VfZACWBkI3MSA
         v/O/tCaLUwOwxWZbCnDLMDpj4pB+ZbhG/i0NGSORzZDASrcYIk1tpZtHt+MnGb3PiQZ9
         ZpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479254; x=1746084054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AZNhrPu/ql7VC/XdDgtKSsy0/I0x2aFYmrukg/YtJw=;
        b=o7XaLngn1ile9KzRJb/jIxwKEfHjU1RGoMk4W26jpgTh4DxSgKWAOxoMrfIQTCN5EI
         KN8VT3vNS834lX/O50qObXMsGDMmkkN8wJ40L0KEBh8e7RlqEfQfkSyCmONi12wzuYlB
         OT5txf1ZPHvAzH5TrSTI47P0fidU7a40MGv6QqXiGyQCYbL3WwcrTmZmvZhK7gDUsm6L
         zKMo8MPZfoS1ndnXWEskx7n9KImAwJBFpeceeAIMcXt7LEXhdUt/fWUhWA1FDUfYmPi9
         ulS5MBwxYgyRLbp7oqNo/i4KTrcx3uaKLKF0tM/gBAgSJ+HbOw/UfK9zF1RnTzef51en
         agLw==
X-Gm-Message-State: AOJu0YzbG3LdTHJeqDtkmioVORnJL1mXgFhGph/noiwDne/lCANgTsGs
	fhH7oghs62s1EkSNDPy2NPlPOsAwkd/+efV4rjkJZHnp9OIXhhlTqlIqoD3R
X-Gm-Gg: ASbGncuODNs45JYkSH0q1Rs+L7M4e0SUr44I0Di/8rnCsJEmbLLZT0yN6VIixngX/t/
	qqUE/2Zv7eTjcqRZftRmfKaXaoM9V7xuEtLKW0FHwJY/WifJvHvmS7kkoySvJfetEJ5RWrXINPm
	Gihef/MmvknNW9E0B+fHBjwLnO1Ejx1jUPJGAoBU06xJmUQ26ckrwaJb+QjMauVxIDnPJrH966l
	ShHGi49bIYMIo1rsD7xBU4abOSycx37vbZXSJ8cEs8jowvn5gDjU8UFZuotk9CA5zmRKcWMnPez
	IxlKzy5hwMwmideolJNDbispoAd/42S7
X-Google-Smtp-Source: AGHT+IFkQgj4HqRTp5D3gGXTwLzemScASa6rBJHQmXhQWbTkluoYJiZSpJN7zKqehVcG8cnduFEbRQ==
X-Received: by 2002:a17:903:8c6:b0:225:ac99:ae0f with SMTP id d9443c01a7336-22db3bb71f0mr22522575ad.1.1745479254485;
        Thu, 24 Apr 2025 00:20:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:37 -0700
Subject: [PATCH 03/11] maintainers.inc: Add myself as maintainer for clang
 family of recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-3-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215330

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8065287c171dca14b85b2b78660a24b5994337a0..8f480c768ec1aee41c51ae86a85d4137a388a638 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -97,8 +97,14 @@ RECIPE_MAINTAINER:pn-cantarell-fonts = "Unassigned <unassigned@yoctoproject.org>
 RECIPE_MAINTAINER:pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-clang = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-clang-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-cmake = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-cmake-native = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-compiler-rt = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-compiler-rt-sanitizers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-connman = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-connman-conf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome = "Ross Burton <ross.burton@arm.com>"
@@ -325,6 +331,7 @@ RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
@@ -472,7 +479,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -540,6 +547,7 @@ RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-nativesdk-clang-glue = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
@@ -559,6 +567,7 @@ RECIPE_MAINTAINER:pn-npth = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-openmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Thomas Perrot <thomas.perrot@bootlin.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Unassigned <unassigned@yoctoproject.org>"

-- 
2.49.0


