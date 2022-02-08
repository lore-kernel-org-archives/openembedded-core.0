Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886A1C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 15:53:56 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.13041.1644335634628899081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 07:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UxMMTzIX;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644335635;
  x=1675871635;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eJegiajDlvquMjtaCUQq2ke9H0hBH6fyLEk1xTZKtBk=;
  b=UxMMTzIXOW6lhzTOt/ZS1Oc0DswO4fH0o2oDNw8ylWYmcAOaXkU3CcQ+
   ixEI1ylBqB4CiMTNhcM2Zz1cV2xHCaD7bjFH/AJRfv+o2uZdbGQHYJQTD
   OQ6GQxK9Kzm+gZ9Ffg1PHcKsV9Le/dUqqw2ff4dynJ/4OyVVMGEzml/76
   GraVCUySffyROsB+JfF/hAo/G77T+vz/Uuegj0j4kedJBTLNu0Hh8Y+T6
   XvF+xDSH6ZmcDwARDWypqlJ3aXvAGpV7moBI2O154zzgywipNbgF6SdcU
   JXaV1Axaqr/Vz3VbpROkzaMR5rcElFdwAGoIS06tiLSVDSBkJYpQXegV4
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [honister][PATCH 2/3] package: Make package_debug_vars() return a
 dict
Date: Tue, 8 Feb 2022 16:53:50 +0100
Message-ID: <20220208155351.11582-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220208155351.11582-1-pkj@axis.com>
References: <20220208155351.11582-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 15:53:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161518

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It simplifies the API to return one dict instead of seven strings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 96 +++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 31e89ff37d..c3b4c0390a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1073,42 +1073,49 @@ def package_debug_vars(d):
     # We default to '.debug' style
     if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
         # Single debug-file-directory style debug info
-        debugappend = ".debug"
-        debugstaticappend = ""
-        debugdir = ""
-        debugstaticdir = ""
-        debuglibdir = "/usr/lib/debug"
-        debugstaticlibdir = "/usr/lib/debug-static"
-        debugsrcdir = "/usr/src/debug"
+        debug_vars = {
+            "append": ".debug",
+            "staticappend": "",
+            "dir": "",
+            "staticdir": "",
+            "libdir": "/usr/lib/debug",
+            "staticlibdir": "/usr/lib/debug-static",
+            "srcdir": "/usr/src/debug",
+        }
     elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-without-src':
         # Original OE-core, a.k.a. ".debug", style debug info, but without sources in /usr/src/debug
-        debugappend = ""
-        debugstaticappend = ""
-        debugdir = "/.debug"
-        debugstaticdir = "/.debug-static"
-        debuglibdir = ""
-        debugstaticlibdir = ""
-        debugsrcdir = ""
+        debug_vars = {
+            "append": "",
+            "staticappend": "",
+            "dir": "/.debug",
+            "staticdir": "/.debug-static",
+            "libdir": "",
+            "staticlibdir": "",
+            "srcdir": "",
+        }
     elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg':
-        debugappend = ""
-        debugstaticappend = ""
-        debugdir = "/.debug"
-        debugstaticdir = "/.debug-static"
-        debuglibdir = ""
-        debugstaticlibdir = ""
-        debugsrcdir = "/usr/src/debug"
+        debug_vars = {
+            "append": "",
+            "staticappend": "",
+            "dir": "/.debug",
+            "staticdir": "/.debug-static",
+            "libdir": "",
+            "staticlibdir": "",
+            "srcdir": "/usr/src/debug",
+        }
     else:
         # Original OE-core, a.k.a. ".debug", style debug info
-        debugappend = ""
-        debugstaticappend = ""
-        debugdir = "/.debug"
-        debugstaticdir = "/.debug-static"
-        debuglibdir = ""
-        debugstaticlibdir = ""
-        debugsrcdir = "/usr/src/debug"
+        debug_vars = {
+            "append": "",
+            "staticappend": "",
+            "dir": "/.debug",
+            "staticdir": "/.debug-static",
+            "libdir": "",
+            "staticlibdir": "",
+            "srcdir": "/usr/src/debug",
+        }
 
