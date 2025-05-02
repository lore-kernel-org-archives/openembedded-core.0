Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3906C3ABB2
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 16:55:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.24232.1746204924554690200
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 09:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WGj130Z8;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30a5094df42so1181481a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746204924; x=1746809724; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jppv6TSH9H4lq9inX+Ge/h4GYCTBnWhBBPR5HlHg85I=;
        b=WGj130Z8ZJ091VD9QVAXFeVgfpeT+FE737NykD8SUsY9rLvCVgezgQCam2zyyyk4rW
         YKPbrS03mBD8o9axe02ostKnVJOmHhsH5d0CNVcJiFoHuAudBWUhes3Z2lVD5akkfclt
         I+a16UEAz2TYo71T8hlvDbHNlekr6ChAwqcuko+OYKLaUFYW9a9PHMGpYO4GOR0SpqaX
         VNsQ/r5k+ga11Greh6dbmDanXZ0ywRAPin3ovR7ftaKmBgXCnuzyixSIzXRgbt3jWYmx
         EA15D/ftbUonq23Hbc66cpuSBidmQtcktMfYwMkERIbgOkAsF0XjUmME8kiNYuZ0y7Jk
         q6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204924; x=1746809724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jppv6TSH9H4lq9inX+Ge/h4GYCTBnWhBBPR5HlHg85I=;
        b=bzOwn2ITAYmfNVlWvmorq+yAogrhjllEiXFr0rv22jglxlQnWVPoxlv8MHNFj/M3u/
         SX8ScqeJBpfuYlk6iM4/h3pgScuUfJfMtcmezrX6gxs+4ZLkcU8esCwE0RD148vxrUtC
         +g1XXzmQc7uQA9Fx8Mbn2WBc0mzFXJajfGkOm9U2HcXUfRtVGGVX+yX/kYh7JpEL1cEp
         iIp40Ao5y0K5IxWqxOeHhcK4jrHjk0Jn4nCpQjqxGec8DZC+bBZ04RJSQ4VaPfA5uwlM
         csLKiWtayTVE6DfQNDgvZ9aAoQZz76Yob68gknNb1eQMvUoPOOAc416x0G+QG1/ZONsR
         +61A==
X-Gm-Message-State: AOJu0YymoHI8rqduxDn0QtloKSE46RVTs68JJmrwuB9bSoH/gQaVZjqE
	WOIu4KFTf1dz5tNGUywyZfYE3nZGQ51yf6bFp1L5PwkZ//ppGF5cWsF3/Pju
X-Gm-Gg: ASbGncusYmQt3whNpDNX44is4JXBFPgzl+JmCsnnZYJR8+8OA4fjcS5jVS6ukdfQXiR
	yStaLH6lBfM50IcJiwMNdXsf46Cjiy7YjkU/kvDCioAuaPxXKpmlYt/PsmSNTIIS1Y1bjIk3IW9
	LX5MjdD7Ftx3dvLmOOyhEgmUU6lsyf/YgpgjpzbFVg2c3MBNNES0rZoZcprj62OPw+KUuAd/odw
	vjD0m0Rvj1VQfS2Dya8VsjE4CH2cFGAfuOozdSW9vIERPR5i+aUxmII/9hw0RP0mZBgjZOclexv
	UqwlA8HPvvECukgnRUTU5KhRCjDGbVpI
X-Google-Smtp-Source: AGHT+IErhUZyxZvb61rwLp8GexMbQMG2G6vAe427TdkeuMjoH1BA0wAUWKvVUbbsPJ7MsxKMWnTtRQ==
X-Received: by 2002:a17:90b:384b:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-30a4e5ccd19mr5038849a91.21.1746204923771;
        Fri, 02 May 2025 09:55:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::fb82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47625af9sm3253794a91.31.2025.05.02.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 09:55:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 02 May 2025 09:55:19 -0700
Subject: [PATCH v6 5/6] maintainers.inc: Add myself as maintainer for clang
 family of recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-clang-merge-v6-5-00f2c2e9ff68@gmail.com>
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
In-Reply-To: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 16:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215916

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1932e3d0e83ffebc7526fa209470be9cd30f7cc1..b3e3862df9e8ff0d040c804f80704b1a768bce37 100644
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
@@ -324,6 +330,7 @@ RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcomps = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com>"
+RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdazzle = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hiago.franco@toradex.com>"
@@ -471,7 +478,7 @@ RECIPE_MAINTAINER:pn-linux-yocto = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-20.1.2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lrzsz = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -539,6 +546,7 @@ RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-nativesdk-clang-glue = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
@@ -558,6 +566,7 @@ RECIPE_MAINTAINER:pn-npth = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-nss-myhostname = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-openmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-opensbi = "Thomas Perrot <thomas.perrot@bootlin.com>"
 RECIPE_MAINTAINER:pn-openssh = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-openssl = "Unassigned <unassigned@yoctoproject.org>"

-- 
2.49.0


