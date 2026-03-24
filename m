Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F8BF54ADD
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 23:08:45 +0000 (UTC)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10517.1774393721534942697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 16:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CHAgZucy;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso331144eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 16:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774393720; x=1774998520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuapuRbOhf/dWmcGQaP6q7kfiMuGIPpBLdL0jEtcOF0=;
        b=CHAgZucyvRJ5biVx8jSUrkyxcnjMgjG5RULkIow/IjiSjLSMEnsK85nIVsJv1jRIil
         L60qD5GV5fRem86Kl0gtWwvfd5+JbpkiEffUCkhd0aPk77BvhSqffBJLWqgdkTc2KwQu
         hYo4VlFS1OrGCqMgdvTRRXZ8z30zf2acAKzyRrB0zmfKLJxSTZJO1qXk/onBhAj9OOVD
         MRWTH/0lTt2toas6MG39Ws1WOO3O+Or7vkhJ8sHBNIhR8NdFPMHl9XX/gR6fa933isAG
         hIzOerzjGOGexEmiYEfd8R7wbAL2yFfPt5NpLkFB/7dqxjm8wBpCkJw2bpyal++KWZeH
         xDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774393720; x=1774998520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iuapuRbOhf/dWmcGQaP6q7kfiMuGIPpBLdL0jEtcOF0=;
        b=hlfFwdo+a/czxUSNsKX/i7bEi9K9xRc6Ah+fQQs0so5kGhgRjJHMLlXuoSd6a8LQmy
         /qraNz/8KkM18phlK0l+JgwhZ4vYn2ttpP7gwfLkmvHVKe4MKCM3v70hpCfbrWk15LP+
         d1go9Itpyc2WVIKzKoCMstfpUVSG+LbTeox7ujKPjVqs/UT8gCz4pLctYAdqJqz8GyI0
         F7cYSPmP7MVpvYFGTelV+39hwAPC5wSumhe0fn8OgQinz9iD1TeSciFZwfYJTpTeq5UY
         vLA9si5gNdnVlTE3/69dPRzhhWaBlWR7RNMeBrwUmGQtI4WrjDCmH1t3EnRKqXu21r6f
         PpKA==
X-Gm-Message-State: AOJu0Yzia51EQzLKhdhEF9Sjz+gYunk4NNAQddWyiSgCvRqCF2WRDtMY
	1BHai/vK3dfeagKlUgmacOSq66X8WE+Io9e3vdHCEx5rS1LMrxYT0zlLGqp3tPOWSEg=
X-Gm-Gg: ATEYQzyaQNq8dW2YZLJUCYZkYaz5t2kCVr9py0n7kD9VeG+mllLX+7TUWgCCEfjie1D
	+eoxM7UvIHafcrbriG3rr/zQ2BppH6V7erBaKxeKYkZv2V7JQGdnQZqMP7v/KJioq7qudrHVnMf
	VsXxZfvF9U03EThPRwLuid9+rfb+h2Mf68Y+EAMJm2YrsL61+4TFdf5JupeNmhCwHgyy82sHrit
	UaYhLxI5rC+DPq0JJsLJj/sV0T7b9kKSg9L/2yrpt4I8796k8lkW76mTdscHVi+QyHXupZJFtM2
	ct+Nw8IcN5+QDJzkx0AnzkGfoFk5enRvn3sldeaGMxMYLZjKxgFMziKip3z5HfcNsTKuhborcEK
	y/xIScqaNjNGMDLHfV71CZb5Rxf9k6hzWaq8DyuLLTcvGdJXtliVOHvoKQVrrdpgvhmHhV4155d
	FJNd5foyOD5GarZY/dvrKp97TcFwLhDyu81AeecR+mS23w+iIaV2YVWU9BmB91QgpgNK3BZ0jS2
	1CJNjgB9DCNOYnPtQ7xVQjfmaYkANVgNYlNPxOF0+jlGb3RHshqkIkYlKiT
X-Received: by 2002:a05:7300:320b:b0:2be:171c:2180 with SMTP id 5a478bee46e88-2c15b9e4566mr962622eec.0.1774393720532;
        Tue, 24 Mar 2026 16:08:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm16235874eec.11.2026.03.24.16.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:08:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] spirv-llvm-translation: Upgrade to 22.0
Date: Tue, 24 Mar 2026 16:08:33 -0700
Message-ID: <20260324230835.2363568-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 23:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233831

From: Khem Raj <raj.khem@gmail.com>

major version of spirv translator should match clang major version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...anslator_21.1.5.bb => spirv-llvm-translator_22.0.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.5.bb => spirv-llvm-translator_22.0.0.bb} (75%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
similarity index 75%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
index a727079a43..20f4ba8464 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_22.0.0.bb
@@ -5,10 +5,10 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
-SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a76fd0702de564476fb31e8a15f1415f05ad8951"
+SPIRV_BRANCH = "main"
+SRCREV = "f821423888319dd2f0c436fc9ab86c798ac48ba1"
 SRC_URI = " \
-    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
+    git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH} \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
@@ -18,7 +18,7 @@ DEPENDS = "llvm spirv-tools spirv-headers"
 inherit cmake pkgconfig lib_package
 
 EXTRA_OECMAKE = "\
-    -DBASE_LLVM_VERSION='${@oe.utils.trim_version('${PV}', 3)}' \
+    -DBASE_LLVM_VERSION=22.1.0 \
     -DCMAKE_SKIP_BUILD_RPATH=ON \
     -DBUILD_SHARED_LIBS=ON \
     -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=${STAGING_INCDIR}/.. \

