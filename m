Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3B086011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 03:00:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9G30edq015310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 20:00:50 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 20:00:29 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Oct 2018 10:19:16 +0800
Message-ID: <20181016021916.11521-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH] sstatetests.py: reset TCLIBCAPPEND
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
X-List-Received-Date: Tue, 16 Oct 2018 03:01:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It appends TCLIBCAPPEND to TMPDIR in meta/conf/distro/defaultsetup.conf:

  TMPDIR .= "${TCLIBCAPPEND}"

It affects some oe selftest cases in sstatetests.py. Reset TCLIBCAPPEND
for these cases.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 7194225c0a..077d6e5374 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -262,6 +262,7 @@ class SStateTests(SStateBase):
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
+TCLIBCAPPEND = ""
 BUILD_ARCH = "x86_64"
 BUILD_OS = "linux"
 SDKMACHINE = "x86_64"
@@ -272,6 +273,7 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
+TCLIBCAPPEND = ""
 BUILD_ARCH = "i686"
 BUILD_OS = "linux"
 SDKMACHINE = "i686"
@@ -307,12 +309,14 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroA\"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
         bitbake("core-image-sato -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+TCLIBCAPPEND = \"\"
 NATIVELSBSTRING = \"DistroB\"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
@@ -340,10 +344,12 @@ NATIVELSBSTRING = \"DistroB\"
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 """
         self.sstate_allarch_samesigs(configA, configB)
@@ -356,6 +362,7 @@ MACHINE = \"qemuarm\"
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86-64\"
 require conf/multilib.conf
 MULTILIBS = \"multilib:lib32\"
@@ -363,6 +370,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = \"x86\"
 """
         configB = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 require conf/multilib.conf
 MULTILIBS = \"\"
@@ -407,6 +415,7 @@ MULTILIBS = \"\"
 
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
+TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
@@ -416,6 +425,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
+TCLIBCAPPEND = \"\"
 MACHINE = \"qemux86copy\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
@@ -451,6 +461,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
 
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
+TCLIBCAPPEND = ""
 BB_NUMBER_THREADS = "${@oe.utils.cpu_count()}"
 PARALLEL_MAKE = "-j 1"
 DL_DIR = "${TOPDIR}/download1"
@@ -464,6 +475,7 @@ http_proxy = ""
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
+TCLIBCAPPEND = ""
 BB_NUMBER_THREADS = "${@oe.utils.cpu_count()+1}"
 PARALLEL_MAKE = "-j 2"
 DL_DIR = "${TOPDIR}/download2"
-- 
2.19.0.rc2


