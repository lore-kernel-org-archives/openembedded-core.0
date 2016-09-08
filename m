Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED7E07002B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 19:20:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2016 12:20:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,301,1470726000"; 
   d="scan'208";a="6549768"
Received: from cmau-mobl2.amr.corp.intel.com (HELO
	swold-mobl2.amr.corp.intel.com) ([10.255.95.201])
	by orsmga004.jf.intel.com with ESMTP; 08 Sep 2016 12:20:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  8 Sep 2016 12:20:14 -0700
Message-Id: <1473362414-29683-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] qemu: fix: cp command cannot find tests/Makeflie
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
X-List-Received-Date: Thu, 08 Sep 2016 19:20:18 -0000

From: Jianxun Zhang <jianxun.zhang@linux.intel.com>

bitbake qemu

This error shows up:

ERROR: qemu-2.7.0-r1 do_install_ptest_base: Function failed:
do_install_ptest_base
...
cp: cannot stat '...tmp/work/core2-64-poky-linux/qemu/2.7.0-r1
/qemu-2.7.0/tests/Makefile: No such file or directory
...

Commit 46e7b70699d8bf4db08c8bb5111974318dd5416d in qemu project
renamed tests/Makefile to tests/Makefile.include, we apply the
same change in recipe accordingly to fix this issue.

Fixes [YOCTO #10245]
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d724aa4..b46e7f7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -76,7 +76,7 @@ do_install_ptest() {
 	cp -rL ${B}/tests ${D}${PTEST_PATH}
 	find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcod]" | xargs -i rm -rf {}
 
-	cp ${S}/tests/Makefile ${D}${PTEST_PATH}/tests
+	cp ${S}/tests/Makefile.include ${D}${PTEST_PATH}/tests
 }
 
 do_install () {
-- 
2.7.4


