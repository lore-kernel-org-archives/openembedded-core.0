Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38887.1793004981811665345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=NZ2JHgal;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E3DB73D81833;
	Mon, 26 Oct 2026 04:56:20 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id JOzS0a6xe-0U; Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D566E3D81665;
	Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com D566E3D81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004979; bh=M1LIKssFdcbe94nCJnZdmFMs47hU4b3W7TGxC5v287A=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=NZ2JHgal6vN5cgio+ImTAtlYxkj9XdvgBGz/Fh32Qep5qgakBsuDlfNTYyl8VsfoI
	 fh7ZrDTbLz+DEnxUb4x+GK4hry9bsCA+dK27T7yghLva4bZby8rPPLiiar9J5Xl/bd
	 VzCfPajHsPEnEZCaT73MRA8o3QxFpFa+eNUtU54OcfwEaQ3MtMeKNLwEF9JHtE1MQJ
	 cCbIfN2VogLDty3o3FqmOxzSlyoWjvw806yu5cSYVCUhS0urb+/ZWSKrQ7BPaFVzMP
	 QdERrQbVVbEFVM4pb69vF1d/UCmJ8Dg7zsflx9LLep85C16638bAC7CLol3BNO0vGQ
	 w9l5HvjkZhClw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id N5OSjCGFLput; Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 53B3A3D81886;
	Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:55 +0100
Subject: [PATCH 17/20] oeqa/selftest: share source breakpoint lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-17-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248655

Move the stable source-line helper to the common ide-sdk test base so the
Rust CodeLLDB integration can reuse it. Preserve the rationale for using
marker-based lines instead of brittle hard-coded numbers.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ca76597bbe..99e6531877 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3133,6 +3133,20 @@ class DevtoolIdeSdkTests(DevtoolBase):
     def _sources_workdir_dir(self, src_dir):
         return os.path.realpath(os.path.join(src_dir, 'oe-workdir'))
 
+    def _find_source_break_line(self, tempdir, source_file, marker):
+        """Find the 1-based line number of `marker` in tempdir/source_file
+
+        Used to set a source-level (file:line) breakpoint at a stable,
+        self-documenting location instead of hard-coding a line number that
+        would silently go stale whenever the example source changes.
+        """
+        source_path = os.path.join(tempdir, source_file)
+        with open(source_path) as f:
+            for lineno, line in enumerate(f, start=1):
+                if marker in line:
+                    return lineno
+        self.fail("Could not find marker %r in %s" % (marker, source_path))
+
     def _find_multi_script_port(self, recipe_name, script_prefix, example_exe):
         """Discover the port assigned to a generated 'multi' mode debug-server
         script (gdbserver_*/lldb_server_*), since each --ide plugin allocates
@@ -4876,20 +4890,6 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
             self.assertTrue(task,
                             f"Configuration '{config_name}' preLaunchTask should not be empty")
 
-    def _find_source_break_line(self, tempdir, source_file, marker):
-        """Find the 1-based line number of `marker` in tempdir/source_file
-
-        Used to set a source-level (file:line) breakpoint at a stable,
-        self-documenting location instead of hard-coding a line number that
-        would silently go stale whenever the example source changes.
-        """
-        source_path = os.path.join(tempdir, source_file)
-        with open(source_path) as f:
-            for lineno, line in enumerate(f, start=1):
-                if marker in line:
-                    return lineno
-        self.fail("Could not find marker %r in %s" % (marker, source_path))
-
     def _lldb_debug_cpp_example_batch_commands(self, tempdir):
         """Get a list of lldb --batch '-o' commands to debug the cpp-example-lib example
 

-- 
2.53.0

