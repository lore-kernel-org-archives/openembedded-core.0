Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46825C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 11:22:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6472.1741692167657748898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 04:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CAE9152B
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:22:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D66F53F673
	for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 04:22:46 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] xserver-xf86-config: add a configuration fragment to disable screen blanking
Date: Tue, 11 Mar 2025 11:22:40 +0000
Message-ID: <20250311112242.1750761-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 11:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212560

Add a configuration fragment that disables screen blanking, and add it
to all qemu machines.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-xserver/xserver-xf86-config/qemuall/noblank.conf  | 7 +++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb                | 6 ++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-confi=
g/qemuall/noblank.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemua=
ll/noblank.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/=
qemuall/noblank.conf
new file mode 100644
index 00000000000..9d40a9599aa
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuall/nobl=
ank.conf
@@ -0,0 +1,7 @@
+# Disable screen blanking
+Section "ServerFlags"
+    Option        "BlankTime" "0"
+    Option        "StandbyTime" "0"
+    Option        "SuspendTime" "0"
+    Option        "OffTime" "0"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.b=
b b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 0972a5dd784..d57b3427f8d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -5,6 +5,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
=20
 SRC_URI =3D "file://xorg.conf"
+SRC_URI:append:qemuall =3D " file://noblank.conf"
=20
 S =3D "${WORKDIR}/sources"
 UNPACKDIR =3D "${S}"
@@ -19,4 +20,9 @@ do_install () {
 		install -d ${D}/${sysconfdir}/X11
 		install -m 0644 ${S}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
+
+	if test -s ${S}/noblank.conf; then
+		install -d ${D}/${sysconfdir}/X11/xorg.conf.d
+		install -m 0644 ${S}/noblank.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+	fi
 }
--=20
2.43.0


