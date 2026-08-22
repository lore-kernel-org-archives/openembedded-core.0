Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CA4C5DF97
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 09:47:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3974.1787392027584984660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 02:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=uKhhptud;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 564D34E4132B;
	Sat, 22 Aug 2026 09:47:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 124F7604C4;
	Sat, 22 Aug 2026 09:47:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B156211C77977;
	Sat, 22 Aug 2026 11:46:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787392020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=mPM4CMAy7MO59Bm6w2uiXqF/H2YwuGsCKh0sOku66Ts=;
	b=uKhhptud+D3a3C78dpgQhWGzZv4A8N31B8JDkgdGJsuDnRpOajpyohzmAzvfLHs1PIxURW
	qRYeioXTe2ZUCP4CQUxkOC7uO6jWu5QXSWeM2fW7uDiaPUw2nREwzHjYvS/Hx8e2hB2rO6
	MKGZv9kx6WjIhOi3ctdlUgmfXn8AdoQODJToYLhE0CZ9iMYPXvxfY88VFfHdvbRmYO10rn
	k7D8Bt0KFWdYKGRvVyTi6cBRv97BlyRXexAuqDbCKFcdGBQ0zS6+kdEk4uIj0dltrSKnr8
	N+p9eB54c/qXeMXD/Sc2eeHorDV6ubna9n9XOURckPx0cPf52x/wxgIM8eSi8A==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Sat, 22 Aug 2026 11:46:48 +0200
Subject: [PATCH v2] package: no longer modify paths in
 save_debugsources_info()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-fix-save-debugsources-info-v2-1-34fe2bd460dc@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBAAv2J6dk1bDCGe/Ifh0JYF1mjXdKHRE
 P5uwQ94nGQysyjBRCjqclhUwkxCHAvY40GF0cUBgbrCympb68Zo6OkN4jJCh34ehOcUUIBiz+C
 bTrtwRmd1rUrglbDYe/zW/lhmf8cwbcXNGEkmTp/9ns3m/TXKBjRYbCpTGR96ba6eeXpQPAV+q
 nZd1y9sgmLV2AAAAA==
X-Change-ID: 20260810-fix-save-debugsources-info-b8d0ac4ea206
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 daniel.turull@ericsson.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 09:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243971

The source files saved in `${PN}-debugsources.json.zstd` are now saved as
is: "/usr/src/kernel/" is no longer replaced by "${BP}/". However, the
file list is still filtered to exclude "<internal>" or "<built-in>", ...

With this modification, the content of `${PN}-debugsources.json.zstd`
is no longer specific or tied to SPDX generation.

The logic that modified the source file paths to match what SPDX
generation expects is now in `oe.spdx_common.get_compiled_sources()`.

Furthermore, previously, for all non-kernel recipes the source paths were
never "resolved", since the KERNEL_SRC_PATH variable is always defined.
So the returned source file paths always started with
`/usr/src/debug/${PN}/${PV}` (the value of TARGET_DBGSRC_DIR).

Update the source file paths to match what the SPDX generation expects:
- In `get_patched_src()`, the sources of the recipe are extracted
  (again). The unpack task runs in a modified local context with
  UNPACKDIR set to the value of `${SPDXWORK}`, so the sources end up
  extracted in a sub-directory of `${SPDXWORK}`.
- In `add_package_files()`, all files below topdir, set to `${SPDXWORK}`,
  are (recursively) listed. For each source file, if its path (relative
  to topdir) is in the list returned by `get_compiled_sources()`, the
  file is added to the SPDX SBoM.

Handle this by replacing ${TARGET_DBGSRC_DIR} with the relative path of
${S} relative to ${UNPACKDIR}. If ${S} is not relative to ${UNPACKDIR},
do nothing.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
The overall goal of this series is to fix SPDX SBoM generation in such a way
that it correctly includes compiled sources for "normal" recipes (a recipe
which does not inherit the kernel class).

This was tested with the busybox recipe. The following command list the
effective list of compiled sources.

python3 -m json.tool \
  tmp/deploy/spdx/3.0.1/cortexa15t2hf-neon/builds/build-busybox.spdx.json | \
  grep -F '.c"'

This is the same list (however without the same prefix) as the extracted
sources from the debug symbol:

zstdcat tmp/pkgdata/qemuarm/debugsources/busybox-debugsources.json.zstd | \
  python3 -m json.tool
---
Changes in v2:
- No longer modify the source file paths in debugsources.json.zstd
- Move the logic in oe.spdx_common.get_compiled_sources()
- Link to v1: https://patch.msgid.link/20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com
---
 meta/lib/oe/package.py     | 54 +++++++++++++++++++++-------------------------
 meta/lib/oe/spdx_common.py | 42 ++++++++++++++++++++++++++++++------
 2 files changed, 61 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4a244ec9801e..551681d4e153 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1088,37 +1088,33 @@ def copydebugsources(debugsrcdir, sources, d):
                 os.rmdir(p)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
-def save_debugsources_info(debugsrcdir, sources_raw, d):
+def save_debugsources_info(sources_raw, d):
     import json
     import bb.compress.zstd
