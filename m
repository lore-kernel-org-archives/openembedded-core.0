Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C1AFB62132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:54:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498220"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:54:19 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:54:28 +0300
Message-Id: <895ad837696396c6bf9e6abf337bde77673af5e2.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 39/45] libcap-ng: move to Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:54:17 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
index 5715467..5608f49 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
@@ -10,16 +10,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
            file://python.patch"
 
-inherit lib_package autotools pythonnative
+inherit lib_package autotools python3native
 
 SRC_URI[md5sum] = "3d7d126b29e2869a0257c17c8b0d9b2e"
 SRC_URI[sha256sum] = "615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b"
 
-DEPENDS += "swig-native python"
+DEPENDS += "swig-native python3"
 
-EXTRA_OECONF += "--without-python3"
-
-EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
+export PYTHON
+export STAGING_INCDIR
+export STAGING_LIBDIR
+EXTRA_OECONF += "--with-python --with-python3"
+EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}${PYTHON_ABI}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
 
 PACKAGES += "${PN}-python"
 
-- 
2.8.1


