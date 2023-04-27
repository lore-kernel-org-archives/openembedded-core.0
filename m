Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B701C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 15:13:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.23460.1682608375792374306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 08:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=b57LuZRh;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-2fa36231b1cso5403458f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682608373; x=1685200373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=59+46kOMDS9n8/sSTNrBOrH9O5aQAh18s0f9fR1OZKU=;
        b=b57LuZRhI7AAWhb+QvuN5khAIxhdS+QL3ZvhwvGLTxuV0Pr8NsSAOGtcL7Z3dUYO//
         ggVxIYFmQwNS4cidqPDLcA/eT6MV6GcuPmpSP3KPnTfMamqrlQPI139ChNIVDN8PY3+I
         BGLQpeCyruFbBm0LuGoSMMSAq+rlFZkDyYr1g6hv/NH84rMfDCOiypQyoljbj7f46eYI
         U3lrFvePP1csNdxHv/TsYeMFJgrE2URrkBrZaSWqhxnpSlSbxKaiFIQpLHVpsWH6sR+5
         qc5eMCBZy353+nmwYHKYqD8rqEKZ+1S5nXVbDYUrok7qr5AnWfXab5DuhcTjAl9P7qXR
         UDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682608373; x=1685200373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59+46kOMDS9n8/sSTNrBOrH9O5aQAh18s0f9fR1OZKU=;
        b=FXNhEFH+ldw53eYfNic2Oo/K8uBeGT6WSG2oZhpA53CCWNvxoFqbcN7btoS+YlqYf4
         96pj7jOe09neu6SfO6Ip6bt54J79TTiLpP4/YikN0jVrZ6PsxKR6Vzq3SUDylDKVAgIy
         7iSCHhOhOSIz8f3D+KalUyW4vw1MFnYB2g3SQy2bxqC3njy0DiJFBbzr/cKLMLMQo7AD
         mEZc2o7I8Rxvhnvffj/uhJva/aNVj+ROvU2Dccc6EQF86ydglVWhVz393sgA60PbqeZ2
         yO/NT5iTXRgt1ij55GWbaT3rbmUjXwCEKyAZ+b+HWlDTj5L3WeMRjGf5cJHjDSC+Q1xM
         4dow==
X-Gm-Message-State: AC+VfDwahilVSPURSg5YkZOqkM/XzBWU8/XuziBMd4u3wAcqdfsGkNwj
	egy9G/bfgATKS6QEFIPf7KpT6WIm+P4=
X-Google-Smtp-Source: ACHHUZ5EpKY8ewSwej7rP3Tf9ZlySVtglR4dmBXgh9BkuvgaXT8o7RpjreZlRfPTbOvjPJnoMzXHGw==
X-Received: by 2002:adf:df87:0:b0:2ff:f37:9d02 with SMTP id z7-20020adfdf87000000b002ff0f379d02mr1638665wrl.69.1682608373458;
        Thu, 27 Apr 2023 08:12:53 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id v19-20020a05600c215300b003ee20b4b2dasm21655529wml.46.2023.04.27.08.12.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 08:12:53 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV4 1/3] ptest-cargo.bbclass: create class
Date: Thu, 27 Apr 2023 17:12:48 +0200
Message-Id: <54264f6b2766e0f5a70d7286d64d2adc0106ff3e.1682608254.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682608254.git.frederic.martinsons@gmail.com>
References: <cover.1682608254.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 15:13:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180494

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This new class offers the possibility to build rust unit tests
(and integration tests) and find them correctly.
Due to non deterministic names of generated binaries, a custom
parsing of build result must be performed.
See https://github.com/rust-lang/cargo/issues/1924

