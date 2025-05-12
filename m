Return-Path: <ines.kchelfi@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA77BC3ABCB
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 14:46:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.52289.1747061160368562209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 07:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fFs6klqY;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf680d351so32684775e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1747061159; x=1747665959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9q4U6bQ28XIbvf/Jk7rUFUdwNPqm6Dk0HeflKgkKjAg=;
        b=fFs6klqYRJpORMMkYsIwAFxCpBguaZvZtp6Is3liV6+mCX8j9b7KM7oF1WjZ2YrsA8
         VHzXhGMsC+BF39CsyNWwKzQVdpcyrF7W112/JMIXUKVcvk0kj1hocFY73vwYJfJ/Ulm3
         Bn3LX4kQousEbyZoOiMiKfapZes2Qt5p0cmeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061159; x=1747665959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9q4U6bQ28XIbvf/Jk7rUFUdwNPqm6Dk0HeflKgkKjAg=;
        b=t+fId7Kb13n+1ERuvRY8tNUIYJgVdQG1iWDM4NPT6lvQGE0uKpo5ujluSJLXInaMuN
         aU8yUivqt3F+s+pQWTZP7yPPbaUNeQatDf5tnyg7hhqb8y2YwOSc+eeU2x/yHv0UokQh
         +ClbskDi7fAjjZqGR8NlQNvmeCKNRK9wIAZJ8CLwl8QGjNaYs/7SO1vKxVPsyHW5rlHZ
         kEbSx2dvFrebiyCzUk/eOsVsKN+Ow99EMMQfaA3hZr3kL+xr4apF4USp3ubTyZFypWDN
         y/Myw2sux07GtCLV33Wlf0pjWXl/O0F8u+P1GbZjs7v6nkjrHraFQR/nR+pM35i5Ybmj
         WTnA==
X-Gm-Message-State: AOJu0YxwELghoqrcqq743nZWuoBAcP1x+zbBC7ppwZYtSZxktPHSvLnH
	+eFaCDtdO0FypHRDJMZZ4+wpw/pXPOhbIdEjvXSIZ1KOKtdj6xqZgODwc5CjPM40nFryI5fc8XP
	9
X-Gm-Gg: ASbGnctK/clJ3ukpUaeIm3iqkC5RJd1OfMGfPJaB0by9kJjzrKH2PidyFTn6nXNvsS4
	y0qshf+ko1Dsh2OE2f993DT7xIuGdnAXG4eNettuyBeSLu63b68HHlwxiKWYqQrhdeM+4UcoIT+
	rtvVEK7dSzzcDOBjgz1cJTnLqRX3suJUAUnmu5TKZeYfC86UlTwezaS4YXDjDrhht/NFucMt9bI
	vMLYkVCiBgG2/mOUUrEWE4NYz0bZm7bAgrPvGrHi2H5rXOR6g+b25Ws3tK7hSuFRH4CxgP4gxJ+
	K07jPwKne19buByFW7/gRx5JYljQdp6NQjUuFHc8vn36iluvZX/lxTJGUIXGYH3W5576Crj/SKG
	a6QnqGVeZO+L7O3kBNOJJZWXpJhg/I1OpoypBEu4hfnmLaGnpzJJo/tW4uQ==
X-Google-Smtp-Source: AGHT+IHR8F9ZIusTVEfQCXrxBdcHBzuHRiVrsD3Xzfbjc7oacXTOHmpqJ/Ji32FZirwjoDFDGs7q2Q==
X-Received: by 2002:a05:6000:4205:b0:3a0:b735:2ee6 with SMTP id ffacd0b85a97d-3a1f6c9c3a9mr11101143f8f.20.1747061158547;
        Mon, 12 May 2025 07:45:58 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d30asm12615170f8f.76.2025.05.12.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:45:58 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Ines KCHELFI <ines.kchelfi@smile.fr>
Subject: [PATCH v2 1/2] rpm-sequoia: add ptest
Date: Mon, 12 May 2025 16:44:09 +0200
Message-ID: <20250512144409.244102-2-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 14:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216372

From: Ines KCHELFI <ines.kchelfi@smile.fr>

