Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AFF070D6D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 08:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F8nR9N020448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 01:49:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 01:49:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 01:49:25 -0700
Message-ID: <27d6a067f84e300af1e31238f07667e46556bc72.1408092524.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408092524.git.liezhi.yang@windriver.com>
References: <cover.1408092524.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] python3-distribute: fix interpreter
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
X-List-Received-Date: Fri, 15 Aug 2014 08:49:28 -0000
Content-Type: text/plain

It should use "/usr/bin/env python3" rather than python, otherwise it
would cause python2 to be installed when we install python3-distribute.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3-distribute_0.6.32.bb            |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
index 573096c..0ef3a87 100644
--- a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -37,6 +37,8 @@ do_install_append() {
     rm ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
     mv ${D}${bindir}/easy_install ${D}${bindir}/easy3_install
     echo "./${SRCNAME}-${PV}-py${PYTHON_BASEVERSION}.egg" > ${D}${PYTHON_SITEPACKAGES_DIR}/setuptools.pth
+    sed -i -e '1s|^#!.*python|#!/usr/bin/env python3|' \
+        ${D}${PYTHON_SITEPACKAGES_DIR}/distribute-${PV}-py${PYTHON_BASEVERSION}.egg/setuptools/tests/test_resources.py
 }
 
 RDEPENDS_${PN} = "\
-- 
1.7.9.5


