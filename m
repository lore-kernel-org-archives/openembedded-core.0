Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 9EE2371E5A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 02:23:57 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 83DE91C0264;
	Fri,  3 May 2019 14:23:56 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2019 14:23:50 +1200
Message-Id: <20190503022350.26366-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430023405.29459-1-douglas.royds@taitradio.com>
References: <20190430023405.29459-1-douglas.royds@taitradio.com>
Subject: [PATCH v2] distutils: Run python from the PATH in the -native case as well
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
X-List-Received-Date: Fri, 03 May 2019 02:23:58 -0000

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
---
 meta/classes/distutils.bbclass  | 11 +++++------
 meta/classes/distutils3.bbclass |  7 +++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 9862731493..8d258daea4 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -9,6 +9,9 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
+DISTUTILS_PYTHON = "${PYTHON_PN}"
+DISTUTILS_PYTHON_class-native = "native${PYTHON_PN}"
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
index 834e322474..bae536d343 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -10,6 +10,9 @@ DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
 
+DISTUTILS_PYTHON = "${PYTHON_PN}"
+DISTUTILS_PYTHON_class-native = "native${PYTHON_PN}"
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
2.17.1


