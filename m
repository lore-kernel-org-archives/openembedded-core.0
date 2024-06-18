Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7258FC27C4F
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 10:06:32 +0000 (UTC)
Received: from pv50p00im-zteg10011401.me.com (pv50p00im-zteg10011401.me.com [17.58.6.41])
 by mx.groups.io with SMTP id smtpd.web10.83041.1718705185706231187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 03:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=WpkQgTUD;
 spf=pass (domain: subset.ch, ip: 17.58.6.41, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1718705185; bh=pHIYjVXDNmLkWiJC6hyuOp7AzjImrbX0cZTIqFYtkj8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WpkQgTUDQqMbxfwrwGbe+LyNp2XOqp5l2/aYM+e7gHhmo1TJoDam9CUnGrAmXRzMw
	 oMyv+j/DXW1bZxpoPTUUo0jF3KWSNIFNZJdryMq53QHBHeWu5QRfgsklnkyjUhjDA4
	 gfYl7ZZdmJsa6vJtTovikhCpAsoD+JBd2t/Mbml8HSO5XCockQwhhKbQtBNL/BsCeN
	 KjSrzghLJADfSoN0yqZ9BaneWP72rzaGd6jr7qWXyqyOYXsif0hyt7vOquVSSR3FsS
	 138wqkdfCCSZmBv6hvHSQYbH5hqY4/KJvmL2MCwCPvgABFVPO/+maNkPfkvoQ+zExZ
	 1rvhyiOxhlzyA==
Received: from thinkpad.. (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id A5738DC01F9;
	Tue, 18 Jun 2024 10:06:21 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-core@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [OE-core][scarthgap][master][PATCH] gpgme: move gpgme-tool to own sub-package
Date: Tue, 18 Jun 2024 12:05:54 +0200
Message-ID: <20240618100554.2793454-1-patrick@subset.ch>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Proofpoint-GUID: JMmPmbD7zJC6hj3Aa5bVBvvzEJmjscUK
X-Proofpoint-ORIG-GUID: JMmPmbD7zJC6hj3Aa5bVBvvzEJmjscUK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1030 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406180075
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 10:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200865

From: Patrick Wicki <patrick.wicki@siemens.com>

The gpgme-tool binary is licensed GPL-3.0-or-later. Split it out into
its own package that can be opted out of.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta/recipes-support/gpgme/gpgme_1.23.2.bb | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.23.2.bb b/meta/recipes-su=
pport/gpgme/gpgme_1.23.2.bb
index d8807b3af2..55f164e4a9 100644
--- a/meta/recipes-support/gpgme/gpgme_1.23.2.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.23.2.bb
@@ -3,11 +3,18 @@ DESCRIPTION =3D "GnuPG Made Easy (GPGME) is a library d=
esigned to make access to G
 HOMEPAGE =3D "http://www.gnupg.org/gpgme.html"
 BUGTRACKER =3D "https://bugs.g10code.com/gnupg/index"
=20
-LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & GPL-3.0-or-later"
+LICENSE:${PN} =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-cpp =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-tool =3D "GPL-3.0-or-later"
+LICENSE:python3-gpg =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
                     file://COPYING.LESSER;md5=3Dbbb461211a33b134d42ed5ee=
802b37ff \
                     file://src/gpgme.h.in;endline=3D23;md5=3D2f0bf06d1c7=
dcb28532a9d0f94a7ca1d \
-                    file://src/engine.h;endline=3D22;md5=3D4b6d8ba313d9b=
564cc4d4cfb1640af9d"
+                    file://src/engine.h;endline=3D22;md5=3D4b6d8ba313d9b=
564cc4d4cfb1640af9d \
+                    file://src/gpgme-tool.c;endline=3D21;md5=3D66c5381e0=
e05475792e24982d15e7ce8 \
+                    "
=20
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
 SRC_URI =3D "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
@@ -33,6 +40,8 @@ RDEPENDS:${PN}-cpp +=3D "libstdc++"
=20
 RDEPENDS:python3-gpg +=3D "python3-unixadmin"
=20
+RRECOMMENDS:${PN} +=3D "${PN}-tool"
+
 BINCONFIG =3D "${bindir}/gpgme-config"
=20
 # Default in configure.ac: "cl cpp python qt"
@@ -61,9 +70,10 @@ export PKG_CONFIG=3D'pkg-config'
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-PACKAGES =3D+ "${PN}-cpp python3-gpg"
+PACKAGES =3D+ "${PN}-cpp ${PN}-tool python3-gpg"
=20
 FILES:${PN}-cpp =3D "${libdir}/libgpgmepp.so.*"
+FILES:${PN}-tool =3D "${bindir}/gpgme-tool"
 FILES:python3-gpg =3D "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-dev +=3D "${datadir}/common-lisp/source/gpgme/*"
=20
--=20
2.45.2


