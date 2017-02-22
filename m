Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 238847310E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:52:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 06:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51302184"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:52:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:51:07 +0200
Message-Id: <137b2d8ef4355e51436fe80a9b564668b61ee4b8.1487774787.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/24] lzip: add a recipe from meta-oe
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
X-List-Received-Date: Wed, 22 Feb 2017 14:52:24 -0000

ed tarballs are now available only in .lz format, which saves them
an amazing 30 kilobytes over gz.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/lzip/lzip_1.18.bb | 41 +++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/lzip/lzip_1.18.bb

diff --git a/meta/recipes-extended/lzip/lzip_1.18.bb b/meta/recipes-extended/lzip/lzip_1.18.bb
new file mode 100644
index 00000000000..30c7dd5a6d2
--- /dev/null
+++ b/meta/recipes-extended/lzip/lzip_1.18.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Lossless data compressor based on the LZMA algorithm"
+HOMEPAGE = "http://lzip.nongnu.org/lzip.html"
+SECTION = "console/utils"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=76d6e300ffd8fb9d18bd9b136a9bba13 \
+                    file://decoder.cc;beginline=3;endline=16;md5=db09fe3f9573f94d0076f7f07959e6e1"
+
+SRC_URI = "${SAVANNAH_GNU_MIRROR}/lzip/lzip-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3838567460ce4a10143de4bccc64fe1c"
+SRC_URI[sha256sum] = "47f9882a104ab05532f467a7b8f4ddbb898fa2f1e8d9d468556d6c2d04db14dd"
+
+CONFIGUREOPTS = "\
+    '--srcdir=${S}' \
+    '--prefix=${prefix}' \
+    '--exec-prefix=${exec_prefix}' \
+    '--bindir=${bindir}' \
+    '--datadir=${datadir}' \
+    '--infodir=${infodir}' \
+    '--sysconfdir=${sysconfdir}' \
+    'CXX=${CXX}' \
+    'CPPFLAGS=${CPPFLAGS}' \
+    'CXXFLAGS=${CXXFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+"
+EXTRA_OEMAKE = ""
+
+B = "${S}/obj"
+do_configure () {
+    ${S}/configure ${CONFIGUREOPTS}
+}
+
+do_install () {
+    oe_runmake 'DESTDIR=${D}' install
+    # Info dir listing isn't interesting at this point so remove it if it exists.
+    if [ -e "${D}${infodir}/dir" ]; then
+        rm -f ${D}${infodir}/dir
+    fi
+}
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.11.0


