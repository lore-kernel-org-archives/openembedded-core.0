Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A351C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 12:56:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68471.1782996992684238276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 05:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=IS2s2xgq;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C16B81FCD
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C24773F673
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Jul 2026 05:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782996992; bh=wE+u/o2AwUtuRmigejQZbmcrwFtNzK9QmWMygbqx6JI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IS2s2xgqfuMVVdn5VlFPqItRl+moiLYcw3/YIG+Z7RDEC6zu9V8/mNjazcBUXSInr
	 qeLA+o4EmKuzA90VeyeYcwj4Jd6RqzCLd5wrmhZqacsypcPNo6q/flLWWb7w0YJ4jF
	 iyYYGge8+oeI+jg6YDUPfElmKbgadDfvJimHUY2o=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] kea: fix python module packaging
Date: Thu,  2 Jul 2026 13:56:26 +0100
Message-ID: <20260702125627.977563-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702125627.977563-1-ross.burton@arm.com>
References: <20260702125627.977563-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 12:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240041

This was previously installing into the wrong target directory because
it was using the python3-native's directory layout.

Now that meson.bbclass is telling meson where to put files, we need to
inherit python3-dir and package the correct files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-connectivity/kea/kea_3.2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/kea/kea_3.2.0.bb b/meta/recipes-co=
nnectivity/kea/kea_3.2.0.bb
index 3967f539b7f..1b6693c2c80 100644
--- a/meta/recipes-connectivity/kea/kea_3.2.0.bb
+++ b/meta/recipes-connectivity/kea/kea_3.2.0.bb
@@ -22,7 +22,7 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar=
.xz \
            "
 SRC_URI[sha256sum] =3D "14bf695d37b65b9b1bf550fea5d0adaf9806c50e5419ef2a=
176a4b8e9aade3df"
=20
-inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
+inherit meson pkgconfig systemd update-rc.d upstream-version-is-even pyt=
hon3-dir
=20
 # install-umask can be removed when upgrading to 3.1.19 onwards
 # https://gitlab.isc.org/isc-projects/kea/-/commit/d9f332a6f36f8056a54b0=
698d4672a67aea812ba
@@ -98,7 +98,7 @@ CONFFILES:${PN} =3D "${sysconfdir}/kea/kea-ctrl-agent.c=
onf \
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


