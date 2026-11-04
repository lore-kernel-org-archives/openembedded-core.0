Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9735.1793801118779501764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 06:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=vasileios.anagnostopoulos@siemens.com header.s=fm2 header.b=LZchkA0U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1336772-2026110413550566f1bb324500020779-toc977@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026110413550566f1bb324500020779
        for <openembedded-core@lists.openembedded.org>;
        Wed, 04 Nov 2026 14:55:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=vasileios.anagnostopoulos@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mxeHhPAgTLeqAc09Q/OUygXJ+gotN3Sjc3vqn6Wv+Ok=;
 b=LZchkA0UFxiohz9PlVq+iaiwvL7LpQ45F23F59H3sziUt9OpGvAbR11L7dMM7QYV4OzCv6
 o9RXSmHkcGZwdpaDnXxJ3PP2sMMZQzIfpNq3WyVWLUbsc4jhyixeaGuK76ndwjR3S6FgMtEK
 CIemzwYnajd9+zNvNAmYQSc8hPV7Zwgk1s+GIPx5V+n3YseYU7PH72xhkcqpyuHRA/cBBtYP
 zeMkMVx2ZRbJ9DyaUzfq14amkbvGjibXFFkK9ykwc2h/C408b/wkEsTAvPvrAypoqa1nDpTP
 aTdvqdUm7unRXTN7TbV40VZbAKF9gRYjDNKaY5bCV2lT655r8MlxucCA==;
From: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>,
	Patrick Wicki <patrick.wicki@siemens.com>
Subject: [PATCH] ptest-cargo: align test and application build environments
Date: Wed,  4 Nov 2026 14:53:19 +0100
Message-ID: <20261104135319.586204-1-vasileios.anagnostopoulos@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1336772:519-21489:flowmailer
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 14:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249385
Content-Type: text/plain; charset="utf-8"

do_compile runs oe_cargo_fix_env before invoking cargo. That function
points cargo and the crate build scripts at the cross toolchain correctly.

do_compile_ptest_cargo spawned cargo from python with only RUSTFLAGS
set, so every build script that still had to run for the test build
(e.g. dev-dependencies, test-only features, etc)
saw the plain task environment. The test binaries were therefore built in a
different, and for cross builds wrong, environment than the application.

Run the test build through oe_cargo_fix_env as well so both builds share
one environment.

Co-authored-by: Patrick Wicki <patrick.wicki@siemens.com>

Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 35 +++++++++----------------
 1 file changed, 12 insertions(+), 23 deletions(-)

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
index 62444e9cc6..5cdd1c43d1 100644
--- a/meta/classes-recipe/ptest-cargo.bbclass
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -5,39 +5,28 @@ RUST_TEST_ARGS[doc] = "Arguments to give to the test binaries (e.g. --shuffle)"
 
 # I didn't find a cleaner way to share data between compile and install tasks
 CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
+CARGO_TEST_BUILD_JSON ?= "${B}/cargo_test_build.json"
+
+# Build the tests with the same environment as do_compile (oe_cargo_fix_env).
+cargo_ptest_build () {
+    oe_cargo_fix_env
+    export RUSTFLAGS="${RUSTFLAGS}"
+    bbnote "Building tests with cargo"
+    "${CARGO}" build --tests --message-format json-render-diagnostics ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} > "${CARGO_TEST_BUILD_JSON}"
+}
 
 # Sadly, generated test binaries have no deterministic names (https://github.com/rust-lang/cargo/issues/1924)
 # This forces us to parse the cargo output in json format to find those test binaries.
 python do_compile_ptest_cargo() {
-    import subprocess
     import json
 
-    cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO"))
-    cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS")
-    packageconfig_confargs = d.getVar("PACKAGECONFIG_CONFARGS")
-    rust_flags = d.getVar("RUSTFLAGS")
     manifest_path = d.getVar("CARGO_MANIFEST_PATH")
     project_manifest_path = os.path.normpath(manifest_path)
     manifest_dir = os.path.dirname(manifest_path)
 
-    env = os.environ.copy()
-    env['RUSTFLAGS'] = rust_flags
-    cmd = f"{cargo} build --tests --message-format json {cargo_build_flags} {packageconfig_confargs}"
-    bb.note(f"Building tests with cargo ({cmd})")
-
-    try:
-        proc = subprocess.Popen(cmd, shell=True, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
-    except subprocess.CalledProcessError as e:
-        bb.fatal(f"Cannot build test with cargo: {e}")
-
-    lines = []
-    for line in proc.stdout:
-        data = line.strip('\n')
-        lines.append(data)
-        bb.note(data)
-    proc.communicate()
-    if proc.returncode != 0:
-        bb.fatal(f"Unable to compile test with cargo, '{cmd}' failed")
+    bb.build.exec_func("cargo_ptest_build", d)
+    with open(d.getVar("CARGO_TEST_BUILD_JSON")) as f:
+        lines = f.read().splitlines()
 
     # Definition of the format: https://doc.rust-lang.org/cargo/reference/external-tools.html#json-messages
     test_bins = []
