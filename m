Return-Path: <ines.kchelfi@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6853EC3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 10:17:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.46825.1746440233139470714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 03:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sc6m2xsf;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: ines.kchelfi@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so17404655e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 03:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1746440231; x=1747045031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xBCqmn0VVTcggoZEBfeyGQO4gzj8pBVWRRMG9lp4go=;
        b=sc6m2xsf8GcUHo/IPccKyHlxbJQahnilEY433WIEgTbwdPskgFXMLpgHryeux9YJhI
         blkiDqWPXWlxj1Eh4iL/o3elzfP+pFPlHvlddNJAO3Tj360CDmPc9MpCW30PK21/ko5y
         PtrU3AOC1aRfF0v+o/x5mWPRx/kSKDi2wkeKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746440231; x=1747045031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xBCqmn0VVTcggoZEBfeyGQO4gzj8pBVWRRMG9lp4go=;
        b=XqtM0bgxCanmsJ0SszDHTolBU1rSSVw/eQbHNhzRv7phTl/xD59QWtEmQb4poIAqQ5
         +kG3xIxUQ5CCMAMZ9IpOeHJhoW3exoHaJi5c17NpcB0EpHs0z3YP0kG4nC2vkybKWWg9
         66iGagbMNZIEn2JkyJ3zR0dlrBjePny+2GNpRNl+9bTwnIOkAWalakBwCl9+EmpTaBNi
         mHc8n6Z+Q63hiw1rEtUAQn3W+jXhSAw07aiujVlLoiaIhQWJtd7mEwQ19qOeMj+PsucK
         jelLJ6HMWnZCDrWH1gUkIQ9BJfVh5flxYjp9laKHOi6oZpqnh3wWN6v5WAGvbx1IjCVy
         temg==
X-Gm-Message-State: AOJu0Yzm2/C0K68WJ49wkNSJwac0+vgsUmCrY+hPRXfWc2ObJkw4/8Zf
	3Ud4nKgFHwAr4CSzTItICY9aSRVCSb8B++TSz0sCJ4wrEOnTzeWethVU2Gye79R+pL5Hieo3IP7
	d
X-Gm-Gg: ASbGncs95iOPDirB+VYVcUYeyVPeC7mg4OGS6giqHuiPpPyL0Y5C4zEHalYgju9pHX7
	BRk+r+pVcl/hqMNmkYm/eqZ2ZS6qOU/VaGevnHAmofkDlxJr8HT7egEYODep3+QTV/v3xaFnVsg
	j5pd6sy1/k/qDAmfN+14lsPCF66BFvWF+7S16kohXxmf0PMtS932VOEdOG5hAiA6PlQ03W8vzPn
	MdQH31366/KePgCNx8ewf3/3w3jOpRwxIJ+kGiiW17jP7/eyQhlYJ8jsVctw60DESOJE9MlG04Q
	TGXtZXuQgQxy3kO3kIrS2HD1bSKNmDLg4ajlnN8UXGIcdIPRBc4QSnBomaY+GJHYG1mSJ/1asky
	T1iKDw/3D6oHns+YgkkXTFqoLhpwgPldal5Ylz9xMzMfX+jVkjThODP2anw==
X-Google-Smtp-Source: AGHT+IHLP/wsYtKmI8o2xeHedK58URUwptPWpFntvqZ2vp/EEkU827Z5JBkQ1zbNDxllz+1fpPgNfw==
X-Received: by 2002:a05:600c:384d:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-441c1cc4764mr73549995e9.2.1746440231336;
        Mon, 05 May 2025 03:17:11 -0700 (PDT)
Received: from FRSMI24-WIZAR.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b276052bsm174832725e9.0.2025.05.05.03.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 03:17:11 -0700 (PDT)
From: ines.kchelfi@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Ines KCHELFI <ines.kchelfi@smile.fr>
Subject: [PATCH] rpm-sequoia: add ptest
Date: Mon,  5 May 2025 12:16:43 +0200
Message-ID: <20250505101642.9255-2-ines.kchelfi@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 10:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216003

