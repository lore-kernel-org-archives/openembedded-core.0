Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11V-00027z-Lp
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520393"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:50 -0700
Message-Id: <10ef5eed082ba680197bad29d1f6bcb5191230a2.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 32/39] libtool: add ${PN} in middle of package list to ensure .m4 get with ${PN}
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:23 -0000

With the new order scheme, ${PN} needs to be in the middle
for the .m4 files to be packaged, otherwise the move the
-dev package which is wrong in this case.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.2.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
index 05a2e6d..5b9557e 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
@@ -37,7 +37,12 @@ EXTRA_AUTORECONF = "--exclude=libtoolize"
 DEPENDS = "libtool-native"
 
 PACKAGES =+ "libltdl libltdl-dev libltdl-dbg libltdl-staticdev"
-FILES_${PN} += "${datadir}/aclocal*"
+FILES_${PN} += "${datadir}/aclocal"
+FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
+                ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
+                ${base_libdir}/*.o ${libdir}/${BPN}/*.la ${base_libdir}/*.la"
+
+#FILES_${PN}-dev := "${@oe_filter_out('${datadir}/aclocal', '${FILES_libtool-dev}', d)}"
 FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
 FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
 FILES_libltdl-staticdev = "${libdir}/libltdl.a"
-- 
1.7.7.6



