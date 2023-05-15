Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F123C7EE26
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:30:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.88214.1684157400831997322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BC7D2F4;
	Mon, 15 May 2023 06:30:45 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F34A43F67D;
	Mon, 15 May 2023 06:29:59 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/8] gnutls: remove use of argp-standalone for musl
Date: Mon, 15 May 2023 14:29:52 +0100
Message-Id: <20230515132955.2231164-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515132955.2231164-1-ross.burton@arm.com>
References: <20230515132955.2231164-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181255

From: Ross Burton <ross.burton@arm.com>

This was made obsoleten in 3.5.0 when crywrap was removed from the
GnuTLS source tree.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/gnutls/gnutls_3.8.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.0.bb b/meta/recipes-s=
upport/gnutls/gnutls_3.8.0.bb
index eef004efa5b..1e3f34b6c53 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.0.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.0.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D71391c8e0c1c=
fe68077e7fce3b586283 \
                     file://doc/COPYING.LESSER;md5=3D4fbd65380cdd25595107=
9008b364516c"
=20
 DEPENDS =3D "nettle gmp virtual/libiconv libunistring"
-DEPENDS:append:libc-musl =3D " argp-standalone"
=20
 SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('=
.')[1]}"
=20
@@ -58,8 +57,6 @@ EXTRA_OECONF =3D " \
 # Otherwise the tools try and use HOSTTOOLS_DIR/bash as a shell.
 export POSIX_SHELL=3D"${base_bindir}/sh"
=20
-LDFLAGS:append:libc-musl =3D " -largp"
-
 do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
--=20
2.34.1


