Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 009F878400
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 01:28:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w151SEd8026358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 4 Feb 2018 17:28:15 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 4 Feb 2018 17:28:12 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Feb 2018 20:28:01 -0500
Message-ID: <5af2b05f88df2d24a1bd7a725314be6e2e185e63.1517793934.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517793934.git.hongxu.jia@windriver.com>
References: <cover.1517793934.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] python3-core: improve reproducibility
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
X-List-Received-Date: Mon, 05 Feb 2018 01:28:14 -0000
Content-Type: text/plain

Since modify _sysconfigdata.py to improve reproducibility,
its pyo files should be recompiled.

Remove remaining build host references of python3.5m-config

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3_3.5.3.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index 3ae0db2..dfdaa92 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -194,7 +194,18 @@ py_package_preprocess () {
 		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
+		${PKGD}/${bindir}/python${PYTHON_BINABI}-config
+
+	# Recompile _sysconfigdata after modifying it
+	cd ${PKGD}
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py')"
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=1)"
+	${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+	     -c "from py_compile import compile; compile('./${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py', optimize=2)"
+	cd -
 }
 
 # manual dependency additions
-- 
2.8.1


