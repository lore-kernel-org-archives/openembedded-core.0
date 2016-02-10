Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADD4F73198
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:43:40 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id b35so1746047qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T/RzYRCEZzaXG/yUkLy1ElQ2ng3RTgtZUonY7G1C+AM=;
	b=XLjyWAqdrkgheqjqbxIj/fRU/WmQQ1KyyRRdj12zEsHLu5KMK+4FhDyB+47cuWqlky
	Quq5s69Ppf7lWmlnD5Zpbxv6cutBWOgS5a6tv4odpk3AOz8SmiFF30FGdWE/X1Cz4kIL
	BM3uUITF9/cqDxYdVHxD1PhKyAvFqgFZavAwBZTVreRLbYeSHwsxHQvnA+/x7uOpPBPe
	33LgQ5lwJSErWqPOEPwll5gxZ9G8K4+C82o+XJt9CrBXXkXhgxpoDuIxgclKH2fU0azD
	/+KNQ1gPaJgYuKCWXevkAwrKr6o2a0cV7p1RKZ7uvqpE6xraeARMPFwwcRJrx8A2es2S
	x9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T/RzYRCEZzaXG/yUkLy1ElQ2ng3RTgtZUonY7G1C+AM=;
	b=kuKjMG6Ife/6mcBOQ5KpS7lhY+lJdnzO0gTBU3tCyTn2r6wRI2adob0FAPhNXH65jm
	++8EyEYU0POf+bv98W7GUol5af52PZptJ9Ty7h+vOhp3D+0NSwYTHy2LBWVLoF1vb/jz
	ARW055ewqhENktNJ0xRmU2jZ+gTP5Bo92jD/yLd2H6uYHERIkDwLx9AprJuVjVlvJDad
	kd2qEIaIoLXkRhLKCzCI1UAadx29QfSzF4jHXlhnOgBHSrdY8ETIWGNGx4zOy/sZbps6
	CvPIg6Qb59fN822731YWYnxgUv+2f/REG/DIYEdvIqNJf66uWJO5tEa6dRRzt4CqDh7l
	YsxQ==
X-Gm-Message-State: AG10YOSSQ2lJ2nyrvYRtKn7GAY42cPKiMWCznzg4j3aLDojwzhP8fQgkabUaGsILJP1C3A==
X-Received: by 10.140.31.8 with SMTP id e8mr51464388qge.14.1455126220979;
	Wed, 10 Feb 2016 09:43:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	a66sm1724349qkb.20.2016.02.10.09.43.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 09:43:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 17:43:28 +0000
Message-Id: <d7fb520732892e8f08f7817b7abd127b98fa6c1d.1455126045.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1455126045.git.raj.khem@gmail.com>
References: <cover.1455126045.git.raj.khem@gmail.com>
Subject: [PATCH 1/9] distutils: Consider S != B case
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
X-List-Received-Date: Wed, 10 Feb 2016 17:43:40 -0000

out of tree builds can break the assumption about setup.py being in the
current directory, seen especially with devtool when using externalsrc
many python modules cant build since it cant find setup.py in devtool
workspace

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils.bbclass  | 27 +++++++++++++++++----------
 meta/classes/distutils3.bbclass | 26 +++++++++++++++++++-------
 2 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index cd06713..d9e0086 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -8,44 +8,51 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
 distutils_do_compile() {
-         STAGING_INCDIR=${STAGING_INCDIR} \
-         STAGING_LIBDIR=${STAGING_LIBDIR} \
-         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "${PYTHON_PN} setup.py build execution failed."
+        cwd=$PWD;cd ${S}
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py build execution failed."
+        cd $cwd
 }
 
 distutils_stage_headers() {
+        cwd=$PWD;cd ${S}
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+        cd $cwd
 }
 
 distutils_stage_all() {
+        cwd=$PWD;cd ${S}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+        cd $cwd
 }
 
 distutils_do_install() {
+        cwd=$PWD;cd ${S}
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
         # only modify file if it contains path  and recompile it
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \; -exec ${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;
 
-        if test -e ${D}${bindir} ; then	
+        if test -e ${D}${bindir} ; then
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
                 	sed -i -e s:${STAGING_BINDIR_NATIVE}/python-native/python:${bindir}/env\ python:g $i
@@ -65,7 +72,6 @@ distutils_do_install() {
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py*
-        
         #
         # FIXME: Bandaid against wrong datadir computation
         #
@@ -79,6 +85,7 @@ distutils_do_install() {
 	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
 	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
 	fi
+        cd $cwd
 }
 
 EXPORT_FUNCTIONS do_compile do_install
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 443bf3a..47cbf72 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -9,6 +9,8 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
 distutils3_do_compile() {
+        cwd=$PWD
+        cd ${S}
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
                 SYS=${MACHINE}
         else
@@ -17,13 +19,16 @@ distutils3_do_compile() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-        build ${DISTUTILS_BUILD_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py \
+        build -build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+        cd $cwd
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_stage_headers() {
+        cwd=$PWD
+        cd ${S}
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
                 SYS=${MACHINE}
@@ -31,12 +36,15 @@ distutils3_stage_headers() {
                 SYS=${HOST_SYS}
         fi
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
+        cd $cwd
 }
 distutils3_stage_headers[vardepsexclude] = "MACHINE"
 
 distutils3_stage_all() {
+        cwd=$PWD
+        cd ${S}
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
                 SYS=${MACHINE}
         else
@@ -47,12 +55,15 @@ distutils3_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
+        cd $cwd
 }
 distutils3_stage_all[vardepsexclude] = "MACHINE"
 
 distutils3_do_install() {
+        cwd=$PWD
+        cd ${S}
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
                 SYS=${MACHINE}
@@ -63,13 +74,13 @@ distutils3_do_install() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \;
 
-        if test -e ${D}${bindir} ; then	
+        if test -e ${D}${bindir} ; then
             for i in ${D}${bindir}/* ; do \
                 sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
@@ -84,7 +95,7 @@ distutils3_do_install() {
         fi
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-        
+
         #
         # FIXME: Bandaid against wrong datadir computation
         #
@@ -92,6 +103,7 @@ distutils3_do_install() {
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
             rmdir ${D}${datadir}/share
         fi
+        cd $cwd
 }
 distutils3_do_install[vardepsexclude] = "MACHINE"
 
-- 
2.7.1


