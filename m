Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84E7277CD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:04:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3B84UDl010470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 01:04:30 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 11 Apr 2017 01:04:29 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Apr 2017 16:03:48 +0800
Message-ID: <1491897828-50233-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] python2/3: Remove building host path from packages
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
X-List-Received-Date: Tue, 11 Apr 2017 08:04:30 -0000
Content-Type: text/plain

Remove building host related path from python2 and python3 packages.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/python/python3_3.5.2.bb | 8 +++++++-
 meta/recipes-devtools/python/python_2.7.13.bb | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index 2ff7c9e..ca8dfe3 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -185,9 +185,15 @@ py_package_preprocess () {
 	install -m 0644 ${B}/Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile
 	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		-e 's:${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig:${datadir}/pkgconfig:g' \
+		-e 's:${STAGING_DIR_NATIVE}::g' \
+		-e 's:${STAGING_DIR_HOST}::g' \
+		-e 's:${WORKDIR}::g' \
+		-e 's:${TMPDIR}::g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}/Makefile \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py \
+		${PKGD}/${bindir}/python${PYTHON_MAJMIN}${PYTHON_ABI}-config
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 4ef9952..b4bde5f 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -131,7 +131,13 @@ py_package_preprocess () {
 
 	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		-e 's:${STAGING_DIR}/${MACHINE}${datadir}/pkgconfig:${datadir}/pkgconfig:g' \
+		-e 's:${STAGING_DIR_NATIVE}::g' \
+		-e 's:${STAGING_DIR_HOST}::g' \
+		-e 's:${WORKDIR}::g' \
+		-e 's:${TMPDIR}::g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/config.c \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
     python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
 }
-- 
1.9.1


