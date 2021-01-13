Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7987.1610545506358620998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 05:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4D47D6E
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 05:45:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DC493F70D
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 05:45:05 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] scripts: oe-run-native, fix *-native directories
Date: Wed, 13 Jan 2021 13:44:59 +0000
Message-Id: <20210113134500.1571067-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Adrian Herrera <adrian.herrera@arm.com>

This fixes a crash with "find" when running a native tool and *-native
directories do not exist under the binary directory in the sysroot.
This happened because the directory wildcard was passed as part of the
root directory.
The directory wildcard is now passed by "-name", which returns an empty
result if no matching directory.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
Change-Id: Iba7acd8bbd7e0beb4d25c984f6af7a4fd21486e6
---
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 4e63e69cc4..22958d97e7 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -43,7 +43,7 @@ fi
 OLD_PATH=3D$PATH
=20
 # look for a tool only in native sysroot
-PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE=
_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE=
_SYSROOT/usr/bin/*-native -maxdepth 1 -type d -printf ":%p")
+PATH=3D$OECORE_NATIVE_SYSROOT/usr/bin:$OECORE_NATIVE_SYSROOT/bin:$OECORE=
_NATIVE_SYSROOT/usr/sbin:$OECORE_NATIVE_SYSROOT/sbin$(find $OECORE_NATIVE=
_SYSROOT/usr/bin -maxdepth 1 -name "*-native" -type d -printf ":%p")
 tool_find=3D`/usr/bin/which $tool 2>/dev/null`
=20
 if [ -n "$tool_find" ] ; then
--=20
2.25.1

