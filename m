Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UcP2P-00081z-S4
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 01:53:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4ENZVWn027299
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 16:35:33 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 14 May 2013 16:35:31 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 May 2013 16:35:28 -0700
Message-ID: <1368574528-28247-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1368574528-28247-1-git-send-email-jslater@windriver.com>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] zlib: put shared libraries in base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 23:54:09 -0000
Content-Type: text/plain

We put the shared libraries in base_libdir because at least
one library under base_libdir, pam_cracklib.so, needs them
and will cause a qa warning when it is built.
---
 meta/recipes-core/zlib/zlib_1.2.7.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
index 803fec3..f5deba1 100644
--- a/meta/recipes-core/zlib/zlib_1.2.7.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
@@ -6,6 +6,8 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
 
+PR = "r1"
+
 SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
            file://remove.ldconfig.call.patch \
            "
@@ -22,6 +24,18 @@ do_compile (){
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
+
+	# move the shared libraries to avoid possible qa warnings
+	#
+	case ${PN} in
+		zlib-native*)
+			;;
+		*)
+			mkdir -p ${D}/${base_libdir}
+			mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
+			tmp=`readlink ${D}/${libdir}/libz.so`
+			ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
+	esac
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



