Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0685C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 02:00:00 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.58096.1643767197237197926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 17:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=S2Hs8lGb;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643767199;
  x=1675303199;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=x4HoMcZLz/Ygj2xwoWqymhtE2WjgWx+ysy68bRN45ZA=;
  b=S2Hs8lGbaHEX7S4Z7WzYsimZ0hNNYYdkKzV531rqaQMUW+0BWT9evrJ+
   jFnP5m9La4yma5aMd3SMOXOWW/e3kT3uXlrFoaW28Y2dAZcWM91+U149l
   rhCdIl1tVSi2j5+eubijB8ORYFGsR8mpcWunBKkl9939SHiYz1N4ILPVN
   PxJAb7eucISHWnPMXTiQBEvBezRqFwZ6wO7pEPndHWpKu5O1oXHo77fok
   +gPLuw6EndofZ+xNd+1bFd6OJlic6Yx2OoI2jWNAOet7bZlVEA/ydK//5
   Pffghzd7WIN0JWBxefzXU2vmWle4EHqClpHQZ+feghx7f0Fqb/72W/kPW
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] package.bbclass: Make package_debug_vars() return a dict
Date: Wed, 2 Feb 2022 02:59:49 +0100
Message-ID: 
 <4b5e2fd0dc00e048dcc170ab66f0098f1687561f.1643766962.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <cover.1643766962.git.pkj@axis.com>
References: <cover.1643766962.git.pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 02:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161173

It simplifies the API to return one dict instead of seven strings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 96 +++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 45 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 545471468c..9e895b4ecc 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1069,42 +1069,49 @@ def package_debug_vars(d):
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
@@ -1117,8 +1124,7 @@ python split_and_strip_files () {
     oldcwd = os.getcwd()
     os.chdir(dvar)
 
-    debugappend, debugstaticappend, debugdir, debugstaticdir, \
-    debuglibdir, debugstaticlibdir, debugsrcdir = package_debug_vars(d)
+    dv = package_debug_vars(d)
 
     #
     # First lets figure out all of the files we may have to process ... do this only once!
@@ -1139,9 +1145,9 @@ python split_and_strip_files () {
                 file = os.path.join(root, f)
 
                 # Skip debug files
-                if debugappend and file.endswith(debugappend):
+                if dv["append"] and file.endswith(dv["append"]):
                     continue
-                if debugdir and debugdir in os.path.dirname(file[len(dvar):]):
+                if dv["dir"] and dv["dir"] in os.path.dirname(file[len(dvar):]):
                     continue
 
                 if file in skipfiles:
@@ -1238,11 +1244,11 @@ python split_and_strip_files () {
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
@@ -1261,9 +1267,9 @@ python split_and_strip_files () {
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
@@ -1273,7 +1279,7 @@ python split_and_strip_files () {
         # Create symlinks for all cases we were able to split symbols
         for file in symlinks:
             src = file[len(dvar):]
-            dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+            dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(src) + dv["append"]
             fpath = dvar + dest
             # Skip it if the target doesn't exist
             try:
@@ -1289,17 +1295,17 @@ python split_and_strip_files () {
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
@@ -1323,7 +1329,7 @@ python split_and_strip_files () {
     # Build "minidebuginfo" and reinject it back into the stripped binaries
     if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
         oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
-                                     extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
+                                     extraargs=(dvar, dv["dir"], dv["libdir"], dv["append"], dv["srcdir"], d))
 
     #
     # End of strip

