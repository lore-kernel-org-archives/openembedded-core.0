Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5744DCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 16:00:04 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12983.1763395196996019721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 07:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rtg9H8zk;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779d47be12so15106795e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 07:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763395195; x=1763999995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSH2UzmDeMnq1dG2amjEfVhAlWjPR8C+SaUswyvjR6k=;
        b=rtg9H8zkfqiuonxsB2lDE+S2M0xcb09CBq4Yx9U/fwUq8fFqwE/mfPZrThC7aBeqp0
         mQV2utvmzKIC09m3FsQaZGvc81M8hE4yI/CjRpHwq+ReBXXkJ9s+32fgIur4O8EnfQvz
         pBqTGfAAuN9hzvog0AnM2WctD33FMwiRtf1q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763395195; x=1763999995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dSH2UzmDeMnq1dG2amjEfVhAlWjPR8C+SaUswyvjR6k=;
        b=tXg0FBq1m/UXUYRdEBn2V8FHGwayXE0HlpZunWISvtRfsrhVCDNf3zzFWD7M8Acwyz
         40d692Qx7FvHT0E2Scrz87P8DASXwI0CjM8cNMvTIt+PLFh1PeIbJYAR7yZllG1GMV/O
         Bp0V/7eSAlP70Qu2knCNNbN27FRYDZnw9KRieavvuL/omZZbNcoRFpPwfM/E4EUDlkwb
         uuqoC1s1XVbezmoOvsIzwb1cJ4RlfxuI9c6NudXp7eaxvXd8ZdskxjoW0SEXnTKLXgxh
         2ZDL/aRCI+wh1F4TtSvi34T7ZhDBWd4RmDkQS8VAcXz4eCcwcsUUubyS4Ar0nqgP0nPx
         cyNg==
X-Gm-Message-State: AOJu0YzyGu+PEkuS8PqgG7vCVjqdyzv6ij+inkaomp6iE3c67BG7/OdU
	qRIOiSvmMSJ8CADiPOZKvXYaIjtLT+dlbL6Hj/zcPM+7E2ylX7HEbAlTUEf0kUIy/ytjRVZyNdf
	DDhPc
X-Gm-Gg: ASbGnctmpAz0zyi0Sw7/EcZ7hM6ELOj69WyklnPOhFPOosrXIVcRICvyS7pQo3DpZZx
	XamoUJfaGlVh0elbtEnFRh6K3l9IRjqQmklEgbXdQB8AyaT1mdG5MLiw/uiAi1a9T7ynfSBWniK
	dIpYCFc4g151G9d46PuEG125fj1e/hsb3Ht2CJ/F4QRlJcvLLPrdOhALiyDKih4NMhTShLMT8Ec
	K58vD8z3QFTgQZBXja3lPsnO7oxJJBEQuU55bv4Y2e4ru+0V+GVGTWhjd0YTK/3LzPZu279sGJF
	e5LCyr1nOaLngntKu/KUjdNFRf6cWTLui7mbAeS0mw2h+rNEbadmY5UXDBCL7Di4zp2OOVYhLRS
	tb4uIx9TklSLh8cPv5ZKvCV85RVv96aBhEz6yTPNsZ6jTLIg6HCp4UnRvM8ntBM+QppmFOWMUFZ
	VP8Bt6HHbx74ofF5H0F+vo+s0T0grPh2XxuZJH6oH85yMbBWafprD88wHPwU6ybLZwtmaFNnigZ
	cs9HtDsW929WNswL6PN9JvAhd20ex0=
X-Google-Smtp-Source: AGHT+IF6uz+i2cWa8NBQH28c1PKc+WyKuRnKiIv1dZORFVp10cheAW/ZHKYFNJZioDDAV990hszAVQ==
X-Received: by 2002:a05:600c:1986:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-4778fea7037mr117427995e9.27.1763395195091;
        Mon, 17 Nov 2025 07:59:55 -0800 (PST)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm340609225e9.0.2025.11.17.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 07:59:54 -0800 (PST)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
Subject: [PATCH v2 3/3] ptest-cargo.bbclass: Add support for CARGO_BIN_EXE_<name> environment variables
Date: Mon, 17 Nov 2025 16:59:27 +0100
Message-ID: <20251117155927.427462-4-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117155927.427462-1-andreas.stergiopoulos@smile.fr>
References: <20251117155927.427462-1-andreas.stergiopoulos@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 16:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226499

