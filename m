Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0E7C3DA6E
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 05:42:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.14279.1702791749061432548
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Dec 2023 21:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IqpvSNlA;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6d2350636d6so1902022b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 21:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702791748; x=1703396548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRSFpCTbPYxsTFwaTj/h6e+A5g9ln+48p2G018Bcq2c=;
        b=IqpvSNlASoC/uxhbMSVjYdPIT4bQ1hk0P1oFkv/MRNlqaSJTefgj3LRzOAoSucXtOa
         mSYPdBaxYy/nDHvWibYtcokfLLdeF4teU+sp7cQ4ecB+NXjB/4fFfMrJfg6slZFxIM8Y
         uzXl7D8LQFlPxh/Jj6xkL6hEhfrZ++OyandurjL95KKbAf8h0T3WYFiWGR2J1wASynqM
         OZkBlwtgvV1BuA/Nuwq0nTgBizx5DiECMkyZWWqerlOGQ/9KFEAVKoN3R00CG907eiuI
         Omskf/hG0WivR58+GZyOSUvIh8jB4be9O47xhSy1TewnwabRYzQAZiFj1R65YMNL7GPv
         MPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702791748; x=1703396548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRSFpCTbPYxsTFwaTj/h6e+A5g9ln+48p2G018Bcq2c=;
        b=Gj1C3NsQ9R7oOP4WFlAu3VKJo0zzhKBuqStPcQb8abtl+NRuWgvBRh+PUiEIckydnF
         gxf9PWdy3gMiK8h8zc8Q0vsfqzcfau4wH2n4dhdz6VTDPdTChyeqbBQNsnBNPr1kzOwi
         9oPNQZZF4WjVOU5KIPsHvzfmK3hOT4cJbEisEBt9zU3ZX9vGJa9j/0aVFopmNC29lD+I
         1sZhYxXKpkbcoFKcnMpFfoD+OnLxVhbRrM/jykR8tV3dlnTQpIdUnJbn52dbH7RCtvr+
         bez0LQAYAWUHAaxQ6qJQaiDz2pyMU6T1qZWnW4Ca1Nhr/N5Z4mG9F3LzsBRjp4+t/WP0
         LstQ==
X-Gm-Message-State: AOJu0Yzi4A7JH8b2m20MlZ8vs2gE7TkLh4gFONq1rf/OfzBF4xSFMx7p
	P9AgPyVBpw8XhY967rxIToWq9/C+D3U=
X-Google-Smtp-Source: AGHT+IG5zOAPmBzTOMKjGrbinWC822GpJEldagddoQzHXeo+6yg6CGeBgv0vuXnJ1adXbJ3ck+UFXg==
X-Received: by 2002:aa7:8501:0:b0:6d2:6715:9b4d with SMTP id v1-20020aa78501000000b006d267159b4dmr5650711pfn.17.1702791747737;
        Sat, 16 Dec 2023 21:42:27 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6e3d:56d2:3c7b:de95])
        by smtp.gmail.com with ESMTPSA id f16-20020a056a001ad000b006cedd530420sm15365545pfv.52.2023.12.16.21.42.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 21:42:27 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] oeqa: add "maturin develop" SDK test case
Date: Sat, 16 Dec 2023 21:41:33 -0800
Message-Id: <e297d8755ac5afbd6e2a9df5af85b311fd975491.1702791173.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702791173.git.tim.orling@konsulko.com>
References: <cover.1702791173.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Dec 2023 05:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192581

'maturin develop' first checks that a virtual environment
has been created, which is a good test for our python3 SDK
environment ;)

Source for guessing-game lifted from https://www.maturin.rs/tutorial

The test case is expected to fetch any necessary crates, build a
development version of the crate and package it as a wheel

Needs at a minimum the following in e.g. local.conf:
TOOLCHAIN_HOST_TASK:append = " nativesdk-python3-maturin"
SDK_INCLUDE_TOOLCHAIN = '1'
SDK_TOOLCHAIN_LANGS += 'rust'

