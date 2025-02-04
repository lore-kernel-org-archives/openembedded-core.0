Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363AAC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 10:37:47 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web10.113684.1738665461139127332
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 02:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=cBN+LTx3;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tfGJH-0004We-NZ; Tue, 04 Feb 2025 05:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=XGPX3Xe3rovtrt+NpSl2N3rwSJHiArkxGZfgM9RUWPw=; b=cBN+LTx35DTl3C
	FH2AFzEDZK1ONliNV7FDbANaE7XSbeUDCdAWd3uqW/r58f9u/a8Kzg3G38jNr0soX+V7UxwGblTLM
	GxXHjK3iRaIBQNR4tWXZA8p3G5qySan+iAnsUe8F4mZqAF8a71ZZyX/SwnzXsBgguBaZRGvgbZQGd
	JK9FN3doztkwCWlmJRxzb7CBwwut0tohXZKFy6QkFAs9Rd5cvcMsR2ydqst89q+PR599w92R5Ec25
	sBwqfjXN/XaQVX2/vvgzO1/7PQ9SKu3/6163/tqmu8jfI82i7MgVggygKJO0rA3nVtumbOf9THWLn
	92z6+9ute++/i9hyp2qQ==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v2] lib/oe/package: Add strip keep-section support
Date: Tue,  4 Feb 2025 11:37:44 +0100
Message-ID: <20250204103744.27883-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210762

Add a 'PACKAGE_KEEP_SECTIONS' variable to keep some specific ELF sections
while stripping binaries and libraries.

That one can then be used to keep the .debug_frame section around for
example, this way:

PACKAGE_KEEP_SECTIONS = ".debug_frame"

By using libunwind + minidebuginfo, that provides a way for users to get
debug_frame based backtraces on target.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
v1: https://lists.openembedded.org/g/openembedded-core/message/209545
documentation: https://lists.yoctoproject.org/g/docs/message/6243

 meta/classes-global/staging.bbclass |  4 +++-
 meta/classes-recipe/kernel.bbclass  |  2 +-
 meta/lib/oe/package.py              | 23 +++++++++++++----------
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 1008867a6c..7083878c73 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -91,10 +91,12 @@ python sysroot_strip () {
     base_libdir = d.getVar("base_libdir")
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP:' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
+    keep_sections = d.getVar('PACKAGE_KEEP_SECTIONS') or ""
 
     max_process = oe.utils.get_bb_number_threads(d)
     oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
-                           qa_already_stripped=qa_already_stripped)
+                           qa_already_stripped=qa_already_stripped,
+                           keep_sections=keep_sections)
 }
 
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 617727a989..d3d3d9fa65 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -770,7 +770,7 @@ python do_strip() {
     if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
         kernel_image_stripped = kernel_image + ".stripped"
         shutil.copy2(kernel_image, kernel_image_stripped)
-        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
+        oe.package.runstrip((kernel_image_stripped, 8, strip), '', extra_sections)
         bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
             extra_sections)
 }
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1af10b7eb0..468f331fce 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -18,7 +18,7 @@ import shutil
 
 import oe.cachedpath
 
-def runstrip(arg):
+def runstrip(arg, keep_sections='', extra_strip_sections=''):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
     #
@@ -27,12 +27,7 @@ def runstrip(arg):
     # 4 - executable
     # 8 - shared library
     # 16 - kernel module
-
-    if len(arg) == 3:
-        (file, elftype, strip) = arg
-        extra_strip_sections = ''
-    else:
-        (file, elftype, strip, extra_strip_sections) = arg
+    (file, elftype, strip) = arg
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -60,6 +55,10 @@ def runstrip(arg):
             for section in extra_strip_sections.split():
                 stripcmd.extend(["--remove-section=" + section])
 
+    if keep_sections != '' and not elftype & 16:
+        for section in keep_sections.split():
+            stripcmd.extend(["--keep-section=" + section])
+
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
@@ -115,7 +114,8 @@ def is_static_lib(path):
             return start == magic
     return False
 
-def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_already_stripped=False):
+def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_already_stripped=False,
+                keep_sections=''):
     """
     Strip executable code (like executables, shared libraries) _in_place_
     - Based on sysroot_strip in staging.bbclass
@@ -194,7 +194,8 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_alre
         elf_file = int(elffiles[file])
         sfiles.append((file, elf_file, strip_cmd))
 
-    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process)
+    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process,
+                                    extraargs=(keep_sections, ''))
 
 TRANSLATE = (
     ("@", "@at@"),
@@ -1305,7 +1306,9 @@ def process_split_and_strip_files(d):
             for f in staticlibs:
                 sfiles.append((f, 16, strip))
 
-        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
+        keep_sections = d.getVar('PACKAGE_KEEP_SECTIONS') or ""
+        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d,
+                                     extraargs=(keep_sections, ''))
 
     # Build "minidebuginfo" and reinject it back into the stripped binaries
     if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True, False, d):
-- 
2.25.1


