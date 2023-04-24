Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD47C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 13:04:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.50232.1682341460013543982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 06:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=UBufwuv+;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f178da21b5so29394345e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 06:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682341458; x=1684933458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd5jaosxCYQ6baIAK1XchMU81zt9Q0R7k1dPJ7dfW8Q=;
        b=UBufwuv+wnNReeTkDTckXp/vtwjGo+rtvVZyhT6naw9FmbRWD9kBXE/IhMm1Eu2tZC
         dv3KVUdrXf/jroVKwDAcwTy/f7s6BRxGA0heTjS5gWbhXKRLlBwsX26LY2uRcRnsYG73
         /zqxQhJXJ+HppsS2RN80/2+bOX2pv3zlIYX4jJzH9GFOWIfcJInZuIRwCgi/E/W7JEJp
         kfT5+LsPadBMvfH2cN01GVFDos2mcxRvsLIBm5bb//Ws5aii/Eb2Q+AyUvBib5fFBhy7
         bGuGZhM2rDvtzHx++Zl3l9vrbxK0ppnc5xVUeeaoxC5bzRelir0uJE/VZsCPyaX202Uy
         BRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682341458; x=1684933458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd5jaosxCYQ6baIAK1XchMU81zt9Q0R7k1dPJ7dfW8Q=;
        b=RSG1j3XZ4VeMsRq7YLBL6zswprRkC9S5J+yRTmkSurtcWSgY741moYEK2ZdakDDOJ/
         2+DVQPylqVvbaHux3CdPTTmKrtr4W7chOL3fBjCKY6CbzbR/4zdZaIoeBOnFWsHd6S6v
         iM4Bn8tq/3JrKCDnw8qllDdlTfoUGFXffGSo3LylzhWn3LVeyPaaXYfB8SLRZegHGWbm
         U9G7WsGEerLwZtpUs+AEYw47x/jCXk7WheDfxOYn3+iQY4mbAkPcbxeSQujfHXEUOLtW
         IWWQMm8wlDH2u/aoBezHAXSxOI9S7WK2uSYa9jyDliPJ6rtgjOEwxjUbn11Ig+6tsYzg
         e/Hw==
X-Gm-Message-State: AAQBX9fsiT4JhESu7n88TornecDNjF2L+Xfnhp+Vz8tn1Y8ycgECVa5w
	NA8IpL2ao8Eg7LrUPLNPiIPx7AsYO6Y=
X-Google-Smtp-Source: AKy350aSgpUYplSA2G3wezVvqrIQHMzAEPp+S1Znh0y8BGMpECy/qWQXDigw0LgCCBlkz65PgcqoOQ==
X-Received: by 2002:adf:eac5:0:b0:303:c151:8e69 with SMTP id o5-20020adfeac5000000b00303c1518e69mr6898415wrn.40.1682341457609;
        Mon, 24 Apr 2023 06:04:17 -0700 (PDT)
Received: from work-pc.core.sigfox.net ([2a01:e0a:8d5:c6c0:d7e1:16f4:c5d8:fb02])
        by smtp.gmail.com with ESMTPSA id eo9-20020a05600c82c900b003f0ad8d1c69sm9170508wmb.25.2023.04.24.06.04.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 06:04:17 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV2 1/3] ptest-cargo.bbclass: create class
Date: Mon, 24 Apr 2023 15:04:11 +0200
Message-Id: <55d311e26e8c3eff765d71f4c1aa439459708812.1682341336.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682341336.git.frederic.martinsons@gmail.com>
References: <cover.1682341336.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180352

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
 meta/classes-recipe/ptest-cargo.bbclass | 129 ++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass

diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
new file mode 100644
index 0000000000..f26d4225d3
--- /dev/null
+++ b/meta/classes-recipe/ptest-cargo.bbclass
@@ -0,0 +1,129 @@
+inherit cargo ptest
+
+CARGO_TEST_BINARIES_FILES ?= "${B}/test_binaries_list"
+
+# sadly generated test binary have no deterministic names (https://github.com/rust-lang/cargo/issues/1924)
+# which force us to parse the cargo output in json format to find those test binaries
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
+        d.setVarFlag('do_install_ptest_cargp', 'umask', '022')
+
+    # Remove all '*ptest_cargo' tasks when ptest is not enabled
+    if not(d.getVar('PTEST_ENABLED') == "1"):
+        for i in ['do_compile_ptest_cargo', 'do_install_ptest_cargo']:
+            bb.build.deltask(i, d)
+}
-- 
2.34.1


