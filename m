Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D667FC61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:23:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7793.1787732628913230894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iRsZdp/7;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so5852235e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732627; x=1788337427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcAY5phukPhDG9j6gQXxCiC7402vHsTFsP0BZvHX64c=;
        b=iRsZdp/7zZppSVvOVHsFKgM9Ldhe4IZbFJieFqU774GodKmwNbMIbRY4IF7BOoUDfW
         IQXVqgUf1GcFvQGmtICurPJmVcIlTFKS8vFdYuVnBOgSgWipbco/miR6Nx3w0EZs+7UZ
         DiPatTaZHpf1d8YHUIJ5+4oRvtvabIgfPASdt/M85WhqAou9BLPP9rAvTGzcjqLU33uK
         tyyDp4s8qhjPsn69Owz+yX8YUb29l/GU1Y5OtEFt4YSn7NMs846JLTTdI01neHt4iSje
         wm+S3Y6s60qW5VdraJvbgIef8aEDhJXqcAR25M8sN8lXmhElmy4+qLBS0jpPxxC0qiqP
         hcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732627; x=1788337427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcAY5phukPhDG9j6gQXxCiC7402vHsTFsP0BZvHX64c=;
        b=ZN6ihK15KW0BvU9mv56Yj3zoI/oPl83anYNJ6FnFF3o3lh764RqebfmsMEYpBbVQg2
         lDUX8Vc7PBUxh4XdMI10/tPUCyVyYMQzHAxxBQS6L5mr5CxobZ8PN27k+rI2Vzuxxmr2
         akP9WlckAESxFOJcwC3pPhk+3CVmTu/ouDnu9BwhQVnF1IxaOgw2p4l6R40lUaGC9INQ
         bn5vUX5l3rnPfin8w+P8Vbe+CcTJ8jtSiVET5kr6l3LWJQVFGdbBlby2r7eHA+hNNR7T
         t3or+VyKsVlsyXTffkk2w87U+VMi8GqLxVJm3BmM4qlHwwpNJYTNjSHyOh2sFgssL8cM
         HV+g==
X-Gm-Message-State: AFuF++lFs9g83nCrcNnEy06xKMrGPg1jhfNSrajd49p7FOig6Oditm+2
	2lgqaW3kYfyXtw2U4NG4USxi7AxlC8k3iYCmhAKZm3snJbZ4Z4jvZqJfK59W66weUfE=
X-Gm-Gg: AR+sD13nnH2yNziZKVH5iqdk6pTWsJS1CkJiFwGVSkrAQftX2YYtuuw9fyGB0wKmUlk
	+3WqqKXyOxX048wsPD1SBS9kOZG9/juzphzNA8zqtjIaMzfQvJgo3fjPIJYzO5MmOXe0toM5NG3
	xullpfkNJVb//cO6tm4SeDCPpXdp1dH5H+eX8keRafYoGg/059NxdIlUik8CZes9/jcHOSgJxqF
	tEhAupPLGr9/9n3wxH1VhAp6iRQOT5lhlo4eM/2CYSKhPi3Y5J+QWEWQG/FVC5i/26w/TQ8uUTD
	d1III5cu5TQzHKA9qOj62idqf1mYmCgz/VzzLF92HqtFkeNGHDOARmKn+uMPKdbJKkqxFm5Uqkc
	UYDkxUOXfMaxbGrHyQZGw6Ni1OWjVshMwsPejqlWAyQPvyqIU94TvZPnda5EYMwJzFrVKh4k8jS
	3V7mWepP8DmlVl9s/SWnWMWww+H3X8mSOP6cBXg20ukAbyw2Oih8tiHpAG9FHu4elM2OIhxYaMF
	C+y/paBt1rZOyLKnjKA8O+/f8idf0+hg2VgkLzQGAnszdVIYibohqTK4YL4ldd3jbEL/eVBSUMy
	K8dI8NlHYZ8=
X-Received: by 2002:a05:600c:3f08:b0:499:d513:e507 with SMTP id 5b1f17b1804b1-499dc6efdf9mr43029595e9.2.1787732627020;
        Wed, 26 Aug 2026 01:23:47 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:f9af:e499:eded:1124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8b84esm17933655e9.1.2026.08.26.01.23.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 01:23:46 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	peter.kjellerstedt@axis.com,
	antonin.godard@bootlin.com,
	Anis Bougrine <anis.bougrine10@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][PATCH v6 2/5] kernel: re-sign kernel modules after package stripping process
Date: Wed, 26 Aug 2026 10:23:18 +0200
Message-ID: <20260826082321.22104-3-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260826082321.22104-1-anis.bougrine10@gmail.com>
References: <20260826082321.22104-1-anis.bougrine10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244361

Fixes [YOCTO #12927]

Currently, signed kernel modules are not stripped in order to preserve
their valid signatures. See commit 4c47e5f.

Therefore, this commit makes kernel modules stripped and correctly
signed. Two options are possible:

    - Strip the kernel modules after installation and before signing.
    - Re-sign the kernel modules after stripping and before package splitting.

The first option was rejected because debug symbols would be dropped early
in the build workflow, which may impact the SPDX process.

The second option is adopted because it does not impact the build flow.

Reported-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
---
 .../kernel-module-split.bbclass               | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
index bde7cd02dd..da7b30e99f 100644
--- a/meta/classes-recipe/kernel-module-split.bbclass
+++ b/meta/classes-recipe/kernel-module-split.bbclass
@@ -35,6 +35,11 @@ modprobedir ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${nonarch_b
 
 KERNEL_SPLIT_MODULES ?= "1"
 PACKAGESPLITFUNCS =+ "split_kernel_module_packages"
+# Order matters:
+# 1. Strip the modules
+# 2. Re-sign the modules (if enabled)
+# 3. Split the packages
+PACKAGESPLITFUNCS =+ "post_strip_kernel_modules_signing"
 
 KERNEL_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-modules"
 
@@ -63,6 +68,26 @@ def get_ext_mod(d):
 
     return d.getVar("S")
 
+# This function supports both in-tree and out-of-tree modules.
+post_strip_kernel_modules_signing(){
+    # Read .config values to determine if module auto-signing is enabled
+    is_modules="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULES)"
+    is_module_sig="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG)"
+    is_module_sig_all="$(${STAGING_KERNEL_DIR}/scripts/config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
+
+    if [ "$is_modules" = "y" ] && [ "$is_module_sig" = "y" ] && [ "$is_module_sig_all" = "y" ]; then
+        # Sign modules under ${PKGD}, with M= if out-of-tree module.
+        # Out-of-tree module Makefiles invoke the kernel Makefile by appending M= (the module directory) to MAKEFLAGS.
+        # However, they usually do not provide a modules_sign target. Therefore, the kernel modules_sign target has to
+        # be invoked manually after retrieving M= variable from package source code Makefile.
+        oe_runmake \
+            -C ${KBUILD_OUTPUT}  \
+            MODLIB=${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
+            ${@'M=${@get_ext_mod(d)}' if not "virtual/kernel" in d.getVar('PROVIDES') else ''} \
+            modules_sign
+    fi
+}
+
 python split_kernel_module_packages () {
     import re
 
-- 
2.50.1 (Apple Git-155)


