Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6074.1794231922196809365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=UCC5hUlH;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 4CEB13D8176B;
	Mon,  9 Nov 2026 08:45:21 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id DvbqVrQqfGnF; Mon,  9 Nov 2026 08:45:20 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E94593D818F3;
	Mon,  9 Nov 2026 08:45:19 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E94593D818F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231920; bh=TJbL/Ug0+0fZ8oQ5yp5cr/FU1qS8tHB2OChIVDVKqQg=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=UCC5hUlH6qbS369AWMaBedWa4EqXAmN8AW1sR/8osRybvpfYygajTsLwkJbW/lhvW
	 C6tWy4SQlEj+0Uk7JhGsK7o0fNP1jQVR7Zo97mQQuT5X3GkvxMaXNP0G/FIOT8Agw5
	 WsyYTkboir7UjHHOWPVmapj974XL833YiYI4OCSp7yPUTBP9NvAO7XQE/cOXPublYv
	 oi4MI9ks+i/36+H6wtPSIVz+maml/hfhnnprj97gXJg/A+OctByWmgOIruJyKnlKJM
	 YuUfiVhKjueJQ+oHYQk2Hjv5l8g5kGsmqokcsjq6zuAqXOwmjRVGenDxPqXT1yVP5Q
	 H4Lac6JgAJVcg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id l15F38LbneYF; Mon,  9 Nov 2026 08:45:19 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 36AA93D818FC;
	Mon,  9 Nov 2026 08:45:19 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:29 +0100
Subject: [PATCH v2 12/18] devtool: ide-sdk: remap Cargo sources for BitBake
 builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-12-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249839

With devtool modify, Cargo sources can live outside WORKDIR, so the
standard Rust remaps leave the workspace path in DWARF and package QA
rejects the debug package. Append a workspace-specific remap to
RUST_DEBUG_REMAP in a managed bbappend section so repeated ide-sdk runs
restore and reparse it.

AI-Generated: Uses GitHub Copilot

---

Changes in v2:

- Revert bbappend comparison after stripping managed sections to avoid
  reparse when the ide-sdk section is not modified. I think there is a
  pre-existing bug with that logic however. An ide-sdk re-run leaves the
  stripped bbappend for clang and cargo classes. As a consequence, I
  simplified the Qemu selftest to no longer run ide-sdk twice.
---
 scripts/lib/devtool/ide_sdk.py | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 0ce2a7780e..5096297b32 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -831,6 +831,7 @@ class RecipeModified:
     VALID_BASH_ENV_NAME_CHARS = re.compile(r"^[a-zA-Z0-9_]*$")
 
     MARKER = '# devtool ide-sdk: clangd toolchain support'
+    CARGO_REMAP_MARKER = '# devtool ide-sdk: Cargo source debug remap'
 
     # PROVIDES of recipes that are deployed via do_deploy (e.g. to
     # DEPLOY_DIR_IMAGE) rather than installed into the rootfs, so adding them
@@ -951,13 +952,14 @@ class RecipeModified:
                 content = f.read()
             originals[name] = content
             stripped = cls._strip_marker_section(content, cls.MARKER)
+            stripped = cls._strip_marker_section(stripped, cls.CARGO_REMAP_MARKER)
             if stripped != content:
                 with open(bbappend, 'w') as f:
                     f.write(stripped)
         return originals
 
     def update_bbappend(self):
-        """Add DEPENDS on clang-native when clangd is used as only the IntelliSense engine"""
+        """Add workspace-only clang dependencies or Cargo debug path remaps."""
         wants_clang_native = (
             self.build_tool.is_c_cpp
             and self.ide_sdk_intellisense == 'clangd'
@@ -970,17 +972,27 @@ class RecipeModified:
         else:
             parsed_content = ''
 
-        if not wants_clang_native:
+        new_sections = []
+        if wants_clang_native:
+            new_sections.append(
+                self.MARKER + '\nDEPENDS:append = " clang-native"\n')
+        if self.build_tool is BuildTool.CARGO:
+            new_sections.append(
+                self.CARGO_REMAP_MARKER
+                + '\nRUST_DEBUG_REMAP:append = " '
+                '--remap-path-prefix=${S}=${TARGET_DBGSRC_DIR}"\n')
+
+        if not new_sections:
             if self.MARKER in original_content:
                 logger.info(
                     "Removed clangd toolchain support from %s: no longer needed", self.bbappend)
             return False
 
-        new_section = self.MARKER + '\nDEPENDS:append = " clang-native"\n'
         new_content = parsed_content
-        if new_content and not new_content.endswith('\n'):
-            new_content += '\n'
-        new_content += new_section
+        for section in new_sections:
+            if new_content and not new_content.endswith('\n'):
+                new_content += '\n'
+            new_content += section
 
         if new_content == original_content:
             return False
@@ -989,9 +1001,13 @@ class RecipeModified:
         os.makedirs(appends_dir, exist_ok=True)
         with open(self.bbappend, 'w') as f:
             f.write(new_content)
-        logger.info(
-            "Updated %s: added DEPENDS on clang-native, needed to stage clangd "
-            "for IDE_SDK_INTELLISENSE=\"clangd\"", self.bbappend)
+        if wants_clang_native:
+            logger.info(
+                "Updated %s: added DEPENDS on clang-native, needed to stage clangd "
+                "for IDE_SDK_INTELLISENSE=\"clangd\"", self.bbappend)
+        if self.build_tool is BuildTool.CARGO:
+            logger.info(
+                "Updated %s: remapped Cargo external sources for debug info", self.bbappend)
         return True
 
     def initialize(self, config, workspace, tinfoil):

-- 
2.53.0