-    if debugsrcdir and sources_raw:
-        debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
-        debugsources_dir = os.path.dirname(debugsources_file)
-        if not os.path.isdir(debugsources_dir):
-            bb.utils.mkdirhier(debugsources_dir)
-        bb.utils.remove(debugsources_file)
 
-        workdir = d.getVar("WORKDIR")
-        pn = d.getVar('PN')
-
-        # Kernel sources are in a different directory and are special case
-        # we format the sources as expected by spdx by replacing /usr/src/kernel/
-        # into BP/
-        kernel_src = d.getVar('KERNEL_SRC_PATH')
-        bp = d.getVar('BP')
-        sources_dict = {}
-        for file, src_files in sources_raw:
-            file_clean = file.replace(f"{workdir}/package/","")
-            sources_clean = [
-                src.replace(f"{debugsrcdir}/{pn}/", "")
-                if not kernel_src else src.replace(f"{kernel_src}/", f"{bp}/")
-                for src in src_files
-                if not any(keyword in src for keyword in ("<internal>", "<built-in>")) and not src.endswith("/")
-            ]
-            sources_dict[file_clean] = sorted(sources_clean)
-        num_threads = int(d.getVar("BB_NUMBER_THREADS"))
-        with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
-            json.dump(sources_dict, f, sort_keys=True)
+    if not sources_raw:
+        return
+
+    debugsources_file = d.expand("${PKGDESTWORK}/debugsources/${PN}-debugsources.json.zstd")
+    debugsources_dir = os.path.dirname(debugsources_file)
+    if not os.path.isdir(debugsources_dir):
+        bb.utils.mkdirhier(debugsources_dir)
+    bb.utils.remove(debugsources_file)
+
+    workdir = d.getVar("WORKDIR")
+
+    def _filter_src_file(src):
+        if src.endswith("/"):
+            return False
+        return not any(keyword in src for keyword in ("<internal>", "<built-in>"))
+
+    sources_dict = {}
+    for file, src_files in sources_raw:
+        file_clean = file.replace(f"{workdir}/package/", "")
+        sources_dict[file_clean] = sorted(filter(_filter_src_file, src_files))
+    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+    with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+        json.dump(sources_dict, f, sort_keys=True)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def read_debugsources_info(d):
@@ -1364,7 +1360,7 @@ def process_split_and_strip_files(d):
         copydebugsources(dv["srcdir"], sources, d)
 
         # Save source info to be accessible to other tasks
-        save_debugsources_info(dv["srcdir"], results, d)
+        save_debugsources_info(results, d)
     #
     # End of debug splitting
     #
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index e40cf36bba18..f885f1832ae3 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -277,14 +277,44 @@ def get_compiled_sources(d):
         bb.debug(1, "Do not have debugsources.list. Skipping")
         return [], []
 
-    # Sources are not split now in SPDX, so we aggregate them
-    sources = set(itertools.chain.from_iterable(source_info.values()))
-    # Check extensions of files
+    unpackdir = d.getVar("UNPACKDIR")
+    srcdir = d.getVar("S")
+    bp = d.getVar("BP")
+    kernel_src = d.getVar("KERNEL_SRC_PATH")
+    dbgsrc_dir = d.getVar("TARGET_DBGSRC_DIR")
+
+    # Compute the relative path of source directory from ${UNPACKDIR}.
+    # The goal is to replace ${TARGET_DBGSRC_DIR} by this relative path.
+    srcdir_rel = None
+    if srcdir and unpackdir:
+        srcdir_rel = os.path.relpath(srcdir, unpackdir)
+        if srcdir_rel.startswith(".."):
+            srcdir_rel = None
+
+    sources = set()
     types = set()
-    for src in sources:
+
+    # Sources are not split now in SPDX, so we aggregate them
+    for src in set(itertools.chain.from_iterable(source_info.values())):
+        # In the common case, the sources are located in ${S}. To format them as
+        # expected by SPDX, we replace /usr/src/debug/${PN}/${PV} with the path
+        # of ${S} relative to ${UNPACKDIR}.
+        if dbgsrc_dir and srcdir_rel:
+            src = src.replace(f"{dbgsrc_dir}/", f"{srcdir_rel}/")
+
+        # Kernel sources are in a different directory and are special case
+        # we format the sources as expected by spdx by replacing /usr/src/kernel/
+        # into ${BP}/
+        if kernel_src and bp:
+            src = src.replace(f"{kernel_src}/", f"{bp}/")
+
+        sources.add(src)
+
+        # Check extensions of files
         basename = os.path.basename(src)
         ext = basename.partition(".")[2]
-        if ext not in types and ext:
+        if ext:
             types.add(ext)
-    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {str(types)}")
+
+    bb.debug(1, f"Num of sources: {len(sources)} and types: {len(types)} {types!s}")
     return sources, types

---
base-commit: 7944665886cb0bf881807a5d849ebdf42a33d1bf
change-id: 20260810-fix-save-debugsources-info-b8d0ac4ea206

Best regards,
--  
Benjamin Robin <benjamin.robin@bootlin.com>


