Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EF7C41513
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 11:54:26 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.83603.1691927656283130505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 04:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PIknkEEf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.170, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so53330871fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691927654; x=1692532454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TU5UhFL1PchjNUkNJKlOcXkdXwCSDYhUrPWUjkb644=;
        b=PIknkEEfZWjHINiHBiaSldUTKGmDXq6DCYjKTdzaqGLYrE4ho6A5XQ5/26nhKzap/Q
         0Cifm03vbUWGU/ZXefK1+9d5EsqL2x8UjWnha2ei1KO8o7z0NoG6TR09YBq+t1ehN4+t
         hpmgLBIyn5MjTTW/MlM+FXRHkVgOab/YMy78g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691927654; x=1692532454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TU5UhFL1PchjNUkNJKlOcXkdXwCSDYhUrPWUjkb644=;
        b=fGQQQFR2Kd3F2dh0ultJaNfutK9RBX4GfLlERCwg6utrDLt1k07H4PuZs8ggtvAm5c
         ypp7S8WqZaCy7UXxJuyjOSnA6bSGO37q0D2pQmbtac0W6LC8dpW/LFASlNF+xhvyL7Th
         1sotxGJ2x/XnVrriwrh0M4rrBKmoSsy3g6txSgkDQym9JDrPMs6hOyyKojIRnaVsACLZ
         RRYdZfCW/p3LWriwA7kvrP4BCzCmAygx0EPsaWklT97kkBlHTzVLxurbuuTFv4B8Ho70
         x/OLMtK/Kq6i4k+YECHUDvQ0YubQWHZQyb1Z3ugk7TvxSv366bRCtDpG/D7qkszpvCfE
         KuAA==
X-Gm-Message-State: AOJu0Yw28nP2LYJAdHSeEdSjU//lfws+j0eGutxNOd5o0C/j5cpPY+v/
	PaF9ywCgACRqNY5bPfA4oXFUutmSrKSfrozYeEY=
X-Google-Smtp-Source: AGHT+IFjHx1dpSCJ+9Gq2ZTlXvX61Xhrm16fdkW4X61jMvywkV0H1reLSPbYnRxtCgqnzH2yXLSdKQ==
X-Received: by 2002:a2e:9bd4:0:b0:2b9:5b46:2107 with SMTP id w20-20020a2e9bd4000000b002b95b462107mr4863312ljj.9.1691927653718;
        Sun, 13 Aug 2023 04:54:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c7404000000b003fe1a092925sm10970082wmc.19.2023.08.13.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 04:54:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/8] mips/tune-mips64r2: Set qemu cpu option correctly
Date: Sun, 13 Aug 2023 12:54:06 +0100
Message-Id: <20230813115410.163212-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
References: <20230813115410.163212-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 11:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185876

Ensure the CPU enabled in QEMU is correct for this architecture.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/mips/tune-mips64r2.inc | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/conf/machine/include/mips/tune-mips64r2.inc b/meta/conf/machine/include/mips/tune-mips64r2.inc
index c644f409187..e9ca4201ffc 100644
--- a/meta/conf/machine/include/mips/tune-mips64r2.inc
+++ b/meta/conf/machine/include/mips/tune-mips64r2.inc
@@ -12,11 +12,13 @@ TUNE_FEATURES:tune-mips64r2 = "${TUNE_FEATURES:tune-mips64} mips64r2"
 BASE_LIB:tune-mips64r2 = "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2 = "mips64r2"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2 = "mips64 mips64r2"
+QEMU_EXTRAOPTIONS_mips64r2 = " -cpu MIPS64R2-generic"
 
 TUNE_FEATURES:tune-mips64r2el = "${TUNE_FEATURES:tune-mips64el} mips64r2"
 BASE_LIB:tune-mips64r2el = "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2el = "mips64r2el"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el = "mips64el mips64r2el"
+QEMU_EXTRAOPTIONS_mips64r2el = " -cpu MIPS64R2-generic"
 
 # MIPS 64r2 Soft Float
 AVAILTUNES += "mips64r2-nf mips64r2el-nf"
@@ -25,11 +27,13 @@ TUNE_FEATURES:tune-mips64r2-nf = "${TUNE_FEATURES:tune-mips64-nf} mips64r2"
 BASE_LIB:tune-mips64r2-nf = "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-nf = "mips64-nf mips64r2-nf"
