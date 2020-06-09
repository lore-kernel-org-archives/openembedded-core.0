Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.2077.1591687725201687544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 00:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0597Shet026526
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2020 00:28:44 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 9 Jun 2020 00:28:43 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-setuptools: add missing rdepends for python3-pkg-resources
Date: Tue, 9 Jun 2020 15:27:20 +0800
Message-ID: <20200609072720.366796-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add missing rdepends for python3-pkg-resources to fix below error:
 # python3
 [snip]
 import pkg_resources
 [snip]
 ModuleNotFoundError: No module named 'plistlib'
 ModuleNotFoundError: No module named 'email'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python-setuptools.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index c91cca9f06..032d337424 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -48,6 +48,12 @@ BBCLASSEXTEND = "native nativesdk"
 # minimal distributions.
 PACKAGES =+ "${PYTHON_PN}-pkg-resources "
 FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
+RDEPENDS_${PYTHON_PN}-pkg-resources = "\
+  ${PYTHON_PN}-compression \
+  ${PYTHON_PN}-email \
+  ${PYTHON_PN}-plistlib \
+  ${PYTHON_PN}-pprint \
+"
 # Due to the way OE-Core implemented native recipes, the native class cannot
 # have a dependency on something that is not a recipe name. Work around that by
 # manually setting RPROVIDES.
-- 
2.24.1

