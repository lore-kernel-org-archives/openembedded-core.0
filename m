Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1REAx5-0003bW-76
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 04:23:19 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D2HZeR004301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 19:17:35 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 12 Oct 2011 19:17:35 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 10:22:59 +0800
Message-ID: <98a9c26c02e87af50d659b4c3f2c83dca9921277.1318472103.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1318472103.git.wenzong.fan@windriver.com>
References: <cover.1318472103.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qt4-x11-free: Fix broken regexes in qt4-x11-free's recipe.
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
X-List-Received-Date: Thu, 13 Oct 2011 02:23:19 -0000
Content-Type: text/plain

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
1.7.0.4



