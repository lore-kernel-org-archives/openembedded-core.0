Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09C76605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 12:13:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2MCDFlE031004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Mar 2016 05:13:15 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 22 Mar 2016 05:13:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>, <mark.hatle@windriver.com>
Date: Tue, 22 Mar 2016 08:12:38 -0400
Message-ID: <a997ff86a299ec21d6378f75b95b4033f48cc3b8.1458638728.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458638728.git.hongxu.jia@windriver.com>
References: <cover.1458638728.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/16] python-setuptools/python3-setuptools: use old-style install
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
X-List-Received-Date: Tue, 22 Mar 2016 12:13:16 -0000
Content-Type: text/plain

Since '--root' is added to 'setup.py install' to fix .pyc/.pyo
buildpaths issue. For python setuptools, the '--root' option
means explicit request for old-style install. There will be
no egg generated. And it do not need setuptools.pth any more.

Rename easy_install to easy_install3.

Ubuntu or Debian did the same thing like us:
https://packages.debian.org/sid/all/python3-setuptools/filelist

[YOCTO #8446]
[YOCTO #9162]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python-setuptools_19.4.bb  | 2 --
 meta/recipes-devtools/python/python3-setuptools_19.4.bb | 8 ++------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python-setuptools_19.4.bb b/meta/recipes-devtools/python/python-setuptools_19.4.bb
index c172039..01763d4 100644
--- a/meta/recipes-devtools/python/python-setuptools_19.4.bb
+++ b/meta/recipes-devtools/python/python-setuptools_19.4.bb
@@ -7,8 +7,6 @@ DEPENDS_class-native += "python-native"
 
 inherit distutils
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
-
 RDEPENDS_${PN} = "\
   python-stringold \
   python-email \
diff --git a/meta/recipes-devtools/python/python3-setuptools_19.4.bb b/meta/recipes-devtools/python/python3-setuptools_19.4.bb
index fb2931c..12b0d93 100644
--- a/meta/recipes-devtools/python/python3-setuptools_19.4.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_19.4.bb
@@ -5,13 +5,9 @@ DEPENDS_class-native += "python3-native"
 
 inherit distutils3
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
-
-# The installer puts the wrong path in the setuptools.pth file.  Correct it.
+# Rename easy_install to avoid confliction with python2's setuptools
 do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
-    mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+    mv ${D}${bindir}/easy_install ${D}${bindir}/easy_install3
 }
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