This commit takes the installation paths collected during package installation and
sets them up as environment variables in the run-ptest script. This is necessary as
the integration tests require the executable binary to run successfully.

The paths collected are not those of the artifacts created during cargo test, but the
paths where the artifacts in the system. The intention for this choice was to ensure
that the tested binaries are those who are actually executed by the user and vice
versa.

Env has been used instead of export, as export explicitly does not support dashes "-"
when setting up environment variables. The execution environment is set up inside the
function exec_in_env. For every binary executable artifact collected, one environment
variable is added irregardles of whether it is needed or not.

Signed-off-by: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
---
Changes in v2:
* Remove the "-" when invoking env. The "-" implies a new empty environment.
* Improve how spaces are printed for better-looking auto-generated code.
---
 meta/classes-recipe/ptest-cargo.bbclass | 41 +++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 004abb40f7..68f0090b74 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -6,6 +6,11 @@ RUST_TEST_ARGS[doc] = "Arguments to give to the test binaries (e.g. --shuffle)"
 # I didn't find a cleaner way to share data between compile and install tasks
 CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
 
+# Integration tests usually require the application binary to execute successfully.
+# This file contains the paths in the image where all the crate executable artifacts
+# reside.
+CARGO_BIN_EXE_PATHS ?= "${B}/binary_exe_path_list"
+
 # Sadly, generated test binaries have no deterministic names (https://github.com/rust-lang/cargo/issues/1924)
 # This forces us to parse the cargo output in json format to find those test binaries.
 python do_compile_ptest_cargo() {
@@ -84,6 +89,7 @@ python do_install_ptest_cargo() {
     pn = d.getVar("PN")
     ptest_path = d.getVar("PTEST_PATH")
     cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES')
+    cargo_bin_exe_paths = d.getVar('CARGO_BIN_EXE_PATHS')
     rust_test_args = d.getVar('RUST_TEST_ARGS') or ""
 
     ptest_dir = os.path.join(dest_dir, ptest_path.lstrip('/'))
@@ -94,6 +100,14 @@ python do_install_ptest_cargo() {
         for line in f.readlines():
             test_bins.append(line.strip('\n'))
 
+    # Read the file that contains the paths to the executable binaries. This step is
+    # necessary in order to successfully set up the execution environment for integration tests.
+    cargo_bin_exes = []
+    if os.path.exists(cargo_bin_exe_paths):
+        with open(cargo_bin_exe_paths, "r") as f:
+            for line in f.readlines():
+                cargo_bin_exes.append(line.strip('\n'))
+
     test_paths = []
     for test_bin in test_bins:
         shutil.copy2(test_bin, ptest_dir)
@@ -106,11 +120,34 @@ python do_install_ptest_cargo() {
             f.write("#!/bin/sh\n")
         else:
             f.write(f"\necho \"\"\n")
-            f.write(f"echo \"## starting to run rust tests ##\"\n")               
+            f.write(f"echo \"## starting to run rust tests ##\"\n")
+
+        # For the integration tests, cargo uses the CARGO_BIN_EXE_<name> environment variable to
+        # communicate the location of the binary executable. More info on this variable can be
+        # found in the link: (https://doc.rust-lang.org/cargo/reference/environment-variables.html).
+
+        # This environment variable is exported by cargo automatically during compilation. Making it
+        # also available during runtime is a very powerful tool as it allows the ptest framework to
+        # run the integration tests on the actual executables installed in the target, no matter the
+        # installation location.
+
+        # By using env we ensure that we will be able to create environment variables even for apps
+        # whose name contains dashes "-", which is not supported by export. For every binary executable
+        # produced by the rust compiler, one environment variable is added.
+
+        f.write("exec_in_env () {\n")
+        f.write("    env ")
+        for cargo_bin_exe in cargo_bin_exes:
+            f.write(f"CARGO_BIN_EXE_{os.path.basename(cargo_bin_exe)}={cargo_bin_exe} \\\n")
+            f.write("        ")
+
+        f.write("\"$@\"\n")
+        f.write("}\n")
+
         f.write("if [ -z \"$rc\" ]; then rc=0; fi\n")
         for test_path in test_paths:
             script = textwrap.dedent(f"""\
-                if ! {test_path} {rust_test_args}
+                if ! exec_in_env {test_path} {rust_test_args}
                 then
                     rc=1
                     echo "FAIL: {test_path}"

