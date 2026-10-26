Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38886.1793004980472050747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 01:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=wrXgnWqj;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 91E343D81896;
	Mon, 26 Oct 2026 04:56:19 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id bVcolLKkvPEg; Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 338293D8187E;
	Mon, 26 Oct 2026 04:56:18 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 338293D8187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1793004978; bh=rrnEewBsKAjXM2aK/FIRI4NA7lrcGb58Im2xwYnT0TA=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=wrXgnWqjWNFlZHPNS3BB3+bTVDLoI/WgzLFjVTTEbe3eNFx2R3jm42EHn5O4npNSr
	 PyJdkOI8AJMw5m/cexCtklYGaMGQWLCVGgRYHRLEqM4R+3xFVJSkavRhUPMzfEPIYI
	 frNDLPeVMVx0qqiJLAw/gChnk74jR9otzadyChXt4fPJkvllYchUfvDZHoEr2HnN1C
	 39EagkJfBc4l1n9xj8UH/3KWKcTVXUYHI7JCp+QltJDcVBsYEwTCIaXb66H7ca5KNC
	 cxMX7TLbeJAgKuMnXO0D44eOHpeAM0jVppSO+OuJGnH+iQF6VxpMBo7vUEBwFFAMuH
	 +4VQfvpsRJKpw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id pXolrxfZrivB; Mon, 26 Oct 2026 04:56:17 -0400 (EDT)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 7CB123D81863;
	Mon, 26 Oct 2026 04:56:17 -0400 (EDT)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 26 Oct 2026 09:55:52 +0100
Subject: [PATCH 14/20] devtool: ide-sdk: remap Cargo sources for BitBake
 builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-devtool-ide-sdk-cargo-v1-14-d4504e124d07@savoirfairelinux.com>
References: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
In-Reply-To: <20261026-devtool-ide-sdk-cargo-v1-0-d4504e124d07@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248652

With devtool modify, Cargo sources can live outside WORKDIR, so the
standard Rust remaps leave the workspace path in DWARF and package QA
rejects the debug package. Append a workspace-specific remap to
RUST_DEBUG_REMAP in a managed bbappend section so repeated ide-sdk runs
restore and reparse it.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 scripts/lib/devtool/ide_sdk.py | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index f22a98cedf..9fd95f0a63 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -823,6 +823,7 @@ class RecipeModified:
     VALID_BASH_ENV_NAME_CHARS = re.compile(r"^[a-zA-Z0-9_]*$")
 
     MARKER = '# devtool ide-sdk: clangd toolchain support'
+    CARGO_REMAP_MARKER = '# devtool ide-sdk: Cargo source debug remap'
 
     # PROVIDES of recipes that are deployed via do_deploy (e.g. to
     # DEPLOY_DIR_IMAGE) rather than installed into the rootfs, so adding them
@@ -943,13 +944,14 @@ class RecipeModified:
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
+        """Add workspace-only IDE dependencies and Cargo debug path remaps."""
         wants_clang_native = (
             self.build_tool.is_c_cpp
             and self.ide_sdk_intellisense == 'clangd'
@@ -962,28 +964,44 @@ class RecipeModified:
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
 
-        if new_content == original_content:
+        # Managed sections were stripped before parsing, so compare against
+        # what BitBake parsed rather than the saved pre-strip contents.
+        if new_content == parsed_content:
             return False
 
         appends_dir = os.path.dirname(self.bbappend)
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

