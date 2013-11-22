Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 9ADEC6B7F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 16:19:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMGJita024415 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 16:19:44 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O3e6b-Q0HD-l
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 16:19:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMGJduX024411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 16:19:41 GMT
Message-ID: <1385137176.16887.180.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 16:19:36 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: adt-installer: Switch from svn to tarball release for opkg
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
X-List-Received-Date: Fri, 22 Nov 2013 16:19:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 88650ae..a4cdde5 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -33,11 +33,10 @@ PR = "r11"
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
 YOCTOADT_VERSION = "${SDK_VERSION}"
-S = "${WORKDIR}/trunk"
+S = "${WORKDIR}/opkg-${PV}"
 
-SRCREV = "596"
-PV = "0.1.8+svnr${SRCPV}"
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
+PV = "0.2.0"
+SRC_URI = "https://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://wget_cache.patch \
            file://adt_installer \
            file://scripts/adt_installer_internal \
@@ -49,6 +48,9 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://opkg/conf/opkg-sdk-i686.conf \
 	  "
 
+SRC_URI[md5sum] = "e8a6fd34fb2529191fe09dc14c934cc3"
+SRC_URI[sha256sum] = "81b7055eb4c12c5e5652339305c9236cf357890717d4bea063963f3f434d966f"
+
 ADTREPO ?= "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
 
 do_populate_adt[umask] = "022"
@@ -61,8 +63,8 @@ fakeroot do_populate_adt () {
 	mkdir -p ${ADT_DIR}/opkg/build
 	cp -r opkg ${ADT_DIR}/
 	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
-	cp -r trunk ${ADT_DIR}/opkg/build/
-	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
+	cp -r opkg-${PV} ${ADT_DIR}/opkg/build/
+	mv ${ADT_DIR}/opkg/build/opkg-${PV} ${ADT_DIR}/opkg/build/opkg-svn
 	rm -rf ${ADT_DIR}/opkg/build/opkg-svn/patches ${ADT_DIR}/opkg/build/opkg-svn/.pc
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}



