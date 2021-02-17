Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8450.1613573162236932530
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 06:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC044ED1
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 06:46:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F7EB3F73B
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 06:46:00 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rootfs_deb: handle aarch64 SDK_ARCH
Date: Wed, 17 Feb 2021 14:45:56 +0000
Message-Id: <20210217144556.1707181-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This class maps from OE architectures to dpkg architectures, but wasn't
handling aarch64 correctly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/rootfs_deb.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bb=
class
index ef616da229..0469ba7059 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -32,4 +32,8 @@ python () {
          d.setVar('DEB_SDK_ARCH', 'amd64')
     elif darch =3D=3D "arm":
          d.setVar('DEB_SDK_ARCH', 'armel')
+    elif darch =3D=3D "aarch64":
+         d.setVar('DEB_SDK_ARCH', 'arm64')
+    else:
+         bb.fatal("Unhandled SDK_ARCH %s" % darch)
 }
--=20
2.25.1

