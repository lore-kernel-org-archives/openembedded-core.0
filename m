Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F9EC2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 19:40:15 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.6063.1719344406864491316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 12:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=nehNbCO1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024062519400288ad4dab76e6da7c6a-_t_g6k@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024062519400288ad4dab76e6da7c6a
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Jun 2024 21:40:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QHOnY3ayMWmYvZ9sFLXuhFH6F4c+L6h7VEYyxP4cf+E=;
 b=nehNbCO1ViiL7UZDLiSFPewuestXcbhT8xuwiy1/qYGoNQjYOGIQTrN4FJxueNfHHBP/ZJ
 OVZFXNMupcJzdJxqLI04gS0Cq0LMC/X7sKx+2Ldc21c8FBYAyg7a+uTkPYKkyc/DoynH7IHF
 P1dQII0XZEy+WhSHg+DjPniyHwGXk=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][scarthgap][PATCH] cargo: remove True option to getVar calls
Date: Tue, 25 Jun 2024 21:36:45 +0200
Message-Id: <20240625193645.1799736-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 19:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201146

From: Peter Marko <peter.marko@siemens.com>

Layer cleanup similar to
https://git.openembedded.org/openembedded-core/commit/?id=26c74fd10614582e177437608908eb43688ab510

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/cargo_common.bbclass |  4 ++--
 meta/classes-recipe/ptest-cargo.bbclass  | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 78440c810b..2386cc3d77 100644
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
2.30.2


