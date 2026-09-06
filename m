Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 890C6C79F99
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 21:03:23 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21346.1788728596370200145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 14:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=B/lqKg85;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260906210313f7c32f03250002075d-0hvwa_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260906210313f7c32f03250002075d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 06 Sep 2026 23:03:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2p7gAouxJn7TOWyp36zRSZg68tD3dgL3mff1NdheCuM=;
 b=B/lqKg85bwLbCesJOx/MpjyJK3I2GlH1TXLwXKZ3H1cBkG49lkuhe7bSdSNXuEjE92Li8d
 uyX+MMSa7EHMwgEWM6CHUTvUljWkXBknTG81RiXGpxe6YkfIqc01qlH+Jp2bpv+4lpejLiwz
 bHLHPp2WZQQ5P8Xujg+WwlthZEMzxqkMZUEpQeMmfQ7Nk3tCDu0to42R2HUr+FdpAC/ibjJ7
 06nS+MCnD6ZNdJEcYRgZw2uN8bKO/tErPx5k76aE7jh9Yjeskbe8DkZKxDp74cYypNvT0tGZ
 XY79H5Df9W1fyjNV7F4GMzZxTJJ5hKVcDlWx3Bs42TDJ3zJF2cOYO0eA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/9] devtool: ide-sdk: fix GDB loading stale libs instead of recipe's own build
Date: Sun,  6 Sep 2026 23:01:59 +0200
Message-ID: <20260906210307.2793974-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
References: <20260906210307.2793974-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 21:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245214

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
in every generated launch config. Since with usrmerge in
DISTRO_FEATURES (the default) base_libdir and libdir resolve to the
same path, this can introduce literal duplicates in the list; dedupe
with list(dict.fromkeys(...)) instead of a set, since the order of
the list is essential: it defines GDB's solib-search-path priority.

Also extend the launch.json oe-selftest assertions to check that the
first additionalSOLibSearchPath entry is the recipe's own image (D)
directory, not rootfs-dbg.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py |  5 ++
 scripts/lib/devtool/ide_sdk.py          | 62 +++++++++++++++++--------
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3e0eb7948f..de59feadb8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -3591,6 +3591,11 @@ class DevtoolIdeSdkGccTests(DevtoolIdeSdkTests):
             so_paths = config.get("additionalSOLibSearchPath", [])
             self.assertIn("/.debug", so_paths, f"Configuration '{config['name']}' should include debug symbol paths")
             self.assertIn("/rootfs-dbg/", so_paths, f"Configuration '{config['name']}' should include rootfs-dbg paths")
+            # The recipe's own D/usr/lib must come first, so GDB's solib-search-path basename fallback
+            # prefers freshly rebuilt libraries over a stale rootfs-dbg/rootfs copy from the last full image build.
+            first_so_path = so_paths.split(":", 1)[0]
+            self.assertIn("/image/", first_so_path, f"Configuration '{config['name']}' first SO lib search path should be the recipe's own image dir: {first_so_path}")
+            self.assertNotIn("rootfs-dbg", first_so_path, f"Configuration '{config['name']}' first SO lib search path should not be rootfs-dbg: {first_so_path}")
 
             # Verify source file mappings
             source_map = config.get("sourceFileMap", {})
diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9225546c5e..6558137134 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -827,27 +827,50 @@ class RecipeModified:
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
 
-        The debug symbols of shared libraries which are provided by other packages
-        are grabbed from the -dbg packages in the rootfs-dbg.
+        This recipe's own D is searched (for ELF files, wherever they are
+        installed), so that this recipe's freshly rebuilt libraries take
+        precedence over any stale copy from the last full image build.
+        "set sysroot D" alone cannot achieve this: GDB's sysroot (tested with
+        GDB 17.2) only matches "/lib" paths, but D usually only contains
+        "usr/lib" (no top-level "lib" symlink), so it falls back to
+        solib-search-path's basename matching instead. This also covers
+        libraries not installed into the standard libdirs.
 
-        But most cross debugging tools like gdb, perf, and systemtap need to find
-        executable/library first and through it debuglink note find corresponding
-        symbols file. Therefore the library paths from the rootfs are added as well.
-
-        Note: For the devtool modified recipe compiled from the IDE, the debug
-        symbols are taken from the unstripped binaries in the image folder.
-        Also, devtool deploy-target takes the files from the image folder.
-        debug symbols in the image folder refer to the corresponding source files
-        with absolute paths of the build machine. Debug symbols found in the
-        rootfs-dbg are relocated and contain paths which refer to the source files
-        installed on the target device e.g. /usr/src/...
+        D is listed first, ahead of rootfs-dbg/rootfs. For every other
+        library, i.e. one provided by another package, debug symbols are
+        grabbed from the -dbg packages in rootfs-dbg. gdb, perf, and
+        systemtap need to find the executable/library itself first, and
+        through its debuglink find the symbols file, so the plain rootfs
+        paths are added too.
         """
         base_libdir = self.base_libdir.lstrip('/')
         libdir = self.libdir.lstrip('/')
-        so_paths = [
+        # dedupe (e.g. base_libdir = libdir) while keeping the order (using dict instead of set)
+        so_paths = dict.fromkeys([
+            # This recipe's own rebuilt libraries/plugins, ahead of rootfs-dbg/rootfs.
+            *self._find_elf_dirs(self.d),
             # debug symbols for package_debug_split_style: debug-with-srcpkg or .debug
             os.path.join(image.rootfs_dbg, base_libdir, ".debug"),
             os.path.join(image.rootfs_dbg, libdir, ".debug"),
@@ -858,13 +881,12 @@ class RecipeModified:
             # With image-combined-dbg.bbclass the binaries are copied into rootfs-dbg
             os.path.join(image.rootfs_dbg, base_libdir),
             os.path.join(image.rootfs_dbg, libdir),
-            # Without image-combined-dbg.bbclass the binaries are only in rootfs.
-            # Note: Stepping into source files located in rootfs-dbg does not
-            #       work without image-combined-dbg.bbclass yet.
+            # Without image-combined-dbg.bbclass the binaries are only in rootfs
+            # (stepping into rootfs-dbg sources needs image-combined-dbg.bbclass)
             os.path.join(image.rootfs, base_libdir),
             os.path.join(image.rootfs, libdir)
-        ]
-        return so_paths
+        ])
+        return list(so_paths)
 
     def solib_search_path_str(self, image):
         """Return a : separated list of paths usable by GDB's set solib-search-path"""
-- 
2.55.0


