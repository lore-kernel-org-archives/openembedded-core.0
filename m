Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 26CE27002B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 09:02:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2I92f0k020439
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Mar 2016 02:02:41 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 18 Mar 2016 02:02:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>,
	<raj.khem@gmail.com>
Date: Fri, 18 Mar 2016 05:01:55 -0400
Message-ID: <4e249657117a1b4e7cf92434a3c65b1e2293b324.1458282563.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/18] python3-pip: use old-style install
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
X-List-Received-Date: Fri, 18 Mar 2016 09:02:42 -0000
Content-Type: text/plain

Since '--root' is added to 'setup.py install' to fix .pyc/.pyo
buildpaths issue. For python3-pip, the '--root' option
means there will be no eggs generated.

Ubuntu or Debian did the same thing like us:
https://packages.debian.org/sid/all/python3-pip/filelist

[YOCTO #8446]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3-pip_8.0.0.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_8.0.0.bb b/meta/recipes-devtools/python/python3-pip_8.0.0.bb
index 834ecda..b45aeea 100644
--- a/meta/recipes-devtools/python/python3-pip_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pip_8.0.0.bb
@@ -19,22 +19,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils3
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
-
-do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
-}
-
 # Use setuptools site.py instead, avoid shared state issue
 do_install_append() {
-    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/site.py
-    rm ${D}/${libdir}/${PYTHON_DIR}/site-packages/__pycache__/site.cpython-*.pyc
-
     # Install as pip3 and leave pip2 as default
     rm ${D}/${bindir}/pip
-
-    # Installed eggs need to be passed directly to the interpreter via a pth file
-    echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}-${PV}.pth
 }
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


