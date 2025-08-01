Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08419C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 20:49:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.98309.1754081394639652679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 13:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41EBD237B
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 13:49:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFA373F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 13:49:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] dbus: glib is only used in the test suite
Date: Fri,  1 Aug 2025 21:49:26 +0100
Message-ID: <20250801204928.2580529-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801204928.2580529-1-ross.burton@arm.com>
References: <20250801204928.2580529-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 20:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221374

The glib/gio libraries are only used in a few of the tests:

$ grep use_glib
meson.build:use_glib =3D glib.found() and gio.found()
test/meson.build:if use_glib
test/meson.build:if message_bus and tools and platform_unix and use_glib
test/meson.build:if use_glib
test/meson.build:if message_bus and tools and platform_unix and use_glib

So there's no need to depend on glib if we're not building the tests.
Explicitly enable/disable the modular tests option to ensure that when
the tests are not being installed we don't still need glib to build them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/db=
us/dbus_1.16.2.bb
index 909a209fc7b..1876ea8a944 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -20,7 +20,6 @@ SRC_URI[sha256sum] =3D "0ba2a1a4b16afe7bceb2c07e9ce99a8=
c2c3508e5dec290dbb643384bd6
 EXTRA_OEMESON =3D "-Dxml_docs=3Ddisabled \
                  -Ddoxygen_docs=3Ddisabled \
                  -Dsystem_socket=3D/run/dbus/system_bus_socket \
-                 -Dmodular_tests=3Denabled \
                  -Dchecks=3Dtrue \
                  -Druntime_dir=3D${runtimedir} \
                  -Dtest_socket_dir=3D/tmp \
@@ -41,9 +40,9 @@ PACKAGECONFIG[user-session] =3D "-Duser_session=3Dtrue =
-Dsystemd_user_unitdir=3D${syst
 PACKAGECONFIG[verbose-mode] =3D "-Dverbose_mode=3Dtrue,-Dverbose_mode=3D=
false,,"
 PACKAGECONFIG[audit] =3D "-Dlibaudit=3Denabled,-Dlibaudit=3Ddisabled,aud=
it"
 PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,lib=
selinux"
-PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=3Df=
alse"
+PACKAGECONFIG[tests] =3D "-Dmodular_tests=3Denabled -Dinstalled_tests=3D=
true,-Dmodular_tests=3Ddisabled -Dinstalled_tests=3Dfalse,glib-2.0"
=20
-DEPENDS =3D "expat virtual/libintl glib-2.0"
+DEPENDS =3D "expat virtual/libintl"
 RDEPENDS:${PN} +=3D "${PN}-common ${PN}-tools"
 RDEPENDS:${PN}:class-native =3D ""
=20
--=20
2.43.0


