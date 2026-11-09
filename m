Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6197.1794231923590750331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=u5zhGJrR;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AEAD33D818F9;
	Mon,  9 Nov 2026 08:45:22 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id zYJZ-xdxwcmN; Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AC42E3D80F35;
	Mon,  9 Nov 2026 08:45:21 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com AC42E3D80F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231921; bh=wLnXzdNitA2vxndp/qoR1rZuR4DEoMybexn+RauOHUE=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=u5zhGJrRDs7AyrcxU2noGq5bq5uDtu+aaRzWfXEcwLHfR3Q79E1Fkn6lQMuIYNwXl
	 cLejLA+wGZ86y50Qk0btWyYnS7C5b14Y9RfD5TT0gDRRRZRbtlURF/C24uCm7MYeA+
	 8ty8WpTHsatB3sXBWz1s7F2zycJlIoSG4Fl+BBlpvaJMgeqCKkQwtk53QLD5D1EHrH
	 g/G68WcxxSrS17fx3Cws/eabHZHEdNrr8/cNVNIDZfO0jidACcmHU6rXL6KY7BYG2h
	 vPZ/bPMIJgg01luhgKBof4rBUQEuA1l7hGCeMkjVoRI5DnLLztG5EyLNvLCmAIP/En
	 W3w3QpolIGPnQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id MWqLjBpU6out; Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id EC5DB3D8182D;
	Mon,  9 Nov 2026 08:45:20 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:32 +0100
Subject: [PATCH v2 15/18] oeqa/selftest: share source breakpoint lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-15-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249842

Move the stable source-line helper to the common ide-sdk test base so the
Rust CodeLLDB integration can reuse it. Preserve the rationale for using
marker-based lines instead of brittle hard-coded numbers.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3b80d6a4a8..f0bfa5ce27 100644
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
@@ -4860,20 +4874,6 @@ class DevtoolIdeSdkClangTests(DevtoolIdeSdkTests):
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

