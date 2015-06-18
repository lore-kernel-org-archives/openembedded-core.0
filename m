Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id B04AA759F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 20:20:06 +0000 (UTC)
Received: by qcet6 with SMTP id t6so5745766qce.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 13:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=Gce0nbi7mCpD2FKNdU+RZkrvG2OFS7WDod/xcNpZZ+0=;
	b=gAtQEYt/jhnrVwvWimO28mrLNFGVSCNMre7QPWAXR0yeiWkVULbpMjhxC9UsX49EJo
	VMepcE7N7kE8gbXtc36I0IveWuqAHSEBgHUubp4u6pn0d6+qkTUp5zg3+raNlSP703FI
	AmnQHA9ZvvPqnR+CVeldDDCzhuOtwk2NsLFsZVz76+nUSLoQI2FYIwB6T2FlA9hIBg3u
	2LUowMgyU21uxf3GUxws/hZsJXEVj7jSGyU46oo1q7F3WMDw0+RA27eUCEetFbm963aL
	OQkAtVQ3KkscdA007AtexMyHtFKED3Qw/fIPTrhMhah55FBy6nWmNDz9eNTn9v8nGpWf
	+2YA==
X-Received: by 10.140.35.230 with SMTP id n93mr16794690qgn.7.1434658807036;
	Thu, 18 Jun 2015 13:20:07 -0700 (PDT)
Received: from localhost ([177.100.226.57])
	by mx.google.com with ESMTPSA id 140sm4442590qhg.16.2015.06.18.13.20.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jun 2015 13:20:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 18 Jun 2015 17:19:59 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jun 2015 17:19:58 -0300
Message-Id: <1434658798-20459-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.4.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] Revert "wpa-supplicant: Make SystemD D-Bus config conditional"
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
X-List-Received-Date: Thu, 18 Jun 2015 20:20:06 -0000

The D-Bus config is not SystemD specific. It is required for the D-Bus
communication to be operational.

This reverts commit OE-Core:e658ee16.

Fixes [YOCTO: #7769]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index f95e91c..6f0de3c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -86,13 +86,12 @@ do_install () {
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
 
+	install -d ${D}/${sysconfdir}/dbus-1/system.d
+	install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-		install -d ${D}/${sysconfdir}/dbus-1/system.d
-		install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
-
 		install -d ${D}/${systemd_unitdir}/system
 		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
 	fi
-- 
2.4.3


