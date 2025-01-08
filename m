Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B09E7719B
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 10:20:10 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.14015.1736321953898474580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 23:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=h2sZAKoc;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1tVQel-0007JL-UD
	for openembedded-core@lists.openembedded.org; Wed, 08 Jan 2025 02:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=TjNIBvxAoLRGXjOSwIK7GKTI5V+I2MRxeJXFkYo94jM=; b=h2sZAKocqEjRQ/
	jO4gVYWqUcDAGFHrENfu+7sbb+njV0QTsF6QGslUrzqCN7cQzNJPEAohe9Usy3GgIaOuP40bsQ79W
	1mKztKE9vG2Kzneq8EWey4+nTaIx8tbM0PKsDP0d/CI7OiEN3jQ7NyHEPuj/stR8IcgMvKskU6FwW
	bBvPMKrmmvc/3Jl8Zk5diSeeHcEJeiWtinTTxgX7Ye5Vics/aoFWEhpQe9B8qjWNXYTPauNXa7oCj
	1uyQh+tYz1OBaA8H5dzXEiwGj52D/B0PxBLp7BcSW7iqX56zEceNs0cMPMtOeP7wPC64qG9+Pqpp+
	I3bCBMga7QIJeXVLIX1A==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH] lib/oe/package: Add debug_frame support
Date: Wed,  8 Jan 2025 08:39:20 +0100
Message-ID: <20250108073921.15856-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 10:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209545

On ARMv7, the .ARM.extab and .ARM.exidx unwinding sections are not providing
support to get full backtraces on C++ exceptions:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941

In addition to those unwinding sections, GCC is providing unwinding
instructions in DWARF format for ARMv7 binaries under the .debug_frame
section.

By instructing 'strip' not to remove the .debug_frame section, one can use
libunwind on the .debug_frame section to get full backtraces on C++
exceptions:

Unexpected exception caught!
Backtrace:
  0x4b0c7d: unexpected_handler() + 0x1b
  0xb6dded55: __cxxabiv1::__terminate(void (*)()) + 0x3
  0xb6ddedb7: std::terminate() + 0x9
  0xb6ddf023: __cxa_rethrow + 0x2d
  0x4b0c61: uncaught_function() + 0x7
  0x4b0c9f: main + 0x11
  0xb6c317c7: __libc_start_call_main + 0x41
  0xb6c31871: __libc_start_main + 0x5f
  0x4b0901: _start + 0x27

Add a 'PACKAGE_KEEP_DEBUG_FRAME' variable to keep the .debug_frame section
around. By using libunwind + minidebuginfo, that provides a way for ARMv7
Yocto users to get full backtraces on C++ exceptions, on target.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 meta/classes-global/staging.bbclass |  4 +++-
 meta/classes-recipe/kernel.bbclass  |  2 +-
 meta/lib/oe/package.py              | 22 ++++++++++++----------
 3 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index c2213ffa2b..d9ccf32a73 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -91,10 +91,12 @@ python sysroot_strip () {
     base_libdir = d.getVar("base_libdir")
     qa_already_stripped = 'already-stripped' in (d.getVar('INSANE_SKIP:' + pn) or "").split()
     strip_cmd = d.getVar("STRIP")
+    keep_debug_frame = (d.getVar('PACKAGE_KEEP_DEBUG_FRAME') == '1')
 
     max_process = oe.utils.get_bb_number_threads(d)
     oe.package.strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process,
-                           qa_already_stripped=qa_already_stripped)
+                           qa_already_stripped=qa_already_stripped,
+                           keep_debug_frame=keep_debug_frame)
 }
 
 do_populate_sysroot[dirs] = "${SYSROOT_DESTDIR}"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index a7c4bf0ef4..b052b71be7 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -770,7 +770,7 @@ python do_strip() {
     if (extra_sections and kernel_image.find(d.getVar('KERNEL_IMAGEDEST') + '/vmlinux') != -1):
         kernel_image_stripped = kernel_image + ".stripped"
         shutil.copy2(kernel_image, kernel_image_stripped)
-        oe.package.runstrip((kernel_image_stripped, 8, strip, extra_sections))
+        oe.package.runstrip((kernel_image_stripped, 8, strip), False, extra_sections)
         bb.debug(1, "KERNEL_IMAGE_STRIP_EXTRA_SECTIONS is set, stripping sections: " + \
             extra_sections)
 }
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 1af10b7eb0..561df35313 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -18,7 +18,7 @@ import shutil
 
 import oe.cachedpath
 
-def runstrip(arg):
+def runstrip(arg, keep_debug_frame=False, extra_strip_sections=''):
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
@@ -44,6 +39,7 @@ def runstrip(arg):
     skip_strip = False
     # kernel module
     if elftype & 16:
+        keep_debug_frame = False
         if is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
             skip_strip = True
@@ -60,6 +56,9 @@ def runstrip(arg):
             for section in extra_strip_sections.split():
                 stripcmd.extend(["--remove-section=" + section])
 
+    if keep_debug_frame:
+        stripcmd.extend(["--keep-section=.debug_frame"])
+
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
 
@@ -115,7 +114,7 @@ def is_static_lib(path):
             return start == magic
     return False
 
-def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_already_stripped=False):
+def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_already_stripped=False, keep_debug_frame=False):
     """
     Strip executable code (like executables, shared libraries) _in_place_
     - Based on sysroot_strip in staging.bbclass
@@ -194,7 +193,8 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, max_process, qa_alre
         elf_file = int(elffiles[file])
         sfiles.append((file, elf_file, strip_cmd))
 
-    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process)
+    oe.utils.multiprocess_launch_mp(runstrip, sfiles, max_process,
+                                    extraargs=(keep_debug_frame, ''))
 
 TRANSLATE = (
     ("@", "@at@"),
@@ -1305,7 +1305,9 @@ def process_split_and_strip_files(d):
             for f in staticlibs:
                 sfiles.append((f, 16, strip))
 
-        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
+        keep_debug_frame = (d.getVar('PACKAGE_KEEP_DEBUG_FRAME') == '1')
+        oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d,
+                                     extraargs=(keep_debug_frame, ''))
 
     # Build "minidebuginfo" and reinject it back into the stripped binaries
     if bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', True, False, d):
-- 
2.25.1


