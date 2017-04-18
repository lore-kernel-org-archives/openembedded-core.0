Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8E35371AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 10:08:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 18 Apr 2017 03:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,218,1488873600"; d="scan'208";a="1137109651"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2017 03:08:54 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 924596A4006;
	Tue, 18 Apr 2017 03:08:42 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org,
	freesilicon@gmail.com
Date: Tue, 18 Apr 2017 13:08:43 +0300
Message-Id: <1492510123-21370-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] Revert "openssl: Fix symlink creation"
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
X-List-Received-Date: Tue, 18 Apr 2017 10:08:54 -0000

This reverts commit 991620f3962a9917fa99abb5582f4b72ebd42a3d.

The commit breaks openssl-native (you can no longer generate keys
because it can't find the configuration file). Also the idea that we
would install configuration files normally but then add the symlinks
pointing to them in a postinstall feels wrong.

Fixes [YOCTO #11296]. The bug contains an alternative fix but I'm
sending a revert as I cannot fully understand the motive of the
original patch. See also discussion in
http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135176.html

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index c721d8c..8f2a797 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -201,6 +201,7 @@ do_install () {
 	   ${D}${sysconfdir}/ssl/
 	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
 	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
+	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
 }
 
 do_install_ptest () {
@@ -248,16 +249,4 @@ do_install_append_class-native() {
 	    OPENSSL_ENGINES=${libdir}/ssl/engines
 }
 
-pkg_postinst_openssl-conf () {
-#!/bin/sh
-if [ -e $D${libdir}/ssl/openssl.cnf ]; then
-	rm -f $D${libdir}/ssl/openssl.cnf
-fi
-
-# If openssl-conf is installed before openssl, we must ensure that the symlink
-# destination exists
-mkdir -p $D${libdir}/ssl/
-ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


