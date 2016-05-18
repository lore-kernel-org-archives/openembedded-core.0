Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4148977047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4I7hl9x025852
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:47 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:40 -0700
Message-ID: <e53efa98a73809edd3ae7ed53d15762d7c018e35.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463557068.git.liezhi.yang@windriver.com>
References: <cover.1463557068.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] python3-async: add it for python3-gitdb
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

python3-git -> python3-gitdb -> python3-async

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/python/python-async.inc       | 15 +++++++++++++++
 meta/recipes-devtools/python/python-async_0.6.2.bb  | 16 +---------------
 meta/recipes-devtools/python/python3-async_0.6.2.bb |  6 ++++++
 3 files changed, 22 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-async.inc
 create mode 100644 meta/recipes-devtools/python/python3-async_0.6.2.bb

diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
new file mode 100644
index 0000000..d80606a
--- /dev/null
+++ b/meta/recipes-devtools/python/python-async.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
+HOMEPAGE = "http://github.com/gitpython-developers/async"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
+
+SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
+SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
+SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
+
+UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
+
+S = "${WORKDIR}/async-${PV}"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python-async_0.6.2.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
index ad0a617..d855e42 100644
--- a/meta/recipes-devtools/python/python-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python-async_0.6.2.bb
@@ -1,19 +1,5 @@
-SUMMARY = "Python framework to process interdependent tasks in a pool of workers"
-HOMEPAGE = "http://github.com/gitpython-developers/async"
-SECTION = "devel/python"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=88df8e78b9edfd744953862179f2d14e"
-
-SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
-SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
-SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
-
-UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/async/"
-
-S = "${WORKDIR}/async-${PV}"
+require python-async.inc
 
 inherit setuptools
 
 RDEPENDS_${PN} += "python-threading python-lang"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/python/python3-async_0.6.2.bb b/meta/recipes-devtools/python/python3-async_0.6.2.bb
new file mode 100644
index 0000000..54a30f5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-async_0.6.2.bb
@@ -0,0 +1,6 @@
+require python-async.inc
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-threading python3-lang"
+
-- 
2.8.0


