Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 97A2A7DEDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:14 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id h17so7957987pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AV8lItFCDIOZXvEtE40oWFba2L81W2MGNyW+RjMi6H0=;
	b=tG9iRdc4cFUrYvTrkrmfVFgyV3rhAXsGcT3MtBiFbEAKp4GQhJmcFV0EUR8pOyLmSv
	xjzwonQQm/HRSi9wbnLdzvM9WHuJy/U9/If6fbbkdMcnr8sDNIHtybEhV7CAqIKP4gDi
	+xo264rWHPeFgOMLX5qv/N3YnhcW8BLSrXYMT8wHdCI899/uZUmHA2QI+Puxm9kDVyQn
	4997IG1qHeQq3G1+CJ+O6b4OuGI4o7O8Ed5zasgJMfPR4WIfc4sDQAmFieN6YdIbVeBs
	aXU/OslJx9F0Cw8ieN6P+tLCRTpcONdRm4cRhv7zVbwW2eQrcue6H1cHXc1CZ4zOUozn
	uf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AV8lItFCDIOZXvEtE40oWFba2L81W2MGNyW+RjMi6H0=;
	b=qUSUxY9OUoTs9sU1emhuAFrlaMBE1AA/dEN1Bf63gY8qEdOxSR73+Wpo/YCZXZqCPd
	gAHEOIiffeHTnDgiJtWf/f4B+jxZ/EvN1TxtALD02TjDvFyiWp//+IhCaNGqBFkF/XWA
	MfxsQDWXguF6mASBCV41S14kxm7HMYsKo2UMs6UT4IMEzNFnMDAJ76rail8kICocXULV
	Xu/LKsi6CaaVSzk8IWOK0KGky0xGIggy4aZUbQsQjE405jboDKTwdr9gda0PT0HzdZ9I
	g/f9QVqN83YFTvyWq6kMeENdJw6jdREQmCZSVgYiqwOCaHBUQXmlBaQkg6Hrv58k4TJK
	krOw==
X-Gm-Message-State: APjAAAUd3HDMab3MTz26HHno3EF2HB7SMiWEgYuycIlqGH1qU+2KcaR9
	P30B+qk6qLKrzcgfkBIRck7TkNPF
X-Google-Smtp-Source: APXvYqyhaUIJ7AAyHuFHM2N5Qgz/VaiVhUeYD+020DCRlWrFtsJerLSI3GhrWNAhsqFidxXJtN2uyg==
X-Received: by 2002:a65:578b:: with SMTP id b11mr36166456pgr.446.1557809655604;
	Mon, 13 May 2019 21:54:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:49 -0700
Message-Id: <d32cd33b5aeaa8859cfd68b9167a3ab3b892e710.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 07/23] distutils: Run python from the PATH in the -native case as well
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 04:54:14 -0000

From: Douglas Royds <douglas.royds@taitradio.com>

The python distutils generate a python wrapper script for each package,
containing shebang lines pointing to the python executable.
In our case, this is a fully-qualified path to python-native in the
recipe-sysroot-native.

Ubuntu 18.04 restricts the useful length of the shebang line to 125
characters, and Ubuntu 16.04 restricts it to 77. In both cases, the
staged python script fails to run due to the length of the path to
the python-native executable.

Replace the shebang line with nativepython or nativepython3 as appropriate.
The nativepython symlink is installed by the python-native recipe:

    #!/usr/bin/env nativepython

We were already doing this for on-target distutils components.
This change applies the sed-line to -native distutils components as well.
In this way, -native clients of these components can invoke the wrapper scripts
directly, without themselves needing to inherit pythonnative.

This works around a known setuptools issue:
https://github.com/pypa/setuptools/issues/494
Even once this issue has been resolved upstream,
we will still need to replace `python` with `nativepython`

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/distutils.bbclass  | 11 +++++------
 meta/classes/distutils3.bbclass |  7 +++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 9862731..b5c9c2f 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -9,6 +9,9 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
+DISTUTILS_PYTHON = "python"
+DISTUTILS_PYTHON_class-native = "nativepython"
+
 distutils_do_configure() {
         if [ "${CLEANBROKEN}" != "1" ] ; then
                 NO_FETCH_BUILD=1 \
@@ -53,18 +56,14 @@ distutils_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                if [ ${PN} != "${BPN}-native" ]; then
-			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
-		fi
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if [ -e ${D}${sbindir} ]; then
             for i in ${D}${sbindir}/* ; do \
-                if [ ${PN} != "${BPN}-native" ]; then
-			sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ python:g $i
-		fi
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 834e322..42e7f5a 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -10,6 +10,9 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
+DISTUTILS_PYTHON = "python3"
+DISTUTILS_PYTHON_class-native = "nativepython3"
+
 distutils3_do_configure() {
 	if [ "${CLEANBROKEN}" != "1" ] ; then
 		NO_FETCH_BUILD=1 \
@@ -57,14 +60,14 @@ distutils3_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${USRBINPATH}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
-- 
2.7.4


