Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C60C44500
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:13:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49051.1782922399253680085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:13:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ha8/Vj/k;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65B56165C
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:13:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 688F93F673
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782922398; bh=ypRgHZ/emcxg+YVRoW+MbIpxvhmdJeAcgXASN9jCf8s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ha8/Vj/kV6DAk/8kSM53Dt1qN2ndsrygI04wHCMbD6CDdv8eL/FTdpN3lChQulOj9
	 tvzSv7KQF0sbaqTaTQvOc5+zMxsbKc/NxIJVntZn1DO5eX3KFjYVLrNCxOrl2N5JoP
	 VubYisyzPOvxXTF9ZEjZFbDwtUdZ3sca9XuFJJ+M=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] kea: fix python module packaging
Date: Wed,  1 Jul 2026 17:13:13 +0100
Message-ID: <20260701161313.981064-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701161313.981064-1-ross.burton@arm.com>
References: <20260701161313.981064-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239995

This was previously installing into the wrong target directory because
it was using the python3-native's directory layout.

Now that meson.bbclass is telling meson where to put files, we need to
inherit python3-dir and package the correct files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.0.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.3.bb b/meta/recipes-co=
nnectivity/kea/kea_3.0.3.bb
index f5ca2b16eec..1c3dae15958 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.3.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.3.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.xz \
            "
 SRC_URI[sha256sum] =3D "09702ddb078b637e85de9236cbedd3fb9d7af7c6e797026c=
538b45748ad4d631"
=20
-inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
+inherit meson pkgconfig systemd update-rc.d upstream-version-is-even pyt=
hon3-dir
=20
 # install-umask can be removed when upgrading to 3.1.19 onwards
 # https://gitlab.isc.org/isc-projects/kea/-/commit/d9f332a6f36f8056a54b0=
698d4672a67aea812ba
@@ -101,7 +101,7 @@ CONFFILES:${PN} =3D "${sysconfdir}/kea/kea-ctrl-agent=
.conf \
                   "
=20
 PACKAGES =3D+ "${PN}-python"
-FILES:${PN}-python =3D "${nonarch_libdir}/python*/site-packages/*"
+FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python =3D "python3"
=20
 FILES:${PN}-staticdev +=3D "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
--=20
2.43.0


