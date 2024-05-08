Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E579C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 15:16:13 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.15317.1715181367115113046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 08:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=URzJuND5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6f4a817f1e5so664486b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715181366; x=1715786166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfUQq/AgjTi3Sne+yOmTjhkeZjD8XcZo5o8xvByrMtU=;
        b=URzJuND5riOlM2VHodN/zJCOQQ1RJQYmONCbmZWHW+5/ps5lHg+jzjVZhegab9GokC
         iUM5hzSWALcz5RIw/hY3nAdoQQRvelmEz4hbVI7GVRe5Czo/SU5KW2E4M+WgXUJKb9xX
         eB4GHeEZHrsHKJt6czq2k6oHcBHHPO9cTg0lUsI7I0Da2+Y9C68fwLzNXZ5NSQrmEDhk
         yu/n3ZZSNqlFrkcUbrB0h+E4Iv9PPiPnC/vKVPDYG+wvAN2yqOFHz8Q6KZ8mUzK9LOgC
         kKFB3SntaerbasytUG4gWccWrcniK0HftpM0loQmBo/mQo4TSDv4Z2fes8cQuT9MFL3D
         61/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715181366; x=1715786166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfUQq/AgjTi3Sne+yOmTjhkeZjD8XcZo5o8xvByrMtU=;
        b=hvQ1yP0DonWaMof+Gn4Kb+xogNurNa3TvCUwqGi6mvtvawVtDikpLW9iOCadVI3saP
         TE2KyAB9a18ZR/GrSRvOCGKv2szUnsS1JpkN0w6utT16nLyWBLXxEVCgKQPmr3h3ZoUx
         lSA2991lEdclTyei6xLXy4JIBhrODPYfKK9ZA0gsCqOXCwlgVQy4PhKHbtgI1DJOB2wA
         xvd9r6KF0TeOyKK9P5Grzy0gsoohVwSnoCMwowGM3yS5AtB1YXNVQ122BHn5P9cofHgP
         TDhJLjkytELse7XgA9ONEtPhKLnl+LuCmBdSWWEPuY9/CSYIcxYjtMTomI+PAw/VtNno
         imXw==
X-Gm-Message-State: AOJu0Yw1oJNY6p8h8ktjiHxi+8I4vhGddZ6cisup6+pfzeguv/xHNp2V
	7bIoPdJj+tzYuDKtl45RcIal6E0qyZSFQd+r7D0mIr5zdJvXtLWMOSU9vTlY
X-Google-Smtp-Source: AGHT+IFWBM5WAvTz4/YBPx86Qr5VyW5/9e+JViSYC98yiShiGX6alvkvSIPFpdjQqm5Rx76MHSLIZw==
X-Received: by 2002:aa7:8b44:0:b0:6ed:7684:484b with SMTP id d2e1a72fcca58-6f49c295075mr3244255b3a.27.1715181366236;
        Wed, 08 May 2024 08:16:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id n10-20020aa78a4a000000b006f260fb17e5sm11645543pfa.141.2024.05.08.08.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 08:16:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Switch to using release tarballs
Date: Wed,  8 May 2024 08:16:03 -0700
Message-ID: <20240508151603.2629233-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 15:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199123

git checkouts are in excess of 3G, which is not
ideal for everyone to download/clone, instead switch to
fetching release tarball which is ~126M as of 18.1.5 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../llvm/{llvm_git.bb => llvm_18.1.5.bb}            | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_git.bb => llvm_18.1.5.bb} (93%)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
similarity index 93%
rename from meta/recipes-devtools/llvm/llvm_git.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.5.bb
index 6413b041a8d..9c80b46b607 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.5.bb
@@ -13,27 +13,26 @@ DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
 RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
-
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
-PV = "18.1.5${VER_SUFFIX}"
+PV .= "${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
-BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "617a15a9eac96088ae5e9134248d8236e34b91b1"
-SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
+SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
+SRC_URI[sha256sum] = "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d019b67a57edd7de56"
 
-UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
+UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/git/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.45.0