+QEMU_EXTRAOPTIONS_mips64r2-nf = " -cpu MIPS64R2-generic"
 
 TUNE_FEATURES:tune-mips64r2el-nf = "${TUNE_FEATURES:tune-mips64el-nf} mips64r2"
 BASE_LIB:tune-mips64r2el-nf = "lib64"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-nf = "mips64el-nf mips64r2el-nf"
+QEMU_EXTRAOPTIONS_mips64r2el-nf = " -cpu MIPS64R2-generic"
 
 # MIPS 64r2 n32
 AVAILTUNES += "mips64r2-n32 mips64r2el-n32"
@@ -38,11 +42,13 @@ TUNE_FEATURES:tune-mips64r2-n32 = "${TUNE_FEATURES:tune-mips64-n32} mips64r2"
 BASE_LIB:tune-mips64r2-n32 = "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2-n32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-n32 = "mips64-n32 mips64r2-n32"
+QEMU_EXTRAOPTIONS_mips64r2-n32 = " -cpu MIPS64R2-generic"
 
 TUNE_FEATURES:tune-mips64r2el-n32 = "${TUNE_FEATURES:tune-mips64el-n32} mips64r2"
 BASE_LIB:tune-mips64r2el-n32 = "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-n32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-n32 = "mips64el-n32 mips64r2el-n32"
+QEMU_EXTRAOPTIONS_mips64r2el-n32 = " -cpu MIPS64R2-generic"
 
 # MIPS 64r2 n32 and Soft Float
 AVAILTUNES += "mips64r2-nf-n32 mips64r2el-nf-n32"
@@ -51,11 +57,13 @@ TUNE_FEATURES:tune-mips64r2-nf-n32 = "${TUNE_FEATURES:tune-mips64-nf-n32} mips64
 BASE_LIB:tune-mips64r2-nf-n32 = "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2-nf-n32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-nf-n32 = "mips64-nf-n32 mips64r2-nf-n32"
+QEMU_EXTRAOPTIONS_mips64r2-nf-n32 = " -cpu MIPS64R2-generic"
 
 TUNE_FEATURES:tune-mips64r2el-nf-n32 = "${TUNE_FEATURES:tune-mips64el-nf-n32} mips64r2"
 BASE_LIB:tune-mips64r2el-nf-n32 = "lib32"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-nf-n32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-nf-n32 = "mips64el-nf-n32 mips64r2el-nf-n32"
+QEMU_EXTRAOPTIONS_mips64r2el-nf-32 = " -cpu MIPS64R2-generic"
 
 # MIPS 64r2 o32
 AVAILTUNES += "mips64r2-o32 mips64r2el-o32"
@@ -64,11 +72,13 @@ TUNE_FEATURES:tune-mips64r2-o32 = "${TUNE_FEATURES:tune-mips64-o32} mips64r2"
 BASE_LIB:tune-mips64r2-o32 = "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2-o32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-o32 = "mips mips64-o32 mips64r2-o32"
+QEMU_EXTRAOPTIONS_mips64r2-o32 = " -cpu MIPS64R2-generic"
 
 TUNE_FEATURES:tune-mips64r2el-o32 = "${TUNE_FEATURES:tune-mips64el-o32} mips64r2"
 BASE_LIB:tune-mips64r2el-o32 = "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-o32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-o32 = "mipsel mips64el-o32 mips64r2el-o32"
+QEMU_EXTRAOPTIONS_mips64r2el-o32 = " -cpu MIPS64R2-generic"
 
 # MIPS 64r2 o32 and Soft Float
 AVAILTUNES += "mips64r2-nf-o32 mips64r2el-nf-o32"
@@ -77,8 +87,10 @@ TUNE_FEATURES:tune-mips64r2-nf-o32 = "${TUNE_FEATURES:tune-mips64-nf-o32} mips64
 BASE_LIB:tune-mips64r2-nf-o32 = "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2-nf-o32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2-nf-o32 = "mips-nf mips64r2-nf-o32"
+QEMU_EXTRAOPTIONS_mips64r2-nf-o32 = " -cpu MIPS64R2-generic"
 
 TUNE_FEATURES:tune-mips64r2el-nf-o32 = "${TUNE_FEATURES:tune-mips64el-nf-o32} mips64r2"
 BASE_LIB:tune-mips64r2el-nf-o32 = "lib"
 MIPSPKGSFX_VARIANT:tune-mips64r2el-nf-o32 = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS:tune-mips64r2el-nf-o32 = "mipsel-nf mips64r2el-nf-o32"
+QEMU_EXTRAOPTIONS_mips64r2el-nf-o32 = " -cpu MIPS64R2-generic"
-- 
2.39.2


