Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BC6D41D7A
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 17:56:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16061.1765475793160454071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 09:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91DE51063
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:56:25 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F7323F73B
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 09:56:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/8] classes/meson: set LD
Date: Thu, 11 Dec 2025 17:55:43 +0000
Message-ID: <20251211175547.3944470-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211175547.3944470-1-ross.burton@arm.com>
References: <20251211175547.3944470-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 17:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227555

Set binaries.ld in the toolchain files and remove the unset from the
environment, as ld no longer appears to need special handling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/meson.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meso=
n.bbclass
index 72dbbcb67b1..4cf5de6753e 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -78,6 +78,7 @@ do_write_config() {
 [binaries]
 c =3D ${@meson_array('CC', d)}
 cpp =3D ${@meson_array('CXX', d)}
+ld =3D ${@meson_array('LD', d)}
 cython =3D 'cython3'
 ar =3D ${@meson_array('AR', d)}
 nm =3D ${@meson_array('NM', d)}
@@ -120,6 +121,7 @@ EOF
 [binaries]
 c =3D ${@meson_array('BUILD_CC', d)}
 cpp =3D ${@meson_array('BUILD_CXX', d)}
+ld =3D ${@meson_array('BUILD_LD', d)}
 cython =3D 'cython3'
 ar =3D ${@meson_array('BUILD_AR', d)}
 nm =3D ${@meson_array('BUILD_NM', d)}
@@ -168,10 +170,6 @@ do_write_config:append:class-nativesdk() {
 CONFIGURE_FILES =3D "meson.build"
=20
 meson_do_configure() {
-    # Meson requires this to be 'bfd, 'lld' or 'gold' from 0.53 onwards
-    # https://github.com/mesonbuild/meson/commit/ef9aeb188ea2bc7353e5991=
6c18901cde90fa2b3
-    unset LD
-
     bbnote Executing meson ${EXTRA_OEMESON}...
     if ! meson setup ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_C=
ROSS_FILE} ${EXTRA_OEMESON}; then
         MESON_LOG=3D${B}/meson-logs/meson-log.txt
--=20
2.43.0


