Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UcjMW-0003th-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 23:36:10 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4FLHcOx022210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 14:17:38 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 15 May 2013 14:17:37 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 May 2013 14:17:37 -0700
Message-ID: <1368652657-3841-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH [v1] 1/1] zlib: put shared libraries in base_libdir
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
X-List-Received-Date: Wed, 15 May 2013 21:36:12 -0000
Content-Type: text/plain

We put the shared libraries in base_libdir because at least
one library under base_libdir, pam_cracklib.so, needs them
and will cause a qa warning when it is built.
---
 meta/recipes-core/zlib/zlib_1.2.7.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
index 803fec3..dfdf5fe 100644
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
@@ -24,4 +26,17 @@ do_install() {
 	oe_runmake DESTDIR=${D} install
 }
 
+# We move zlib shared libraries for target builds to avoid
+# qa warnings.
+#
+do_install_append_class-target() {
+	if [ ${base_libdir} != ${libdir} ]
+	then
+		mkdir -p ${D}/${base_libdir}
+		mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
+		tmp=`readlink ${D}/${libdir}/libz.so`
+		ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
+	fi
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4