All rust projects will generate a test binary with "cargo build --tests"
command, even if there are no test defined in source code.
The binary will just output that it ran 0 tests.

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 130 ++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
new file mode 100644
index 0000000000..f28bc7a826
--- /dev/null
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -0,0 +1,130 @@
+inherit cargo ptest
+
+# I didn't find a cleaner way to share data between compile and install tasks
+CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
+
+# Sadly, generated test binaries have no deterministic names (https://github.com/rust-lang/cargo/issues/1924)
+# This forces us to parse the cargo output in json format to find those test binaries.
+python do_compile_ptest_cargo() {
+    import subprocess
+    import json
+
+    cargo = bb.utils.which(d.getVar("PATH"), d.getVar("CARGO", True))
+    cargo_build_flags = d.getVar("CARGO_BUILD_FLAGS", True)
+    rust_flags = d.getVar("RUSTFLAGS", True)
+    manifest_path = d.getVar("MANIFEST_PATH", True)
+
+    env = os.environ.copy()
+    env['RUSTFLAGS'] = rust_flags
+    cmd = f"{cargo} build --tests --message-format json {cargo_build_flags}"
+    bb.note(f"Building tests with cargo ({cmd})")
+
+    try:
+        proc = subprocess.Popen(cmd, shell=True, env=env, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
+    except subprocess.CalledProcessError as e:
+        bb.fatal(f"Cannot build test with cargo: {e}")
+
+    lines = []
+    for line in proc.stdout:
+        data = line.decode('utf-8').strip('\n')
+        lines.append(data)
+        bb.note(data)
+    proc.communicate()
+    if proc.returncode != 0:
+        bb.fatal(f"Unable to compile test with cargo, '{cmd}' failed")
+
+    # Definition of the format: https://doc.rust-lang.org/cargo/reference/external-tools.html#json-messages
+    test_bins = []
+    for line in lines:
+        try:
+            data = json.loads(line)
+        except json.JSONDecodeError:
+            # skip lines that are not a json
+            pass
+        else:
+            try:
+                # Filter the test packages coming from the current manifest
+                current_manifest_path = os.path.normpath(data['manifest_path'])
+                project_manifest_path = os.path.normpath(manifest_path)
+                if current_manifest_path == project_manifest_path:
+                    if data['target']['test'] or data['target']['doctest'] and data['executable']:
+                        test_bins.append(data['executable'])
+            except KeyError as e:
+                # skip lines that do not meet the requirements
+                pass
+
+    # All rust project will generate at least one unit test binary
+    # It will just run a test suite with 0 tests, if the project didn't define some
+    # So it is not expected to have an empty list here
+    if not test_bins:
+        bb.fatal("Unable to find any test binaries")
+
+    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES', True)
+    bb.note(f"Found {len(test_bins)} tests, write their paths into {cargo_test_binaries_file}")
+    with open(cargo_test_binaries_file, "w") as f:
+        for test_bin in test_bins:
+            f.write(f"{test_bin}\n")
+
+}
+
+python do_install_ptest_cargo() {
+    import shutil
+
+    dest_dir = d.getVar("D", True)
+    pn = d.getVar("PN", True)
+    ptest_path = d.getVar("PTEST_PATH", True)
+    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES', True)
+
+    ptest_dir = os.path.join(dest_dir, ptest_path.lstrip('/'))
+    os.makedirs(ptest_dir, exist_ok=True)
+
+    test_bins = []
+    with open(cargo_test_binaries_file, "r") as f:
+        for line in f.readlines():
+            test_bins.append(line.strip('\n'))
+
+    test_paths = []
+    for test_bin in test_bins:
+        shutil.copy2(test_bin, ptest_dir)
+        test_paths.append(os.path.join(ptest_path, os.path.basename(test_bin)))
+
+    ptest_script = os.path.join(ptest_dir, "run-ptest")
+    if os.path.exists(ptest_script):
+        with open(ptest_script, "a") as f:
+            f.write(f"\necho \"\"\n")
+            f.write(f"echo \"## starting to run rust tests ##\"\n")
+            for test_path in test_paths:
+                f.write(f"{test_path}\n")
+    else:
+        with open(ptest_script, "a") as f:
+            f.write("#!/bin/sh\n")
+            for test_path in test_paths:
+                f.write(f"{test_path}\n")
+        os.chmod(ptest_script, 0o755)
+
+    # this is chown -R root:root ${D}${PTEST_PATH}
+    for root, dirs, files in os.walk(ptest_dir):
+        for d in dirs:
+            shutil.chown(os.path.join(root, d), "root", "root")
+        for f in files:
+            shutil.chown(os.path.join(root, f), "root", "root")
+}
+
+do_install_ptest_cargo[dirs] = "${B}"
+do_install_ptest_cargo[doc] = "Create or update the run-ptest script with rust test binaries generated"
+do_compile_ptest_cargo[dirs] = "${B}"
+do_compile_ptest_cargo[doc] = "Generate rust test binaries through cargo"
+
+addtask compile_ptest_cargo after do_compile            before do_compile_ptest_base
+addtask install_ptest_cargo after do_install_ptest_base before do_package
+
+python () {
+    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
+        d.setVarFlag('do_install_ptest_cargo', 'fakeroot', '1')
+        d.setVarFlag('do_install_ptest_cargo', 'umask', '022')
+
+    # Remove all '*ptest_cargo' tasks when ptest is not enabled
+    if not(d.getVar('PTEST_ENABLED') == "1"):
+        for i in ['do_compile_ptest_cargo', 'do_install_ptest_cargo']:
+            bb.build.deltask(i, d)
+}
-- 
2.34.1


