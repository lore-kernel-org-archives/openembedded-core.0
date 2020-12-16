Received: from C02VH2K5HV2R.localdomain (C02VH2K5HV2R.localdomain [81.96.232.39])
 by mx.groups.io with SMTP id smtpd.web12.493.1611867046795591396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 12:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: c02vh2k5hv2r.localdomain, ip: 81.96.232.39, mailfrom: adrher02@c02vh2k5hv2r.localdomain)
Received: by C02VH2K5HV2R.localdomain (Postfix, from userid 501)
	id 007CB983CD5C; Wed, 16 Dec 2020 10:01:25 +0000 (GMT)
From: adrian.herrera@arm.com
To: openembedded-core@lists.openembedded.org
Cc: Adrian Herrera <adrian.herrera@arm.com>
Subject: [PATCH] scripts: oe-run-native, fix *-native directories
Date: Wed, 16 Dec 2020 10:01:19 +0000
Message-Id: <20201216100119.54625-1-adrian.herrera@arm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This fixes a crash with "find" when running a native tool and *-native
directories do not exist under the binary directory in the sysroot.
This happened because the directory wildcard was passed as part of the
root directory.
The directory wildcard is now passed by "-name", which returns an empty
result if no matching directory.

Signed-off-by: Adrian Herrera <adrian.herrera@arm.com>
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
2.29.2

