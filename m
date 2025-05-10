Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09DCC3ABC3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 08:44:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6631.1746866659932409131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 01:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3A3A153B
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 483A73F5A1
	for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 01:44:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/23] meson: clean up the native template in nativesdk builds
Date: Sat, 10 May 2025 09:43:56 +0100
Message-ID: <20250510084400.269726-23-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250510084400.269726-1-ross.burton@arm.com>
References: <20250510084400.269726-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 08:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216271

In a nativesdk build, the native build template should be minimal as it
just needs to ensure that Meson can link with libraries in the SDK's
native sysroot.

Specifically, it shouldn't be passing BUILD_* flags to Meson as these
are for the Yocto build host, not the SDK user.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/meson/meson_1.8.0.bb | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/meson/meson_1.8.0.bb b/meta/recipes-de=
vtools/meson/meson_1.8.0.bb
index 5d4fc39751b..78e0a0ed805 100644
--- a/meta/recipes-devtools/meson/meson_1.8.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.8.0.bb
@@ -86,6 +86,21 @@ cpp_link_args =3D ${@generate_native_link_template(d)}
 EOF
 }
=20
+install_nativesdk_template() {
+    install -d ${D}${datadir}/meson
+
+    cat >${D}${datadir}/meson/meson.native.template <<EOF
+[binaries]
+pkg-config =3D 'pkg-config-native'
+
+[built-in options]
+c_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}']
+c_link_args =3D ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}', '-L@{OECO=
RE_NATIVE_SYSROOT}${base_libdir_native}',]
+cpp_args =3D ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}']
+cpp_link_args =3D ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}', '-L@{OE=
CORE_NATIVE_SYSROOT}${base_libdir_native}',]
+EOF
+}
+
 install_cross_template() {
     install -d ${D}${datadir}/meson
=20
@@ -117,7 +132,7 @@ EOF
 }
=20
 do_install:append:class-nativesdk() {
-    install_native_template
+    install_nativesdk_template
     install_cross_template
=20
     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
--=20
2.43.0


