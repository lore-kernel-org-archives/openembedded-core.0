Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 74F2472F01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 16:55:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2018 09:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,469,1517904000"; d="scan'208";a="34647399"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.59])
	by orsmga007.jf.intel.com with ESMTP; 19 Apr 2018 09:53:04 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 09:53:02 -0700
Message-Id: <1524156782-27661-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] glib-2.0/glib.inc: fix broken mingw build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 16:55:19 -0000

mingw build was broken by the commit:
"glib-2.0/glib.inc: apply MLPREFIX renaming to all package classes"

When building for mingw, we encounter build errors such as:

  mv: cannot stat '<builddir>/<...>/usr/libexec/gio-querymodules': No such file or directory

The mingw file that exists is "gio-querymodules.exe" instead of "gio-qeurymodules".
The fix is to append the names of executables by an OS specific EXEEXT.

[YOCTO #12679]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index b7c32e6..f645ed6 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -91,6 +91,9 @@ USE_NLS_class-target = "yes"
 USE_NLS_class-nativesdk = "yes"
 CACHED_CONFIGUREVARS_append_class-native = " ac_cv_path_MSGFMT=/bin/false"
 
+EXEEXT = ""
+EXEEXT_mingw32 = ".exe"
+
 do_install_append () {
 	if [ -f ${D}${bindir}/gtester-report ]; then
 		sed ${D}${bindir}/gtester-report -i -e '1s|^#!.*|#!/usr/bin/env python3|'
@@ -107,7 +110,7 @@ do_install_append () {
 
         # Make sure gio-querymodules is unique among multilibs
         if test "x${MLPREFIX}" != "x"; then
-                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
+                mv ${D}${libexecdir}/gio-querymodules${EXEEXT} ${D}${libexecdir}/${MLPREFIX}gio-querymodules${EXEEXT}
         fi
 }
 
-- 
2.7.4


