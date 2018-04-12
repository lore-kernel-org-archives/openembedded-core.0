Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 65F597456A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 22:28:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2018 15:28:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,443,1517904000"; d="scan'208";a="33885326"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.59])
	by orsmga006.jf.intel.com with ESMTP; 12 Apr 2018 15:28:09 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2018 15:28:07 -0700
Message-Id: <1523572087-34315-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] glib-2.0/glib.inc: fix broken mingw build
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
X-List-Received-Date: Thu, 12 Apr 2018 22:28:09 -0000

mingw build was broken by the commit:
"glib-2.0/glib.inc: apply MLPREFIX renaming to all package classes"

When building for mingw, we encounter build errors such as:

  mv: cannot stat '<builddir>/<...>/usr/libexec/gio-querymodules': No such file or directory

The file that exists is actually "gio-querymodules.exe", but still there is no
good reason to rename it to "nativesdk-gio-querymodules.exe".
So for mingw we simply avoid renaming of the executable, by skippng the line:

  mv -v ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules

[YOCTO #12679]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index b7c32e6..92ac19e 100644
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
@@ -106,7 +109,7 @@ do_install_append () {
 	fi
 
         # Make sure gio-querymodules is unique among multilibs
-        if test "x${MLPREFIX}" != "x"; then
+        if test "x${MLPREFIX}" != "x" && test "${EXEEXT}" != ".exe"; then
                 mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
         fi
 }
-- 
2.7.4


