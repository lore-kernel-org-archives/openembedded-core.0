Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73107C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 07:11:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24616.1786345902456708403
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 00:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v7D5unim;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CFA0C1A151D;
	Mon, 10 Aug 2026 07:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A54AC6033B;
	Mon, 10 Aug 2026 07:11:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72F1A11C494BE;
	Mon, 10 Aug 2026 09:11:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786345896; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6SKb7j+uwiDWw8z0xiw1NvjSfhiZ6h0YxwIJWIMFTEY=;
	b=v7D5unimZss11tT0m8PPF8DLO30TO4AceontNl6y+OgpYgLm/Vz5krKoHBfChlAjYSXBFE
	C0cerBeJw/ImKbTtdIp2uujrrUcimVVTVEg7XKQ0K83rEkAbJZLbdvBHpPSTIhfPlVX1QP
	CZ8/ihC++3hbVNV8nLrkdMGW0335hVIKixpgGB9/7Y4Rd3e/bfvQSZSR4j3CdoQSHVaZTl
	YqNK1jsIItbXH48HPmBMjXdaAmT0he4aRSaUAd98aziEl4VWXBP+uunOj36Qxsb16t9tki
	9HXdTBt4r/uox8wALtoqcV/zCImAuPvE2kbWkXSWD1urPBsQqSP2EicCzgaIwQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 10 Aug 2026 09:11:21 +0200
Subject: [PATCH 2/2] package: fix source path in save_debugsources_info()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-fix-save-debugsources-info-v1-2-2e83131bcf01@bootlin.com>
References: <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
In-Reply-To: <20260810-fix-save-debugsources-info-v1-0-2e83131bcf01@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 daniel.turull@ericsson.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 07:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243114

Previously, except for a kernel recipe, the source file paths were never
"resolved" since the KERNEL_SRC_PATH variable is always defined. So in
the ${PN}-debugsources.json.zstd file the source file paths always started
with /usr/src/debug/${PN}/${PV} (which is the value of TARGET_DBGSRC_DIR).

Currently the debugsources.json file is only used by the spdx generation.
- In `get_patched_src()` the sources of the recipe are extracted (again).
  The unpack task is executed from a modified local context with UNPACKDIR
  set to the value of `${SPDXWORK}`. So in summary the sources are
  extracted in a sub-directory of `${SPDXWORK}`.
- In `add_package_files()`, with topdir equal to `${SPDXWORK}`, all the
  files (recursively) found in topdir are listed. For each source file,
  if the file path (relative to topdir) is in the list of source files
  retrieved by save_debugsources_info, then the file is added to the SPDX
  SBoM.

So try to handle that by replacing ${TARGET_DBGSRC_DIR} by the relative
path of ${S} relative to ${UNPACKDIR}. If ${S} is not relative to
${UNPACKDIR}, do nothing.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/lib/oe/package.py | 74 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 4a244ec9801e..229b9caa5d82 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1088,37 +1088,61 @@ def copydebugsources(debugsrcdir, sources, d):
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
+    def _resolve_source_path(p):
+        # In the common case, the sources are located in ${S}. To format them as
+        # expected by SPDX, we replace /usr/src/debug/${PN}/${PV} with the path
+        # of ${S} relative to ${UNPACKDIR}.
+        if dbgsrc_dir and srcdir_rel:
+            p = p.replace(f"{dbgsrc_dir}/", f"{srcdir_rel}/")
 
         # Kernel sources are in a different directory and are special case
         # we format the sources as expected by spdx by replacing /usr/src/kernel/
         # into BP/
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
+        if kernel_src and bp:
+            p = p.replace(f"{kernel_src}/", f"{bp}/")
+
+        return p
+
+    sources_dict = {}
+    for file, src_files in sources_raw:
+        file_clean = file.replace(f"{workdir}/package/", "")
+        sources_clean = [
+            _resolve_source_path(src)
+            for src in src_files
+            if not any(keyword in src for keyword in ("<internal>", "<built-in>")) and not src.endswith("/")
+        ]
+        sources_dict[file_clean] = sorted(sources_clean)
+    num_threads = int(d.getVar("BB_NUMBER_THREADS"))
+    with bb.compress.zstd.open(debugsources_file, "wt", encoding="utf-8", num_threads=num_threads) as f:
+        json.dump(sources_dict, f, sort_keys=True)
 
 @bb.parse.vardepsexclude("BB_NUMBER_THREADS")
 def read_debugsources_info(d):
@@ -1364,7 +1388,7 @@ def process_split_and_strip_files(d):
         copydebugsources(dv["srcdir"], sources, d)
 
         # Save source info to be accessible to other tasks
-        save_debugsources_info(dv["srcdir"], results, d)
+        save_debugsources_info(results, d)
     #
     # End of debug splitting
     #

-- 
2.55.0


