Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C7DC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:21:27 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.10988.1715858477146447985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MU1vI3dH;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59e4136010so318639966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858475; x=1716463275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPNcM1xdWejvI+BC1btAiA9YQq7o6vAKPdbz5T/xGJw=;
        b=MU1vI3dH5tjli0Bvnucw27r1+lHWa67tv7fpYCNTjJPx5wmJCdgLr2fW4MTMMD2l/3
         Zkw5IGm6OmsaZW4A11oVI9nYHvsxSjSIbHfWvQhOE5wF4gDkGadeFqQfOBwV7EbNPdPs
         o/VGOzWZ2i6l+lBzFhmROFq1cPvYFEuR7S4r0I1BJoUgp5towmONsW7DWuaToLbWDoWb
         AKiPT7elsfZdDhCdORyuGuJ3VqV2hk5MXKPDecuPgBvtHXjikyGbAIx87To+FFab7y5s
         4MTrj5W4J+w8xBNFgYs3njGz8QbsbcgXeUwjFkNr825Glx++eB4KzFfiD+dd+f7z0sKf
         ArNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858475; x=1716463275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPNcM1xdWejvI+BC1btAiA9YQq7o6vAKPdbz5T/xGJw=;
        b=IATDw8vdAtcSmGCOd9GtZURWG5JgEHweIwcPFnEwHJfOZtmyhjB19ZJ1HSqwbQSxru
         5Y4inaykgBoDWYtiJkdZmqpznm8Eyj52maRv6dOdqRmKuSLpb9FefKjfujxDjPyehDM7
         I3UGvGl9DOPcEDbnqo2cKrl2X1NMgivrp/0m3KB3txXagUQb4MAlia6eAczwhid2gFPE
         IiPlTHoBVT2gTJu8dw23qq2nvpFO19ft5GjxH547iwrioI7BWwYcfYcrMmprf5bBJbFm
         7vy8oNAd9jN/pNFd+drWuoR31X/CDibVeUiKqF13nEGYlf4oirA8KyeF1MlfDTn6RNjp
         ZO3w==
X-Gm-Message-State: AOJu0Ywm1EdAYK5inSGGjtbJk6G7QSo+cQbkblsJmrTY5i5j4hwsmROP
	OjHxK78YGJHWkoukSalYurr3SkIV18j+O9Jx/8wuM+dxVOoII47i7D0n+w==
X-Google-Smtp-Source: AGHT+IEWhGkGTEmNChySV268fB0WyDS6tYl0YWwvkXHYSwRevhPLUEjyODHEjmw9TymEd34Rf/6mAg==
X-Received: by 2002:a17:906:78b:b0:a59:ba2b:590e with SMTP id a640c23a62f3a-a5a2d65f27dmr1148967666b.48.1715858475402;
        Thu, 16 May 2024 04:21:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdcd149c5sm131254866b.201.2024.05.16.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:21:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] rust: use rust-snapshot binaries only in rust-native
Date: Thu, 16 May 2024 13:21:10 +0200
Message-Id: <20240516112111.2145436-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112111.2145436-1-alex.kanavin@gmail.com>
References: <20240516112111.2145436-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199465

From: Alexander Kanavin <alex@linutronix.de>

Otherwise, use rust-native and cargo-native binaries as that allows
our native tweaks in them to be used for target/nativesdk rust -
same as for everything else written in rust.

In particular, this allows building target rust with
cargo-native that includes important reproducibility tweaks.

Unfortunately, this also breaks rust selftest, and that
is partially addressed by the following commit.

[YOCTO #15185]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/rust_1.75.0.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
index 8ef838ee90c..e82a7395e44 100644
--- a/meta/recipes-devtools/rust/rust_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -11,6 +11,11 @@ DEPENDS += "file-native python3-native"
 DEPENDS:append:class-native = " rust-llvm-native"
 DEPENDS:append:class-nativesdk = " nativesdk-rust-llvm"
 
+# native rust uses cargo/rustc from binary snapshots to bootstrap
+# but everything else should use our native builds
+DEPENDS:append:class-target = " cargo-native rust-native"
+DEPENDS:append:class-nativesdk = " cargo-native rust-native"
+
 DEPENDS += "rust-llvm (=${PV})"
 
 RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
@@ -68,6 +73,11 @@ addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
+RUSTC_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/rustc"
+CARGO_BOOTSTRAP = "${STAGING_BINDIR_NATIVE}/cargo"
+RUSTC_BOOTSTRAP:class-native = "${WORKDIR}/rust-snapshot/bin/rustc"
+CARGO_BOOTSTRAP:class-native = "${WORKDIR}/rust-snapshot/bin/cargo"
+
 python do_configure() {
     import json
     import configparser
@@ -141,10 +151,10 @@ python do_configure() {
     config.set("build", "docs", e(False))
     config.set("build", "tools", ["rust-demangler",])
 
-    rustc = d.expand("${WORKDIR}/rust-snapshot/bin/rustc")
+    rustc = d.getVar('RUSTC_BOOTSTRAP')
     config.set("build", "rustc", e(rustc))
 
-    cargo = d.expand("${WORKDIR}/rust-snapshot/bin/cargo")
+    cargo = d.getVar('CARGO_BOOTSTRAP')
     config.set("build", "cargo", e(cargo))
 
     config.set("build", "vendor", e(True))
-- 
2.39.2


