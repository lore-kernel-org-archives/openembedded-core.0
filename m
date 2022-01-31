Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF28CC433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 21:40:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.40026.1643665199171059206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 13:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Q2yDBem+;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643665201;
  x=1675201201;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=QY3gTX/v1D5L0het0Fs6gTvuI5mN1x7YlKPVjR9z3iY=;
  b=Q2yDBem+YzcFE3jH2IkBRhbL1NxY5DLHFzoWdzJ0Nbw5WtU6FfnpjVVI
   sD22vfcx7jsPZPPs3jjpge+4TdaW5q1ueTYmuFIq/hgOARJwY9fUcflPK
   HmHX6JyJVwAHUGKtpmDH1/zoYTLXq1k5srL30f7+d0V1faeY/vOpDoeCB
   aTKvW4kvRQycuAxFRfyJ4HfNrnObZeXeOecjimEETbRUPefmxmXnhj+NP
   5p0wBTBNmnbiODQYZmp9CMEgM1eVzmku7HXFgoVh2Dymltz+M5bGsZ4cg
   0tFG9d1GkzN8VSELvzH1NO8ziON8HWih7mmeQXH/CmTynDRxrKGHF8HAJ
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] packages.bbclass: Break out the debug info styles to
 bitbake variables
Date: Mon, 31 Jan 2022 22:39:54 +0100
Message-ID: <20220131213954.29887-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220131213954.29887-1-pkj@axis.com>
References: <20220131213954.29887-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 21:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161139

Break out the hardcoded values for the various debug info styles from
split_and_strip_files() into bitbake variables. This allows the debug
info styles to be adopted, and also allows new styles to be added
(within the limits of the available variables).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 95 ++++++++++++++++++++++--------------
 1 file changed, 58 insertions(+), 37 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 4927fb99ff..a5358d5851 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1065,6 +1065,51 @@ python fixup_perms () {
                     fix_perms(each_file, fs_perms_table[dir].fmode, fs_perms_table[dir].fuid, fs_perms_table[dir].fgid, dir)
 }
 
