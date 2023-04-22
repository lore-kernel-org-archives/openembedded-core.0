Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6074C77B7F
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:59:59 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.10437.1682179195946706337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EqZfYDTr;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f1950f5676so15944425e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682179194; x=1684771194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cjp1ogdo4ofojqZKwp4y1Y1xui7YN6OnrH+gN6VrZ4=;
        b=EqZfYDTrH7nh+IHOJqH0LYJ8El9amsxY+nCb7cpNh694aHBbzSt2MgN9GztbhXGOOT
         8IR++0+IEI4eM9490vCKnn5AO5bTR2sMc9yZ5sbEgOjvqJj8IK8k+2IBWk+Yo+uaCCQc
         Ke8Bhd9rAcXI901eVlhhua6srDmMY/JYQwaKB6vC4GB1Z5iSBXN9eU0Z29w323m5HF53
         +gumX/uR9bnnGOJN8l1O9Xz/lHcmBhu20hNMyyqS81w/091wOcT6GFgBBWEId9+T2NPk
         PGhMsRI29XxDUUJMT+j7W4MqGKoekd+M/3Qj44LrLr3f0RfAZzF6V5wLtr2PsfGqr3GT
         zu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179194; x=1684771194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cjp1ogdo4ofojqZKwp4y1Y1xui7YN6OnrH+gN6VrZ4=;
        b=BGLpaBp9ci9O44VCYgCDBlG7ffe59Q+VvDnqg24vGVB8iCGupXP2lvBETPOvcuOO+0
         qtVlrq0I5jiXsjjW1QUKOwvGn09evBJJ9jzNu4XVRoTFV1Ei/FgKZbptPxrLjUPs0ibf
         mgADDepB170fRrYwojJAh2TGSA42htKfP08FimNzTjuEoC7s3oMnOi0ZlTy5eIqLngre
         uyFO/rG8UQuulkGu5rv8qa0CMUF4eUsW94o+fhT6QSS8oJjrCUISrN79AKCejVXrBFrG
         WaULrazA9mu8HTIbjDKHpCmKGIzo5oQ9JmgCtH3JZbpihEWZbQh2B2/EWHrP4hf/+r29
         tPPA==
X-Gm-Message-State: AAQBX9ergmalkX7z1ebKMSAOFyMfXihq6dftGOUK4LwsCymOLVCIDXGv
	yDziBZBqnutnUW4t2ch19Evon7dgry8=
X-Google-Smtp-Source: AKy350a3AJCyBikmJSmbveYyB0090WZkm+3R0MBsghPbVHci4zfdKAre2/MIhIzuO/qbZQiicCcp+A==
X-Received: by 2002:a5d:4d8d:0:b0:2ee:f1f0:14bb with SMTP id b13-20020a5d4d8d000000b002eef1f014bbmr5657045wru.49.1682179193833;
        Sat, 22 Apr 2023 08:59:53 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:446e:1477:ec70:1aee])
        by smtp.gmail.com with ESMTPSA id e29-20020a5d595d000000b002fddcb73162sm6798184wri.71.2023.04.22.08.59.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:59:53 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] ptest-cargo.bbclass: create class
Date: Sat, 22 Apr 2023 17:59:41 +0200
Message-Id: <aa3fa22b7e1ab102ed43ff0b6f2f6c3ae3701ad4.1682178812.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178812.git.frederic.martinsons@gmail.com>
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180320

From: Frederic Martinsons <frederic.martinsons@gmail.com>

This new class offer the capbility to build rust tests and
find them correctly.
Due to non deterministic name of generated binaries, a custom
parsing of build result must be performed.
See https://github.com/rust-lang/cargo/issues/1924

All rust project will generate a test binary even if there are
not test defined in source code (the binary will just output
that it ran 0 tests)

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/classes-recipe/ptest-cargo.bbclass | 108 ++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
new file mode 100644
index 0000000000..a76b06b46a
--- /dev/null
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -0,0 +1,108 @@
+inherit cargo ptest
+
+CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
+
+# sadly generated test binary have no deterministic names (https://github.com/rust-lang/cargo/issues/1924)
+# which force us to parse the cargo output in json format to find those test binaries
+python do_compile_ptest_base() {
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
+    # All rust project will genrate at least one unit test binary
+    # It will just run a test suite with 0 tests if the project didn't define some
+    # So it is not expected to have an empty list here
+    if not test_bins:
+        bb.fatal("Unable to find any test binaries")
+
+    cargo_test_binaries_file = d.getVar('CARGO_TEST_BINARIES_FILES', True)
+    bb.note(f"Found {len(test_bins)} tests, write their path into {cargo_test_binaries_file}")
+    with open(cargo_test_binaries_file, "w") as f:
+        for test_bin in test_bins:
+            f.write(f"{test_bin}\n")
+
+}
+
+python do_install_ptest_base() {
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
+            for test_path in test_paths:
+                f.write(f"{test_path}\n")
+    else:
+        with open(ptest_script, "a") as f:
+            f.write("#!/bin/sh\n")
+            for test_path in test_paths:
+                f.write(f"{test_path}\n")
+    os.chmod(ptest_script, 0o755)
+
+    # this is chown -R root:root ${D}${PTEST_PATH}
+    for root, dirs, files in os.walk(ptest_dir):
+        for d in dirs:
+            shutil.chown(os.path.join(root, d), "root", "root")
+        for f in files:
+            shutil.chown(os.path.join(root, f), "root", "root")
+}
-- 
2.34.1


