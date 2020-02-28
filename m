Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A17D56196C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 15:24:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 07:24:17 -0800
X-IronPort-AV: E=Sophos;i="5.70,496,1574150400"; d="scan'208";a="232272088"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	28 Feb 2020 07:24:15 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 23:23:34 +0800
Message-Id: <559fd361440898479937c887a0e4f8cfb8c46891.1582902875.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1582902875.git.anuj.mittal@intel.com>
References: <cover.1582902875.git.anuj.mittal@intel.com>
Subject: [zeus][PATCH 10/22] libmodule-build-perl: fix ptests
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
X-List-Received-Date: Fri, 28 Feb 2020 15:24:15 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Particularly remove a broken detection of skipped tests
(which was marking tests that actually passed), and install
additional artefacts needed for testing.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dbbce0918617c21d0e43e9727d38372c22dff3dc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl/libmodule-build-perl/run-ptest | 2 --
 meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest b/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
index 0d63d15..d802781 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
+++ b/meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
@@ -6,8 +6,6 @@ for case in `find t -type f -name '*.t'`; do
     cat $case.output
     if [ $ret -ne 0 ]; then
         echo "FAIL: ${case%.t}"
-    elif grep -i 'SKIP' $case.output; then
-        echo "SKIP: ${case%.t}"
     else
         echo "PASS: ${case%.t}"
     fi
diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
index f759f86..e3ba40d 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
@@ -36,7 +36,10 @@ do_patch[postfuncs] += "do_patch_module_build"
 do_install_ptest() {
 	cp -r ${B}/inc ${D}${PTEST_PATH}
 	cp -r ${B}/blib ${D}${PTEST_PATH}
+	cp -r ${B}/_build ${D}${PTEST_PATH}
+	cp -r ${B}/lib ${D}${PTEST_PATH}
 	chown -R root:root ${D}${PTEST_PATH}
+	sed -i -e "s,'perl' => .*,'perl' => '/usr/bin/perl'\,,g" ${D}${PTEST_PATH}/_build/build_params
 }
 
 RDEPENDS_${PN} += " \
-- 
2.7.4


