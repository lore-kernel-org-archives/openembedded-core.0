Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BF30B6007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 21:04:13 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2017 14:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,429,1503385200"; d="scan'208";a="141814755"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 24 Oct 2017 14:04:12 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Oct 2017 14:04:09 -0700
Message-Id: <1508879049-10490-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] gobject-introspection: improve reproducibility
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
X-List-Received-Date: Tue, 24 Oct 2017 21:04:13 -0000

Remove cross-compiler wrappers from the package, these contain numerous
build host references.
The wrappers are only needed for cross-compiling.

[YOCTO #11705]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../gobject-introspection/gobject-introspection_1.52.1.bb        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
index 605f02e..3fe71a3 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.52.1.bb
@@ -177,3 +177,12 @@ gi_ldsoconf_sysroot_preprocess () {
 	echo "echo ${libdir} >> ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf" >> $dest
 	chmod 755 $dest
 }
+
+# Remove wrapper files from the package, only used for cross-compiling
+PACKAGE_PREPROCESS_FUNCS += "gi_package_preprocess"
+gi_package_preprocess() {
+	rm -f ${PKGD}${bindir}/g-ir-scanner-qemuwrapper
+	rm -f ${PKGD}${bindir}/g-ir-scanner-wrapper
+	rm -f ${PKGD}${bindir}/g-ir-compiler-wrapper
+	rm -f ${PKGD}${bindir}/g-ir-scanner-lddwrapper
+}
-- 
2.7.4


