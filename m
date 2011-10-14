Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUf-0002YD-B4
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540474"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:25 -0700
Message-Id: <8f1ef274716e95fa8c15ee08a780cfb1e88c20d0.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/28] qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:41 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

[YOCTO #1671]

qt4-x11-free's recipe includes a sed script to sanitize it's .prl files,
which are used by qmake to generate a list of libs and includes in the
Makefiles it generates. It however, fails to take into account the possibility
of trailing slashes, and thus leaves them in, and breaks gcc's syntax.
Update these regexes to account for them.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-qt/qt4/qt4.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index d6382f5..1406a87 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -294,13 +294,13 @@ do_install() {
 	rm -f ${D}/${bindir}/lrelease
 
 	# fix pkgconfig, libtool and prl files
-	sed -i -e s#-L${S}/lib##g \
-			-e s#-L${STAGING_LIBDIR}##g \
+	sed -i -e s#-L${S}/lib/\?##g \
+			-e s#-L${STAGING_LIBDIR}/\?##g \
 			-e 's#STAGING_LIBDIR}#libdir}'#g \
-			-e s#-L${libdir}##g \
+			-e s#-L${libdir}/\?##g \
 			-e s#'$(OE_QMAKE_LIBS_X11)'#"${OE_QMAKE_LIBS_X11}"#g \
-			-e s#" -Wl,-rpath-link,${S}/lib"##g \
-			-e s#" -Wl,-rpath-link,${libdir}"##g \
+			-e s#" -Wl,-rpath-link,${S}/lib/\?"##g \
+			-e s#" -Wl,-rpath-link,${libdir}/\?"##g \
 			-e 's#Iin#I${in#g' \
 			${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
 
-- 
1.7.6.2



