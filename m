Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3AEC54E41
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 16:19:35 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.27959.1709655569000723432
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 08:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=nmyt+0d2;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=787e54d6c=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709655568; x=1741191568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sbNc9C4bar3q7KPeXsON0n3/fXSHAlJwog1+2wTYLuc=;
  b=nmyt+0d231Lb5KoP0b2oxbkDcvttXw/paIeavnWqolY1cuwEWsodwVZM
   OdoQFZ/BiasbEaPaqPvL6vKRBXTT74vvuu4dPwmTtuG2u+F7QbVUoWUWP
   76UzZRxA11LVgt8iyN86396WL3KVs5TZctLTx9DMnNT4jAQKk4qSwoGmK
   s=;
X-CSE-ConnectionGUID: v+MnCwzGQemdTPyJ1j1e3A==
X-CSE-MsgGUID: JHrdzF3JTEqKC0vg9H5Izw==
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw2.muc with ESMTP/TLS;
 05 Mar 2024 17:19:26 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb2.muc with ESMTP/TLS; 05 Mar 2024 17:19:26 +0100
Received: from localhost.localdomain (10.30.85.204) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 5 Mar 2024 17:19:26 +0100
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [RFC PATCH v2 2/3] package: Expose list of split out debug files
Date: Tue, 5 Mar 2024 17:18:29 +0100
Message-ID: <20240305161856.4163138-3-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240228062139.473528-1-philip.lorenz@bmw.de>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP10F.europe.bmw.corp (2a03:1e80:a15:58f::202c) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 16:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196638

As correctly determining the list of debug files based on existing
variables is non-trivial, this patch introduces the PKGDEBUGFILES
variable which holds the path to all files generated during stripping.

This list may then be used for further processing, such as extracting
the GNU build ID of all files containing debug symbols.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
---
 meta/classes-global/package.bbclass |  4 ++++
 meta/lib/oe/package.py              | 19 ++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index aa1eb5e901c..f2d358459f8 100644
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
index 587810bdafd..921a958ed1f 100644
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
2.44.0


