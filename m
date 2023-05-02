Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BA6C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:42:18 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.1638.1683042129551158474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 08:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: otavio.salvador@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-38e27409542so2862364b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 08:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683042128; x=1685634128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rHKai/7Ga0/yuGdvoKrabABM6UZASZQuIYKVnc25WQ=;
        b=aYSRDJ5CW8g8k82Ps0BKFztw85jscAjLkYzgQNAo9Y8GLGKS7/OR8kzZBn86O0b9+Z
         +qR1HL8a9zfMNckAWiXcRPG+Lscp00/cbKaJyBAP5Byp/9Qy6UZImRj/Ka3TUNHJt0FP
         s02+Z5bG5M3o67F3sMTN22TrDo7vPBzdsNIqQxbICsuNCpc+PDGe1/WvcSgPPCGawKai
         TvZZpAP70S11SRzTm5oRu05jPkruofGZZDv0mxXirp5Rl+RMpBTo3f9G2oRg9QNk/P3m
         WBbqrDBL6+LMrJQU9ky6SF145DW+RKlclK0g9OY7y8NmXIhiSTJWr+ZkVcCiiDNz2/hB
         AFKQ==
X-Gm-Message-State: AC+VfDz1wZP1caF5G+fJWMbMjD2ZSsAAKcT+uxkAlWDK03C6OVRa6SNi
	o/O1FjNeddMQ5JKYBiPvqXVH/l23dyxZmA==
X-Google-Smtp-Source: ACHHUZ5TOJKoCOQ2N6IjTXoftHLnays3T71m2p3Z//VTIslwBpIzL4p7Lav7/48U53lQuOL9qilmuQ==
X-Received: by 2002:a54:408b:0:b0:38d:eaf6:d93a with SMTP id i11-20020a54408b000000b0038deaf6d93amr8845770oii.40.1683042128516;
        Tue, 02 May 2023 08:42:08 -0700 (PDT)
Received: from localhost (201-35-128-44.user3p.brasiltelecom.net.br. [201.35.128.44])
        by smtp.gmail.com with ESMTPSA id i25-20020a056808031900b0038bf8c6151fsm12569369oie.6.2023.05.02.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 08:42:07 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] glide: remove as 'go mod' has become standard
Date: Tue,  2 May 2023 12:42:02 -0300
Message-Id: <20230502154202.1771869-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180749

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes-recipe/glide.bbclass           | 15 -------
 meta/conf/distro/include/maintainers.inc    |  1 -
 meta/recipes-devtools/glide/glide_0.13.3.bb | 43 ---------------------
 3 files changed, 59 deletions(-)
 delete mode 100644 meta/classes-recipe/glide.bbclass
 delete mode 100644 meta/recipes-devtools/glide/glide_0.13.3.bb

diff --git a/meta/classes-recipe/glide.bbclass b/meta/classes-recipe/glide.bbclass
deleted file mode 100644
index 21b48fa4e0..0000000000
--- a/meta/classes-recipe/glide.bbclass
+++ /dev/null
@@ -1,15 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-# Handle Glide Vendor Package Management use
-#
-# Copyright 2018 (C) O.S. Systems Software LTDA.
-
-DEPENDS:append = " glide-native"
-
-do_compile:prepend() {
-    ( cd ${B}/src/${GO_IMPORT} && glide install )
-}
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdf..6902019f3a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -211,7 +211,6 @@ RECIPE_MAINTAINER:pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-tests = "Lukasz Majewski <lukma@denx.de>"
 RECIPE_MAINTAINER:pn-glibc-testsuite = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER:pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-gnome-desktop-testing = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
deleted file mode 100644
index db703c2d21..0000000000
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Vendor Package Management for Golang"
-HOMEPAGE = "https://github.com/Masterminds/glide"
-DESCRIPTION = "Glide is a Vendor Package Management for Golang"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc350c35b2"
-
-GO_IMPORT = "github.com/Masterminds/glide"
-SRC_URI = "git://${GO_IMPORT};branch=master;protocol=https"
-SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
-
-inherit go
-
-# New Go versions has Go modules support enabled by default and cause the Glide
-# tool build to fail.
-export GO111MODULE = "off"
-
-RDEPENDS:${PN}-dev += "bash"
-RDEPENDS:${PN}-ptest += "bash"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# for x86 ends with textrel in ${PN}
-# http://errors.yoctoproject.org/Errors/Details/185631/
-# ERROR: QA Issue: ELF binary '/work/i586-oe-linux/glide/0.13.1-r0/packages-split/glide/usr/bin/glide' has relocations in .text [textrel]
-INSANE_SKIP:${PN} += "textrel"
-
-# for aarch64 ends with textrel in ${PN}-ptest
-# http://errors.yoctoproject.org/Errors/Details/185633/
-# ERROR: QA Issue: ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/glide.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/dependency/dependency.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/repo/repo.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/mirrors/mirrors.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/cfg/cfg.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/godep/strip/strip.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/path/path.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/tree/tree.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/util/util.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/action/action.test' has relocations in .text
-# ELF binary '/work/aarch64-oe-linux/glide/0.13.1-r0/packages-split/glide-ptest/usr/lib/glide/ptest/github.com/Masterminds/glide/cache/cache.test' has relocations in .text [textrel]
-INSANE_SKIP:${PN}-ptest += "textrel"
-
-# fails to run task compile_ptest_base on mips
-PTEST_ENABLED:mipsarch = "0"
-- 
2.40.0


