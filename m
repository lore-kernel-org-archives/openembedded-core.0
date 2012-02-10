Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rvt2O-00069o-1r
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:09:28 +0100
Received: by wgbdr13 with SMTP id dr13so2649396wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 08:01:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.134.3 with SMTP id r3mr1248449wei.40.1328889681951;
	Fri, 10 Feb 2012 08:01:21 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id m8sm19117125wia.11.2012.02.10.08.01.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 08:01:21 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 18:01:15 +0200
Message-Id: <1328889675-9864-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmTxWA6JgFOpC9UolLsJEjot9+Bec9o3DNspXwcua+knTc+8cHmRD4ONeIFYVVLryOfoHa/
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
X-List-Received-Date: Fri, 10 Feb 2012 16:09:28 -0000

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...001-openssl-Move-libcrypto-to-base_libdir.patch |   61 ++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |   10 +++-
 .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch

diff --git a/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
new file mode 100644
index 0000000..b101d8c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
@@ -0,0 +1,61 @@
+From ac1fe1490e997fb8fd91ec13b675d38efcc65775 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Thu, 9 Feb 2012 00:03:38 +0200
+Subject: [PATCH] openssl: Move libcrypto to base_libdir
+
+This fix is for dhclient. It needs libcrypto at runtime and if
+libcrypto is in libdir, it's path can be inaccessible on systems
+where /usr is on nfs for example or dhclient is needed before
+/usr is mounted.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+---
+ meta/recipes-connectivity/openssl/openssl.inc      |    8 +++++++-
+ .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
+index 771f146..76a28ff 100644
+--- a/meta/recipes-connectivity/openssl/openssl.inc
++++ b/meta/recipes-connectivity/openssl/openssl.inc
+@@ -36,10 +36,11 @@ export AS = "${CC} -c"
+ inherit pkgconfig siteinfo
+ 
+ PACKAGES =+ "libcrypto libssl ${PN}-misc"
+-FILES_libcrypto = "${libdir}/libcrypto.so.*"
++FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
+ FILES_libssl = "${libdir}/libssl.so.*"
+ FILES_${PN} =+ " ${libdir}/ssl/*"
+ FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
++FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
+ 
+ do_configure_prepend_darwin () {
+ 	sed -i -e '/version-script=openssl\.ld/d' Configure
+@@ -132,6 +133,11 @@ do_install () {
+ 	oe_libinstall -so libcrypto ${D}${libdir}
+ 	oe_libinstall -so libssl ${D}${libdir}
+ 
++	# Moving libcrypto to /usr
++	mkdir -p ${D}/${base_libdir}/
++	mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
++	sed -i s/usr// ${D}/${libdir}/pkgconfig/libcrypto.pc
++
+ 	install -d ${D}${includedir}
+ 	cp --dereference -R include/openssl ${D}${includedir}
+ 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
+diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
+index 80dfcb3..8ffe931 100644
+--- a/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
++++ b/meta/recipes-connectivity/openssl/openssl_1.0.0g.bb
+@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
+ 
+ CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+ 
+-PR = "${INC_PR}.0"
++PR = "${INC_PR}.1"
+ 
+ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 771f146..eb6c5ea 100644
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
@@ -132,6 +133,13 @@ do_install () {
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 
+	# Moving libcrypto to /usr
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mkdir -p ${D}/${base_libdir}/
+		mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
+		sed -i s#libdir=\$\{exec_prefix\}\/lib#libdir=${base_libdir}# ${D}/${libdir}/pkgconfig/libcrypto.pc
+	fi
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