The output of 'maturin develop' should be something like:
...
🔗 Found pyo3 bindings with abi3 support for Python ≥ 3.8
🐍 Not using a specific python interpreter
📡 Using build options features from pyproject.toml
   ...
   Compiling guessing-game v0.1.0 (/path/to/guessing-game)
    Finished dev [unoptimized + debuginfo] target(s) in 7.14s
📦 Built wheel for abi3 Python ≥ 3.8 to /path/to/tmpdir/guessing_game-0.1.0-cp38-abi3-linux_x86_64.whl
🛠 Installed guessing-game-0.1.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../files/maturin/guessing-game/Cargo.toml    |  20 ++
 .../maturin/guessing-game/LICENSE-APACHE      | 201 ++++++++++++++++++
 .../files/maturin/guessing-game/LICENSE-MIT   |  25 +++
 .../maturin/guessing-game/pyproject.toml      |   8 +
 .../files/maturin/guessing-game/src/lib.rs    |  48 +++++
 meta/lib/oeqa/sdk/cases/maturin.py            |  48 ++++-
 6 files changed, 349 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/LICENSE-APACHE
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/LICENSE-MIT
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
 create mode 100644 meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs

diff --git a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
new file mode 100644
index 00000000000..de95025e863
--- /dev/null
+++ b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
@@ -0,0 +1,20 @@
+[package]
+name = "guessing-game"
+version = "0.1.0"
+edition = "2021"
+
+# See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
+
+[lib]
+name = "guessing_game"
+# "cdylib" is necessary to produce a shared library for Python to import from.
+crate-type = ["cdylib"]
+
+[dependencies]
+rand = "0.8.4"
+
+[dependencies.pyo3]
+version = "0.19.0"
+# "abi3-py38" tells pyo3 (and maturin) to build using the stable ABI with minimum Python version 3.8
+features = ["abi3-py38"]
+
diff --git a/meta/lib/oeqa/files/maturin/guessing-game/LICENSE-APACHE b/meta/lib/oeqa/files/maturin/guessing-game/LICENSE-APACHE
new file mode 100644
index 00000000000..16fe87b06e8
--- /dev/null
+++ b/meta/lib/oeqa/files/maturin/guessing-game/LICENSE-APACHE
@@ -0,0 +1,201 @@
+                              Apache License
+                        Version 2.0, January 2004
+                     http://www.apache.org/licenses/
+
+TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
+
+1. Definitions.
+
+   "License" shall mean the terms and conditions for use, reproduction,
+   and distribution as defined by Sections 1 through 9 of this document.
+
+   "Licensor" shall mean the copyright owner or entity authorized by
+   the copyright owner that is granting the License.
+
+   "Legal Entity" shall mean the union of the acting entity and all
+   other entities that control, are controlled by, or are under common
+   control with that entity. For the purposes of this definition,
+   "control" means (i) the power, direct or indirect, to cause the
+   direction or management of such entity, whether by contract or
+   otherwise, or (ii) ownership of fifty percent (50%) or more of the
+   outstanding shares, or (iii) beneficial ownership of such entity.
+
+   "You" (or "Your") shall mean an individual or Legal Entity
+   exercising permissions granted by this License.
+
+   "Source" form shall mean the preferred form for making modifications,
+   including but not limited to software source code, documentation
+   source, and configuration files.
+
+   "Object" form shall mean any form resulting from mechanical
+   transformation or translation of a Source form, including but
+   not limited to compiled object code, generated documentation,
+   and conversions to other media types.
+
+   "Work" shall mean the work of authorship, whether in Source or
+   Object form, made available under the License, as indicated by a
+   copyright notice that is included in or attached to the work
+   (an example is provided in the Appendix below).
+
+   "Derivative Works" shall mean any work, whether in Source or Object
+   form, that is based on (or derived from) the Work and for which the
+   editorial revisions, annotations, elaborations, or other modifications
+   represent, as a whole, an original work of authorship. For the purposes
+   of this License, Derivative Works shall not include works that remain
+   separable from, or merely link (or bind by name) to the interfaces of,
+   the Work and Derivative Works thereof.
+
+   "Contribution" shall mean any work of authorship, including
+   the original version of the Work and any modifications or additions
+   to that Work or Derivative Works thereof, that is intentionally
+   submitted to Licensor for inclusion in the Work by the copyright owner
+   or by an individual or Legal Entity authorized to submit on behalf of
+   the copyright owner. For the purposes of this definition, "submitted"
+   means any form of electronic, verbal, or written communication sent
+   to the Licensor or its representatives, including but not limited to
+   communication on electronic mailing lists, source code control systems,
+   and issue tracking systems that are managed by, or on behalf of, the
+   Licensor for the purpose of discussing and improving the Work, but
+   excluding communication that is conspicuously marked or otherwise
+   designated in writing by the copyright owner as "Not a Contribution."
+
+   "Contributor" shall mean Licensor and any individual or Legal Entity
+   on behalf of whom a Contribution has been received by Licensor and
+   subsequently incorporated within the Work.
+
+2. Grant of Copyright License. Subject to the terms and conditions of
+   this License, each Contributor hereby grants to You a perpetual,
+   worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+   copyright license to reproduce, prepare Derivative Works of,
+   publicly display, publicly perform, sublicense, and distribute the
+   Work and such Derivative Works in Source or Object form.
+
+3. Grant of Patent License. Subject to the terms and conditions of
+   this License, each Contributor hereby grants to You a perpetual,
+   worldwide, non-exclusive, no-charge, royalty-free, irrevocable
+   (except as stated in this section) patent license to make, have made,
+   use, offer to sell, sell, import, and otherwise transfer the Work,
+   where such license applies only to those patent claims licensable
+   by such Contributor that are necessarily infringed by their
+   Contribution(s) alone or by combination of their Contribution(s)
+   with the Work to which such Contribution(s) was submitted. If You
+   institute patent litigation against any entity (including a
+   cross-claim or counterclaim in a lawsuit) alleging that the Work
+   or a Contribution incorporated within the Work constitutes direct
+   or contributory patent infringement, then any patent licenses
+   granted to You under this License for that Work shall terminate
+   as of the date such litigation is filed.
+
+4. Redistribution. You may reproduce and distribute copies of the
+   Work or Derivative Works thereof in any medium, with or without
+   modifications, and in Source or Object form, provided that You
+   meet the following conditions:
+
+   (a) You must give any other recipients of the Work or
+       Derivative Works a copy of this License; and
+
+   (b) You must cause any modified files to carry prominent notices
+       stating that You changed the files; and
+
+   (c) You must retain, in the Source form of any Derivative Works
+       that You distribute, all copyright, patent, trademark, and
+       attribution notices from the Source form of the Work,
+       excluding those notices that do not pertain to any part of
+       the Derivative Works; and
+
+   (d) If the Work includes a "NOTICE" text file as part of its
+       distribution, then any Derivative Works that You distribute must
+       include a readable copy of the attribution notices contained
+       within such NOTICE file, excluding those notices that do not
+       pertain to any part of the Derivative Works, in at least one
+       of the following places: within a NOTICE text file distributed
+       as part of the Derivative Works; within the Source form or
+       documentation, if provided along with the Derivative Works; or,
+       within a display generated by the Derivative Works, if and
+       wherever such third-party notices normally appear. The contents
+       of the NOTICE file are for informational purposes only and
+       do not modify the License. You may add Your own attribution
+       notices within Derivative Works that You distribute, alongside
+       or as an addendum to the NOTICE text from the Work, provided
+       that such additional attribution notices cannot be construed
+       as modifying the License.
+
+   You may add Your own copyright statement to Your modifications and
+   may provide additional or different license terms and conditions
+   for use, reproduction, or distribution of Your modifications, or
+   for any such Derivative Works as a whole, provided Your use,
+   reproduction, and distribution of the Work otherwise complies with
+   the conditions stated in this License.
+
+5. Submission of Contributions. Unless You explicitly state otherwise,
+   any Contribution intentionally submitted for inclusion in the Work
+   by You to the Licensor shall be under the terms and conditions of
+   this License, without any additional terms or conditions.
+   Notwithstanding the above, nothing herein shall supersede or modify
+   the terms of any separate license agreement you may have executed
+   with Licensor regarding such Contributions.
+
+6. Trademarks. This License does not grant permission to use the trade
+   names, trademarks, service marks, or product names of the Licensor,
+   except as required for reasonable and customary use in describing the
+   origin of the Work and reproducing the content of the NOTICE file.
+
+7. Disclaimer of Warranty. Unless required by applicable law or
+   agreed to in writing, Licensor provides the Work (and each
+   Contributor provides its Contributions) on an "AS IS" BASIS,
+   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+   implied, including, without limitation, any warranties or conditions
+   of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
+   PARTICULAR PURPOSE. You are solely responsible for determining the
+   appropriateness of using or redistributing the Work and assume any
+   risks associated with Your exercise of permissions under this License.
+
+8. Limitation of Liability. In no event and under no legal theory,
+   whether in tort (including negligence), contract, or otherwise,
+   unless required by applicable law (such as deliberate and grossly
+   negligent acts) or agreed to in writing, shall any Contributor be
+   liable to You for damages, including any direct, indirect, special,
+   incidental, or consequential damages of any character arising as a
+   result of this License or out of the use or inability to use the
+   Work (including but not limited to damages for loss of goodwill,
+   work stoppage, computer failure or malfunction, or any and all
+   other commercial damages or losses), even if such Contributor
+   has been advised of the possibility of such damages.
+
+9. Accepting Warranty or Additional Liability. While redistributing
+   the Work or Derivative Works thereof, You may choose to offer,
+   and charge a fee for, acceptance of support, warranty, indemnity,
+   or other liability obligations and/or rights consistent with this
+   License. However, in accepting such obligations, You may act only
+   on Your own behalf and on Your sole responsibility, not on behalf
+   of any other Contributor, and only if You agree to indemnify,
+   defend, and hold each Contributor harmless for any liability
+   incurred by, or claims asserted against, such Contributor by reason
+   of your accepting any such warranty or additional liability.
+
+END OF TERMS AND CONDITIONS
+
+APPENDIX: How to apply the Apache License to your work.
+
+   To apply the Apache License to your work, attach the following
+   boilerplate notice, with the fields enclosed by brackets "[]"
+   replaced with your own identifying information. (Don't include
+   the brackets!)  The text should be enclosed in the appropriate
+   comment syntax for the file format. We also recommend that a
+   file or class name and description of purpose be included on the
+   same "printed page" as the copyright notice for easier
+   identification within third-party archives.
+
+Copyright [yyyy] [name of copyright owner]
+
+Licensed under the Apache License, Version 2.0 (the "License");
+you may not use this file except in compliance with the License.
+You may obtain a copy of the License at
+
+	http://www.apache.org/licenses/LICENSE-2.0
+
+Unless required by applicable law or agreed to in writing, software
+distributed under the License is distributed on an "AS IS" BASIS,
+WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
+See the License for the specific language governing permissions and
+limitations under the License.
diff --git a/meta/lib/oeqa/files/maturin/guessing-game/LICENSE-MIT b/meta/lib/oeqa/files/maturin/guessing-game/LICENSE-MIT
new file mode 100644
index 00000000000..c4a9a58791b
--- /dev/null
+++ b/meta/lib/oeqa/files/maturin/guessing-game/LICENSE-MIT
@@ -0,0 +1,25 @@
+Copyright (c) 2018 konstin
+
+Permission is hereby granted, free of charge, to any
+person obtaining a copy of this software and associated
+documentation files (the "Software"), to deal in the
+Software without restriction, including without
+limitation the rights to use, copy, modify, merge,
+publish, distribute, sublicense, and/or sell copies of
+the Software, and to permit persons to whom the Software
+is furnished to do so, subject to the following
+conditions:
+
+The above copyright notice and this permission notice
+shall be included in all copies or substantial portions
+of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF
+ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
+TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
+PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
+SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
+CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
+IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+DEALINGS IN THE SOFTWARE.
diff --git a/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml b/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
new file mode 100644
index 00000000000..ff35abc472b
--- /dev/null
+++ b/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
@@ -0,0 +1,8 @@
+[build-system]
+requires = ["maturin>=1.0,<2.0"]
+build-backend = "maturin"
+
+[tool.maturin]
+# "extension-module" tells pyo3 we want to build an extension module (skips linking against libpython.so)
+features = ["pyo3/extension-module"]
+
diff --git a/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs b/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs
new file mode 100644
index 00000000000..6828466ed1a
--- /dev/null
+++ b/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs
@@ -0,0 +1,48 @@
+use pyo3::prelude::*;
+use rand::Rng;
+use std::cmp::Ordering;
+use std::io;
+
+#[pyfunction]
+fn guess_the_number() {
+    println!("Guess the number!");
+
+    let secret_number = rand::thread_rng().gen_range(1..101);
+
+    loop {
+        println!("Please input your guess.");
+
+        let mut guess = String::new();
+
+        io::stdin()
+            .read_line(&mut guess)
+            .expect("Failed to read line");
+
+        let guess: u32 = match guess.trim().parse() {
+            Ok(num) => num,
+            Err(_) => continue,
+        };
+
+        println!("You guessed: {}", guess);
+
+        match guess.cmp(&secret_number) {
+            Ordering::Less => println!("Too small!"),
+            Ordering::Greater => println!("Too big!"),
+            Ordering::Equal => {
+                println!("You win!");
+                break;
+            }
+        }
+    }
+}
+
+/// A Python module implemented in Rust. The name of this function must match
+/// the `lib.name` setting in the `Cargo.toml`, else Python will not be able to
+/// import the module.
+#[pymodule]
+fn guessing_game(_py: Python, m: &PyModule) -> PyResult<()> {
+    m.add_function(wrap_pyfunction!(guess_the_number, m)?)?;
+
+    Ok(())
+}
+
diff --git a/meta/lib/oeqa/sdk/cases/maturin.py b/meta/lib/oeqa/sdk/cases/maturin.py
index 14245bc36e5..ea10f568b27 100644
--- a/meta/lib/oeqa/sdk/cases/maturin.py
+++ b/meta/lib/oeqa/sdk/cases/maturin.py
@@ -4,9 +4,12 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
+import shutil
 import unittest