-    return (debugappend, debugstaticappend, debugdir, debugstaticdir,
-            debuglibdir, debugstaticlibdir, debugsrcdir)
+    return debug_vars
 
 python split_and_strip_files () {
     import stat, errno
@@ -1121,8 +1128,7 @@ python split_and_strip_files () {
     oldcwd = os.getcwd()
     os.chdir(dvar)
 
-    debugappend, debugstaticappend, debugdir, debugstaticdir, \
-    debuglibdir, debugstaticlibdir, debugsrcdir = package_debug_vars(d)
+    dv = package_debug_vars(d)
 
     #
     # First lets figure out all of the files we may have to process ... do this only once!
@@ -1144,9 +1150,9 @@ python split_and_strip_files () {
                 file = os.path.join(root, f)
 
                 # Skip debug files
-                if debugappend and file.endswith(debugappend):
+                if dv["append"] and file.endswith(dv["append"]):
                     continue
-                if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
+                if dv["dir"] and dv["dir"] in os.path.dirname(file[len(dvar):]):
                     continue
 
                 if file in skipfiles:
@@ -1243,11 +1249,11 @@ python split_and_strip_files () {
     # First lets process debug splitting
     #
     if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT') != '1'):
-        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
+        results = oe.utils.multiprocess_launch(splitdebuginfo, list(elffiles), d, extraargs=(dvar, dv["dir"], dv["libdir"], dv["append"], dv["srcdir"], d))
 
-        if debugsrcdir and not hostos.startswith("mingw"):
+        if dv["srcdir"] and not hostos.startswith("mingw"):
             if (d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
-                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, debugstaticdir, debugstaticlibdir, debugstaticappend, debugsrcdir, d))
+                results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, dv["staticdir"], dv["staticlibdir"], dv["staticappend"], dv["srcdir"], d))
             else:
                 for file in staticlibs:
                     results.append( (file,source_info(file, d)) )
@@ -1266,9 +1272,9 @@ python split_and_strip_files () {
             target = inodes[ref][0][len(dvar):]
             for file in inodes[ref][1:]:
                 src = file[len(dvar):]
-                dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(target) + debugappend
+                dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
                 fpath = dvar + dest
-                ftarget = dvar + debuglibdir + os.path.dirname(target) + debugdir + "/" + os.path.basename(target) + debugappend
+                ftarget = dvar + dv["libdir"] + os.path.dirname(target) + dv["dir"] + "/" + os.path.basename(target) + dv["append"]
                 bb.utils.mkdirhier(os.path.dirname(fpath))
                 # Only one hardlink of separated debug info file in each directory
                 if not os.access(fpath, os.R_OK):
@@ -1278,7 +1284,7 @@ python split_and_strip_files () {
         # Create symlinks for all cases we were able to split symbols
         for file in symlinks:
             src = file[len(dvar):]
-            dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+            dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(src) + dv["append"]
             fpath = dvar + dest
             # Skip it if the target doesn't exist
             try:
@@ -1294,17 +1300,17 @@ python split_and_strip_files () {
             lbase = os.path.basename(ltarget)
             ftarget = ""
             if lpath and lpath != ".":
-                ftarget += lpath + debugdir + "/"
-            ftarget += lbase + debugappend
+                ftarget += lpath + dv["dir"] + "/"
+            ftarget += lbase + dv["append"]
             if lpath.startswith(".."):
                 ftarget = os.path.join("..", ftarget)
             bb.utils.mkdirhier(os.path.dirname(fpath))
             #bb.note("Symlink %s -> %s" % (fpath, ftarget))
             os.symlink(ftarget, fpath)
 
-        # Process the debugsrcdir if requested...
+        # Process the dv["srcdir"] if requested...
         # This copies and places the referenced sources for later debugging...
-        copydebugsources(debugsrcdir, sources, d)
+        copydebugsources(dv["srcdir"], sources, d)
     #
     # End of debug splitting
     #
@@ -1330,7 +1336,7 @@ python split_and_strip_files () {
     # Build "minidebuginfo" and reinject it back into the stripped binaries
     if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
         oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
-                                     extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
+                                     extraargs=(dvar, dv["dir"], dv["libdir"], dv["append"], dv["srcdir"], d))
 
     #
     # End of strip

