Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id D2172734E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 22:15:06 +0000 (UTC)
Received: by qcto4 with SMTP id o4so28826039qct.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=GjDf5p4dV2FAlpVM5un8jJtFtF1JkimWWnTM/dA4CEU=;
	b=fzaNXjBY8p4F/3Euwen3JByrgGQwicICNpU6CKxZ8tcDNo5cWRxxDu2/DbEtPFT4l/
	cUJg2Zx9M5aSv3EgyOchnugumVczO9kYPHGm+nbKgIvhxrKicfQniaA44OoeHsJW7Ka/
	UOLvRTvlbD5ClepSqly+V7hRITosxfcXydttMUOyumEqCpIQyHR3QcEOQ/uG2tUSvM8E
	NQGjxcXRihE1NzvX9Q731oTJirUj7ksrm2PQTlpdk3rDe8vHUt7y5T3Z7s9TTzMhDiGy
	2f1v18yATivPKyuPJ61PBGXJLPgkDLhA8k2gWC3beKylIBIyDelBt2/T7QYUUkdwWMbK
	gZ1A==
X-Received: by 10.55.31.143 with SMTP id n15mr44259765qkh.70.1427494507501;
	Fri, 27 Mar 2015 15:15:07 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id z78sm2394662qkg.44.2015.03.27.15.15.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Mar 2015 15:15:06 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Mar 2015 19:14:24 -0300
Message-Id: <1427494464-22167-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] wpa-supplicant: Make SystemD D-Bus config conditional
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
X-List-Received-Date: Fri, 27 Mar 2015 22:15:07 -0000

The SystemD D-Bus configuration should only to be installed when
SystemD support is enabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 6f0de3c..f95e91c 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -86,12 +86,13 @@ do_install () {
 	cd ${D}${sysconfdir}/network/ && \
 	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
 
-	install -d ${D}/${sysconfdir}/dbus-1/system.d
-	install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
 	install -m 644 ${S}/wpa_supplicant/dbus/*.service ${D}/${datadir}/dbus-1/system-services
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		install -d ${D}/${sysconfdir}/dbus-1/system.d
+		install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
+
 		install -d ${D}/${systemd_unitdir}/system
 		install -m 644 ${S}/wpa_supplicant/systemd/*.service ${D}/${systemd_unitdir}/system
 	fi
-- 
2.1.4


