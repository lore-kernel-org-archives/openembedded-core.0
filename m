Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E21C3ABBD
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 04:15:23 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.43260.1746418519962217729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 21:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P4y9DR7z;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso4003538b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 21:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746418519; x=1747023319; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jppv6TSH9H4lq9inX+Ge/h4GYCTBnWhBBPR5HlHg85I=;
        b=P4y9DR7zxCq+wSez/hh3LgzD7CVwYGuUM50qqSER9kaasqT3CwGAlLCHrvnLU60eH8
         AKLTJrMRdBth9nv8EJWwbwgymApW2SUF0/znRvtKf/9EbVmOfDCss/aN9Cy5Z7uxahow
         rTdoovAV2OAJ1veJ93adDahagsyXyyZqGVVqEtC6W/XllpfPRuyXemQsbN/eGUhMXHO7
         lfeF8ClHUYosGgZ/hKr538x4k9Uutwh7er8QrwOcXqD3AERPbCWCh0z/STJYuvodVNil
         rx0p4fHiG7oQcer2vcvBsWvAn+lfHRfNu1apFC7TvsQlYM4eojhEV7OIzdcAnEGIqZvN
         X6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746418519; x=1747023319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jppv6TSH9H4lq9inX+Ge/h4GYCTBnWhBBPR5HlHg85I=;
        b=oqPM6TR8Z/cs8qJshr2rHqzhNN1qY4bG/XCB+fPE6fdwJjYWDr4vs6ktRIxwpvowRD
         X7hR6lZcFcPYTS7fiY6S2/Mic8eYzDkP9IuPRq2IgEyG/AbcvpdlVbFO2/mHdgFmkJlg
         0a/sm51FOkLgx+sS44d+6/Z+dhmw1YnRCifmY7EhEbKo1FhD0BG5aN8ZMyIX6J4DbtER
         6fvDeCWMI6+RnPw71upbBjXH2A7ctdASuHXK+CGW/mHPn7fOo0IRN3tTpEWExZ4eluio
         KRCVOf6qbVyGJIfzuDIX2oOAhDaU36dJ3KhAHfifhH0IvhEDgyRGaFH67ELWPMWTfwKd
         crwA==
X-Gm-Message-State: AOJu0YycgCyuy75QZfnpYYhQZ/CI+ESIeSmfPYXV7U9mKhEuYmqqA9xV
	i4ikls3ACt4ar1DLXTuzWep68tADnbsu+SHtOJ3Ki46emJ0nIIK+bkqAWwnG
X-Gm-Gg: ASbGncugcUIsxF5BBiO69vAg4JUmT7EXJ3ZvwcES1nGcjFDOy8hl7mRhqzH/RG47m/R
	9OLreCkVpvrke/qmyQ8y+zk/Tui7Qq1I0UrA6rkv8lnXdru/FIepnTLkGUAch+yCFGngv9h8lfr
	kRFlHCBIRH6GYaFXRKVF5aGws8WHIvsRG8CYVCKcXayDC8Q2gAon3HOhTYWqFytqwsJBD9ZmAns
	EY+dvlOEh0fo8SK1SnlhSx1YT0BF048tSBpwMNjwx8rAXM33Fx9uu+WvBSDBp+IRKq5XUDE8k2Y
	2sYipibC3HNsWbVuGmJ4JLs0eERGs/qv
X-Google-Smtp-Source: AGHT+IG3BLd9zjgBll4SL9vgTtF85jWSlFy6W4+pXOv3k//2Q8FyE9Hwxig5q3ksA0hUKKvSe186ag==
X-Received: by 2002:a05:6a00:1c81:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-74057b2f03amr18351959b3a.5.1746418519271;
        Sun, 04 May 2025 21:15:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021044sm5905039b3a.96.2025.05.04.21.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 21:15:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 04 May 2025 21:15:15 -0700
Subject: [PATCH v7 5/8] maintainers.inc: Add myself as maintainer for clang
 family of recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-clang-merge-v7-5-165be7b96180@gmail.com>
References: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
In-Reply-To: <20250504-clang-merge-v7-0-165be7b96180@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 04:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215981

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


