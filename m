Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.14559.1608657800700786233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 09:23:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EC061042
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 09:23:19 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DECED3F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 09:23:18 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: default SDKMACHINE to the build host architecture
Date: Tue, 22 Dec 2020 17:23:14 +0000
Message-Id: <20201222172315.3913967-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Currently there's a limitation that Extensible SDKs can only be build on =
a
machine with the same architecture as the SDK.

However, SDKMACHINE defaults to x86-64, which means eSDKs cannot be built
out of the box on arm64 systems.

By defaulting SDKMACHINE to ${BUILD_ARCH} we generate SDKs for the build
host, so they'll always work out of the box.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index da6db9f595..92b6866d4d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -136,7 +136,7 @@ TARGET_CC_ARCH =3D "${TUNE_CCARGS}"
 TARGET_LD_ARCH =3D "${TUNE_LDARGS}"
 TARGET_AS_ARCH =3D "${TUNE_ASARGS}"
=20
-SDKMACHINE ??=3D "x86_64"
+SDKMACHINE ??=3D "${BUILD_ARCH}"
 SDK_OS =3D "${BUILD_OS}"
 SDK_VENDOR =3D "-oesdk"
 SDK_SYS =3D "${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
--=20
2.25.1

