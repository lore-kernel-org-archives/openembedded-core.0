Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvYtY-00058i-FW
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 19:39:00 +0100
Received: by qadz30 with SMTP id z30so4796202qad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 10:30:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.135.146 with SMTP id n18mr1868475qct.72.1328812255257;
	Thu, 09 Feb 2012 10:30:55 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id dm7sm7308429qab.5.2012.02.09.10.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 10:30:53 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2012 20:30:44 +0200
Message-Id: <1328812244-32105-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQn9hR3Xn19Axs0tIDMap0Hcmmlr42I/QERuE3540QuEZhIOljdKgMzFS4WPk3XAxWSbjpYb
Subject: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 18:39:00 -0000

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-connectivity/openssl/openssl.inc      |    8 +++++++-
 .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 771f146..76a28ff 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -36,10 +36,11 @@ export AS = "${CC} -c"
 inherit pkgconfig siteinfo
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc"
-FILES_libcrypto = "${libdir}/libcrypto.so.*"
+FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
+FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
@@ -132,6 +133,11 @@ do_install () {
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 
+	# Moving libcrypto to /usr
+	mkdir -p ${D}/${base_libdir}/
+	mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
+	sed -i s/usr// ${D}/${libdir}/pkgconfig/libcrypto.pc
+
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
index 80dfcb3..8ffe931 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
-- 
1.7.5.4



