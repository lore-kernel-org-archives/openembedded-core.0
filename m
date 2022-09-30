Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9897EC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:55:05 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.306.1664560498355713000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hwcau83i;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id x18so7982080wrm.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/iYMnH4adh839yRZSulyCFbtKRwz9Q31ald1NGkh3OI=;
        b=Hwcau83ibz1F7AowuzI/fSsP6dSQ8KRmuxNQ/JCTEjTgDifyUGcKKah7mzPETVXlnz
         fZG8IG3lOTNYUHBhyngXU3DBUQ62i+RiFIYv7ZcZKlFSrr/SUW3LZZMDBHoy5doWMvxE
         Qtiy7HJZreJQzkhSTKkEJhuVdJgH3teH28HNBajpp5D8LX6NsT5V0P3U+s39AYwD8EEH
         Z646ZNSleY3dTRSm3De0G3pwxwUYx/EEBAgo0yuqaQQejh/UGiPlN3sxotiSCJFvmM2I
         AfAlPp9VE9skwZAW8gpnkt9eXHL8QBgadh089u4RijmTc5zUf+SicYiyvFW6KcLkaoo2
         tsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/iYMnH4adh839yRZSulyCFbtKRwz9Q31ald1NGkh3OI=;
        b=lG4eG1WBAHUP406UYPWGPeWBgEMhQvR1KlXp/LB24VufKQFR6AmWaXxxN8f1DBC4Au
         lh4sjuhYkuP+08SUneFpHWYse0T7MGNGnE2o0q+q1lN2JTz7fXOxtJ0rIehvyX/ck8OW
         ZI/WduGWWyO4e2fIssiGvKCWmJhO11UPlJE/h6V3RJwyPmAf4YHYp+JpilwNaY2L9vnJ
         iMa0KG7uxii7dxWug9bX1Zc/O62ltUK/uXXdBprU8p8MY2Gn1ynqp9qzmcty0LYGxwO2
         Bz+h9Sng1A35TCSLYVxgwdGRTCVG85MBRz2LtKTQXkNp7/08PH4sZwWoyEEdpbgwCeR6
         lwLw==
X-Gm-Message-State: ACrzQf1vwsAYwg4/fjStFw2V853TnQsT7n2V3gvfEuMBUAwvHtkVcdtQ
	Ig+dSxq57YWjws0zt5YJNwM1924ZLzXU1XD7
X-Google-Smtp-Source: 
 AMsMyM4Uznvs58y9ajQIMW4g+/LrQHxjKAaqDhtiXvTyMXTo0240S1tNA3qEfOwD4you/wDodAEzOQ==
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr6543550wrj.626.1664560496414;
        Fri, 30 Sep 2022 10:54:56 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 y9-20020a05600c20c900b003a531c7aa66sm2636017wmm.1.2022.09.30.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 10:54:55 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH 1/3] go: drop patch to make content based hash generation less
 pedan
Date: Fri, 30 Sep 2022 17:54:38 +0000
Message-Id: <20220930175440.2168008-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:55:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171233

With patch in place I have see some build issues mainly in meta-virtualization
with ti am62xx-evm, am64xx-evm and riscv64 machines.

All the mahines fails to build the following recipes:

| Summary: 5 tasks failed:
|  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/runc/runc-opencontainers_git.bb:do_compile
|  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/skopeo/skopeo_git.bb:do_compile
|  /srv/oe/build/conf/../../layers/meta-lmp/meta-lmp-base/recipes-support/fioconfig/fioconfig_git.bb:do_compile
|  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/docker/docker-ce_git.bb:do_compile
|  /srv/oe/build/conf/../../layers/meta-virtualization/recipes-containers/containerd/containerd-opencontainers_git.bb:do_compile
| Summary: There were 8 ERROR messages, returning a non-zero exit code.

And all of them fails with the same issue:

| panic: runtime error: index out of range [0] with length 0
|
| goroutine 6688 [running]:
| cmd/go/internal/work.(*Builder).buildActionID(0xc0000030e0, 0xc000172a00)
| 	/srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:281 +0x2425
| cmd/go/internal/work.(*Builder).build(0xc0000030e0, {0xc000000238?, 0x0?}, 0xc000172a00)
| 	/srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:478 +0x199
| cmd/go/internal/work.(*Builder).Do.func2({0xb2e4f0, 0xc000000238}, 0xc000172a00)
| 	/srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:139 +0x5fc
| cmd/go/internal/work.(*Builder).Do.func3()
| 	/srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:201 +0xb9
| created by cmd/go/internal/work.(*Builder).Do
| 	/srv/oe/build/tmp-lmp/work/x86_64-linux/go-cross-riscv64/1.19-r0/recipe-sysroot-native/usr/lib/riscv64-lmp-linux/go/src/cmd/go/internal/work/exec.go:187 +0x3f5
| make: *** [Makefile:244: bin/containerd] Error 2
| make: *** Waiting for unfinished jobs....

Without this patch everithing look good.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/go-1.19.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.inc
index f733a807b4..355a82eb9f 100644
--- a/meta/recipes-devtools/go/go-1.19.inc
+++ b/meta/recipes-devtools/go/go-1.19.inc
@@ -5,7 +5,6 @@ FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
 SRC_URI += "\
-    file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
     file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
     file://0004-ld-add-soname-to-shareable-objects.patch \
     file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-- 
2.34.1


