Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE6656B06C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0F6jo4K015974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 22:45:50 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 14 Jan 2019 22:45:49 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jan 2019 01:45:46 -0500
Message-ID: <20190115064546.121351-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] libcomps & librepo: fix buildpaths qa warnings
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
X-List-Received-Date: Tue, 15 Jan 2019 06:45:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add preprocess option '-fmacro-prefix-map' to TARGET_CPPFLAGS to fix
buildpaths qa warnings of libcomps and librepo.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/libcomps/libcomps_git.bb | 2 ++
 meta/recipes-devtools/librepo/librepo_1.9.3.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 500d412340..421b8173bb 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -18,6 +18,8 @@ inherit cmake distutils3-base
 
 DEPENDS += "libxml2 expat libcheck"
 
+TARGET_CPPFLAGS += "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3"
 OECMAKE_SOURCEPATH = "${S}/libcomps"
 
diff --git a/meta/recipes-devtools/librepo/librepo_1.9.3.bb b/meta/recipes-devtools/librepo/librepo_1.9.3.bb
index abfed798f3..4f468b198a 100644
--- a/meta/recipes-devtools/librepo/librepo_1.9.3.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.9.3.bb
@@ -15,6 +15,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake distutils3-base pkgconfig
 
+TARGET_CPPFLAGS += "-fmacro-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 -DENABLE_TESTS=OFF -DENABLE_DOCS=OFF -DWITH_ZCHUNK=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.0


