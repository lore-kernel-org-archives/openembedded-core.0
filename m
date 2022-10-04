Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B31BC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 10:51:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9125.1664880671255947409
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 03:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8B4211FB;
	Tue,  4 Oct 2022 03:51:17 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 840B23F67D;
	Tue,  4 Oct 2022 03:51:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/5] piglit: upgrade to latest revision
Date: Tue,  4 Oct 2022 11:51:05 +0100
Message-Id: <20221004105106.1556357-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004105106.1556357-1-ross.burton@arm.com>
References: <20221004105106.1556357-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 10:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171384

Also disable any attempt at debug splitting/stripping.  Piglit installs
over 2GB of files which we install stripped, so the action of attempting
to split/strip takes a long time and achieves nothing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-gr=
aphics/piglit/piglit_git.bb
index f758208c6bc..c9cf5795e99 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,7 +14,7 @@ SRC_URI =3D "git://gitlab.freedesktop.org/mesa/piglit.g=
it;protocol=3Dhttps;branch=3Dma
            "
 UPSTREAM_CHECK_COMMITS =3D "1"
=20
-SRCREV =3D "265896c86f90cb72e8f218ba6a3617fca8b9a1e3"
+SRCREV =3D "80465078a0ae8f12411db66850ee14f017962fa7"
 # (when PV goes above 1.0 remove the trailing r)
 PV =3D "1.0+gitr${SRCPV}"
=20
@@ -52,8 +52,10 @@ do_configure:prepend() {
    fi
 }
=20
-# Forcibly strip because Piglit is *huge*
+# Forcibly strip because Piglit is *huge*, and don't bother trying to sp=
lit/strip the result.
 OECMAKE_TARGET_INSTALL =3D "install/strip"
+INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
=20
 RDEPENDS:${PN} =3D "waffle waffle-bin python3 python3-mako python3-json =
\
 	python3-misc \
--=20
2.34.1


