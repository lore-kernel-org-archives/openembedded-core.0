Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9192.1620834799884809344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 08:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 033611FB
	for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 08:53:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A08AA3F719
	for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 08:53:18 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libarchive: disable redundant libxml2 PACKAGECONFIG
Date: Wed, 12 May 2021 16:53:16 +0100
Message-Id: <20210512155316.3836907-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

An XML parser (either libxml2, or expat) is only needed by libarchive to
read/write XAR archives.  However, these also need OpenSSL enabled which
by default it is not, so XAR files were disabled and libxml2 was a build
dependency for no reason.

As XAR archives are mainly used on macOS, we can remove libxml2.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/libarchive/libarchive_3.5.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb b/meta/=
recipes-extended/libarchive/libarchive_3.5.1.bb
index 1387b69066b..c9e30f468fa 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.1.bb
@@ -10,7 +10,6 @@ DEPENDS =3D "e2fsprogs-native"
 PACKAGECONFIG ?=3D "zlib bz2 xz lzo"
=20
 PACKAGECONFIG_append_class-target =3D "\
-	libxml2 \
 	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
 "
=20
--=20
2.25.1

