Return-Path: <amarnath.valluri@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 81078730B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 08:27:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 00:27:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,193,1484035200"; d="scan'208";a="1114018076"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2017 00:27:56 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 10:27:16 +0200
Message-Id: <1487752042-19804-45-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
References: <1487752042-19804-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2 19/25] mdadm: Avoid using hardocded udev, sbin paths
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
X-List-Received-Date: Wed, 22 Feb 2017 08:27:55 -0000

Use appropriate bitbake variables inplace of below hardcoded locations:
  /sbin -> ${base_sbindir}
  /lib/udev -> ${nonarch_base_libdir}/udev

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/mdadm/mdadm_4.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index c228899..8a77204 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -33,7 +33,9 @@ CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
-	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
+	# Point to right sbindir
+	sed -i -e 's;BINDIR  = /sbin;BINDIR = $base_sbindir;' ${S}/Makefile
+	oe_runmake SYSROOT="${STAGING_DIR_TARGET}" UDEVDIR="${nonarch_libdir}/udev"
 }
 
 do_install() {
@@ -51,7 +53,7 @@ do_install_ptest() {
 	cp -a ${S}/tests ${D}${PTEST_PATH}/tests
 	cp ${S}/test ${D}${PTEST_PATH}
 	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
-	ln -s /sbin/mdadm ${D}${PTEST_PATH}/mdadm
+	ln -s ${base_sbindir}/mdadm ${D}${PTEST_PATH}/mdadm
 	for prg in test_stripe swap_super raid6check
 	do
 		install -D -m 755 $prg ${D}${PTEST_PATH}/
-- 
2.7.4