+# Debug info
+PACKAGE_DEBUG_APPEND = "${@d.getVarFlag('PACKAGE_DEBUG_APPEND', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+PACKAGE_DEBUG_STATICAPPEND = "${@d.getVarFlag('PACKAGE_DEBUG_STATICAPPEND', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+PACKAGE_DEBUG_DIR = "${@d.getVarFlag('PACKAGE_DEBUG_DIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+PACKAGE_DEBUG_STATICDIR = "${@d.getVarFlag('PACKAGE_DEBUG_STATICDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+PACKAGE_DEBUG_LIBDIR = "${@d.getVarFlag('PACKAGE_DEBUG_LIBDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+PACKAGE_DEBUG_STATICLIBDIR = "${@d.getVarFlag('PACKAGE_DEBUG_STATICLIBDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+PACKAGE_DEBUG_SRCDIR = "${@d.getVarFlag('PACKAGE_DEBUG_SRCDIR', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))}"
+
+# Original OE-core, a.k.a. ".debug", style debug info
+PACKAGE_DEBUG_APPEND[.debug] = ""
+PACKAGE_DEBUG_STATICAPPEND[.debug] = ""
+PACKAGE_DEBUG_DIR[.debug] = "/.debug"
+PACKAGE_DEBUG_STATICDIR[.debug] = "/.debug-static"
+PACKAGE_DEBUG_LIBDIR[.debug] = ""
+PACKAGE_DEBUG_STATICLIBDIR[.debug] = ""
+PACKAGE_DEBUG_SRCDIR[.debug] = "/usr/src/debug"
+
+# Single debug-file-directory style debug info
+PACKAGE_DEBUG_APPEND[debug-file-directory] = ".debug"
+PACKAGE_DEBUG_STATICAPPEND[debug-file-directory] = ""
+PACKAGE_DEBUG_DIR[debug-file-directory] = ""
+PACKAGE_DEBUG_STATICDIR[debug-file-directory] = ""
+PACKAGE_DEBUG_LIBDIR[debug-file-directory] = "/usr/lib/debug"
+PACKAGE_DEBUG_STATICLIBDIR[debug-file-directory] = "/usr/lib/debug-static"
+PACKAGE_DEBUG_SRCDIR[debug-file-directory] = "/usr/src/debug"
+
+# Debug info without sources in /usr/src/debug
+PACKAGE_DEBUG_APPEND[debug-without-src] = ""
+PACKAGE_DEBUG_STATICAPPEND[debug-without-src] = ""
+PACKAGE_DEBUG_DIR[debug-without-src] = "/.debug"
+PACKAGE_DEBUG_STATICDIR[debug-without-src] = "/.debug-static"
+PACKAGE_DEBUG_LIBDIR[debug-without-src] = ""
+PACKAGE_DEBUG_STATICLIBDIR[debug-without-src] = ""
+PACKAGE_DEBUG_SRCDIR[debug-without-src] = ""
+
+# Debug info with separate -src packages
+PACKAGE_DEBUG_APPEND[debug-with-srcpkg] = ""
+PACKAGE_DEBUG_STATICAPPEND[debug-with-srcpkg] = ""
+PACKAGE_DEBUG_DIR[debug-with-srcpkg] = "/.debug"
+PACKAGE_DEBUG_STATICDIR[debug-with-srcpkg] = "/.debug-static"
+PACKAGE_DEBUG_LIBDIR[debug-with-srcpkg] = ""
+PACKAGE_DEBUG_STATICLIBDIR[debug-with-srcpkg] = ""
+PACKAGE_DEBUG_SRCDIR[debug-with-srcpkg] = "/usr/src/debug"
+
 python split_and_strip_files () {
     import stat, errno
     import subprocess
@@ -1076,42 +1121,18 @@ python split_and_strip_files () {
     oldcwd = os.getcwd()
     os.chdir(dvar)
 
-    # We default to '.debug' style
-    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-file-directory':
-        # Single debug-file-directory style debug info
-        debugappend = ".debug"
-        debugstaticappend = ""
-        debugdir = ""
-        debugstaticdir = ""
-        debuglibdir = "/usr/lib/debug"
-        debugstaticlibdir = "/usr/lib/debug-static"
-        debugsrcdir = "/usr/src/debug"
-    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-without-src':
-        # Original OE-core, a.k.a. ".debug", style debug info, but without sources in /usr/src/debug
-        debugappend = ""
-        debugstaticappend = ""
-        debugdir = "/.debug"
-        debugstaticdir = "/.debug-static"
-        debuglibdir = ""
-        debugstaticlibdir = ""
-        debugsrcdir = ""
-    elif d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg':
-        debugappend = ""
-        debugstaticappend = ""
-        debugdir = "/.debug"
-        debugstaticdir = "/.debug-static"
-        debuglibdir = ""
-        debugstaticlibdir = ""
-        debugsrcdir = "/usr/src/debug"
-    else:
-        # Original OE-core, a.k.a. ".debug", style debug info
-        debugappend = ""
-        debugstaticappend = ""
-        debugdir = "/.debug"
-        debugstaticdir = "/.debug-static"
-        debuglibdir = ""
-        debugstaticlibdir = ""
-        debugsrcdir = "/usr/src/debug"
+    # Sanity test that PACKAGE_DEBUG_SPLIT_STYLE has a valid value.
+    if d.getVarFlag('PACKAGE_DEBUG_APPEND', d.getVar('PACKAGE_DEBUG_SPLIT_STYLE')) is None:
+        bb.fatal("Unknown PACKAGE_DEBUG_SPLIT_STYLE specified: %s" %
+                 d.getVar('PACKAGE_DEBUG_SPLIT_STYLE'))
+
+    debugappend = d.getVar('PACKAGE_DEBUG_APPEND')
+    debugstaticappend = d.getVar('PACKAGE_DEBUG_STATICAPPEND')
+    debugdir = d.getVar('PACKAGE_DEBUG_DIR')
+    debugstaticdir = d.getVar('PACKAGE_DEBUG_STATICDIR')
+    debuglibdir = d.getVar('PACKAGE_DEBUG_LIBDIR')
+    debugstaticlibdir = d.getVar('PACKAGE_DEBUG_STATICLIBDIR')
+    debugsrcdir = d.getVar('PACKAGE_DEBUG_SRCDIR')
 
     #
     # First lets figure out all of the files we may have to process ... do this only once!
@@ -1338,7 +1359,7 @@ python populate_packages () {
     
     autodebug = not (d.getVar("NOAUTOPACKAGEDEBUG") or False)
 
-    split_source_package = (d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg')
+    split_source_package = (d.getVar('PACKAGE_DEBUG_SPLIT_STYLE').endswith('-with-srcpkg'))
 
     # If debug-with-srcpkg mode is enabled then add the source package if it
     # doesn't exist and add the source file contents to the source package.

