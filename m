Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8307.1795188567573841286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 07:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DxqN+HQY;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3767B1477
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:29:24 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B910D3F632
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 07:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795188567; bh=041f5A1XBxKP3nPuY+MAJ1c3iG7WZEBOO3xg504uA4s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DxqN+HQYSr79+btZ0R+0VDqBCWIN7IwrtCUWQZd4vZHBgDaCDILhxxHpsMn1YVK+W
	 z0+4UgO7dHOmUDnmdtGN/V7a3o39GFGkNITz5JXhmqjW8UOXS8vp3dGCaHQ1LQy4IS
	 OEiAEshKJwQ3lSRDk9HEXwMfMOYe4GimRJ+isxng=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 3/4] python3: improve generation of _sysconfigdata.py
Date: Fri, 20 Nov 2026 15:29:20 +0000
Message-ID: <20261120152921.3339902-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120152921.3339902-1-ross.burton@arm.com>
References: <20261120152921.3339902-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 15:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250809
Content-Type: text/plain; charset="utf-8"

Improve the regexes used to match so they are not assuming specific
whitespace, and use a glob instead of find to look for the input file.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.15.2.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index 61eabc07b54..388c7b82e40 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -221,14 +221,14 @@ do_install:append() {
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

