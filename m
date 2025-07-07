Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE79BC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 12:58:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.59739.1751893103675980974
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 05:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EjVVqBcT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d3f72391so31462995e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751893101; x=1752497901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnbQuili6ISe+XYvyhB8lR/aev1PDyONNKV8wtNrZ+I=;
        b=EjVVqBcTMzdPHmHrDlz7xn6wcKcUMZzR4lLAhm5IzOTaQqdGCPU+4hUx7sIn3e09IM
         NmmV/3PbDieo3I/yScmHZ2mf4K8YYnEgjvTrVc5GrShRO+2DGnISx2W9syXySXKM1RbI
         utlTAfMDsbhulLYWsJ0ERQM7zm87xVlZZnENE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751893101; x=1752497901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnbQuili6ISe+XYvyhB8lR/aev1PDyONNKV8wtNrZ+I=;
        b=kkJqp4pa+C9Fxqu0DWv2ghN1834Dqd74IILC4qFtnry4qitBqqpabOMvjSnBAFbsK1
         3844pKB/c5ebIKjPRUVi0Ebtk1OY3bgxicqGaigP4Y8dHqCgdKqs261mEmvPrPGiI+cb
         ETiuGSB0DDzUIwH2AnnWHMlIJzZcUdACROnqgvjy6aMMv3Dkke5OqXyyc+0xpMsvNkGd
         YZ1ooxYFubcr24qVXUXF9Ft/H6WFBJM7lLiKyhF7kMz+LvMPLacPBbP/CU5T9iELYWlV
         P8nze6Fll+7s9R5eFrFicWw3KaUKdaqt2ST7mR2jmkTyASeU3TIDjWWMeikQz6A4VqlH
         LS7Q==
X-Gm-Message-State: AOJu0YzVluurQPu9mInOR0x0UrdbWamZXPUOz47Z/UrBW03GtNRfw1GG
	k6e8KfkI/UrFx9CUSIe/Zp2wwm7tkWH6H7F8g2y7kDXbc5k6xQPJNM68/m4pdzxFjUzB8Saicv5
	vtm0V
X-Gm-Gg: ASbGnctZaR75+bu7Ez++aRqBqbohnX9AKmUkXlmWV5lc+3r61sjDkYXKXfLpGX0LQjr
	9mMOE3wVvX1vdzIUcPn8k5yV9v4ob8D5FsOLaeUPMgFUIIXcfAL3AuBehlD5qJX4+j3sVyYhbda
	c8SlC8pAzdbWttJHyAesKBrajmcV/GFy8FY6+gpUMNhYtkSv/sQDp5dGJJtEdIDDZpt0rkTRvXH
	XPGt8CfBCBKKX8Hjbskhpfa3GZemyzIxLScC3SqMuyKKrxu1NTvnc4G5AlNxWcGJaCPtz9A0n7e
	m1LV8qSFVQsJBHPI427DIy4LL2q65fjH7ifo+jfiK0sjxp74vq7HTtf27Iv6tQaZElLUPk/kuzj
	iGeBnjdSGzqtWcw==
X-Google-Smtp-Source: AGHT+IFpn6BmvI066+CZWQdCLiZAe/i/fSScrjUcPJVVvRlnVO6QhCUP3VkjLqIeRdYjJWeysgHLQw==
X-Received: by 2002:a05:600c:3e1a:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-454b30aff3dmr142197455e9.15.1751893101383;
        Mon, 07 Jul 2025 05:58:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:522e:e734:aad7:114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454adc71aadsm129643435e9.25.2025.07.07.05.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 05:58:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libcxx: Work around native compiles for some gcc configs
Date: Mon,  7 Jul 2025 13:58:19 +0100
Message-ID: <20250707125819.4058560-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 12:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219990

Some systems can have mixed development headers, such as pieces of both gcc 13
and 14 which can cause build failures, particularly if libgcc and libstdc++ for
gcc 13 are present but only libgcc for gcc 14 and not libstdc++ when the gcc
version is gcc 13.

This patch forces clang to use the full toolchain rather than any partial incomplete
version. It is only necessary in the native case and should also be applicable to
compiler-rt in due source, hence making it an inc file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/clang/clang-native-opts.inc | 2 ++
 meta/recipes-devtools/clang/libcxx_git.bb         | 1 +
 2 files changed, 3 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang-native-opts.inc

diff --git a/meta/recipes-devtools/clang/clang-native-opts.inc b/meta/recipes-devtools/clang/clang-native-opts.inc
new file mode 100644
index 00000000000..f068e63933c
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-native-opts.inc
@@ -0,0 +1,2 @@
+BUILD_CFLAGS:append:class-native = " --gcc-install-dir=$(dirname $(gcc -print-libgcc-file-name))"
+BUILD_CXXFLAGS:append:class-native = " --gcc-install-dir=$(dirname $(gcc -print-libgcc-file-name))"
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index d355fc3a0f8..70511f02bd7 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -7,6 +7,7 @@ SECTION = "base"
 
 require common-clang.inc
 require common-source.inc
+require clang-native-opts.inc
 
 inherit cmake python3native
 

