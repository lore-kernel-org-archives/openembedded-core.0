Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 13971609B1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 09:03:44 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XEaeo-0006NS-EA from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Aug 2014 02:03:46 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 5 Aug 2014 02:03:46 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Aug 2014 14:02:21 +0500
Message-Id: <1407229341-15578-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 05 Aug 2014 09:03:46.0338 (UTC)
	FILETIME=[29FCD820:01CFB08C]
Subject: [PATCH] wpa-supplicant: use PACKAGECONFIG for ssl selection
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
X-List-Received-Date: Tue, 05 Aug 2014 09:03:51 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Select between openssl or gnutls as ssl implementation via
PACKAGECONFIG instead of explicitly adding both via DEPENDS.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../wpa-supplicant/wpa-supplicant.inc              |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index d9c6532..3bbe832 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -6,9 +6,13 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
                     file://README;beginline=1;endline=56;md5=a07250b28e857455336bb59fc31cb845 \
                     file://wpa_supplicant/wpa_supplicant.c;beginline=1;endline=12;md5=e8e021e30f3a6ab7c341b66b86626a5a"
-DEPENDS = "gnutls dbus libnl openssl libgcrypt"
+DEPENDS = "dbus libnl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
+PACKAGECONFIG[defaultval] += "gnutls"
+PACKAGECONFIG[gnutls] = ",,gnutls"
+PACKAGECONFIG[ssl] = ",,openssl"
+
 inherit systemd
 
 SYSTEMD_SERVICE_${PN} = "wpa_supplicant.service wpa_supplicant-nl80211@.service wpa_supplicant-wired@.service"
@@ -36,6 +40,17 @@ CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig-gnutls wpa_supplicant/.config
 	echo "CFLAGS +=\"-I${STAGING_INCDIR}/libnl3\"" >> wpa_supplicant/.config
+	
+	sed -i '/CONFIG_TLS/d' wpa_supplicant/.config
+	if echo "${PACKAGECONFIG}" | grep -qw "ssl"; then
+        	ssl=openssl
+	elif echo "${PACKAGECONFIG}" | grep -qw "gnutls"; then
+        	ssl=gnutls
+	fi
+	if [ -n "$ssl" ]; then
+        	echo "CONFIG_TLS = $ssl" >>wpa_supplicant/.config
+	fi
+
 }
 
 export EXTRA_CFLAGS = "${CFLAGS}"
-- 
1.7.9.5


