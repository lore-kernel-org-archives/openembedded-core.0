Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD27BC4332F
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 15:22:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.13151.1637853758293273786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ga9q1hBW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id i5so12438440wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7cLCIAFWcZ9OCuItbb5Yqa5udM6PO9GM5yW0qjl5OEI=;
        b=ga9q1hBWxwDstW+/DlOaRhrVVzy605NRLP29IP+ytEUTGNcHIUpVEVlBV4P0hCy58q
         jhhpmyOd2e4RtAziWwXgIaCUKQhD1p7M/6cF7DkbmyqZUAQH60iFVQgLPqKp5HnOAkTL
         9HP5/n0oSP60o4OHN8Px5jp0WYANQR/sHjevA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7cLCIAFWcZ9OCuItbb5Yqa5udM6PO9GM5yW0qjl5OEI=;
        b=b5grYlqp+HpNdjXZCgsry5Uwb0mOyKs0/uUzXdRb4OIBfEsbbPjj28QbRviCCi/Seo
         wojNpPdYlqHacblxOSt0VTzXdljspVEnsmYDTecxv23cMa99nQBMEA6+ZiqVmLdR9Cby
         YRI+Q2WfNqBIvxKY/HIbF/JiI+Ca2NxxY7Rb3YdAYyj5KXcp2xaW7L5t9jvlfvk7voOv
         /7Bpb4JGS7b/dWqcug+V/PBVqIVCXlqHeQ7LoGQQrCVhNYpvFLnbUjcqfrdXLSwfLxFc
         Dw3Xw48RKzCgmw4ayFjJEefO+l04+QXgXRnSLl3OsphvOCs7pjGAopNbKS0pLU1l0ZtK
         ubhw==
X-Gm-Message-State: AOAM533bKp8DFLf8UyziiPAASYFxg4M0Qki7bewoC1TGg6GaQ5o8aJSn
	bcQEKP5uoz0pz54QhX0Vuw/AOG/k4w5TYQ==
X-Google-Smtp-Source: 
 ABdhPJw1oJYaRpzrEFoVmpYziI+p4TomNx7aHs57ykOp9VY2ksUJPEx8a7K6WQ8mKwUtUDTZaRAsDg==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr7348476wri.322.1637853756387;
        Thu, 25 Nov 2021 07:22:36 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6a3f:a87f:f605:c96b])
        by smtp.gmail.com with ESMTPSA id
 g13sm3222243wmk.37.2021.11.25.07.22.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 07:22:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] gcc: Drop mips default ABI patch
Date: Thu, 25 Nov 2021 15:22:34 +0000
Message-Id: <20211125152234.129463-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
References: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 15:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158783

gcc-configure-common.inc already sets --with-abi=64 for our mips64
targets so this patch is no longer needed.

[YOCTO #14639]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
 .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  | 54 -------------------
 2 files changed, 55 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index b4e4300c66b..afb8f2df5c2 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -36,7 +36,6 @@ SRC_URI = "\
            file://0005-optional-libstdc.patch \
            file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
            file://0009-cpp-honor-sysroot.patch \
-           file://0010-MIPS64-Default-to-N64-ABI.patch \
            file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
            file://0012-gcc-Fix-argument-list-too-long-error.patch \
            file://0014-libtool.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
deleted file mode 100644
index f385f8c5a20..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From a2dc2fa4cc7e5d54544d4a7b6601eef79bc26cad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:23:08 +0400
-Subject: [PATCH] MIPS64: Default to N64 ABI
-
-MIPS64 defaults to n32 ABI, this patch makes it
-so that it defaults to N64 ABI
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Inappropriate [OE config specific]
----
- gcc/config.gcc | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/gcc/config.gcc b/gcc/config.gcc
-index 3ec7582f5dd..a046fa6945c 100644
---- a/gcc/config.gcc
-+++ b/gcc/config.gcc
-@@ -2543,29 +2543,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
- 			default_mips_arch=mips32
- 			;;
- 		mips64el-st-linux-gnu)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			tm_file="${tm_file} mips/st.h"
- 			tmake_file="${tmake_file} mips/t-st"
- 			enable_mips_multilibs="yes"
- 			;;
- 		mips64octeon*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			tm_defines="${tm_defines} MIPS_CPU_STRING_DEFAULT=\\\"octeon\\\""
- 			target_cpu_default=MASK_SOFT_FLOAT_ABI
- 			enable_mips_multilibs="yes"
- 			;;
- 		mipsisa64r6*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			default_mips_arch=mips64r6
- 			enable_mips_multilibs="yes"
- 			;;
- 		mipsisa64r2*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			default_mips_arch=mips64r2
- 			enable_mips_multilibs="yes"
- 			;;
- 		mips64*-*-linux* | mipsisa64*-*-linux*)
--			default_mips_abi=n32
-+			default_mips_abi=64
- 			enable_mips_multilibs="yes"
- 			;;
- 	esac
-- 
2.32.0


