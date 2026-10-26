Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38534.1793004983597195104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=xm8+egdn;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AFDF03D8187E;
	Mon, 26 Oct 2026 04:56:22 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id bT7WqpChRkKy; Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id ABDCB3D81829;
	Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com ABDCB3D81829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004981; bh=g8AC/yjwOAdLGWvDRpSJTF7jvjMboZLf614G+9o3LoU=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=xm8+egdnzw1fiHQXaPm6cswPMIqhaqC2lXpGW3u3TAoWWjyQ3gVWtv77WwONT77JP
	 O+wH2EsYtik32soulM+/YHohYkeCsQOGyoSfXIwUqh/MMo3iXLNxefhT0TB8nQrJIV
	 kn7qr6kucGp8bo4CObDeBHK2sgMlalaSzkrnYjDJCO9zp7jcq5bGz9rRpDzfX8bODS
	 3ZpnwW8JR51rk3QZ9u1l8rxkokTWWG8zgF8v5WBOVEBHW6DfEW0I5p9eTXw5nxdIgo
	 prn1hfwKNrIL5iV9qLY/TBw4WO6xzIjHS3VrLwI0g6IJuEknGDAaauv712gqEhXdAX
	 NfX26giVxUHzQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 7RagCmbTCzat; Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2BA233D81886;
	Mon, 26 Oct 2026 04:56:21 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:58 +0100
Subject: [PATCH 20/20] oeqa/selftest: verify Cargo rebuild and redeploy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-20-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248657

After a source edit, run the ordered Cargo build/install/deploy tasks and
verify the changed Fibonacci result. Use a helper to shift source lines so
the breakpoint location can change without hard-coded line numbers; reuse
the shared LLDB runner for both debug sessions.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 87dc8a1ee5..b9adb624c4 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3147,6 +3147,15 @@ class DevtoolIdeSdkTests(DevtoolBase):
                     return lineno
         self.fail("Could not find marker %r in %s" % (marker, source_path))
 
+    def _insert_source_line_shift(self, source_path, marker, line_count):
+        with open(source_path) as source_handle:
+            source = source_handle.read()
+        self.assertEqual(source.count(marker), 1)
+        inserted_lines = ''.join(
+            '    // line shift %d\n' % index for index in range(line_count))
+        with open(source_path, 'w') as source_handle:
+            source_handle.write(source.replace(marker, inserted_lines + marker, 1))
+
     def _find_multi_script_port(self, recipe_name, script_prefix, example_exe):
         """Discover the port assigned to a generated 'multi' mode debug-server
         script (gdbserver_*/lldb_server_*), since each --ide plugin allocates
@@ -4511,6 +4520,28 @@ class DevtoolIdeSdkRustTests(DevtoolIdeSdkTests):
                 'Repeated ide-sdk runs must preserve the Cargo source remap')
             self._verify_rust_lldb_debugging(tempdir, expected_input=4)
 
+            main_rs = os.path.join(tempdir, 'src', 'main.rs')
+            self._insert_source_line_shift(main_rs, '    match n {', 4)
+            with open(main_rs) as source_file:
+                shifted_source = source_file.read()
+            self.assertEqual(shifted_source.count('fibonacci(4)'), 1)
+            with open(main_rs, 'w') as source_file:
+                source_file.write(
+                    shifted_source.replace('fibonacci(4)', 'fibonacci(5)', 1))
+
+            with open(os.path.join(tempdir, '.vscode', 'tasks.json')) as tasks_file:
+                tasks = json.load(tasks_file)['tasks']
+            install_task = next(
+                task for task in tasks
+                if task['label'].startswith('install && deploy-target '))
+            task_results = self._run_vscode_task_with_dependencies(
+                tempdir, install_task['label'])
+            self.assertTrue(
+                any('Compiling cargo-example' in result.output
+                    for result in task_results),
+                'Cargo build task did not recompile the modified Rust source')
+            self._verify_rust_lldb_debugging(tempdir, expected_input=5)
+
     def _verify_rust_lldb_debugging(self, tempdir, expected_input):
         with open(os.path.join(tempdir, '.vscode', 'launch.json')) as launch_file:
             launch = json.load(launch_file)['configurations'][0]

-- 
2.53.0

