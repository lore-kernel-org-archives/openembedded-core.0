Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1A356212E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904283"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:22 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:50 +0200
Message-Id: <62a513f282c2cce0fbb834a70d45c87c8b8c412e.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/9] package_regex.inc: split PyPi related entries to their own recipes
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:22 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc            | 19 -------------------
 meta/recipes-devtools/python/python-async_0.6.2.bb    |  2 ++
 meta/recipes-devtools/python/python-git_1.0.1.bb      |  3 +++
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb    |  2 ++
 meta/recipes-devtools/python/python-mako_1.0.1.bb     |  3 +++
 meta/recipes-devtools/python/python-nose_1.3.6.bb     |  3 +++
 meta/recipes-devtools/python/python-pexpect_3.3.bb    |  2 ++
 meta/recipes-devtools/python/python-smmap_0.9.0.bb    |  3 +++
 meta/recipes-devtools/python/python3-pip_6.1.1.bb     |  2 ++
 .../python/python3-setuptools_18.2.bb                 |  2 ++
 10 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index d55f5c8..7888260 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -120,25 +120,6 @@ REGEX_pn-nativesdk-qt4-tools = "(?P<pver>\d+(\.\d+)+)/"
 REGEX_URI_pn-qt4-native = "http://download.qt.io/official_releases/qt/4.8/"
 REGEX_pn-qt4-native = "(?P<pver>\d+(\.\d+)+)/"
 
-# PyPI sites
-REGEX_URI_pn-python-nose = "https://pypi.python.org/pypi/nose/"
-REGEX_pn-python-nose = "/nose/${COMMON_REGEX}"
-# python-distribute 0.7.x is a simple compatibility layer that installs Setuptools 0.7+.
-# so we stick to 0.6.x series
-REGEX_URI_pn-python-distribute = "https://pypi.python.org/pypi/distribute/"
-REGEX_pn-python-distribute = "/distribute/(?P<pver>\d+.6.\d+)"
-REGEX_URI_pn-python-gitdb = "https://pypi.python.org/pypi/gitdb/"
-REGEX_URI_pn-python-async = "https://pypi.python.org/pypi/async/"
-REGEX_URI_pn-python-smmap = "https://pypi.python.org/pypi/smmap/"
-REGEX_pn-python-smmap = "/smmap/${COMMON_REGEX}"
-REGEX_URI_pn-python-git = "https://pypi.python.org/pypi/GitPython/"
-REGEX_pn-python-git = "/GitPython/${COMMON_REGEX}"
-REGEX_URI_pn-python-mako = "https://pypi.python.org/pypi/mako/"
-REGEX_pn-python-mako = "/Mako/${COMMON_REGEX}"
-REGEX_URI_pn-python-pexpect = "https://pypi.python.org/pypi/pexpect"
-REGEX_URI_pn-python3-pip = "https://pypi.python.org/pypi/pip"
-REGEX_URI_pn-python3-setuptools = "https://pypi.python.org/pypi/setuptools"
-
 # Sourceforge sites
 REGEX_URI_pn-python-scons = "http://sourceforge.net/projects/scons/files/scons/"
 REGEX_pn-python-scons = "/scons/${COMMON_REGEX}/"
diff --git a/meta/recipes-devtools/python/python-async_0.6.2.bb b/meta/recipes-devtools/python/python-async_0.6.2.bb
index 5a17a1a..0da6be6 100644
--- a/meta/recipes-devtools/python/python-async_0.6.2.bb
+++ b/meta/recipes-devtools/python/python-async_0.6.2.bb
@@ -8,6 +8,8 @@ SRC_URI = "http://pypi.python.org/packages/source/a/async/async-${PV}.tar.gz"
 SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
 SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
 
+REGEX_URI = "https://pypi.python.org/pypi/async/"
+
 S = "${WORKDIR}/async-${PV}"
 
 inherit setuptools
diff --git a/meta/recipes-devtools/python/python-git_1.0.1.bb b/meta/recipes-devtools/python/python-git_1.0.1.bb
index a78d7c8..6a6f15b 100644
--- a/meta/recipes-devtools/python/python-git_1.0.1.bb
+++ b/meta/recipes-devtools/python/python-git_1.0.1.bb
@@ -14,6 +14,9 @@ SRC_URI = "http://pypi.python.org/packages/source/G/GitPython/GitPython-${PV}.ta
 SRC_URI[md5sum] = "4659644b42c41e5e5170c0cd83ed6422"
 SRC_URI[sha256sum] = "9c88c17bbcae2a445ff64024ef13526224f70e35e38c33416be5ceb56ca7f760"
 
+REGEX_URI = "https://pypi.python.org/pypi/GitPython/"
+REGEX = "/GitPython/(?P<pver>(\d+[\.\-_]*)+)"
+
 S = "${WORKDIR}/GitPython-${PV}"
 
 inherit setuptools
