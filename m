Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75DD6793BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 19:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 1C2B5184AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id eSOxob9jwaTT
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1F240184A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E50DD1E092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9D7D1E091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id CE140192C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:17 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w8OJ3IiC032096
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w8OJ3IcA032095
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2018 21:03:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 21:03:12 +0200
Message-Id: <20180924190313.32027-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20180924190313.32027-1-pkj@axis.com>
References: <20180924190313.32027-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/3] lsof: Make it compatible with externalsrc
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
X-List-Received-Date: Mon, 24 Sep 2018 19:03:18 -0000

Make the unpack task do nothing if externalsrc is in use. This avoids
the following error after having done `devtool modify lsof`:

ERROR: lsof-4.91-r0 do_unpack: Unpack failure for URL:
'file://.../builds/qemux86-64/tmp/work/core2-64-poky-linux/lsof/4.91-r0/lsof_4.91/lsof_4.91_src.tar'.
Unpack command PATH="..." tar x --no-same-owner -f
.../builds/qemux86-64/tmp/work/core2-64-poky-linux/lsof/4.91-r0/lsof_4.91/lsof_4.91_src.tar
failed with return value 2

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/lsof/lsof_4.91.bb | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-extended/lsof/lsof_4.91.bb
index 0128de4a6e..b3adfd57af 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -23,18 +23,17 @@ LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
 S = "${WORKDIR}/lsof_${PV}_src"
 
 python do_unpack () {
-    # temporarily change S for unpack
-    # of lsof_${PV}
-    s = d.getVar('S', False)
-    d.setVar('S', '${WORKDIR}/lsof_${PV}')
-    bb.build.exec_func('base_do_unpack', d)
-    # temporarily change SRC_URI for unpack
-    # of lsof_${PV}_src
-    src_uri = d.getVar('SRC_URI', False)
-    d.setVar('SRC_URI', '${LOCALSRC}')
-    d.setVar('S', s)
-    bb.build.exec_func('base_do_unpack', d)
-    d.setVar('SRC_URI', src_uri)
+    if not bb.data.inherits_class('externalsrc', d) or not d.getVar('EXTERNALSRC'):
+        # temporarily change S for unpack of lsof_${PV}
+        s = d.getVar('S', False)
+        d.setVar('S', '${WORKDIR}/lsof_${PV}')
+        bb.build.exec_func('base_do_unpack', d)
+        # temporarily change SRC_URI for unpack of lsof_${PV}_src
+        src_uri = d.getVar('SRC_URI', False)
+        d.setVar('SRC_URI', '${LOCALSRC}')
+        d.setVar('S', s)
+        bb.build.exec_func('base_do_unpack', d)
+        d.setVar('SRC_URI', src_uri)
 }
 
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
-- 
2.12.0


