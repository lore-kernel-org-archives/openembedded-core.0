Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9ALl-0007g5-36
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 09:48:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q857aEhn028104
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 00:36:14 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 00:36:13 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 15:36:22 +0800
Message-ID: <3addd1529ed2986daf528142562949b1cdee0c55.1346830465.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346830465.git.kai.kang@windriver.com>
References: <cover.1346830465.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/2] lsb: update version
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
X-List-Received-Date: Wed, 05 Sep 2012 07:48:37 -0000
Content-Type: text/plain

Update package lsb version to be same with current lsb test suit
version. Because when install the suit, it warns that need lsb
version >= 3.0 at least.

Drop the duplicated creating files under /etc/lsb-release.d.

Provides directories /etc/opt and /var/opt that they are required by
package lsb-dist-checker in lsb test suit.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../lsb/{lsb_1.4.bb => lsb_4.1.bb}                 |   34 ++++++++++----------
 1 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-extended/lsb/{lsb_1.4.bb => lsb_4.1.bb} (84%)

diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
similarity index 84%
rename from meta/recipes-extended/lsb/lsb_1.4.bb
rename to meta/recipes-extended/lsb/lsb_4.1.bb
index 513998c..a3242db 100644
--- a/meta/recipes-extended/lsb/lsb_1.4.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -2,14 +2,14 @@ DESCRIPTION = "LSB support for OpenEmbedded"
 SECTION = "console/utils"
 HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
-PR = "r4"
+PR = "r0"
 
 # lsb_release needs getopt
 RDEPENDS_${PN} += "util-linux"
 
 LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar.gz \
            file://init-functions \
            file://lsb_killproc \
            file://lsb_log_message \
@@ -19,15 +19,20 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}
 
 SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
-S = "${WORKDIR}/lsb-release-${PV}"
+S = "${WORKDIR}/lsb-release-1.4"
 
 do_install(){
-	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D} 
+	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
+
+	# this 2 dirs are needed by package lsb-dist-checker
+	mkdir -p ${D}${sysconfdir}/opt
+	mkdir -p ${D}${localstatedir}/opt
+
 	mkdir -p ${D}${base_bindir}
 	mkdir -p ${D}/${baselib}
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
 	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
-	
+
 	if [ "${TARGET_ARCH}" = "i586" ];then
 		echo -n "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
 	else
@@ -37,29 +42,24 @@ do_install(){
 	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_RELEASE=${DISTRO_VERSION}" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_DESCRIPTION=\"${DISTRO_NAME} ${DISTRO_VERSION}\"" >> ${D}${sysconfdir}/lsb-release
-	
+
 	if [ "${TARGET_ARCH}" = "i586" ];then
 		mkdir -p ${D}${sysconfdir}/lsb-release.d
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-noarch
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-ia32
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ia32
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ia32
 	elif [ "${TARGET_ARCH}" = "x86_64" ];then
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-amd64
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-amd64
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-amd64
 	fi
 	if [ "${TARGET_ARCH}" = "powerpc" ];then
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-ppc32
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc32
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc32
 	elif [ "${TARGET_ARCH}" = "powerpc64" ];then
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-noarch
-		touch ${D}${sysconfdir}/lsb-release.d/graphics-4.1-ppc64
+		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-noarch
 		touch ${D}${sysconfdir}/lsb-release.d/graphics-${PV}-ppc64
 		touch ${D}${sysconfdir}/lsb-release.d/desktop-${PV}-ppc64
 	fi
@@ -87,9 +87,9 @@ do_install_append(){
                ln -sf ld-linux.so.2 ld-lsb.so.2
                ln -sf ld-linux.so.2 ld-lsb.so.3
        fi
- 
+
        if [ "${TARGET_ARCH}" = "powerpc64" ];then
-  	       cd ${D}
+               cd ${D}
                if [ "${baselib}" != "lib64" ]; then
                    ln -sf ${baselib} lib64
                fi
@@ -101,7 +101,7 @@ do_install_append(){
 	       cd ${D}/${baselib}
                ln -sf ld.so.1 ld-lsb-ppc32.so.2
                ln -sf ld.so.1 ld-lsb-ppc32.so.3
-       fi	
+       fi
 }
 FILES_${PN} += "/lib64 \
                 ${base_libdir}/lsb/* \
-- 
1.7.5.4



