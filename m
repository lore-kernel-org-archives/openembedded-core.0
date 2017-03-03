Return-Path: <amarnath.valluri@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C9381775CA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:29:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2017 04:29:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,237,1484035200"; d="scan'208";a="55465746"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2017 04:29:21 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 14:27:42 +0200
Message-Id: <1488544062-30428-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LYgAGvTa5s1cBigazXo9edrXcF6XNpbx=NmBR=D-zjkSw@mail.gmail.com>
References: <CAJTo0LYgAGvTa5s1cBigazXo9edrXcF6XNpbx=NmBR=D-zjkSw@mail.gmail.com>
Subject: [OE-Core[[PATCH v3 19/25] mdadm: Avoid using hardocded sbin path
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
X-List-Received-Date: Fri, 03 Mar 2017 12:29:22 -0000

Use appropriate bitbake variable inplace of hardcoded sbin path in Makefile

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/recipes-extended/mdadm/mdadm_4.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index c228899..62614f0 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -33,6 +33,8 @@ CFLAGS_append_mipsarchn64 = ' -D__SANE_USERSPACE_TYPES__'
 CFLAGS_append_mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
 do_compile() {
+	# Point to right sbindir
+	sed -i -e "s;BINDIR  = /sbin;BINDIR = $base_sbindir;" ${S}/Makefile
 	oe_runmake SYSROOT="${STAGING_DIR_TARGET}"
 }
 
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


