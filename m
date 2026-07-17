Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759A6C44526
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:46:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87.1784303207357713502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=oXVP/10b;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0AF416A3
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:42 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 973813F905
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784303206; bh=lYKSvYDBCBzwq0prTPVacKHiHA5N0JH7ULxEt1rKqtM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oXVP/10bi41pMiOItEoRtfj/FC5T4q4HGk2ivcSqmfrLys0kLbukjSG/0WtePZvMf
	 bvxs8dHHEyO/4ka4Oko0xXcqwChqJJA1iD9s3PTb0buFUShkb7Ie9Fdc8kM1A0cpTU
	 PV9E6tpGn/TsSEYVIRb9G2hX/P7j5UnKEo3t3iYQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 7/7] systemd-tools-native: reduce dependencies, add comments
Date: Fri, 17 Jul 2026 16:46:14 +0100
Message-ID: <20260717154614.3701267-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717154614.3701267-1-ross.burton@arm.com>
References: <20260717154614.3701267-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241214

Pass "--auto-features disabled" to disable all optional dependencies by
default, and remove build dependencies that are not needed.

Reorganise the recipe to make logical sense and so that the SUMMARY
isn't overwritten by systemd.inc, and add comments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemd/systemd-tools-native_259.5.bb      | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb b/me=
ta/recipes-core/systemd/systemd-tools-native_259.5.bb
index 7212ed97507..d25e36ff3c0 100644
--- a/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
@@ -1,19 +1,27 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
=20
-SUMMARY =3D "native tools from systemd"
-
 require systemd.inc
=20
-DEPENDS =3D "gperf-native libcap-native util-linux-native python3-jinja2=
-native"
+SUMMARY =3D "native tools from systemd"
+
+# We don't actually need jinja to generate code, but it's checked for at=
 configure time
+DEPENDS =3D "gperf-native python3-jinja2-native"
=20
 inherit pkgconfig meson native
=20
-MESON_TARGET =3D "systemctl"
-MESON_INSTALL_TAGS =3D "systemctl"
+# Disable everything that is auto-detected by default
+EXTRA_OEMESON +=3D "--auto-features disabled"
+
+# Link systemctl statically
 EXTRA_OEMESON +=3D "-Dlink-systemctl-shared=3Dfalse"
+
+# Ensure unused build paths are not in the binary
 EXTRA_OEMESON +=3D "-Dsysvinit-path=3D -Dsysvrcnd-path=3D"
=20
 # Systemctl is supposed to operate on target, but the target sysroot is =
not
 # determined at run-time, but rather set during configure
 # More details are here https://github.com/systemd/systemd/issues/35897#=
issuecomment-2665405887
 EXTRA_OEMESON +=3D "--sysconfdir ${sysconfdir_native}"
+
+MESON_TARGET =3D "systemctl"
+MESON_INSTALL_TAGS =3D "systemctl"
--=20
2.43.0


