Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DEAC433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 11:04:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.19381.1652007883788120986
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 04:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p9gcB5q+;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dk23so21909992ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpdV3BaHt/Ogrxjq0yvXzzZ0HB2ot3VmT0qJNDtnbkY=;
        b=p9gcB5q+Lyluu57uCLWoA7gVdQenV5XKux158QrX42/zIr8kMXTiQfPUNEqe1LAonh
         wb2RdJ6eNFW2IFAG/oH47BOMrOz+AJcnLp7GPlIKzFGplU/y8vq2hWNX0b1Cdd1qyGoz
         jN0ZIVyE+Guythsy4x+MTeBzEWGHleOwrAzG7YDDaya2B7vlwyjZfrfA0IdeFO3Z9XYd
         1Ugr0lwmrue2p4mfQbfDJZsu/roW2MRMae/3VzyjzSXha+8NzoDRZn+G+MdZT4fM07K6
         DgMcymsp8nOpcyqYydbkJnJj3DrHtYXVmbAyr+5J9bkgwfvcSe5c4DswJdPBW8c5KgAG
         VwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KpdV3BaHt/Ogrxjq0yvXzzZ0HB2ot3VmT0qJNDtnbkY=;
        b=kWdVBTKC49SXZcrz5MPFcrNeWxe2vl0Dz2zqVP4P9OItNU3ecxIg74PBoQQ2hCYZmL
         f5ZZGGnRT0QSRp156ECoUp4FFPzCCzkW796c3+DEWaa7iChKqwgTHPpocshuZR9GqZvv
         mLfLQhRVJFyrN2h/AL3N0h0X/nt2yS9DnnUuoFw/niMK5w7uQMaI+1VYhLuuFuq7lo+1
         rGTGjw4x3AzKc7iQFnRhDKp5OiRoyI24hM4te/hPwbqtp/nFUVgQl8RxBH57j/+Y+hRR
         713TkFCOtjBq68x5SqrRbj9ePk5ncHatwFKeZyx7aDGTsQJBDgHUqV3Q67Q7h6LOY+QH
         DhgA==
X-Gm-Message-State: AOAM530wmuYbI9FJDlv05bKUx7MF8w6MPkmyaaDI1K+3xvlw6Uci3S1M
	JDQdtNGUzMBJHuJkn5XzuceszugdaQs=
X-Google-Smtp-Source: 
 ABdhPJxjN8hSMm71n5vgHpBMr2LU48ZpTJvPIzWvcNX6M/mhBumh8TqMnK14yIWWrVGO4LI1NXSBng==
X-Received: by 2002:a17:906:8585:b0:6f3:99f0:d061 with SMTP id
 v5-20020a170906858500b006f399f0d061mr10246137ejx.436.1652007881841;
        Sun, 08 May 2022 04:04:41 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch.
 [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id
 p9-20020a17090653c900b006f3ef214db0sm3955154ejo.22.2022.05.08.04.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 04:04:41 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][RFC Patch] Revert "kernel: make kernel-base recommend
 kernel-image, not depend"
Date: Sun,  8 May 2022 13:04:16 +0200
Message-Id: <20220508110416.51510-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 11:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165367

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit 1c90b27d2c65cfb4f9debf0272820b6a95942f76. [2]

To exclude the kernel image from the final rootfs the documentation [1]
suggest to override `RDEPENDS:${KERNEL_PACKAGE_NAME}-base`.
With the change to RRECOMMENDS all layers which followed that suggestion
now do get the kernel image as the override has no longer any effect.
(a affected machine: openembedded-core/meta/conf/machine/include/qemu.inc)

Is the use case described in the commit not solvable with less severe
side effects?

[1] https://docs.yoctoproject.org/singleindex.html#how-do-i-install-not-install-the-kernel-image-on-the-root-filesystem
[2] https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?h=master-next&id=1c90b27d2c65cfb4f9debf0272820b6a95942f76

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8299b394a7..25edf17e9e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -652,7 +652,7 @@ FILES:${KERNEL_PACKAGE_NAME}-modules = ""
 RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
 # Allow machines to override this dependency if kernel image files are
 # not wanted in images as standard
-RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image (= ${EXTENDPKGV})"
 PKG:${KERNEL_PACKAGE_NAME}-image = "${KERNEL_PACKAGE_NAME}-image-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-image += "${@oe.utils.conditional('KERNEL_IMAGETYPE', 'vmlinux', '${KERNEL_PACKAGE_NAME}-vmlinux (= ${EXTENDPKGV})', '', d)}"
 PKG:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_PACKAGE_NAME}-${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
-- 
2.20.1


