Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0748C61DD9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 21:49:24 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17149.1788126560349108171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 14:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=LUaX+kNi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-2026083021491943690d66ef00020764-j2xci8@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026083021491943690d66ef00020764
        for <openembedded-core@lists.openembedded.org>;
        Sun, 30 Aug 2026 23:49:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LlmPWDXi+dCOCO7+OaFxqFuhu/kGrmjhLHcFJrRu5gc=;
 b=LUaX+kNi1li3KTrrTHE2iRyHDdkB4kSruVYLQ8yn/b8HdPSvhvwqK/yZlVvz0QlqKn9/UV
 iq95t3tpXfEwGaqYrLPw5cbycsxh06CjzZisNi6Wn5MPK3/gdzxziilD4A6lTS9S+O4E+pRW
 Hn7VoOqDm0DDchHSEanfa6hwhC5HwyVrYw19kCLI8pS8XoHxlxj0xv5Rs5gnaDO9Bk0M/lA7
 FOymBYFxIZDEM46peQYrL6w+Bk+TdPXe6a2zMLBS8R+tRCTdYGdXh9DLuRU7SE5lecJeXsi1
 j023jPex3ii31RiRvkNy7ZU6Hoh8pdHKWXEg2M673JXdIooDKlUa0+nQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v2 25/25] devtool: ide-sdk: fix GDB loading stale libs instead of recipe's own build
Date: Sun, 30 Aug 2026 23:48:47 +0200
Message-ID: <20260830214912.1346063-26-adrian.freihofer@siemens.com>
In-Reply-To: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 21:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244724

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Setting GDB's sysroot to the recipe's D (image/) directory is often not
enough: D only contains "usr/lib", but the target reports merged-usr
paths like "/lib/libfoo.so.0", so the sysroot lookup fails and GDB
falls back to solib-search-path, resolving the library from the full
image's rootfs-dbg/rootfs instead. Recipes that install libraries
outside the standard libdir hit this on every rebuild, silently
debugging with stale symbols from the last full image build. Confirmed
against gdb-17.2 gdb/solib.c (solib_find_1()) by capturing the GDB MI
trace of an attach session and cross-checking against that code.

Fix: add RecipeModified._find_elf_dirs(), which walks D and returns
every directory containing an ELF file, and prepend those directories
to additionalSOLibSearchPath, ahead of the rootfs-dbg/rootfs entries,
in every generated launch config.

Also extend the launch.json oe-selftest assertions to check that the
first additionalSOLibSearchPath entry is the recipe's own image (D)
directory, not rootfs-dbg.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  6 ++++
 scripts/lib/devtool/ide_sdk.py          | 42 ++++++++++++++++++++-----
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8d68809552..7d7d228b22 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3733,6 +3733,12 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             so_paths = config.get("additionalSOLibSearchPath", [])
             self.assertIn("/.debug", so_paths, f"Configuration '{config['name']}' should include debug symbol paths")
             self.assertIn("/rootfs-dbg/", so_paths, f"Configuration '{config['name']}' should include rootfs-dbg paths")
+            # The recipe's own D/usr/lib must come first, so GDB's solib-search-path
+            # basename fallback prefers freshly rebuilt libraries over a stale
+            # rootfs-dbg/rootfs copy from the last full image build.
+            first_so_path = so_paths.split(":", 1)[0]
+            self.assertIn("/image/", first_so_path, f"Configuration '{config['name']}' first SO lib search path should be the recipe's own image dir: {first_so_path}")
+            self.assertNotIn("rootfs-dbg", first_so_path, f"Configuration '{config['name']}' first SO lib search path should not be rootfs-dbg: {first_so_path}")
 
             # Verify source file mappings
             source_map = config.get("sourceFileMap", {})
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 8090117959..c2e7a34b7a 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -939,27 +939,53 @@ class RecipeModified:
             return True
         return False
 
+    @staticmethod
+    def _find_elf_dirs(root):
+        """Return every directory under root that contains an ELF file"""
+        elf_dirs = []
+        for dirpath, _dirnames, filenames in os.walk(root):
+            for filename in filenames:
+                file_path = os.path.join(dirpath, filename)
+                if os.path.islink(file_path):
+                    continue
+                try:
+                    with open(file_path, 'rb') as elf_file:
+                        is_elf = elf_file.read(4) == b'\x7fELF'
+                except OSError:
+                    continue
+                if is_elf:
+                    elf_dirs.append(dirpath)
+                    break
+        return elf_dirs
+
     def solib_search_path(self, image):
-        """Search for debug symbols in the rootfs and rootfs-dbg
+        """Search for debug symbols
 
         The debug symbols of shared libraries which are provided by other packages
         are grabbed from the -dbg packages in the rootfs-dbg.
-
         But most cross debugging tools like gdb, perf, and systemtap need to find
         executable/library first and through it debuglink note find corresponding
         symbols file. Therefore the library paths from the rootfs are added as well.
 
         Note: For the devtool modified recipe compiled from the IDE, the debug
-        symbols are taken from the unstripped binaries in the image folder.
-        Also, devtool deploy-target takes the files from the image folder.
-        debug symbols in the image folder refer to the corresponding source files
-        with absolute paths of the build machine. Debug symbols found in the
-        rootfs-dbg are relocated and contain paths which refer to the source files
-        installed on the target device e.g. /usr/src/...
+        symbols are taken from the unstripped binaries in the image=${D} directory.
+        Also, devtool deploy-target takes the files from the image directory.
+        This recipe's own D is searched (for ELF files, wherever they are
+        installed) and listed first, ahead of rootfs-dbg/rootfs, so that this
+        recipe's freshly rebuilt libraries take precedence over any stale copy
+        from the last full image build. "set sysroot D" alone cannot achieve
+        this: the target reports merged-usr paths (e.g. "/lib/libfoo.so.0"), but
+        D only contains "usr/lib" (raw do_install output, no top-level "lib"
+        symlink), so GDB's sysroot-prefixed lookup always fails open() and it
+        falls back to solib-search-path's basename matching instead. This also
+        does not work for libraries which are not installed into the standard
+        libdirs.
         """
         base_libdir = self.base_libdir.lstrip('/')
         libdir = self.libdir.lstrip('/')
         so_paths = [
+            # This recipe's own rebuilt libraries/plugins, ahead of rootfs-dbg/rootfs.
+            *self._find_elf_dirs(self.d),
             # debug symbols for package_debug_split_style: debug-with-srcpkg or .debug
             os.path.join(image.rootfs_dbg, base_libdir, ".debug"),
             os.path.join(image.rootfs_dbg, libdir, ".debug"),
-- 
2.55.0


