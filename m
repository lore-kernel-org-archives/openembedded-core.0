Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0E3C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 20:51:45 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.51.1707943899207976080
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 12:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9xx7XBV;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e1126f57f1so154499b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 12:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707943898; x=1708548698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jy4pnMITyqAPPRNbxVeb5TZgpID5frSaF6AV8yfSKug=;
        b=g9xx7XBVuUdQ80zXwuAE5zBOUwb2Jid7tLksMwytcimD2ZRb+7HegVRNNePyINCU3J
         gyXx6g6YQNWoGNKoKAQWz5y0ni53u7EJ23ajYiSZHY5+fkVD4QWhrAhrVdTVS1qbwy2H
         jXqc7ptZs2dX0TNy4qixHtJ8ZA6FOq+eQmPGbztqmgwjvVzOIq/dzpaOJeuAfujlb5wb
         53UhxO+ziPuj+G8OLFoAnnc5p+mm7qk88QqeyQer/3utQGJkNrT91TNNUGyfWBLlUe4l
         5VGsKMs7HuCx1Ehw5+nigPTqizAXgsdxcDxP0lWDO6CfNJDdeQl6XlHJr2WA2Pzf1yRm
         OC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707943898; x=1708548698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy4pnMITyqAPPRNbxVeb5TZgpID5frSaF6AV8yfSKug=;
        b=JdDF5mtoTDGonzeNqjD5abFkIBfDVOJgYwPCvSDw2ptJYItHcH6SlR32C2+VS5zfGs
         ib+1WGbUATaKsfujOQGg5rtxqDzEqDcmTctFJdsHgCBffQldjo/jMHywXzfz4Sj++kkJ
         4RU8igo2gWT5RMZr/2JmcWVrqeAAl3vZguksyjX3WO88VJ6Wk5gmmBJJkm29y873vKSx
         hS0/+FnVtQ8IRdS9uRBMxIhVn1zLoovF0w6qaLFxMNmgMbHMAxH6vWO0SvSDVyGuEeIS
         OJe9EkeHnPYKUTuh0EoDQVx2f70madIjsyR0DppBRYkp8f4/HsqIL4fjWp6BUzSdc2x1
         Udgw==
X-Gm-Message-State: AOJu0Ywhek3AirB57BRNlVNE0DngpGuSdSoHdkn/R8H5XWFGsTG0GHAq
	CFdmP354RpLhPl4ViydlJeAIoHhBpuFgMGo0KNVJFwJU5s2CWNR3m4FnPdQOTRA=
X-Google-Smtp-Source: AGHT+IHeX6Ahg6tdXVoYDyQ9C+MmoT0vnaTUXiFDXQBsg86juJrjLndw90ns5ubbDlL/csa+KcXa8w==
X-Received: by 2002:a17:903:2442:b0:1db:4b42:ce7f with SMTP id l2-20020a170903244200b001db4b42ce7fmr5078326pls.8.1707943898167;
        Wed, 14 Feb 2024 12:51:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b58c])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b001d916995423sm4150770pld.99.2024.02.14.12.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 12:51:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] llvm: Upgrade to LLVM-18 RC2
Date: Wed, 14 Feb 2024 12:47:34 -0800
Message-ID: <20240214205135.401454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 20:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195496

Final Release is coming in first week of March

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 9a88549260a..40103a94aea 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,17 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.6"
+# could be 'rcX' or 'git' or empty ( for release )
+VER_SUFFIX = ""
+
+PV = "18.1.0${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "6009708b4367171ccdbf4b5905cb6a803753fe18"
+SRCREV = "0d656f0f12d447ac0e197618a0d25495d66388d1"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
@@ -75,6 +78,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
                   -DLLVM_OPTIMIZED_TABLEGEN=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
+                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
                   -DCMAKE_BUILD_TYPE=Release \
                  "
-- 
2.43.1


