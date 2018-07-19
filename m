Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C216578A68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:49:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6JEn5A4026876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jul 2018 07:49:05 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 19 Jul 2018 07:49:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 22:59:06 +0800
Message-ID: <bc5ed81c566f0a742f77c5963e1f455f662a03b4.1532012164.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532012164.git.hongxu.jia@windriver.com>
References: <cover.1532012164.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python3-pip: clean up obsolete
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
X-List-Received-Date: Thu, 19 Jul 2018 14:49:04 -0000
Content-Type: text/plain

Since unify var-DISTUTILS_INSTALL_ARGS in distutils and setuptools,
- The local DISTUTILS_INSTALL_ARGS assignment is obsolete;
- The site.py is not be generated any more;
- The layout is in a standard pip dir (such as /usr/lib/python3.5/site-
  packages/pip rather than /lib/python3.5/site-packages/pip-10.0.1-
  py3.5.egg/pip), the pth file is not required;

`#!/usr/bin/env python3' is already used, do not manually sed.

[YOCTO #8446]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3-pip_10.0.1.bb | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip_10.0.1.bb b/meta/recipes-devtools/python/python3-pip_10.0.1.bb
index 100d4d0..8deec2b 100644
--- a/meta/recipes-devtools/python/python3-pip_10.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_10.0.1.bb
@@ -11,27 +11,9 @@ SRC_URI[sha256sum] = "f2bd08e0cd1b06e10218feaf6fef299f473ba706582eb3bd9d52203fdb
 
 inherit pypi distutils3
 
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${PYTHON_SITEPACKAGES_DIR}"
-
-do_install_prepend() {
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-}
-
-# Use setuptools site.py instead, avoid shared state issue
 do_install_append() {
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/site.py
-    rm ${D}${PYTHON_SITEPACKAGES_DIR}/__pycache__/site.cpython-*.pyc
-
     # Install as pip3 and leave pip2 as default
     rm ${D}/${bindir}/pip
-
-    # Installed eggs need to be passed directly to the interpreter via a pth file
-    echo "./${PYPI_PACKAGE}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/${PYPI_PACKAGE}-${PV}.pth
-
-    # Make sure we use /usr/bin/env python3
-    for PYTHSCRIPT in `grep -rIl ${bindir} ${D}${bindir}/pip3*`; do
-        sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
-    done
 }
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


