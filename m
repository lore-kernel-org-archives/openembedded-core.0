Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11J-00027o-1v
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 08:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520229"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 08:59:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:19 -0700
Message-Id: <33759cb330142f3d9e1bb0fcda1ddb546faca5ef.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 01/39] bitbake.conf: reorder PACKAGES list
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:09 -0000

This change re-orders the PACKAGES list to move PN to the end of the list
this will ensure that base package gets the final bits since the packaging
is greedy. We can then have -dev and other package get bits first.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 97930a7..e072757 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -253,7 +253,7 @@ SOLIBSDEV_darwin = ".dylib"
 SOLIBSDEV_darwin8 = ".dylib"
 SOLIBSDEV_darwin9 = ".dylib"
 
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PN}"
 PACKAGES_DYNAMIC = "${PN}-locale-*"
 FILES = ""
 
@@ -270,9 +270,11 @@ FILES_${PN}-doc = "${docdir} ${mandir} ${infodir} ${datadir}/gtk-doc \
             ${datadir}/gnome/help"
 SECTION_${PN}-doc = "doc"
 
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
+FILES_SOLIBSDEV ?= "${base_libdir}/lib*${SOLIBSDEV} ${libdir}/lib*${SOLIBSDEV}"
+FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
-                ${datadir}/aclocal ${base_libdir}/*.o"
+                ${datadir}/aclocal ${base_libdir}/*.o \
+                ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
-- 
1.7.7.6



