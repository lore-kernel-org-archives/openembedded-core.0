Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221E8CEFC49
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.4698.1728415871418724833
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 12:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4297DA7
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DF1A3F73F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Oct 2024 12:31:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] libjpeg-turbo: remove redundant RUNPATH entries
Date: Tue,  8 Oct 2024 20:30:56 +0100
Message-Id: <20241008193103.2429829-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241008193103.2429829-1-ross.burton@arm.com>
References: <20241008193103.2429829-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 19:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205303

Our RPATH sanity checks currently don't check RUNPATH (patch incoming),
but the libjpeg objects are built with a RUNPATH set to ${libdir}.

RUNPATH is less of a problem than RPATH (because it is used after the
standard search), but redundant entries are still redundant so lets
remove them anyway.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 132d4b375aa..4ff4cec721b 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -55,4 +55,9 @@ FILES:jpeg-tools =3D "${bindir}/*"
 DESCRIPTION:libturbojpeg =3D "A SIMD-accelerated JPEG codec which provid=
es only TurboJPEG APIs"
 FILES:libturbojpeg =3D "${libdir}/libturbojpeg.so.*"
=20
+do_install:append() {
+    # The binaries have RUNPATH=3D$libdir, which is redundant
+    chrpath -d ${D}/${bindir}/* ${D}${libdir}/*${SOLIBS}
+}
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


