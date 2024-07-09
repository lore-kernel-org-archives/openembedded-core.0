Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FD4C3DA45
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4578.1720553414494012761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E8SveTEc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-701b0b0be38so4276341b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553414; x=1721158214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oW27BesJt0aiUEYKOEanofyUyEqJub/i/2kdI0NCotc=;
        b=E8SveTEcUex/uLNwwVrY4m4l0L/MPgY62QTRsc9Z64DOhpAFpOxjk0mbTwFyutq0m3
         RnzJMIqOsfyUtb4SuJBIC3tICnHjw2i4T3PwJXI2gf15lTgwVuNv1JnaR7JogUz0Q+lX
         h5hQ1cAdM2HKatXJutf8zR4J0kaONaj8ynDP1XhoRkhSoGnqxcUPqmR3YGi4Wzvl//UB
         kpAi3lrDXhiwX6K4eHp/4ZPc0151IUzeVN1PRGRbUacpKjgG3UFtmviphZ9Hb5OTiU7W
         A4WgoNbsYKvr+ulSMlUQHxgs05fGfxuCsG27Cxa2nKUwJS5E64tjvyh05ho9jWM/A+nV
         pRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553414; x=1721158214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oW27BesJt0aiUEYKOEanofyUyEqJub/i/2kdI0NCotc=;
        b=b10100puUUtPWMnSUGoThVktlAM+Tb+lVKzX5JDuaLmK3iI92TcOj/H+Ur8aC4Pj8g
         P5yb/apI3+kT5tU4JILPgbOr1I509AG/u/GOAmYVCyAdISi4SQ3bhQEz9v2MuvUzr0Yu
         b14jzgRlo+jz5Jnz99Uu3auyh5nwXtKOYQ0CbPzvAKmB3RmLB7fkxpAnrJeNJkPBlnRW
         ti5YQAx1kwozUV+oH9zjozeA+5eXc1+Jg6svw/9xqMIRbqVaDuNZ77+G9nOhG/KpngPR
         bImJ2I65XvngHaJSO1c/GGads8A9tKUTxWcYmcJv+6q8C9uMpeZg+2Xdtys6EjFgmmn2
         mo4g==
X-Gm-Message-State: AOJu0Yz7CzepNwG6BMp3Uac1BfmWgpwHVm5UUJmoi4vxpNMdeLH0JRDk
	ufQnT11CaFSp94A+5yRggWKr+E//uW3dDz035EG4DhOJShmJN+Bxtdky9T/NRCsF//KJB5ZRUgr
	g
X-Google-Smtp-Source: AGHT+IHPMnwZDkxyQH41hXFl4FN5VgrE+gp4ch0Ceab+HspXdyBpJn/DEko3C9nnSfRE4IiqohBeQQ==
X-Received: by 2002:a05:6a00:1894:b0:704:24fb:11c6 with SMTP id d2e1a72fcca58-70b43543549mr4493928b3a.12.1720553413689;
        Tue, 09 Jul 2024 12:30:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/7] cargo: remove True option to getVar calls
Date: Tue,  9 Jul 2024 12:29:59 -0700
Message-Id: <f419d57e9605dc5430df6828c4b618265db1243f.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720553275.git.steve@sakoman.com>
References: <cover.1720553275.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201679

From: Peter Marko <peter.marko@siemens.com>

Layer cleanup similar to
https://git.openembedded.org/openembedded-core/commit/?id=26c74fd10614582e177437608908eb43688ab510

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a2ed52473a3e4eb662509824ef8e59520ebdefb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/cargo_common.bbclass |  4 ++--
 meta/classes-recipe/ptest-cargo.bbclass  | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 0fb443edbd..19c497b8d6 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -41,7 +41,7 @@ CARGO_SRC_DIR ??= ""
 CARGO_MANIFEST_PATH ??= "${S}/${CARGO_SRC_DIR}/Cargo.toml"
 
 # Path to Cargo.lock
-CARGO_LOCK_PATH ??= "${@ os.path.join(os.path.dirname(d.getVar('CARGO_MANIFEST_PATH', True)), 'Cargo.lock')}"
+CARGO_LOCK_PATH ??= "${@ os.path.join(os.path.dirname(d.getVar('CARGO_MANIFEST_PATH')), 'Cargo.lock')}"
 
 CARGO_RUST_TARGET_CCLD ??= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
@@ -171,7 +171,7 @@ python cargo_common_do_patch_paths() {
     # here is better than letting cargo tell (in case the file is missing)
     # "Cargo.lock should be modified but --frozen was given"
 
-    lockfile = d.getVar("CARGO_LOCK_PATH", True)
+    lockfile = d.getVar("CARGO_LOCK_PATH")
     if not os.path.exists(lockfile):
         bb.fatal(f"{lockfile} file doesn't exist")
 
diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index c46df362bf..fd1df9d7c9 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -12,10 +12,10 @@ python do_compile_ptest_cargo() {
     import subprocess
     import json
 
-    cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO", True))
-    cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS", True)
-    rust_flags = d.getVar("RUSTFLAGS", True)
-    manifest_path = d.getVar("CARGO_MANIFEST_PATH", True)
+    cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO"))
+    cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS")
+    rust_flags = d.getVar("RUSTFLAGS")
+    manifest_path = d.getVar("CARGO_MANIFEST_PATH")
     project_manifest_path = os.path.normpath(manifest_path)
     manifest_dir = os.path.dirname(manifest_path)
 
@@ -66,7 +66,7 @@ python do_compile_ptest_cargo() {
     if not test_bins:
         bb.fatal("Unable to find any test binaries")
 
-    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES', True)
+    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES')
     bb.note(f"Found {len(test_bins)} tests, write their paths into {cargo_test_binaries_file}")
     with open(cargo_test_binaries_file, "w") as f:
         for test_bin in test_bins:
@@ -77,10 +77,10 @@ python do_compile_ptest_cargo() {
 python do_install_ptest_cargo() {
     import shutil
 
-    dest_dir = d.getVar("D", True)
-    pn = d.getVar("PN", True)
-    ptest_path = d.getVar("PTEST_PATH", True)
-    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES', True)
+    dest_dir = d.getVar("D")
+    pn = d.getVar("PN")
+    ptest_path = d.getVar("PTEST_PATH")
+    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES')
     rust_test_args = d.getVar('RUST_TEST_ARGS') or ""
 
     ptest_dir = os.path.join(dest_dir, ptest_path.lstrip('/'))
-- 
2.34.1


