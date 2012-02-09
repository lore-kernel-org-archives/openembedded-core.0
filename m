Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RvYAx-0003T2-M0
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 18:52:55 +0100
Received: by mail-qy0-f175.google.com with SMTP id o7so1076259qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 09:44:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.136.77 with SMTP id q13mr1701953qct.154.1328809492865;
	Thu, 09 Feb 2012 09:44:52 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id el3sm7062513qab.8.2012.02.09.09.44.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 09:44:52 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Feb 2012 19:44:40 +0200
Message-Id: <1328809480-13730-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQkPt7pO4kPs0O1JgmLOzIMyNNfSKbm3cjeKDwkse0PovEHcfo/sfoIWk6l0VasjkYFdIPBD
Subject: [PATCH 2/2] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Thu, 09 Feb 2012 17:52:55 -0000

This fix is for dhclient. It needs libcrypto at runtime and if
libcrypto is in libdir, it's path can be inaccessible on systems
where /usr is on nfs for example or dhclient is needed before
/usr is mounted.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-connectivity/openssl/openssl.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 771f146..45a6422 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -36,10 +36,11 @@ export AS = "${CC} -c"
 inherit pkgconfig siteinfo
 
 PACKAGES =+ "libcrypto libssl ${PN}-misc"
-FILES_libcrypto = "${libdir}/libcrypto.so.*"
+FILES_libcrypto = "${base_libdir}/libcrypto.so.*"
 FILES_libssl = "${libdir}/libssl.so.*"
 FILES_${PN} =+ " ${libdir}/ssl/*"
 FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
+FILES_${PN}-dev += "${base_libdir}/libcrypto.so"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
@@ -132,6 +133,10 @@ do_install () {
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 
+	# Moving libcrypto to /usr
+	mv ${D}${libdir}/libcrypto* ${D}${base_libdir}/
+	sed -i s/usr// ${D}/${libdir}/pkgconfig/libcrypto.pc
+
 	install -d ${D}${includedir}
 	cp --dereference -R include/openssl ${D}${includedir}
 	sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
-- 
1.7.5.4



