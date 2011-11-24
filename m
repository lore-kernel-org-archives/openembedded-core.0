Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTbET-0000Zv-FH for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 16:29:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOFMNcs026061
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 15:22:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25810-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 15:22:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAOFMFA0026054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 15:22:16 GMT
Message-ID: <1322148141.10928.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2011 15:22:21 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] avahi-ui: Fix packaging and conflict with the avahi recipe
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
X-List-Received-Date: Thu, 24 Nov 2011 15:29:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We need to remove the files from avahi-ui which conflict with the avahi recipe.
If we don't do this they trigger packaging warnings and can also overwrite
files in the sysroot unexpectedly causing build failures (if X depends on
avahi, it expects avahi's files to stay there, not disappear as avahi-ui
build/stages).

This patch cleans up the packaging although I wish there were an alternative
to the do_install which makes my eyes bleed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
index e0733a9..c903087 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS += "avahi gtk+ libglade"
 
@@ -14,7 +14,7 @@ AVAHI_GTK = "--enable-gtk --disable-gtk3"
 
 S = "${WORKDIR}/avahi-${PV}"
 
-PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev python-avahi avahi-discover avahi-discover-standalone"
+PACKAGES = "${PN} ${PN}-utils ${PN}-dbg ${PN}-dev ${PN}-doc python-avahi avahi-discover avahi-discover-standalone"
 
 FILES_${PN} = "${libdir}/libavahi-ui*.so.*"
 FILES_${PN}-dbg += "${libdir}/.debug/libavah-ui*"
@@ -25,7 +25,7 @@ FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
 FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi/*"
 FILES_avahi-discover = "${bindir}/avahi-discover \
                         ${datadir}/applications/avahi-discover.desktop \
-                        ${datadir}/avahi/interfaces/avahi-discover.glade"
+                        ${datadir}/avahi/interfaces/avahi-discover*"
 FILES_avahi-discover-standalone = "${bindir}/avahi-discover-standalone \
                                    ${datadir}/avahi/interfaces/avahi-discover.glade"
 
@@ -35,3 +35,29 @@ RDEPENDS_python-avahi = "python-dbus"
 
 SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
 SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
+
+do_install_append () {
+	rm ${D}${sysconfdir} -rf
+	rm ${D}${base_libdir} -rf
+	rm ${D}${base_libdir} -rf
+	rm ${D}${bindir}/avahi-b*
+	rm ${D}${bindir}/avahi-p*
+	rm ${D}${bindir}/avahi-r*
+	rm ${D}${bindir}/avahi-s*
+	rm ${D}${includedir}/avahi-c* -rf
+	rm ${D}${includedir}/avahi-g* -rf
+	rm ${D}${libdir}/libavahi-c*
+	rm ${D}${libdir}/libavahi-g*
+	rm ${D}${libdir}/pkgconfig/avahi-c*
+	rm ${D}${libdir}/pkgconfig/avahi-g*
+	rmdir ${D}${libdir}/avahi
+	rm ${D}${sbindir} -rf
+	rm ${D}${datadir}/avahi/a*
+	rm ${D}${datadir}/avahi/s*
+	rm ${D}${datadir}/dbus* -rf
+	rm ${D}${mandir}/man1/a*
+	rm ${D}${mandir}/man5 -rf
+	rm ${D}${mandir}/man8 -rf
+	rmdir ${D}${localstatedir}
+}
+