-from oeqa.sdk.case import OESDKTestCase
 
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 
 errors_have_output()
@@ -31,3 +34,46 @@ class MaturinTest(OESDKTestCase):
             output,
             r" - CPython %s (.+)/usr/bin/python%s$" % (python_version, python_version),
         )
+
+
+class MaturinDevelopTest(OESDKTestCase):
+    @classmethod
+    def setUpClass(self):
+        targetdir = os.path.join(self.tc.sdk_dir, "guessing-game")
+        try:
+            shutil.rmtree(targetdir)
+        except FileNotFoundError:
+            pass
+        shutil.copytree(
+            os.path.join(self.tc.files_dir, "maturin/guessing-game"), targetdir
+        )
+
+    def setUp(self):
+        machine = self.td.get("MACHINE")
+        if not (
+            self.tc.hasHostPackage("nativesdk-python3-maturin")
+            or self.tc.hasHostPackage("python3-maturin-native")
+        ):
+            raise unittest.SkipTest("No python3-maturin package in the SDK")
+        if not (
+            self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s" % machine)
+        ):
+            raise unittest.SkipTest(
+                "Testing 'maturin develop' requires Rust cross-canadian in the SDK"
+            )
+
+    def test_maturin_develop(self):
+        """
+        This test case requires:
+          (1) that a .venv can been created.
+          (2) a functional 'rustc' and 'cargo'
+        """
+        self._run("cd %s/guessing-game; python3 -m venv .venv" % self.tc.sdk_dir)
+        cmd = "cd %s/guessing-game; maturin develop" % self.tc.sdk_dir
+        output = self._run(cmd)
+        self.assertRegex(output, r"🔗 Found pyo3 bindings with abi3 support for Python ≥ 3.8")
+        self.assertRegex(output, r"🐍 Not using a specific python interpreter")
+        self.assertRegex(output, r"📡 Using build options features from pyproject.toml")
+        self.assertRegex(output, r"Compiling guessing-game v0.1.0")
+        self.assertRegex(output, r"📦 Built wheel for abi3 Python ≥ 3.8")
+        self.assertRegex(output, r"🛠 Installed guessing-game-0.1.0")
-- 
2.34.1


