Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E6BF4199B
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:18:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17500.1776255477995987655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TTZseQzl;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8870339A
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 05:17:51 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E32303F86F
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776255477; bh=phGamMS4N8qEBBm/N5UFxIlyDQ6PKCpuTj2Ngw1ASjU=;
	h=From:To:Subject:Date:From;
	b=TTZseQzlzPgXfd/fnyQvOr4DoxSHTs4ixakcB83+inOvtPUsCR1t1xMwoo60YoYT7
	 dyANZFnaXkXqmDqoDGLdf+VzKk5WckWOCf59aa4fcKkgxdM+fnfbFZ0KJK9cWV3JGT
	 NvzNU+f6kUk9kq0yzS9au2uobQ4jfAlhwibkCkV0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libsoup: actually apply patches for CVE-2025-32049 and CVE-2026-1539
Date: Wed, 15 Apr 2026 13:17:51 +0100
Message-ID: <20260415121752.793537-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 12:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235196

The patches were added to SRC_URI before inheriting gnomebase, which
does SRC_URI =3D "...". This means the patches were never actually part o=
f
SRC_URI, so never applied.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/libsoup/libsoup_3.6.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes=
-support/libsoup/libsoup_3.6.6.bb
index 981e74d8160..b51368adb64 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0=
d91eb439ebec522ec2"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
=20
+inherit gettext gnomebase upstream-version-is-even gobject-introspection=
 gi-docgen vala
+
 SRC_URI[archive.sha256sum] =3D "51ed0ae06f9d5a40f401ff459e2e5f652f9a510b=
7730e1359ee66d14d4872740"
=20
 SRC_URI +=3D "file://CVE-2025-32049-1.patch \
@@ -20,8 +22,6 @@ SRC_URI +=3D "file://CVE-2025-32049-1.patch \
=20
 PROVIDES =3D "libsoup-3.0"
=20
-inherit gettext gnomebase upstream-version-is-even gobject-introspection=
 gi-docgen vala
-
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
--=20
2.43.0


