Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CE0C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.90.1784303205380927869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AIef9Str;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A008316A3
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 87B7B3F905
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784303204; bh=/o/E2i/f1dhk8HncFgHdWDQ908VLpR5wbqSgeMCkfl0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AIef9StrfYEudT4obTDRsvw1/jaVaP4qv+f6LCnG31hI0qfEXzCb/oO7nWQkFIBwj
	 VytHg+l58Tq0tu5DBsrjvubd+VKLzhX8mVMS+evkLamO+cC3wtMPi7Uk9hQMno2cgP
	 yqm+cRP/Vn9hp2wypmbhmRU/IAhileTd3Kwl+p+k=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/7] initscripts: remove obsolete systemd masking
Date: Fri, 17 Jul 2026 16:46:11 +0100
Message-ID: <20260717154614.3701267-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717154614.3701267-1-ross.burton@arm.com>
References: <20260717154614.3701267-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241211

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility=
")
[2] oe-core 844f897710 ("initscripts: mask initscripts from systemd")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../initscripts/initscripts_1.0.bb            | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/reci=
pes-core/initscripts/initscripts_1.0.bb
index 23411b6a714..ae386a62818 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -41,7 +41,6 @@ S =3D "${UNPACKDIR}"
 KERNEL_VERSION =3D ""
=20
 DEPENDS:append =3D " update-rc.d-native"
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','=
systemd','systemd-systemctl-native','',d)}"
=20
 PACKAGES =3D+ "${PN}-functions ${PN}-sushell"
 RDEPENDS:${PN} =3D "initd-functions \
@@ -154,32 +153,7 @@ do_install () {
 	update-rc.d -r ${D} dmesg.sh start 38 S .
 }
=20
-MASKED_SCRIPTS =3D " \
-  banner \
-  bootmisc \
-  checkfs \
-  checkroot \
-  devpts \
-  dmesg \
-  hostname \
-  mountall \
-  mountnfs \
-  populate-volatile \
-  read-only-rootfs-hook \
-  rmnologin \
-  sysfs \
-  urandom"
-
 pkg_postinst:${PN} () {
-	if type systemctl >/dev/null 2>/dev/null; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		for SERVICE in ${MASKED_SCRIPTS}; do
-			systemctl $OPTS mask $SERVICE.service
-		done
-	fi
-
     # Delete any old volatile cache script, as directories may have move=
d
     if [ -z "$D" ]; then
         rm -f "/etc/volatile.cache"
--=20
2.43.0


