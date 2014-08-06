Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 46DF46FE7E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 12:52:56 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF0i9-0000jZ-SP from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Aug 2014 05:52:57 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 05:52:57 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 17:52:36 +0500
Message-Id: <1407329556-18643-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 06 Aug 2014 12:52:57.0742 (UTC)
	FILETIME=[58E052E0:01CFB175]
Subject: [PATCH v3] wpa-supplicant: use PACKAGECONFIG for ssl selection
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
X-List-Received-Date: Wed, 06 Aug 2014 12:52:57 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Select between openssl or gnutls as ssl implementation via
PACKAGECONFIG instead of explicitly adding both via DEPENDS.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../wpa-supplicant/wpa-supplicant.inc              |   20 +++++++++++++++++---
 .../wpa-supplicant/{defconfig-gnutls => defconfig} |    2 +-
 2 files changed, 18 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/{defconfig-gnutls => defconfig} (99%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index d9c6532..3a1cce0 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -6,16 +6,20 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
                     file://README;beginline=1;endline=56;md5=a07250b28e857455336bb59fc31cb845 \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=e8e021e30f3a6ab7c341b66b86626a5a"
-DEPENDS = "gnutls dbus libnl openssl libgcrypt"
+DEPENDS = "dbus libnl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
+PACKAGECONFIG ??= "gnutls"
+PACKAGECONFIG[gnutls] = ",,gnutls"
+PACKAGECONFIG[openssl] = ",,openssl"
+
 inherit systemd
 
 SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
-           file://defconfig-gnutls \
+           file://defconfig \
            file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
@@ -34,8 +38,18 @@ FILES_${PN} += "${datadir}/dbus-1/system-services/*"
 CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
-	install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config
+	install -m 0755 ${WORKDIR}/defconfig wpa_supplicant/.config
 	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
+	
+	if echo "${PACKAGECONFIG}" | grep -qw "openssl"; then
+        	ssl=openssl
+	elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then
+        	ssl=gnutls
+	fi
+	if [ -n "$ssl" ]; then
+        	sed -i "s/%ssl%/$ssl/" wpa_supplicant/.config
+	fi
+
 }
 
 export EXTRA_CFLAGS = "${CFLAGS}"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
similarity index 99%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index 92ef823..f04e398 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -453,7 +453,7 @@ CONFIG_CTRL_IFACE_DBUS_NEW=y
 #LIBS_p += -lbfd -liberty -lz
 #LIBS_c += -lbfd -liberty -lz
 
-CONFIG_TLS = gnutls
+CONFIG_TLS = %ssl%
 CONFIG_CTRL_IFACE_DBUS=y
 CONFIG_CTRL_IFACE_DBUS_NEW=y
 
-- 
1.7.9.5


