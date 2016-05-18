Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8392077047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4I7hmeb013811
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:41 -0700
Message-ID: <b5545fb5bf4024abcfd4d528d93113816b168e4d.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] python3-gitdb: add it for python3-git
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
X-List-Received-Date: Wed, 18 May 2016 07:43:47 -0000
Content-Type: text/plain

Need add python3-git to buildtools-tarball for the py3 build, and the
dependencies chain is:

python3-git -> python3-gitdb

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-gitdb.inc       | 16 ++++++++++++++++
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb  | 18 ++----------------
 meta/recipes-devtools/python/python3-gitdb_0.6.4.bb |  7 +++++++
 3 files changed, 25 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-gitdb.inc
 create mode 100644 meta/recipes-devtools/python/python3-gitdb_0.6.4.bb

diff --git a/meta/recipes-devtools/python/python-gitdb.inc b/meta/recipes-devtools/python/python-gitdb.inc
new file mode 100644
index 0000000..6467bd2
--- /dev/null
+++ b/meta/recipes-devtools/python/python-gitdb.inc
@@ -0,0 +1,16 @@
+SUMMARY = "A pure-Python git object database"
+HOMEPAGE = "http://github.com/gitpython-developers/gitdb"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
+
+SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
+SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
+
+S = "${WORKDIR}/gitdb-${PV}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
index c82df1e..1777395 100644
--- a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
@@ -1,21 +1,7 @@
-SUMMARY = "A pure-Python git object database"
-HOMEPAGE = "http://github.com/gitpython-developers/gitdb"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=59e5ecb13339a936eedf83282eaf4528"
-DEPENDS = "python-async python-smmap"
-
-SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
-SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
+require python-gitdb.inc
 
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/gitdb/"
-
-S = "${WORKDIR}/gitdb-${PV}"
+DEPENDS = "python-async python-smmap"
 
 inherit distutils
 
 RDEPENDS_${PN} += "python-smmap python-async python-mmap python-lang python-zlib python-io python-shell"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
new file mode 100644
index 0000000..9927658
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
@@ -0,0 +1,7 @@
+require python-gitdb.inc
+
+DEPENDS = "python3-async python3-smmap"
+
+inherit distutils3
+
+RDEPENDS_${PN} += "python3-smmap python3-async python3-mmap python3-lang python3-io python3-shell"
-- 
2.8.0


