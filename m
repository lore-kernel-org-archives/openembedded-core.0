Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CDDC982CC
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 16:03:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18511.1789574573390446704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 09:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=dBi/q41d;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30546176A
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:02:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A5433F86F
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789574572; bh=sbv8Ep1DELkF2qkGFcRsUVDIBITyEj9V5kjoSFmbbPU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dBi/q41dz2issPBYUbyff915aZlv+1tEfvMhjIN9e+LSVnvq/n5I52yB5ITWrvJfO
	 IhKaVjcYh+nb+2YwEX4/Tw7FwUTBCv2+lMfla/yNnBHQxk1oeH0mp2dOK3rqihxhu4
	 Q6TVr+E13SRgmHs6rxaEyrNzIiNkL8BLSazYozcA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] libportal: disable qt6 backend explicitly to ensure deterministic builds
Date: Wed, 16 Sep 2026 17:02:45 +0100
Message-ID: <20260916160246.276107-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916160246.276107-1-ross.burton@arm.com>
References: <20260916160246.276107-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 16:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245989

In theory we can just add a PACKAGECONFIG for qt6 that uses meta-qt6,
but that fails to find the native binaries in the sysroot and I don't
know how to fix this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/libportal/libportal_0.11.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libportal/libportal_0.11.0.bb b/meta/reci=
pes-gnome/libportal/libportal_0.11.0.bb
index 4d18bb4acdb..9e5e84947e0 100644
--- a/meta/recipes-gnome/libportal/libportal_0.11.0.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.11.0.bb
@@ -22,7 +22,8 @@ PACKAGECONFIG ??=3D "${@oe.utils.vartrue('CAN_GTK', 'gt=
k3', '', d)} \
 PACKAGECONFIG[gtk3] =3D "-Dbackend-gtk3=3Denabled,-Dbackend-gtk3=3Ddisab=
led,gtk+3"
 PACKAGECONFIG[gtk4] =3D "-Dbackend-gtk4=3Denabled,-Dbackend-gtk4=3Ddisab=
led,gtk4"
=20
-EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)} -Dbackend-qt5=3Ddisabled"
+EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)} \
+                 -Dbackend-qt5=3Ddisabled -Dbackend-qt6=3Ddisabled"
=20
 PACKAGES =3D+ "${PN}-gtk3 ${PN}-gtk4"
=20
--=20
2.43.0


