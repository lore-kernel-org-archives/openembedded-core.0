Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC8-0004tn-Md
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:07:00 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652376"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:34 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:25 -0800
Message-Id: <b9869193dcf2bf2c86939834d0bc024f34bad2b3.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/25] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 23 Feb 2012 16:07:01 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

[Fix comment to from /usr -> /lib - sgw]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |   10 +++++++++-
 .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 771f146..089b9a4 100644
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
 
+	# Moving libcrypto to /lib
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
1.7.6.5



