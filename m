Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D701CD4F3D
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 17:37:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81269.1778607429447739956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 10:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nMS99rx7;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE3471684
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 90C513F85F
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778607429; bh=+HsZubV2QubXnuSCuDVhz/CfIAv9ep1Yv+hTZKuroK8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nMS99rx7chYpH4VbcgbX1C0zQA+gVP1kofmeoYa8x4PWnCbpkf0dMJbo7uuGCwK5j
	 NHMisECTpr6yGFw0t9DrVkm8+4zL61bMCPp32hn1AUF2XMMRw1oGQNjlLGZUwvc2qf
	 DHMX4Zrw4Ok1XtdCNc7elrie6dpXsprvCywstYtU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] gcr: package the ssh-agent into a separate package
Date: Tue, 12 May 2026 18:37:02 +0100
Message-ID: <20260512173702.4114193-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512173702.4114193-1-ross.burton@arm.com>
References: <20260512173702.4114193-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 17:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236902

The agent is a separate component to the library, so package it into a
new package.

The systemd dependency is only relevant to the ssh-agent, so don't
enable it by default as we don't enable the agent either.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gcr/gcr_4.4.0.1.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb b/meta/recipes-gnome/g=
cr/gcr_4.4.0.1.bb
index fa769759c14..493c8c2a0d0 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
@@ -18,18 +18,17 @@ UPSTREAM_CHECK_REGEX =3D "gcr-(?P<pver>\d+\.\d+\.(?!9=
\d+)\d+(\.\d+)?)"
=20
 SRC_URI[archive.sha256sum] =3D "0c3c341e49f9f4f2532a4884509804190a0c2663=
e6120360bb298c5d174a8098"
=20
-PACKAGECONFIG ??=3D " \
-	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-	${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)} \
-"
-PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret,openssh"
-#'Use systemd socket activation for server programs'
+PACKAGECONFIG ??=3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'va=
pi', '', d)}"
+PACKAGECONFIG[ssh_agent] =3D "-Dssh_agent=3Dtrue,-Dssh_agent=3Dfalse,lib=
secret"
+# Socket activation for the ssh-agent
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Denabled,-Dsystemd=3Ddisabled,sys=
temd"
 PACKAGECONFIG[vapi] =3D "-Dvapi=3Dtrue,-Dvapi=3Dfalse,"
 # A tool to view certificates
 PACKAGECONFIG[viewer] =3D "-Dgtk4=3Dtrue,-Dgtk4=3Dfalse,gtk4"
=20
-FILES:${PN} +=3D "${systemd_user_unitdir}/gcr-ssh-agent.*"
+PACKAGE_BEFORE_PN +=3D "${PN}-ssh-agent"
+FILES:${PN}-ssh-agent =3D "${libexecdir}/gcr-ssh-agent ${systemd_user_un=
itdir}/gcr-ssh-agent.*"
+RDEPENDS:${PN}-ssh-agent +=3D "openssh"
=20
 # http://errors.yoctoproject.org/Errors/Details/20229/
 ARM_INSTRUCTION_SET:armv4 =3D "arm"
--=20
2.43.0


