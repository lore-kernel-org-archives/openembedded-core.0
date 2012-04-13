Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SIdV9-0005Vv-4A
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 12:13:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Apr 2012 03:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141281505"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by fmsmga001.fm.intel.com with ESMTP; 13 Apr 2012 03:03:48 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 18:04:09 +0800
Message-Id: <01480f0f7418b8ceac72201e1b285495d2e23d58.1334311268.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1334311268.git.dexuan.cui@intel.com>
References: <cover.1334311268.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1334311268.git.dexuan.cui@intel.com>
References: <cover.1334311268.git.dexuan.cui@intel.com>
Subject: [PATCH 1/1] nspr: fix package spliting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 10:13:11 -0000

Here /usr/lib/lib*.so files are binaries rather than symbol links.
We should package them into ${PN} rather than ${PN}-dev, or else,
when a package, that rdepends on nspr, is packaged, we get a
"non-dev package rdepends on nspr-dev" ERROR.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-support/nspr/nspr_4.8.9.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/nspr/nspr_4.8.9.bb b/meta/recipes-support/nspr/nspr_4.8.9.bb
index 8b840d9..d3c683c 100644
--- a/meta/recipes-support/nspr/nspr_4.8.9.bb
+++ b/meta/recipes-support/nspr/nspr_4.8.9.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://configure.in;beginline=3;endline=40;md5=99d4d7d68bbc4
                     file://Makefile.in;beginline=4;endline=38;md5=c2b512182a334e1bfa1edc4d1c84a298 "
 SECTION = "libs/network"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz \
            file://remove-rpath-from-tests.patch \
@@ -160,6 +160,7 @@ do_install_append() {
     install -m 0755 ${TESTS} ${D}${libdir}/nspr/tests
 }
 
-FILES_${PN} = "${bindir}/*"
-FILES_${PN}-dev += "${libdir}/nspr/tests/*"
+FILES_${PN} = "${bindir}/* ${libdir}/lib*.so"
+FILES_${PN}-dev = "${libdir}/nspr/tests/* ${libdir}/pkgconfig \
+                ${includedir}/* ${datadir}/aclocal/* "
 FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
-- 
1.7.6



