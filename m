Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1884.1795105885151952736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 08:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N2V+orIA;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C32FB19F0
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:21 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BFF93F673
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795105884; bh=041f5A1XBxKP3nPuY+MAJ1c3iG7WZEBOO3xg504uA4s=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=N2V+orIA3ugGJU5UojcAgJGq6Won8yVVSQAY+cpygIB9RAhX/7AdSSgytVJuBq3RE
	 fiOxFm/XIYr5Dn/cGCAEJZw53sn3NdgPkBWwCyfwsIqr1OGURdwNq90f2BqSPC2Kj6
	 DQYl0Awntvn1OvmMPaHNNUwKMCxmZ3VUGIKTeDOo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] python3: improve generation of _sysconfigdata.py
Date: Thu, 19 Nov 2026 16:31:16 +0000
Message-ID: <20261119163117.2242351-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119163117.2242351-1-ross.burton@arm.com>
References: <20261119163117.2242351-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 16:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250707
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

