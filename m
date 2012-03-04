Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4CXq-0000oA-UN
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Mar 2012 15:36:18 +0100
Received: by wera1 with SMTP id a1so1972259wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2012 06:27:45 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.8.164 as permitted sender)
	client-ip=10.180.8.164; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.8.164 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.8.164])
	by 10.180.8.164 with SMTP id s4mr9196192wia.6.1330871265842 (num_hops =
	1); Sun, 04 Mar 2012 06:27:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.8.164 with SMTP id s4mr7362334wia.6.1330871265424;
	Sun, 04 Mar 2012 06:27:45 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d7sm45389180wiz.6.2012.03.04.06.27.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 06:27:44 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2012 15:27:35 +0100
Message-Id: <1330871257-5525-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlr0WunRcK0ZHGY5jKaLh8sLFoQmxTiuiiGyn4YoICc6w7yd6ZEmse6t/HMe6FUEhrwMcgK
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/3] polkit 0.104: convert pam code to PACKAGECONFIG and adhere to OE recipe styleguide
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
X-List-Received-Date: Sun, 04 Mar 2012 14:36:19 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |   25 +++++++++++++++----------
 1 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 2737a4a..5dc82c5 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -6,28 +6,33 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4 \
                     file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
 
+DEPENDS = "expat dbus-glib eggdbus intltool-native"
+
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=none,libpam,libpam"
+
+PR = "r3"
+
+PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            file://introspection.patch \
-           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
+          "
 
 SRC_URI[md5sum] = "e380b4c6fb1e7bccf854e92edc0a8ce1"
 SRC_URI[sha256sum] = "6b0a13d8381e4a7b7e37c18a54595191b50757e0fcd186cd9918e9ad0f18c7f9"
 
-PAM_SRC_URI = "file://polkit-1_pam.patch"
-PR = "r2"
-DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
-RDEPENDS_${PN} = "libpam"
-EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
+EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
 
 inherit autotools pkgconfig
 
+do_install_append() {
+	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
+}
+
 FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
                 ${datadir}/${PN}-1/actions/* \
                 ${datadir}/dbus-1/system-services/*"
 FILES_${PN}-dbg += "${libdir}/${PN}-1/extensions/.debug/*.so"
 FILES_${PN}-dev += "${libdir}/${PN}-1/extensions/*.la "
 
-do_install_append() {
-	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
-}
-
-- 
1.7.2.5



