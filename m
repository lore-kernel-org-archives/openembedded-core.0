Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 92A8E77EA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 17:28:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Sep 2017 10:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,422,1500966000"; d="scan'208";a="1174213239"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 20 Sep 2017 10:27:50 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 10:27:59 -0700
Message-Id: <1505928479-43268-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] strace_4.18.bb: improve reproducibility
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
X-List-Received-Date: Wed, 20 Sep 2017 17:28:00 -0000

Remove build host references from strace-ptest package.
Also removed some unneeded timestaps.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/strace/strace_4.18.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/strace/strace_4.18.bb b/meta/recipes-devtools/strace/strace_4.18.bb
index bbb82a9..e8fd048 100644
--- a/meta/recipes-devtools/strace/strace_4.18.bb
+++ b/meta/recipes-devtools/strace/strace_4.18.bb
@@ -42,7 +42,16 @@ do_compile_ptest() {
 
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
-	sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
+	sed -i -e '/^src/s/strace.*[1-9]/ptest/' \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+	    -e 's:${RECIPE_SYSROOT}::g' \
+	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+	    -e '/^DEB_CHANGELOGTIME/d' \
+	    -e '/^RPM_CHANGELOGTIME/d' \
+	${D}/${PTEST_PATH}/${TESTDIR}/Makefile
 }
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


