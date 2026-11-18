Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1703.1795037839276734811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 13:37:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sz7icOiQ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A50C61477
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 13:37:15 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A88F3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 13:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795037838; bh=50B8/WnOyUq5vap8Ry/S09g53+e87ilG8tBkY9MVZhg=;
	h=From:To:Subject:Date:From;
	b=sz7icOiQJY9ZUF2o3Ws090PZ1AM4GkE5CxvqmIrymizWTdxioBL5fQpYKgSeKs6Rp
	 OsMWlCPAWQ5jAAdWOXoCbo2zeotEBtJs+ewFKUVCW89pD940hCVtTj4I5N0fNL0oGi
	 TupXkkfhUwAziZLb3K/lI9ayaErWa5Ds3saOoSSc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] python3: improve generation of _sysconfigdata.py
Date: Wed, 18 Nov 2026 21:37:12 +0000
Message-ID: <20261118213714.2531261-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 21:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250597
Content-Type: text/plain; charset="utf-8"

Improve the regexes used to match so they are not assuming specific
whitespace, and use a glob instead of find to look for the input file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.14.10.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index b3e8123d4d6..5fe510d8f75 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -220,14 +220,14 @@ do_install:append() {
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfi=
gdata*.cpython*
=20
         mkdir -p ${D}${libdir}/python-sysconfigdata
-        sysconfigfile=3D`find ${D} -name _sysconfig*.py`
-        sed -i  \
-                -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
-                -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}=
'\,,g" \
-                -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING=
_INCDIR}'\,,g" \
-                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/p=
ython${PYTHON_MAJMIN}'\,,g" \
-                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_I=
NCDIR}/python${PYTHON_MAJMIN}'\,,g" \
-                -e "s,^ 'BUILD_GNU_TYPE'.*, 'BUILD_GNU_TYPE': '${HOST_SY=
S}'\,,g" \
+        sysconfigfile=3D"${D}${libdir}/python${PYTHON_MAJMIN}/_sysconfig=
*.py"
+        sed -i \
+                -e "s,'LIBDIR':.*,'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
+                -e "s,'INCLUDEDIR':.*,'INCLUDEDIR': '${STAGING_INCDIR}'\=
,,g" \
+                -e "s,'CONFINCLUDEDIR':.*,'CONFINCLUDEDIR': '${STAGING_I=
NCDIR}'\,,g" \
+                -e "s,'INCLUDEPY':.*,'INCLUDEPY': '${STAGING_INCDIR}/pyt=
hon${PYTHON_MAJMIN}'\,,g" \
+                -e "s,'CONFINCLUDEPY':.*,'CONFINCLUDEPY': '${STAGING_INC=
DIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,'BUILD_GNU_TYPE':.*,'BUILD_GNU_TYPE': '${HOST_SYS}=
'\,,g" \
                 -e "s,--build=3D${BUILD_ARCH},--build=3D${HOST_ARCH},g" =
\
                 -e "s,build_alias=3D${BUILD_ARCH},build_alias=3D${HOST_A=
RCH},g" \
                 -e "s,${B},/build/path/unavailable/,g" \
--=20
2.43.0

