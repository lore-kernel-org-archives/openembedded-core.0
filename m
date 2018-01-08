Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E197478958
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 12:45:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jan 2018 04:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,330,1511856000"; d="scan'208";a="19851122"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jan 2018 04:45:49 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jan 2018 14:45:46 +0200
Message-Id: <bbd304713d223d1cabd4185b1ba7febdc3209ac3.1515415190.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
References: <cover.1515415190.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 4/6] package.bbclass: add support for pkg_postinst_ontarget()
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
X-List-Received-Date: Mon, 08 Jan 2018 12:45:49 -0000

This function is a convenient and more readable shortcut for situations
when the postinst code always needs to run on target. All commands that
cannot be executed during cross-install and can only be run on target
should go into this function. They will only be executed on first boot
(if package was cross-installed) or immediately during package installation
on target.

Plain pkg_postinst() works as before: it is run during cross-install time,
it can contain a request to defer to first boot, and it is also run
during package installation on target.

Also fix the oeqa test for this functionality to use the new function
where appropriate.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/recipes-test/postinst/postinst_1.0.bb | 14 ++------------
 meta/classes/package.bbclass                        | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
index 112aa08c80f..d4bab6dcc22 100644
--- a/meta-selftest/recipes-test/postinst/postinst_1.0.bb
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -35,14 +35,9 @@ pkg_postinst_${PN}-rootfs () {
 
 # Depends on rootfs, delays until first boot, verifies that the rootfs file was
 # written.
-pkg_postinst_${PN}-delayed-a () {
+pkg_postinst_ontarget_${PN}-delayed-a () {
     set -e
 
-    if [ -n "$D" ]; then
-        echo "Delaying ${PN}-delayed-a until first boot"
-        exit 1
-    fi
-
     if [ ! -e ${TESTDIR}/rootfs ]; then
         echo "${PN}-delayed-a: ${TESTDIR}/rootfs not found"
         exit 1
@@ -53,14 +48,9 @@ pkg_postinst_${PN}-delayed-a () {
 
 # Depends on delayed-a, delays until first boot, verifies that the delayed-a file was
 # written. This verifies the ordering between delayed postinsts.
-pkg_postinst_${PN}-delayed-b () {
+pkg_postinst_ontarget_${PN}-delayed-b () {
     set -e
 
-    if [ -n "$D" ]; then
-        echo "Delaying ${PN}-delayed-b until first boot"
-        exit 1
-    fi
-
     if [ ! -e ${TESTDIR}/delayed-a ]; then
         echo "${PN}-delayed-b: ${TESTDIR}/delayed-a not found"
         exit 1
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 7dc759699f4..6a7f35a3e78 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1320,6 +1320,25 @@ python emit_pkgdata() {
     from glob import glob
     import json
 
+    def process_postinst_on_target(pkg, mlprefix):
+        defer_fragment = """
+if [ -n "$D" ]; then
+    $INTERCEPT_DIR/postinst_intercept delay_to_first_boot %s mlprefix=%s
+    exit 0
+fi
+""" % (pkg, mlprefix)
+
+        postinst = d.getVar('pkg_postinst_%s' % pkg)
+        postinst_ontarget = d.getVar('pkg_postinst_ontarget_%s' % pkg)
+
+        if postinst_ontarget:
+            bb.debug(1, 'adding deferred pkg_postinst_ontarget() to pkg_postinst() for %s' % pkg)
+            if not postinst:
+                postinst = '#!/bin/sh\n'
+            postinst += defer_fragment
+            postinst += postinst_ontarget
+            d.setVar('pkg_postinst_%s' % pkg, postinst)
+
     def write_if_exists(f, pkg, var):
         def encode(str):
             import codecs
@@ -1415,6 +1434,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'ALLOW_EMPTY')
         write_if_exists(sf, pkg, 'FILES')
         write_if_exists(sf, pkg, 'CONFFILES')
+        process_postinst_on_target(pkg, d.getVar("MLPREFIX"))
         write_if_exists(sf, pkg, 'pkg_postinst')
         write_if_exists(sf, pkg, 'pkg_postrm')
         write_if_exists(sf, pkg, 'pkg_preinst')
-- 
2.15.1


