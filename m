Return-Path: <andreas.stergiopoulos@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17616CD1297
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 15:58:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.663.1762963079009659782
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 07:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RnN4aZJJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: andreas.stergiopoulos@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b312a08a2so946739f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762963077; x=1763567877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uztm3Ukaj5egy9bZrIdqKJWBsTlafq7SBZhfhE2Dodg=;
        b=RnN4aZJJD6RMuE7R13a2BFHZDcwCLxn20ayxWa8aE/K7Ji7msrq7SWaxZcD0CDLDpX
         BNcKJ5lZMwQrrjDJvYp6J1KvANlWkxauv+QF52n5+AMujhQEGNxBNon4uygrNAw0LAqw
         ySJfXe8hQQk8kY0WXvBuZ8CEAZZWIvnAtzSl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762963077; x=1763567877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uztm3Ukaj5egy9bZrIdqKJWBsTlafq7SBZhfhE2Dodg=;
        b=SIGSAKdwJz8412RRzqTpoL7QrfmDKG8NELH4BDTEK6I7gqq2qQHCpEMsTulnsdD7sc
         0A4VaIkNrW0MX8XGc3gMmLAjAkBPRHYiJdP/uOcQvd38FUF3aei3h6LaiiGKx3XLn5DM
         70n1yT9TAv3LSoKdRYnmIUTSLelzkp6bGjqiX07SEjyr6aGrtlHi2+QGE9+/caGXOTqu
         FllGU59MzZTYsQ1KmiZzuTyFhsoiz6jKoSbQPq5fMcVBmf+nvc3DepXddhgl+W8qP7AC
         ohPlNo5znrongcSW6UKxFiAH8AmuVJEO2EGlftMZwraT/8YZzpRSLFyG76KNHCFbLU9R
         NXrQ==
X-Gm-Message-State: AOJu0YzsY8oCBrhmW7HCbqAclU73Nzc/wNO8FzF4Tm72/VLHP2zZ0pKM
	rZbou6g/e6jk1FIiE/ZDHN2mpOzvPkoZMXGo+2BDJV2PuRYUIXX4q8rd36kr3Zl+w5CqWa/Dlo2
	ysyzj
X-Gm-Gg: ASbGncuAjF6j1f1RYR7jOR8xRiQkNmC+7H56UQkL8Pv2+byGyUF6dCNTPEMdnQpE0BQ
	y8rAnQ/eZSbd3rYwuwtspFBFdsZkYQ63Q/PboR6pdXkRQbdy5DUImL5qnnzy4uFymaeWrmoFk3W
	+Eyp1ELmhX7ct13qWlTaZgmd+/0dG1xKLvK9wiuxw3WLtl2v61zkOxDISYOWBXwR5NzHP76deH7
	6BMtGm1s3f1aFZYH1P1wNdhLWJWRdLgS64TRpu8CgyOunBOGf0+8iZaeXBUzBEAt8XXeFq12jFu
	ChwF7g4FJYkSo6gk7tGb9Z80uaX4PofHXbTJP8p5M2K/mzcYyySIUG8PGjf+UVgNd0CuaaHoAz3
	7K1rokhdOjd3fWJupgWz41K6HRuETTbrfOgzKwL8XkUB5htDq476xWw4YmLclgvwzO7SwlvXuhZ
	uKNxpgJupiVzXtu3f2gaCvLaG19Zvvh0vZ2AMnRKwlOdtm3PeeORlES+sPzqA7PKMBxrIhPv3ji
	Xr2eJtMoj43sl42KS4a
X-Google-Smtp-Source: AGHT+IFZ5gMdSz/CYSpXQPidUG+3DdGzl+GNWGnvBqXLOkhvLn7IHbGzT2VZyphoBoxa7eHNqJsy1A==
X-Received: by 2002:a05:6000:2c11:b0:42b:3e60:18ba with SMTP id ffacd0b85a97d-42b4bb74c59mr2485114f8f.8.1762963077113;
        Wed, 12 Nov 2025 07:57:57 -0800 (PST)
Received: from FRSMI25-PILS.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm33976612f8f.10.2025.11.12.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:57:56 -0800 (PST)
From: Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	Andreas Stergiopoulos <andreas.stergiopoulos@smile.fr>
Subject: [PATCH 3/3] ptest-cargo.bbclass: Add support for CARGO_BIN_EXE_<name> environment variables
Date: Wed, 12 Nov 2025 16:57:30 +0100
Message-ID: <20251112155730.646159-4-andreas.stergiopoulos@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
References: <20251112155730.646159-1-andreas.stergiopoulos@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 15:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226209

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
 meta/classes-recipe/ptest-cargo.bbclass | 40 +++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 004abb40f7..f5dfe36c48 100644
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
@@ -106,11 +120,33 @@ python do_install_ptest_cargo() {
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
+        f.write("    env - ")
+        for cargo_bin_exe in cargo_bin_exes:
+            f.write(f"CARGO_BIN_EXE_{os.path.basename(cargo_bin_exe)}={cargo_bin_exe} \\\n")
+
+        f.write("        \"$@\"\n")
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

