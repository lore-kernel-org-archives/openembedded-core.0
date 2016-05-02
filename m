Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA9B731C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 14:43:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 02 May 2016 07:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,567,1455004800"; d="scan'208";a="970839393"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 02 May 2016 07:43:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id A80656A4008
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 08:30:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 15:22:35 +0300
Message-Id: <9d32811fe04ce49bdc20891453d37819447d7f88.1462191317.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1462191317.git.ed.bartosh@linux.intel.com>
References: <cover.1462191317.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 4/6] bmap-tools: generate standalone script
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
X-List-Received-Date: Mon, 02 May 2016 14:43:24 -0000

Generated standalone bmaptool script that is more convenient
to use than native script. It can be run straight from
its location ./tmp/deploy/tools/bmaptool. The script doesn't
depend on anything except Python.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
index e10f5fd..0f95788 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
@@ -15,10 +15,28 @@ SRC_URI[sha256sum] = "cc6c7f7dc0a37e2a32deb127308e24e6c4b80bfb54f3803c308efab02b
 
 RDEPENDS_${PN} = "python-core python-compression"
 
-inherit setuptools
+inherit setuptools deploy
 
 BBCLASSEXTEND = "native"
 
 do_install_append_class-native() {
     sed -i -e 's|^#!.*/usr/bin/env python|#! /usr/bin/env nativepython|' ${D}${bindir}/bmaptool
 }
+
+do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_TOOLS}"
+do_deploy[stamp-extra-info] = ""
+do_deploy_class-native() {
+    cp bmaptool __main__.py
+    python -m zipfile -c bmaptool.zip bmaptools __main__.py
+    echo '#!/usr/bin/env python' | cat - bmaptool.zip > bmaptool-standalone
+    install -d ${DEPLOYDIR}
+    install -m 0755 bmaptool-standalone ${DEPLOYDIR}/bmaptool-${PV}
+    rm -f ${DEPLOYDIR}/bmaptool
+    ln -sf ./bmaptool-${PV} ${DEPLOYDIR}/bmaptool
+}
+
+do_deploy() {
+    :
+}
+
+addtask deploy before do_package after do_install
-- 
2.1.4


