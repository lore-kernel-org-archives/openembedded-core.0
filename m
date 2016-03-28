Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA3F6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 08:19:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2S8JYfA007012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 28 Mar 2016 01:19:34 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 01:19:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<mark.hatle@windriver.com>
Date: Mon, 28 Mar 2016 04:18:55 -0400
Message-ID: <4e95679d6eb8fd1a002d0b62f01b9ffbd3b35790.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/17] python-setuptools/python3-setuptools: use old-style install
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
X-List-Received-Date: Mon, 28 Mar 2016 08:19:34 -0000
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