From: Ines KCHELFI <ines.kchelfi@smile.fr>

In rpm-sequoia, some default paths in test code (OUT_DIR,
CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.

To fix this, patch the test code (symbols.rs) to support overriding these
paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and
FORCE_RUNTIME_PATH_SRC.

Also patch the libray name to match what is installed.

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
 .../distro/include/ptest-packagelists.inc     |  1 +
 ...-librpm_sequoia.so.1-instead-of-libr.patch | 29 +++++++++++++++
 ...-vars-to-force-runtime-paths-in-test.patch | 35 +++++++++++++++++++
 .../rpm-sequoia/rpm-sequoia_1.7.0.bb          | 23 ++++++++++--
 4 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/files/0001-Force-the-use-of-librpm_sequoia.so.1-instead-of-libr.patch
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
diff --git a/meta/recipes-devtools/rpm-sequoia/files/0001-Force-the-use-of-librpm_sequoia.so.1-instead-of-libr.patch b/meta/recipes-devtools/rpm-sequoia/files/0001-Force-the-use-of-librpm_sequoia.so.1-instead-of-libr.patch
new file mode 100644
index 0000000000..bfe3860bfc
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/files/0001-Force-the-use-of-librpm_sequoia.so.1-instead-of-libr.patch
@@ -0,0 +1,29 @@
+From 07c738e8731cb658a15c19e0afa023333da4b431 Mon Sep 17 00:00:00 2001
+From: Ines KCHELFI <ines.kchelfi@smile.fr>
+Date: Thu, 10 Apr 2025 16:03:24 +0200
+Subject: [PATCH] Force the use of librpm_sequoia.so.1 instead of librpm_sequoia.so
+
+Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
+Upstream-Status: Inappropriate [configuration specific to Yocto]
+---
+ tests/symbols.rs | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/symbols.rs b/tests/symbols.rs
+index dc4a42c..9f7b89c 100644
+--- a/tests/symbols.rs
++++ b/tests/symbols.rs
+@@ -19,12 +19,12 @@ fn symbols() -> anyhow::Result<()> {
+     let mut build_dir = out_dir;
+     let lib = loop {
+         let mut lib = build_dir.clone();
+-        lib.push("librpm_sequoia.so");
++        lib.push("librpm_sequoia.so.1");
+         if lib.exists() {
+             break lib;
+         }
+         if ! build_dir.pop() {
+-            panic!("Failed to find librpm_sequoia.so");
++            panic!("Failed to find librpm_sequoia.so.1");
+         }
+     };
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
index 57062b100a..24d5f4b38f 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
@@ -10,9 +10,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0ff5ff7747cf7d394079c6ae87f5f0c"
 
 DEPENDS = "openssl"
 
-inherit pkgconfig rust cargo cargo-update-recipe-crates
+inherit pkgconfig rust cargo cargo-update-recipe-crates ptest-cargo
+
+SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main \
+	file://0001-Use-optional-env-vars-to-force-runtime-paths-in-test.patch \
+	file://0001-Force-the-use-of-librpm_sequoia.so.1-instead-of-libr.patch \
+"
 
-SRC_URI = "git://github.com/rpm-software-management/rpm-sequoia.git;protocol=https;branch=main"
 
 SRCREV = "0667e04ae7fb8cf0490919978d69883d16400e41"
 
@@ -41,6 +45,13 @@ do_compile:prepend () {
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
@@ -54,6 +65,14 @@ do_install:append () {
 	install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfig
 }
 
+do_install_ptest:append () {
+	install -d ${D}${PTEST_PATH}/src
+	install -m 644 ${S}/src/symbols.txt ${D}${PTEST_PATH}/src/symbols.txt
+}
+
+# Tests need objdump
+RDEPENDS:${PN}-ptest += "binutils"
+
 RDEPENDS:${PN} = "rpm-sequoia-crypto-policy"
 PACKAGE_WRITE_DEPS += "rpm-sequoia-crypto-policy-native"
 
-- 
2.43.0


