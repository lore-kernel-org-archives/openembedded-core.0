Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38885.1793004979402215349
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=TjDFlYoe;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 782893D81863;
	Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id o58oj3YgpKAY; Mon, 26 Oct 2026 04:56:17 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6D13C3D81833;
	Mon, 26 Oct 2026 04:56:17 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 6D13C3D81833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004977; bh=EKARW0KVqwqLfOu5u2y+ECXis1USBBQhcYj1kADBvQc=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=TjDFlYoerVR7YZTBZFiz9ND7ElRUwf9GAShH1ggugCJTgqYykXx66SaAvAypdVmco
	 EQaMWfw4avneiCNLDIuqjj7JD9Em+IqFyqdpAc0nu86duxceD9r3SKkFIouBlkRfuK
	 OJH1rw5hl2weiq3GsstemTGEQ8AcZvB3zw1WHlf9szpORkZ9nXhUVuWWA0BziIimiw
	 61pOcDYljZTIhNmKBgW7ywWw244UBlJ/VKeCX0CXUiOBe5hEKTgZukmRdy5Zp4wopz
	 pbGY/9m1knoxPlqG3I3BZbqLYmK6zriH8LfsM2hC+Vdhms0QbE8UpysxWo0kBypZMy
	 HxzgWI7Pj5+ig==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VgI_3mzybGgg; Mon, 26 Oct 2026 04:56:17 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DCA1A3D8187E;
	Mon, 26 Oct 2026 04:56:16 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:51 +0100
Subject: [PATCH 13/20] devtool: ide-sdk: parse Rust debug path remaps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-13-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248650

Use Cargo RUSTFLAGS to populate reverse debug mappings and recognize Rust
--remap-path-prefix alongside the existing GCC prefix-map options. The
following LLDB source-map change depends on these normalized mappings.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_sdk.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 44429e80b0..f22a98cedf 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1140,6 +1140,9 @@ class RecipeModified:
         if self.build_tool is BuildTool.KERNEL_MODULE:
             self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
                 self.kernel_cc)
+        elif self.build_tool is BuildTool.CARGO:
+            self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
+                self.cargo_rustflags)
         else:
             self.reverse_debug_prefix_map = self._init_reverse_debug_prefix_map(
                 recipe_d.getVar('DEBUG_PREFIX_MAP'))
@@ -1292,15 +1295,20 @@ class RecipeModified:
         return ':'.join(self.solib_search_path(image))
 
     def _init_reverse_debug_prefix_map(self, debug_prefix_map):
-        """Parses GCC map options and returns a mapping of target to host paths.
+        """Parses compiler map options and returns a mapping of target to host paths.
 
-        This function scans a string containing GCC options such as -fdebug-prefix-map,
+        This function scans a string containing compiler options such as -fdebug-prefix-map,
         -fmacro-prefix-map, and -ffile-prefix-map (in both '--option value' and '--option=value'
         forms), extracting all mappings from target paths (used in debug info) to host source
         paths. If multiple mappings for the same target path are found, the most suitable
         host path is selected (preferring 'sources' over 'build' directories).
         """
-        prefixes = ("-fdebug-prefix-map", "-fmacro-prefix-map", "-ffile-prefix-map")
+        prefixes = (
+            "-fdebug-prefix-map",
+            "-fmacro-prefix-map",
+            "-ffile-prefix-map",
+            "--remap-path-prefix",
+        )
         all_mappings = {}
         args = shlex.split(debug_prefix_map)
         i = 0

-- 
2.53.0

