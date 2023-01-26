Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67073C54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 12:42:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.72483.1674736939532341729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 04:42:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 631CE4B3;
	Thu, 26 Jan 2023 04:43:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19BD23F71E;
	Thu, 26 Jan 2023 04:42:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] buildtools-tarball: set pkg-config search path
Date: Thu, 26 Jan 2023 12:42:16 +0000
Message-Id: <20230126124216.3900839-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 12:42:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176393

The buildtools-tarball includes a native sysroot with .pc files, and
in the case of buildtools-extended-tarball a pkg-config binary too.

If we're using the host pkg-config then it doesn't know to search in the
native sysroot.  If we're using our pkg-config then it searches in the
build-time prefix and not the actual SDK installation location.

Neither of these are correct, so set PKG_CONFIG_LIBDIR to search:
- The native sysroot
- The host pkg-config's default search path, if present
- Falling back to /usr/lib/pkgconfig, if not

In an ideal world this would be handled by the generic toolchain script,
but that is slightly more involved.

[ YOCTO #15007 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-=
core/meta/buildtools-tarball.bb
index de399173bae..34f77733985 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -75,6 +75,9 @@ create_sdk_files:append () {
 		echo 'export REQUESTS_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/c=
erts/ca-certificates.crt"' >>$script
 		echo 'export CURL_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/certs=
/ca-certificates.crt"' >>$script
 	fi
+	echo 'HOST_PKG_PATH=3D$(command -p pkg-config --variable=3Dpc_path pkg-=
config 2>/dev/null)' >>$script
+	echo 'export PKG_CONFIG_LIBDIR=3D${SDKPATHNATIVE}/${libdir}/pkgconfig:$=
{SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:=
/usr/share/pkgconfig}' >>$script
+	echo 'unset HOST_PKG_PATH'
=20
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS=
}
=20
--=20
2.34.1


