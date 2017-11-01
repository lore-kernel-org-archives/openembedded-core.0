Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0764B77BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:41 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573722"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:41 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:34 +0200
Message-Id: <ffb56e0723f33a9bba9d16890e8c096ef062ab21.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/6] Revert "classes: Fix alternatives and rc.d ordering"
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
X-List-Received-Date: Wed, 01 Nov 2017 14:00:41 -0000

This kludge is not needed anymore, now that syslog packages (or any
other package) don't use update-alternatives for managing SysV init
scripts.

This reverts commit fc89a3f739ff25306ea91d9bdb424fc8389bdf72.

[YOCTO #10944]
---
 meta/classes/update-alternatives.bbclass | 29 +++++++----------------------
 meta/classes/update-rc.d.bbclass         | 20 ++------------------
 2 files changed, 9 insertions(+), 40 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 4bba76c3ba..65cae7002f 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -201,8 +201,8 @@ python populate_packages_updatealternatives () {
     pkgdest = d.getVar('PKGD')
     for pkg in (d.getVar('PACKAGES') or "").split():
         # Create post install/removal scripts
-        alt_setup_links = "# Begin section update-alternatives\n"
-        alt_remove_links = "# Begin section update-alternatives\n"
+        alt_setup_links = ""
+        alt_remove_links = ""
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
@@ -225,13 +225,10 @@ python populate_packages_updatealternatives () {
             # Default to generate shell script.. eventually we may want to change this...
             alt_target = os.path.normpath(alt_target)
 
-            alt_setup_links  += 'update-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
-            alt_remove_links += 'update-alternatives --remove  %s %s\n' % (alt_name, alt_target)
+            alt_setup_links  += '\tupdate-alternatives --install %s %s %s %s\n' % (alt_link, alt_name, alt_target, alt_priority)
+            alt_remove_links += '\tupdate-alternatives --remove  %s %s\n' % (alt_name, alt_target)
 
-        alt_setup_links += "# End section update-alternatives\n"
-        alt_remove_links += "# End section update-alternatives\n"
-
-        if len(alt_setup_links.splitlines()) > 2:
+        if alt_setup_links:
             # RDEPENDS setup
             provider = d.getVar('VIRTUAL-RUNTIME_update-alternatives')
             if provider:
@@ -241,24 +238,12 @@ python populate_packages_updatealternatives () {
             bb.note('adding update-alternatives calls to postinst/prerm for %s' % pkg)
             bb.note('%s' % alt_setup_links)
             postinst = d.getVar('pkg_postinst_%s' % pkg) or '#!/bin/sh\n'
-            postinst = postinst.splitlines(True)
-            try:
-                index = postinst.index('# Begin section update-rc.d\n')
-                postinst.insert(index, alt_setup_links)
-            except ValueError:
-                postinst.append(alt_setup_links)
-            postinst = ''.join(postinst)
+            postinst += alt_setup_links
             d.setVar('pkg_postinst_%s' % pkg, postinst)
 
             bb.note('%s' % alt_remove_links)
             prerm = d.getVar('pkg_prerm_%s' % pkg) or '#!/bin/sh\n'
-            prerm = prerm.splitlines(True)
-            try:
-                index = prerm.index('# End section update-rc.d\n')
-                prerm.insert(index + 1, alt_remove_links)
-            except ValueError:
-                prerm.append(alt_remove_links)
-            prerm = ''.join(prerm)
+            prerm += alt_remove_links
             d.setVar('pkg_prerm_%s' % pkg, prerm)
 }
 
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index c3fefea5af..e1e0e04876 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -37,7 +37,6 @@ fi
 PACKAGE_WRITE_DEPS += "update-rc.d-native"
 
 updatercd_postinst() {
-# Begin section update-rc.d
 if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	if [ -n "$D" ]; then
 		OPT="-r $D"
@@ -46,15 +45,12 @@ if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
 	fi
 	update-rc.d $OPT ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 fi
-# End section update-rc.d
 }
 
 updatercd_prerm() {
-# Begin section update-rc.d
 if ${@use_updatercd(d)} && [ -z "$D" -a -x "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
 	${INIT_D_DIR}/${INITSCRIPT_NAME} stop || :
 fi
-# End section update-rc.d
 }
 
 updatercd_postrm() {
@@ -115,25 +111,13 @@ python populate_packages_updatercd () {
         postinst = d.getVar('pkg_postinst_%s' % pkg)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst = postinst.splitlines(True)
-        try:
-            index = postinst.index('# End section update-alternatives\n')
-            postinst.insert(index + 1, localdata.getVar('updatercd_postinst'))
-        except ValueError:
-            postinst.append(localdata.getVar('updatercd_postinst'))
-        postinst = ''.join(postinst)
+        postinst += localdata.getVar('updatercd_postinst')
         d.setVar('pkg_postinst_%s' % pkg, postinst)
 
         prerm = d.getVar('pkg_prerm_%s' % pkg)
         if not prerm:
             prerm = '#!/bin/sh\n'
-        prerm = prerm.splitlines(True)
-        try:
-            index = prerm.index('# Begin section update-alternatives\n')
-            prerm.insert(index, localdata.getVar('updatercd_prerm'))
-        except ValueError:
-            prerm.append(localdata.getVar('updatercd_prerm'))
-        prerm = ''.join(prerm)
+        prerm += localdata.getVar('updatercd_prerm')
         d.setVar('pkg_prerm_%s' % pkg, prerm)
 
         postrm = d.getVar('pkg_postrm_%s' % pkg)
-- 
2.13.6


