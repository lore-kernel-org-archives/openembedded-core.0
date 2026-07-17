Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59670C44525
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91.1784303206080882442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=KhwckMiP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CA7C1477
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 38BCB3F905
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784303205; bh=vmOimp/uA51Ecg9vbQEI3J406ZdrqtnL9t5/iyi1ONQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KhwckMiPCIUtfUZ0cMb71zs0kHTQ0VyNwXq8ayFbWKg6xODZEpV0KwBDFi7qNlFje
	 aByr9t3CjGKJukqNNxY1hbk7P39cDH6trSkGjUhcHfXZPfVJgMtRSXPJGJ/fGVqcmc
	 jDRRprAJ/spSU4VM2zgjXbIhXzS+lekRVE+INiHw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/7] modutils-initscripts: remove obsolete systemd masking
Date: Fri, 17 Jul 2026 16:46:12 +0100
Message-ID: <20260717154614.3701267-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717154614.3701267-1-ross.burton@arm.com>
References: <20260717154614.3701267-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241212

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility=
")
[2] oe-core 8fc304a59b ("modutils-initscripts: mask modutils in case of s=
ystemd")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../modutils-initscripts/modutils-initscripts.bb       | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscript=
s.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index fb7b09393a3..89ef8bd600b 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -18,13 +18,3 @@ do_install () {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${S}/modutils.sh ${D}${sysconfdir}/init.d/
 }
-
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','=
systemd','systemd-systemctl-native','',d)}"
-pkg_postinst:${PN} () {
-	if type systemctl >/dev/null 2>/dev/null; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		systemctl $OPTS mask modutils.service
-	fi
-}
--=20
2.43.0


