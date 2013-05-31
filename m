Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 442C062222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:06:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 May 2013 04:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,778,1363158000"; d="scan'208";a="346126790"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2013 04:06:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 14:07:08 +0300
Message-Id: <1369998428-20266-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 2/2] alsa-tools: Fix configure race
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
X-List-Received-Date: Fri, 31 May 2013 11:06:08 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

aclocal is being called here directly,
not called by autotools.bbclass wrapper.
aclocal files are installed in sysroot,
and are removed while build is still running.
This translates to a possible race condition during the build.

Fixes [YOCTO #4358].

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
index 81ad55a..24af545 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.26.1.bb
@@ -20,14 +20,20 @@ SRC_URI[sha256sum] = "553338693707fe6ddfc430b9edc4cd2677390e200c9e38de82ede3394e
 
 inherit autotools
 
-EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}' ACLOCAL_FLAGS='-I ${STAGING_DATADIR}/aclocal'"
+EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
 PACKAGECONFIG[gtk+] = ",,gtk+,"
 
+do_configure () {
+    autotools_do_configure
+    autotools_copy_aclocal
+}
+
 do_compile_prepend () {
     #Automake dir is not correctly detected in cross compilation case
     export AUTOMAKE_DIR=${STAGING_DATADIR_NATIVE}/$(ls ${STAGING_DATADIR_NATIVE} | grep automake)
+    export ACLOCAL="aclocal --system-acdir=${ACLOCALDIR}/"
 }
 
 FILES_${PN} += "${datadir}/ld10k1"
-- 
1.7.10.4


