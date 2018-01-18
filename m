Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1109787B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 03:48:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0I3mWGf016319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 17 Jan 2018 19:48:32 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 19:48:31 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <juro.bystricky@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 22:48:28 -0500
Message-ID: <6ac9b47678b7329d1096ccbeea51409bb0a4c820.1516247117.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1516247117.git.dengke.du@windriver.com>
References: <cover.1516247117.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python2-dev: improve reproducibility
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
X-List-Received-Date: Thu, 18 Jan 2018 03:48:32 -0000
Content-Type: text/plain

oe-core has fixed it for python3, we can apply it to python2, the origin
commit id:

    e21723bb9b6035714268eeab5f43e2d1cb798a0d

We can check it here:

   http://git.openembedded.org/openembedded-core/commit/?id=e21723bb9b6035714268eeab5f43e2d1cb798a0d

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-devtools/python/python_2.7.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/python/python_2.7.13.bb b/meta/recipes-devtools/python/python_2.7.13.bb
index 754c029..8075204 100644
--- a/meta/recipes-devtools/python/python_2.7.13.bb
+++ b/meta/recipes-devtools/python/python_2.7.13.bb
@@ -140,6 +140,10 @@ py_package_preprocess () {
 
 	# Remove references to buildmachine paths in target Makefile and _sysconfigdata
 	sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+		-e 's|${DEBUG_PREFIX_MAP}||g' \
+		-e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+		-e 's:${RECIPE_SYSROOT}::g' \
+		-e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile \
 		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
     python -m py_compile ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata.py
-- 
2.8.1


