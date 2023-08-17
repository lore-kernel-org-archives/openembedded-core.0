Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F05C2FC04
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 05:04:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.180178.1692248670910640340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 22:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FoS2sFh3;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fe4762173bso11895262e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692248669; x=1692853469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQqU9jZrbeMi8wg0xYguMFEKyVKXTha3tXRrbOd2B+8=;
        b=FoS2sFh3SGaiTE2Juv599NWuvIAYZUrtwQe+O/MsxdvlfeBPFdg8x32FdQJ/PaMLTH
         8R26XWZ9pSoNVP6Sn/9Ibv2XW9tYfWJBZGV14ejWNY/fIdsM8W+DUP8xcTEy6XVEirbU
         S3drsSsQ1sXVaBgdLSTzcn1F6ILaCUifioe5ms6ke/Zr4KdCRak+8svYw2tTuVG6WCZC
         Hx+jjgs0YkFCNomIlA+vSrjeSODYqa+5D/PsmrwIfyuRC9pLM4Ts9LwDihUPp2iwDOWq
         ih/NdryHSUxNrbM4kvslQo2o20llOxp41EkWAbfgwzm/q488pDWPGnKCQCnBxs5YlDC5
         pRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692248669; x=1692853469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQqU9jZrbeMi8wg0xYguMFEKyVKXTha3tXRrbOd2B+8=;
        b=GUEvS+Qe4zeMq3ZsGUygvywHE34XY87tVHMrAnb9/ociLtzDXC2O78DeNMXlMtima8
         jPf+A0uZdrL4xT0NZFK3VyGIe7B1rjhlRCahrJFUi399TMpkhj73kNEoYzV4qFYq9Ovy
         7zjrkK3ab2vYc7+tVZs0nTvcO4V0Q4IgJ+3ksdRBaZLyhAri/SrBu1tGzpgLGq0OQ1SV
         Z91g4VTV5rN3Rk/scCjpp23H8uGuPYNFunQsk1QiPJA1zB+AOe97EWefhCdFfAO9ZhBu
         UV/e/igKGP1CgABqkCNaqDI+WP/oyZuV+sIjbKXHcysMrg82Ml5HU2se1nkHvF/iBH1P
         pQWA==
X-Gm-Message-State: AOJu0YzNDBHhcRQTIzvn2xE61qAg3TckPsC9vCdCl0ZsiH1vL4T8IT+n
	KJzXJHD2nYrBmCkk4y6z+EU0tK0BFvg=
X-Google-Smtp-Source: AGHT+IEqD5FpVOC1tqLlS6KgSIY15x2JxzDh6Jpdhr7tA4+cLr7c7dSS5y5nj+zP0TB8p/JY0gW6pA==
X-Received: by 2002:a05:6512:282:b0:4ff:7ecb:a810 with SMTP id j2-20020a056512028200b004ff7ecba810mr2876094lfp.33.1692248668648;
        Wed, 16 Aug 2023 22:04:28 -0700 (PDT)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:67b0:818b:2f62:9f02])
        by smtp.gmail.com with ESMTPSA id s17-20020a7bc391000000b003fd2e89620asm1503040wmj.40.2023.08.16.22.04.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 22:04:27 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATHCH V6 2/4] classes-recipe: add cargo_c.bbclass
Date: Thu, 17 Aug 2023 07:04:14 +0200
Message-Id: <a16c71354e3c2aef86028659453970bc09256ae5.1692248342.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692248342.git.frederic.martinsons@gmail.com>
References: <cover.1692248342.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 05:04:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186284

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This class can be used inside rust recipe to generate
a rust library that can be called by C/C++ code.

The rust recipe which uses this class has to only replace
"inherit cargo" by "inherit cargo_c".

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/cargo_c.bbclass | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/classes-recipe/cargo_c.bbclass

diff --git a/meta/classes-recipe/cargo_c.bbclass b/meta/classes-recipe/cargo_c.bbclass
new file mode 100644
index 0000000000..ef431634a2
--- /dev/null
+++ b/meta/classes-recipe/cargo_c.bbclass
@@ -0,0 +1,41 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+##
+## Purpose:
+## This class is used by any recipes that want to compile a C ABI compatible
+## library with header and pkg config file
+
+inherit cargo pkgconfig
+
+# the binaries we will use
+CARGO_C_BUILD = "cargo-cbuild"
+CARGO_C_INSTALL = "cargo-cinstall"
+
+# We need cargo-c to compile for the target
+BASEDEPENDS:append = " cargo-c-native"
+
+do_compile[progress] = "outof:\s+(\d+)/(\d+)"
+cargo_c_do_compile() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "Using rust targets from ${RUST_TARGET_PATH}"
+    bbnote "cargo-cbuild = $(which ${CARGO_C_BUILD})"
+    bbnote "${CARGO_C_BUILD} cbuild ${CARGO_BUILD_FLAGS}"
+    "${CARGO_C_BUILD}" cbuild ${CARGO_BUILD_FLAGS}
+}
+
+cargo_c_do_install() {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "cargo-cinstall = $(which ${CARGO_C_INSTALL})"
+    "${CARGO_C_INSTALL}" cinstall ${CARGO_BUILD_FLAGS} \
+        --destdir ${D} \
+        --prefix ${prefix} \
+        --library-type cdylib
+}
+
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.34.1


