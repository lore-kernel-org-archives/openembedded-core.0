Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 065E378CCF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:51:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6R8p8sr019275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:51:08 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:51:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 17:01:17 +0800
Message-ID: <d80f61b5d3a25b41be8d6f7f9e472ae574d93697.1532682009.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1532682009.git.liezhi.yang@windriver.com>
References: <cover.1532682009.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] python3-testtools: add it for oeqa
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
X-List-Received-Date: Fri, 27 Jul 2018 08:51:07 -0000
Content-Type: text/plain

- It is required by oeqa, add it so that we can add nativesdk-python3-testtools
  to buildtools-tarball.
- The original one is python-testtools_2.3.0.bb which is from meta-openstack
  layer, I divided it into python-testtools.inc and python3-testtools_2.2.0.bb,
  and extended to nativesdk.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-testtools.inc  | 27 ++++++++++++++++++++++
 .../python/python3-testtools_2.2.0.bb              |  2 ++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-testtools.inc
 create mode 100644 meta/recipes-devtools/python/python3-testtools_2.2.0.bb

diff --git a/meta/recipes-devtools/python/python-testtools.inc b/meta/recipes-devtools/python/python-testtools.inc
new file mode 100644
index 0000000..0f449f4
--- /dev/null
+++ b/meta/recipes-devtools/python/python-testtools.inc
@@ -0,0 +1,27 @@
+DESCRIPTION = "Extensions to the Python standard library unit testing framework"
+HOMEPAGE = "https://pypi.python.org/pypi/testtools/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c9d3e8ba7141c83bfef190e0b9379a"
+
+inherit pypi
+
+SRC_URI[md5sum] = "adef817b07ba24fd6d807fd41a4f1ef4"
+SRC_URI[sha256sum] = "80f606607a6e4ce4d0e24e5b786562aa42c581906f3c070607a4265f3da65810"
+
+DEPENDS += " \
+    ${PYTHON_PN}-pbr \
+    "
+
+# Satisfy setup.py 'setup_requires'
+DEPENDS += " \
+    ${PYTHON_PN}-pbr-native \
+    "
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-extras \
+    ${PYTHON_PN}-pbr \
+    ${PYTHON_PN}-six \
+    "
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-testtools_2.2.0.bb b/meta/recipes-devtools/python/python3-testtools_2.2.0.bb
new file mode 100644
index 0000000..896ecee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-testtools_2.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-testtools.inc
-- 
2.7.4


