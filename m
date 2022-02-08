Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA50C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:53:57 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.13041.1644335634628899081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=iGa9azZ4;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644335636;
  x=1675871636;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=RRsWHbEF9M6EPS+X+W+o1XIncLfXy8og3Y83FtDP9P4=;
  b=iGa9azZ4mqOglF1TVckpQ2LHxcwKyCGHTseM2HfKvJPCyv22JHsgkcZS
   aZ4AH2PuxWwW4ZQNAJ5T2VmxUy6C+VT/kHirbAzEXrRptoG/SRikQkzOD
   fepUs/a6wJGfLx2XuWVnBuzO7ztFvO/Gn5lscKA1i6btwexWxFKqi4uRe
   9EqjWkf6oCIsXAr44A2Da/BvOI8jRgTypLWTfWa+BdpnFr37mbaB4Evvs
   AjpptXhNBREGkj8GHBH7DIuq8lqcyOw/RRpQPFhKBByYzy80tF4PkOoZv
   S2uvnRP6xYDzgzECG1LtVtJMUsyeHYtPY8K2zjBoF25CFZ6hvcTHDHOII
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH 3/3] package: Pass dv (debug_vars) around instead of
 individual vars
Date: Tue, 8 Feb 2022 16:53:51 +0100
Message-ID: <20220208155351.11582-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220208155351.11582-1-pkj@axis.com>
References: <20220208155351.11582-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:53:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161520

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

This simplifies the APIs for splitdebuginfo(), splitstaticdebuginfo()
and inject_minidebuginfo()

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c3b4c0390a..dc1494eb1e 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -369,7 +369,7 @@ def source_info(file, d, fatal=True):
 
     return list(debugsources)
 
-def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d):
+def splitdebuginfo(file, dvar, dv, d):
     # Function to split a single file into two components, one is the stripped
     # target system binary, the other contains any debugging information. The
     # two files are linked to reference each other.
@@ -380,7 +380,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     import subprocess
 
     src = file[len(dvar):]
-    dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+    dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(src) + dv["append"]
     debugfile = dvar + dest
     sources = []
 
@@ -403,7 +403,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
         os.chmod(file, newmode)
 
     # We need to extract the debug src information here...
-    if debugsrcdir:
+    if dv["srcdir"]:
         sources = source_info(file, d)
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
@@ -418,7 +418,7 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
 
     return (file, sources)
 
-def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d):
+def splitstaticdebuginfo(file, dvar, dv, d):
     # Unlike the function above, there is no way to split a static library
     # two components.  So to get similar results we will copy the unmodified
     # static library (containing the debug symbols) into a new directory.
@@ -431,7 +431,7 @@ def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugsta
     import shutil
 
     src = file[len(dvar):]
-    dest = debugstaticlibdir + os.path.dirname(src) + debugstaticdir + "/" + os.path.basename(src) + debugstaticappend
+    dest = dv["staticlibdir"] + os.path.dirname(src) + dv["staticdir"] + "/" + os.path.basename(src) + dv["staticappend"]
     debugfile = dvar + dest
     sources = []
 
@@ -448,7 +448,7 @@ def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugsta
         os.chmod(file, newmode)
 
     # We need to extract the debug src information here...
-    if debugsrcdir:
+    if dv["srcdir"]:
         sources = source_info(file, d)
 
     bb.utils.mkdirhier(os.path.dirname(debugfile))
@@ -461,7 +461,7 @@ def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugsta
 
     return (file, sources)
 
-def inject_minidebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d):
+def inject_minidebuginfo(file, dvar, dv, d):
     # Extract just the symbols from debuginfo into minidebuginfo,
     # compress it with xz and inject it back into the binary in a .gnu_debugdata section.
     # https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
@@ -475,7 +475,7 @@ def inject_minidebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsr
     minidebuginfodir = d.expand('${WORKDIR}/minidebuginfo')
 
     src = file[len(dvar):]
-    dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+    dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(src) + dv["append"]
     debugfile = dvar + dest
     minidebugfile = minidebuginfodir + src + '.minidebug'
     bb.utils.mkdirhier(os.path.dirname(minidebugfile))
@@ -1249,11 +1249,11 @@ python split_and_strip_files () {
     # First lets process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
-        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, dv["dir"], dv["libdir"], dv["append"], dv["srcdir"], d))
+        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, dv, d))
 
         if dv["srcdir"] and not hostos.startswith("mingw"):
             if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
-                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, dv["staticdir"], dv["staticlibdir"], dv["staticappend"], dv["srcdir"], d))
+                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, dv, d))
             else:
                 for file in staticlibs:
                     results.append( (file,source_info(file, d)) )
@@ -1336,7 +1336,7 @@ python split_and_strip_files () {
     # Build "minidebuginfo" and reinject it back into the stripped binaries
     if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
         oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
-                                     extraargs=(dvar, dv["dir"], dv["libdir"], dv["append"], dv["srcdir"], d))
+                                     extraargs=(dvar, dv, d))
 
     #
     # End of strip

