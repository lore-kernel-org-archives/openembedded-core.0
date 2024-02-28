Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5921CC47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 06:22:10 +0000 (UTC)
Received: from esa8.hc324-48.eu.iphmx.com (esa8.hc324-48.eu.iphmx.com [207.54.65.242])
 by mx.groups.io with SMTP id smtpd.web11.7498.1709101328540302000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 22:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=QZMpUc6+;
 spf=pass (domain: bmw.de, ip: 207.54.65.242, mailfrom: prvs=781c072f5=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709101328; x=1740637328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zKIekixgu1vBG5yu+CWRso3lDgMIF7c6aY6bg3RQ5BI=;
  b=QZMpUc6+qPSMxKxTRBinCvLaw3VjX0kq/dXhVjwvtsNDmpW2IiJxbDUE
   5Xmx7VQPK5Gx8PW0fcZbHKhPm806eZmswRzf00wH60Ts/WHFJvPGoN3ur
   6Nhad5cCI6MrQ4dUYG+TZNObjt7GeDlYnWwsOaPC4at3VxbpUGyOt+wff
   8=;
X-CSE-ConnectionGUID: N8tKU7JqTvmYjexV8BG4gw==
X-CSE-MsgGUID: eBJpshRGSBaU5wQ+aNVu9A==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa8.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Feb 2024 07:22:06 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 28 Feb 2024 07:22:06 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 28 Feb 2024 07:22:06 +0100
Received: from localhost.localdomain (10.30.85.210) by SMUCMP10E.europe.bmw.corp
 (10.30.13.87) with Microsoft SMTP Server (version=TLS;
 Wed, 28 Feb 2024 07:22:06 +0100
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [RFC PATCH 1/1] package.bbclass: Expose list of split out debug files
Date: Wed, 28 Feb 2024 07:21:39 +0100
Message-ID: <20240228062139.473528-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240228062139.473528-1-philip.lorenz@bmw.de>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18h.europe.bmw.corp (10.30.13.166) To
 SMUCMP10E.europe.bmw.corp (10.30.13.87)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 06:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196323

A packaging hook installed via PACKAGEFUNCS may want to access the list
of debug symbol files produced during packaging.

Correctly determining the list of debug files based on existing
variables is non-trivial, so this patch introduces the PKGDEBUGFILES
variable which holds the path to all files generated during stripping.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-global/package.bbclass |  4 ++++
 meta/lib/oe/package.py              | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index aa1eb5e901..f2d358459f 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -67,6 +67,10 @@ PACKAGE_DEPENDS += "rpm-native dwarfsrcfiles-native"
 # tools at rootfs build time.
 PACKAGE_WRITE_DEPS ??= ""
 
+# List of files containing debug symbols. The paths are rooted at their
+# destination path (e.g. /usr/lib/.debug instead of ${PKGD}/usr/lib/.debug)
+PKGDEBUGFILES = ""
+
 def legitimize_package_name(s):
     return oe.package.legitimize_package_name(s)
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 587810bdaf..921a958ed1 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -781,7 +781,7 @@ def splitdebuginfo(file, dvar, dv, d):
     # target system binary, the other contains any debugging information. The
     # two files are linked to reference each other.
     #
-    # return a mapping of files:debugsources
+    # return a mapping of files:debugfile:debugsources
 
     src = file[len(dvar):]
     dest = dv["libdir"] + os.path.dirname(src) + dv["dir"] + "/" + os.path.basename(src) + dv["append"]
@@ -791,7 +791,7 @@ def splitdebuginfo(file, dvar, dv, d):
     if file.endswith(".ko") and file.find("/lib/modules/") != -1:
         if oe.package.is_kernel_module_signed(file):
             bb.debug(1, "Skip strip on signed module %s" % file)
-            return (file, sources)
+            return (file, file, sources)
 
     # Split the file...
     bb.utils.mkdirhier(os.path.dirname(debugfile))
@@ -821,7 +821,7 @@ def splitdebuginfo(file, dvar, dv, d):
     if newmode:
         os.chmod(file, origmode)
 
-    return (file, sources)
+    return (file, debugfile, sources)
 
 def splitstaticdebuginfo(file, dvar, dv, d):
     # Unlike the function above, there is no way to split a static library
@@ -830,7 +830,7 @@ def splitstaticdebuginfo(file, dvar, dv, d):
     # We will then strip (preserving symbols) the static library in the
     # typical location.
     #
-    # return a mapping of files:debugsources
+    # return a mapping of files:debugfile:debugsources
 
     src = file[len(dvar):]
     dest = dv["staticlibdir"] + os.path.dirname(src) + dv["staticdir"] + "/" + os.path.basename(src) + dv["staticappend"]
@@ -861,7 +861,7 @@ def splitstaticdebuginfo(file, dvar, dv, d):
     if newmode:
         os.chmod(file, origmode)
 
-    return (file, sources)
+    return (file, debugfile, sources)
 
 def inject_minidebuginfo(file, dvar, dv, d):
     # Extract just the symbols from debuginfo into minidebuginfo,
@@ -1175,13 +1175,14 @@ def process_split_and_strip_files(d):
                 results = oe.utils.multiprocess_launch(splitstaticdebuginfo, staticlibs, d, extraargs=(dvar, dv, d))
             else:
                 for file in staticlibs:
-                    results.append( (file,source_info(file, d)) )
+                    results.append( (file,file,source_info(file, d)) )
 
-        d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, s in results})
+        d.setVar("PKGDEBUGSOURCES", {strip_pkgd_prefix(f): sorted(s) for f, _, s in results})
+        d.setVar("PKGDEBUGFILES", [strip_pkgd_prefix(d) for _, d, _ in results])
 
         sources = set()
-        for r in results:
-            sources.update(r[1])
+        for _, _, sourcefile in results:
+            sources.update(sourcefile)
 
         # Hardlink our debug symbols to the other hardlink copies
         for ref in inodes:
-- 
2.43.2


