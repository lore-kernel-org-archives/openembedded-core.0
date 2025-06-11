Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF72C71134
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 12:37:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6666.1749645461585352185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 05:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C82F15A1
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 05:37:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AA9713F673
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 05:37:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-ndg-httpsclient: remove unused recipe
Date: Wed, 11 Jun 2025 13:37:37 +0100
Message-ID: <20250611123737.3831062-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 12:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218452

The last dependency in core on this recipe was removed in May 2024[1],
and there don't appear to be any other users that I can find.  The last
upstream release was in 2018 so this is now obsolete.

[1] oe-core dfa482f1998 ("python3-requests: cleanup RDEPENDS")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../python/python3-ndg-httpsclient_0.5.1.bb   | 29 -------------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-ndg-httpsclient_=
0.5.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 5c315d58cf5..b6cf4b7cfae 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -668,7 +668,6 @@ RECIPE_MAINTAINER:pn-python3-markupsafe =3D "Richard =
Purdie <richard.purdie@linuxf
 RECIPE_MAINTAINER:pn-python3-maturin =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-meson-python =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
 RECIPE_MAINTAINER:pn-python3-more-itertools =3D "Tim Orling <tim.orling@=
konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-ndg-httpsclient =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-numpy =3D "Trevor Gamblin <tgamblin@baylibr=
e.com>"
 RECIPE_MAINTAINER:pn-python3-packaging =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-pathspec =3D "Ross Burton <ross.burton@arm.=
com>"
diff --git a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.b=
b b/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
deleted file mode 100644
index c3b8e526f16..00000000000
--- a/meta/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY =3D "Provides enhanced HTTPS support for httplib and urllib2 usi=
ng PyOpenSSL"
-HOMEPAGE =3D "https://github.com/cedadev/ndg_httpsclient/"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://MANIFEST.in;md5=3Dce22c0cd986d2de3f7073cd6b=
5523ae0"
-
-SRC_URI[sha256sum] =3D "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e=
3d72131de2592210"
-
-inherit pypi setuptools3 update-alternatives
-
-PYPI_PACKAGE =3D "ndg_httpsclient"
-UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
-
-DEPENDS +=3D " \
-    python3-pyopenssl \
-    python3-pyasn1 \
-"
-
-RDEPENDS:${PN} +=3D " \
-    python3-datetime \
-    python3-logging \
-    python3-pyopenssl \
-    python3-pyasn1 \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-ALTERNATIVE:${PN} =3D "ndg_httpclient"
-ALTERNATIVE_LINK_NAME[ndg_httpclient] =3D "${bindir}/ndg_httpclient"
-ALTERNATIVE_PRIORITY =3D "30"
--=20
2.43.0


