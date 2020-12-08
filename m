Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web08.10704.1607443405688320575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=NMYu+x6c;
 spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 52B0C60157
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Dec 2020 16:03:23 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1607443402;
	bh=fuztnHW/W81hJgP1jgyE0+08QP6Nqwv2aHH5P2//Ako=;
	h=From:To:Cc:Subject:Date:From;
	b=NMYu+x6cUkHtvFDJALTtKjvygi7vVrNOLhU/BfzGkL4lTMlmgtgvBY2guGWr5eS5p
	 KvEX+nzHq2TN96qaQm6MccQp4PJ8LimWbhxs8fQWsu9eI0iv6nkEbk8VDyTDsFIUie
	 BtsyiIrwd6hhxafQr+xMuHksshd6kp51JpSrwEpZYR3twWqLTY4+biUnICSiLz30kS
	 WaZTxWoS5tH0OcrBYXp+b3MQ6Of5z44gsVf/3X+iOPfHaN3RC9/szyIphPHlD/iMkb
	 s8Ygo19lFX8eHDSq3cfI2iSaNf/9yvDA18ICk4lTqDpXPwmqMsWVeAYil7fIcw9/0+
	 1c9DYpgYeaprA==
From: "Jack Mitchell" <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Cc: Jack Mitchell <ml@embed.me.uk>
Subject: [PATCH] distutils3: allow setup.py to be run from a different directory to ${S}
Date: Tue,  8 Dec 2020 16:03:14 +0000
Message-Id: <20201208160314.2052956-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sometimes setup.py can be buried deep in a source tree. This has
traditionally been solved with setting S to the subdirectory in
the source. However with the new pseudo changes, some python modules
make changes to files beneath ${S}, for example:

S =3D "${WORKDIR}/git/python/pythonmodule"

then in setup.py it works with source code in a relative fashion, such
as:

../../src

This causes pseudo to abort as it isn't tracking the paths. Therefore
implement the variable DISTUTILS_SETUP_PATH so that recipes can use:

S =3D "${WORKDIR}/git"
DISTUTILS_SETUP_PATH =3D "${S}/python/pythonmodule"

inherit distutils3

This allows the full source tree to be monitored, while distutils
can run setup.py from a location other than ${S}.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 meta/classes/distutils3.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bb=
class
index 7356b5245a..a916a8000c 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -12,28 +12,30 @@ DISTUTILS_INSTALL_ARGS ?=3D "--root=3D${D} \
 DISTUTILS_PYTHON =3D "python3"
 DISTUTILS_PYTHON_class-native =3D "nativepython3"
=20
+DISTUTILS_SETUP_PATH ?=3D "${S}"
+
 distutils3_do_configure() {
     :
 }
=20
 distutils3_do_compile() {
-        cd ${S}
+        cd ${DISTUTILS_SETUP_PATH}
         NO_FETCH_BUILD=3D1 \
         STAGING_INCDIR=3D${STAGING_INCDIR} \
         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/s=
etup.py \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
         build --build-base=3D${B} ${DISTUTILS_BUILD_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS=
}' execution failed."
 }
 distutils3_do_compile[vardepsexclude] =3D "MACHINE"
=20
 distutils3_do_install() {
-        cd ${S}
+        cd ${DISTUTILS_SETUP_PATH}
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=3D${STAGING_INCDIR} \
         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
         PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/s=
etup.py \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
         build --build-base=3D${B} install --skip-build ${DISTUTILS_INSTA=
LL_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_=
ARGS}' execution failed."
=20
--=20
2.29.2

