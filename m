Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45861.1795624781686301904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 08:39:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=NASKBTau;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6030F2F
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:38 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE1093F632
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795624781; bh=NqWWy8uHbIAlki6famhwqmBV1aOdsyp0O/a7rBgqmtg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NASKBTauUYM227KRxe9BoKXiZ7SH/B/hMDGeGq/ptM3CqdomW18aUkSzI79i8O6Nu
	 n/rvhlaH2OJPb3BP4s5T+Yd1FVwuyfnUts5uTY3zqSp1ea9EvcFUhM6Qn8zKlkDJyS
	 i85KcXLi1mDB2uyIY/Pi3YGQbFkCed0C0x7p1tLQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/18] python3: remove the -misc package
Date: Wed, 25 Nov 2026 16:39:25 +0000
Message-ID: <20261125163927.1835785-16-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125163927.1835785-1-ross.burton@arm.com>
References: <20261125163927.1835785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251227
Content-Type: text/plain; charset="utf-8"

By removing the catch-all -misc package we ensure that new files added
to Python are explicitly packaged.  A provides is added to preserve
compatibility.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/python3-manifest.json      |  1 +
 .../recipes-devtools/python/python3_3.15.2.bb | 20 -------------------
 2 files changed, 1 insertion(+), 20 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 55a0672ccb9..b1c24ad24c0 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -179,6 +179,7 @@
             "io",
             "math",
             "mime",
+            "misc",
             "numbers",
             "pkgutil",
             "stringold"
diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index 69902f15333..6eb7416375e 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -413,9 +413,6 @@ python(){
     pn =3D 'python3'
     rprovides =3D (d.getVar('RPROVIDES') or "").split()
=20
-    # ${PN}-misc-native is not in the manifest
-    rprovides.append(pn + '-misc-native')
-
     for key in python_manifest:
         pypackage =3D pn + '-' + key + '-native'
         if pypackage not in rprovides:
@@ -438,8 +435,6 @@ python(){
         pypackage =3D pn + '-' + key
=20
         if pypackage not in packages:
-            # We need to prepend, otherwise python-misc gets everything
-            # so we use a new variable
             newpackages.append(pypackage)
=20
         # "Build" python's manifest FILES, RDEPENDS and SUMMARY
@@ -464,7 +459,6 @@ python(){
=20
         d.setVar('SUMMARY:' + pypackage, python_manifest[key]['summary']=
)
=20
-    # Prepending so to avoid python-misc getting everything
     packages =3D newpackages + packages
     d.setVar('PACKAGES', ' '.join(packages))
     d.setVar('ALLOW_EMPTY:${PN}-modules', '1')
@@ -517,21 +511,7 @@ FILES:libpython3-staticdev +=3D "${libdir}/python${P=
YTHON_MAJMIN}/config-${PYTHON_
 INSANE_SKIP:${PN}-dev +=3D "dev-elf"
 INSANE_SKIP:${PN}-ptest =3D "dev-deps"
=20
-# catch all the rest (unsorted)
-PACKAGES +=3D "${PN}-misc"
-RDEPENDS:${PN}-misc +=3D "\
-    ${PN}-audio \
-    ${PN}-codecs \
-    ${PN}-core \
-    ${PN}-email \
-    ${PN}-numbers \
-    ${PN}-pickle \
-    ${PN}-pydoc \
-"
-RDEPENDS:${PN}-modules:append:class-target =3D " ${MLPREFIX}python3-misc=
"
-RDEPENDS:${PN}-modules:append:class-nativesdk =3D " ${MLPREFIX}python3-m=
isc"
 RDEPENDS:${PN}-modules:append:class-target =3D " ${@bb.utils.contains('P=
ACKAGECONFIG', 'gdbm', '${MLPREFIX}python3-gdbm', '', d)}"
-FILES:${PN}-misc =3D "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python$=
{PYTHON_MAJMIN}/lib-dynload"
=20
 # catch manpage
 PACKAGES +=3D "${PN}-man"
--=20
2.43.0

