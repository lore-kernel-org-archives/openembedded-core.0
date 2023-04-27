Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA02C77B7E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 05:21:10 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.13548.1682572862588974129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 22:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ISpkaiTQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2f7a7f9667bso4982655f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 22:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682572860; x=1685164860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd5jaosxCYQ6baIAK1XchMU81zt9Q0R7k1dPJ7dfW8Q=;
        b=ISpkaiTQ9ghi2vVnf3kp8XjMxFGkVDxl93HtUlL3lU8PNbrTdMCIQMqoph3etghhdK
         ZoHkHol1jUJW46E8aXAdyPlUiLomhrKDzxmPE9ClKqf3B4ImS6afHm9P7GL/vbeLHEWB
         acZ9sCq8UjfaXCE63oOKxedkC//mlYD8AazJEgDsUeq9w4A6c0/OwW13iubk3yuvG/sw
         ccrfT90hHGf5f5sOrED7sN2OlbgSzNK75lBpWYFHHMdB9LlN4DDnSmyIYxOYww3b01MR
         Nuxuja1RBEwPAWVBsKamlPseQ+2SljUcAQZquVeWI3WultKa6UWrJbIVOZUNwGwvT4Ff
         U5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682572860; x=1685164860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd5jaosxCYQ6baIAK1XchMU81zt9Q0R7k1dPJ7dfW8Q=;
        b=VVG1BubvKPlFHvYMd6DoyM31FzsIc2KRH15O3VaHApX3iqkG32Wf5L+x4FS8fCJdCe
         QOoW/C1iPaAiCcxHPGikbKn+gxsQOLGmQLprtWIU7w+dm/mReO6sBEQLPv1Ofqwla967
         WRcPMMrOuf3hEkX14zyILaqkiwc0vubWMrM+omufQ9adID0F4fNDVgCq1WMaEZfbCrm4
         rgQ5afwqwgabjt4yVcdDJLazGKx6j8oibzdSUwsS6GKzAPiFiRk9Kt56qJFXl3J5ZUmW
         nJD+VqEfkD4sotL7ZazLF7lw3B/SE8deeTv+B9QRgJrdti0KmEuImAUoMXHHXsm9emVc
         gehA==
X-Gm-Message-State: AC+VfDxkPUGTDOCKDX9QIKua+vd6iLd+oBOWPNtazMfbP44CEG8fQCyC
	c2ZHzHu1BEPz6A29dYFjpIgykfbtuD0=
X-Google-Smtp-Source: ACHHUZ5qixJryqN0VYHYyVvoOuR/RKB5BtV6TfjyZKSnzDPNu8jUFRenrpKBTuvHnLlhg5paPQVWbQ==
X-Received: by 2002:a5d:460f:0:b0:2d8:47c7:7b50 with SMTP id t15-20020a5d460f000000b002d847c77b50mr229326wrq.1.1682572860492;
        Wed, 26 Apr 2023 22:21:00 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id jb12-20020a05600c54ec00b003f17003e26esm23240809wmb.15.2023.04.26.22.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 22:21:00 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV3 1/3] ptest-cargo.bbclass: create class
Date: Thu, 27 Apr 2023 07:20:54 +0200
Message-Id: <55d311e26e8c3eff765d71f4c1aa439459708812.1682572703.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682572703.git.frederic.martinsons@gmail.com>
References: <cover.1682572703.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 05:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180467

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