diff --git a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
index f0083bd..20b8b06 100644
--- a/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
+++ b/meta/recipes-devtools/python/python-gitdb_0.6.4.bb
@@ -10,6 +10,8 @@ SRC_URI = "https://pypi.python.org/packages/source/g/gitdb/gitdb-${PV}.tar.gz"
 SRC_URI[md5sum] = "44e4366b8bdfd306b075c3a52c96ae1a"
 SRC_URI[sha256sum] = "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
 
+REGEX_URI = "https://pypi.python.org/pypi/gitdb/"
+
 S = "${WORKDIR}/gitdb-${PV}"
 
 inherit distutils
diff --git a/meta/recipes-devtools/python/python-mako_1.0.1.bb b/meta/recipes-devtools/python/python-mako_1.0.1.bb
index 5d42b0c..2c2b45e 100644
--- a/meta/recipes-devtools/python/python-mako_1.0.1.bb
+++ b/meta/recipes-devtools/python/python-mako_1.0.1.bb
@@ -8,6 +8,9 @@ SRC_URI = "https://pypi.python.org/packages/source/M/Mako/Mako-${PV}.tar.gz"
 SRC_URI[md5sum] = "9f0aafd177b039ef67b90ea350497a54"
 SRC_URI[sha256sum] = "45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c"
 
+REGEX_URI = "https://pypi.python.org/pypi/mako/"
+REGEX = "/Mako/(?P<pver>(\d+[\.\-_]*)+)"
+
 S = "${WORKDIR}/Mako-${PV}"
 
 inherit setuptools
diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb b/meta/recipes-devtools/python/python-nose_1.3.6.bb
index e47ddb0..54811fc 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.6.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.6.bb
@@ -10,6 +10,9 @@ SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
 SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
 SRC_URI[sha256sum] = "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
 
+REGEX_URI = "https://pypi.python.org/pypi/nose/"
+REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
+
 S = "${WORKDIR}/nose-${PV}"
 
 inherit setuptools
diff --git a/meta/recipes-devtools/python/python-pexpect_3.3.bb b/meta/recipes-devtools/python/python-pexpect_3.3.bb
index cd80aeb..6ff6b3e 100644
--- a/meta/recipes-devtools/python/python-pexpect_3.3.bb
+++ b/meta/recipes-devtools/python/python-pexpect_3.3.bb
@@ -8,6 +8,8 @@ SRC_URI = "https://pypi.python.org/packages/source/p/pexpect/pexpect-${PV}.tar.g
 SRC_URI[md5sum] = "0de72541d3f1374b795472fed841dce8"
 SRC_URI[sha256sum] = "dfea618d43e83cfff21504f18f98019ba520f330e4142e5185ef7c73527de5ba"
 
+REGEX_URI = "https://pypi.python.org/pypi/pexpect"
+
 S = "${WORKDIR}/pexpect-${PV}"
 
 inherit distutils
diff --git a/meta/recipes-devtools/python/python-smmap_0.9.0.bb b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
index b658be8..72a2851 100644
--- a/meta/recipes-devtools/python/python-smmap_0.9.0.bb
+++ b/meta/recipes-devtools/python/python-smmap_0.9.0.bb
@@ -11,6 +11,9 @@ SRC_URI = "http://pypi.python.org/packages/source/s/smmap/smmap-${PV}.tar.gz"
 SRC_URI[md5sum] = "d7932d5ace206bf4ae15198cf36fb6ab"
 SRC_URI[sha256sum] = "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
 
+REGEX_URI = "https://pypi.python.org/pypi/smmap/"
+REGEX = "/smmap/(?P<pver>(\d+[\.\-_]*)+)"
+
 S = "${WORKDIR}/smmap-${PV}"
 
 inherit setuptools
diff --git a/meta/recipes-devtools/python/python3-pip_6.1.1.bb b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
index 7bfc30e..45b3145 100644
--- a/meta/recipes-devtools/python/python3-pip_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_6.1.1.bb
@@ -13,6 +13,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "6b19e0a934d982a5a4b798e957cb6d45"
 SRC_URI[sha256sum] = "89f3b626d225e08e7f20d85044afa40f612eb3284484169813dc2d0631f2a556"
 
+REGEX_URI = "https://pypi.python.org/pypi/pip"
+
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils3
diff --git a/meta/recipes-devtools/python/python3-setuptools_18.2.bb b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
index dc0ac80..94144b5 100644
--- a/meta/recipes-devtools/python/python3-setuptools_18.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_18.2.bb
@@ -14,6 +14,8 @@ SRC_URI = " \
 SRC_URI[md5sum] = "52b4e48939ef311d7204f8fe940764f4"
 SRC_URI[sha256sum] = "0994a58df27ea5dc523782a601357a2198b7493dcc99a30d51827a23585b5b1d"
 
+REGEX_URI = "https://pypi.python.org/pypi/setuptools"
+
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit distutils3
-- 
2.6.2


