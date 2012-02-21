Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RzyPY-0003SF-9Y
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:42:16 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so2369959eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:33:59 -0800 (PST)
Received-SPF: pass (google.com: domain of andrei@gherzan.ro designates
	10.14.95.135 as permitted sender) client-ip=10.14.95.135; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrei@gherzan.ro
	designates 10.14.95.135 as permitted sender)
	smtp.mail=andrei@gherzan.ro
Received: from mr.google.com ([10.14.95.135])
	by 10.14.95.135 with SMTP id p7mr13819261eef.62.1329863639207 (num_hops
	= 1); Tue, 21 Feb 2012 14:33:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.14.95.135 with SMTP id p7mr11032568eef.62.1329863639029;
	Tue, 21 Feb 2012 14:33:59 -0800 (PST)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id w60sm95058244eeb.4.2012.02.21.14.33.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 14:33:58 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 00:33:36 +0200
Message-Id: <1329863616-4572-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329863616-4572-1-git-send-email-andrei@gherzan.ro>
References: <1329863616-4572-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlBthrNaCz1IBcAsLouGGDrLz1SERrK4VRavPPy0YFhYWiv1B115LmCBoDyvw7WCoqym8QH
Subject: [PATCH 1/1] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Tue, 21 Feb 2012 22:42:16 -0000

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 ...001-openssl-Move-libcrypto-to-base_libdir.patch |   62 ++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |   10 +++-
 .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
 3 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch

diff --git a/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
new file mode 100644
index 0000000..7023153
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
@@ -0,0 +1,62 @@
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
+Upstream-Status: Pending
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