In rpm-sequoia, some default paths in test code (OUT_DIR,
CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.

To fix this, patch the test code (symbols.rs) to support overriding these
paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and
FORCE_RUNTIME_PATH_SRC.

Also make -ptest package RDEPEND on -dev package.

Tests take less than a second so this is added to PTEST_FAST.

ptest result:
|root@qemux86-64:~# ptest-runner rpm-sequoia
|START: ptest-runner
|2025-05-02T15:57
|BEGIN: /usr/lib/rpm-sequoia/ptest
|
|running 1 test
|test symbols ... ok
|
|test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
|
|
|running 2 tests
|test tests::merge_certs_mismatch ... ok
|test tests::merge_certs ... ok
|
|test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s
|
|DURATION: 0
|END: /usr/lib/rpm-sequoia/ptest
|2025-05-02T15:57
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
---
v1 -> v2 : Depends on -dev package instead of custom patch
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...-vars-to-force-runtime-paths-in-test.patch | 35 +++++++++++++++++++
 .../rpm-sequoia/rpm-sequoia_1.7.0.bb          | 26 ++++++++++++--
 3 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf6..7ae882400d 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -80,6 +80,7 @@ PTESTS_FAST = "\
     python3-webcolors \
     qemu \
     quilt \
+    rpm-sequoia \
     sed \
     slang \
     wayland \
diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
new file mode 100644
index 0000000000..d0179fc53c
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch
@@ -0,0 +1,35 @@
+From 590937523deea4ad2a2ee0e1ae4412a8f59e0170 Mon Sep 17 00:00:00 2001
+From: Ines KCHELFI <ines.kchelfi@smile.fr>
+Date: Thu, 10 Apr 2025 15:14:11 +0200
+Subject: [PATCH] Use optional env vars to force runtime paths in tests
+
+Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm-sequoia/pull/86]
+---
+ tests/symbols.rs | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tests/symbols.rs b/tests/symbols.rs
+index c16dd9b..dc4a42c 100644
+--- a/tests/symbols.rs
++++ b/tests/symbols.rs
+@@ -14,7 +14,8 @@ fn symbols() -> anyhow::Result<()> {
+     // OUT_DIR gives us
+     // `/tmp/rpm-sequoia/debug/build/rpm-sequoia-HASH/out`.
+ 
+-    let out_dir = PathBuf::from(env!("OUT_DIR"));
++    let out_dir = PathBuf::from(option_env!("FORCE_RUNTIME_PATH_LIB")
++        .unwrap_or(env!("OUT_DIR")));
+     let mut build_dir = out_dir;
+     let lib = loop {
+         let mut lib = build_dir.clone();
+@@ -53,7 +54,8 @@ fn symbols() -> anyhow::Result<()> {
+     }
+ 
+     let mut expected_symbols_txt_fn
+-        = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
++    = PathBuf::from(option_env!("FORCE_RUNTIME_PATH_SRC")
++        .unwrap_or(env!("CARGO_MANIFEST_DIR")));
+     expected_symbols_txt_fn.push("src/symbols.txt");
+ 
+     let mut expected_symbols_txt = Vec::new();
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
index 57062b100a..6ef626e466 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
@@ -10,9 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
 
 DEPENDS = "openssl"
 
-inherit pkgconfig rust cargo cargo-update-recipe-crates
+inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo
+
+SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main \
+	file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
+"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main"
 
 SRCREV = "0667e04ae7fb8cf0490919978d69883d16400e41"
 
@@ -41,6 +44,13 @@ do_compile:prepend () {
 	export LIBDIR="${libdir}"
 }
 
+# By default, ptest binaries contain host build dir paths.
+# Use custom environment variables to force these paths to match the target instead.
+do_compile_ptest_cargo:prepend() {
+    os.environ["FORCE_RUNTIME_PATH_LIB"] = d.getVar("libdir")
+    os.environ["FORCE_RUNTIME_PATH_SRC"] = d.getVar("PTEST_PATH")
+}
+
 do_install:append () {
 	# Move the library to the correct location expected by rpm-sequoia.pc
 	mkdir -p ${D}${libdir}
@@ -54,6 +64,18 @@ do_install:append () {
 	install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfig
 }
 
+do_install_ptest:append () {
+	install -d ${D}${PTEST_PATH}/src
+	install -m 644 ${S}/src/symbols.txt ${D}${PTEST_PATH}/src/symbols.txt
+}
+
+# Tests need objdump
+# ptest requires a symlinked library that is only present in the -dev package,
+# so we add the -dev to runtime dependencies.
+# The "dev-deps" QA check is skipped to avoid warnings about this dev package dependency.
+RDEPENDS:${PN}-ptest += "binutils ${PN}-dev"
+INSANE_SKIP:${PN}-ptest += "dev-deps"
+
 RDEPENDS:${PN} = "rpm-sequoia-crypto-policy"
 PACKAGE_WRITE_DEPS += "rpm-sequoia-crypto-policy-native"
 
-- 
2.43.0


