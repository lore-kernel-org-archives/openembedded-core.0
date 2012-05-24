Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SXYsx-0005gE-VY
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 16:19:28 +0200
Received: by wibhm14 with SMTP id hm14so5397651wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2012 07:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wzQcF7H4ehwwYKPCSSG6arIq3rZjaiRibSgcSpP+2ck=;
	b=zKz2sHMdWsdPCGX5SbsHCHw5cKwCmLbKqMnMjfm3hvN4TPkIJ8+Fsi/LbaWAL43y6m
	Y46r1Dx6+KT0sJIQ9PmsqjRzQTzPd8O3Po5zgTq/jjMlKO23BYhX3zQZ7z2FzbOjr4zy
	+FgcwHae1Eo2r7nEdF8/4mGi950AZzctUaey59b2zbrnTHlzQ7d+gOrJxzgQWS12F+I3
	tmZZ5YDfaM4xOGus62GNjA721marQcPuBRZMTtpDSQ0bpBQHjTidRjLV0j2q5hemFG31
	/cNa4hQK2HZoedxF9B/TSwMcmXNO/a21q7+AFkJNHg9Y2olpTBl05So1IVfc2/VievrO
	PYfA==
Received: by 10.180.86.194 with SMTP id r2mr55090389wiz.15.1337868556758;
	Thu, 24 May 2012 07:09:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m1sm47656723wic.6.2012.05.24.07.09.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 May 2012 07:09:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 16:09:11 +0200
Message-Id: <1337868551-6674-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] wpa-supplicant: add wpa_supplicant.conf to CONFFILES and don't install it twice
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
X-List-Received-Date: Thu, 24 May 2012 14:19:28 -0000

* first we install ${WORKDIR}/wpa_supplicant.conf-sane
  install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane ${D}${sysconfdir}/wpa_supplicant.conf
  and a bit later in do_install we were overwritting it with ${WORKDIR}/wpa_supplicant.conf
  install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
* notice that this patch also changes .conf permissions from 644 back to 600

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    2 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
index b489893..efd1a66 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.inc
@@ -22,6 +22,7 @@ PACKAGES_prepend = "wpa-supplicant-passphrase wpa-supplicant-cli "
 FILES_wpa-supplicant-passphrase = "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli = "${sbindir}/wpa_cli"
 FILES_${PN} += "${datadir}/dbus-1/system-services/*"
+CONFFILES_${PN} += "${sysconfdir}/wpa_supplicant.conf"
 
 do_configure () {
 	install -m 0755 ${WORKDIR}/defconfig-gnutls .config
@@ -50,7 +51,6 @@ do_install () {
 	install -d ${D}${sysconfdir}/network/if-pre-up.d/
 	install -d ${D}${sysconfdir}/network/if-post-down.d/
 	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 644 ${WORKDIR}/wpa_supplicant.conf ${D}${sysconfdir}
 	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
index 1e0086a..7bbb8c0 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.7.3.bb
@@ -1,6 +1,6 @@
 require wpa-supplicant-0.7.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI[md5sum] = "f516f191384a9a546e3f5145c08addda"
 SRC_URI[sha256sum] = "d0cd50caa85346ccc376dcda5ed3c258eef19a93b3cade39d25760118ad59443"
-- 
1.7.8.6



