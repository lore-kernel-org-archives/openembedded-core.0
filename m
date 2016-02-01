Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 72497771C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 05:08:35 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id s5so46493908qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 21:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O/ikN7XL56zevHr5gb09l4GUWUyenHnGtBRDOIt7oaE=;
	b=h/ugIeJtXZHU0fHKs8LlH9hyRmex26LdJkxgyK4Fdk4kuVHp1j1H2XONiO+21lko+T
	Fr/QOTut9w9sb5Zz4oaoiKEZr8eQn5Lj5sBhAbNM2NOWTCsiFJd+cbWcmtUcfLyT3z8V
	BhX6Cs6/4mDQpKY7E0ZwbvY8iZ8IBs8CDCDhkI0/7VD1dQCJJMTtK3IN0EIeGdpQDdQM
	ZT2h4OQv2d2T/Ufo47uWDWN8jgXSUFS6Ots8YpXKfjnnpdilDLhgAw4/j5XTL07RofxC
	WTptH5MOd7TZ1wvZ9ITz9TEW11MTZJEG4QSiMEmdM5aKyKh1UY3/y9T7dN+GT/1ckZJI
	KFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=O/ikN7XL56zevHr5gb09l4GUWUyenHnGtBRDOIt7oaE=;
	b=UnPFuru+AVQvjisGdP0uqju63UDaFkwJayfeB1oQWl4gBLfbzcdyEZKyvK8JP/pLCd
	Oxv7Ims8Ws84RFwtni87yVo3qj53nX/ge89bsF/UB42I6S7B0M4vBI6MW2VHYzT+O7QU
	ggUPquq0QAFPPzLUi8Wp39FXB54kXYTK69QnbAy4ndEbSB8QonMxfDKyTLT1omwRq2cf
	p9d9MMEmqIwY0DtneKeZz99m2wyCjgbjsqnNsyHVWNCWkV5ALxkFSs7B3UxYWzTXCBkE
	83NixFmdjVQ9HrTZZdDkZYATVLzYs3D5awQQSoTGJhYKtRdM7iBrRMoNC/xo4GAJSnbb
	lXpA==
X-Gm-Message-State: AG10YOQlkp9BiMYqaGdLrb4ipW5JYkoDADkSoyX6+7vKniVjyCxbnBg9LVUCUv76ox5kBw==
X-Received: by 10.55.74.86 with SMTP id x83mr25985397qka.89.1454303315741;
	Sun, 31 Jan 2016 21:08:35 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	b6sm12058940qkh.12.2016.01.31.21.08.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 21:08:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Feb 2016 05:08:24 +0000
Message-Id: <17891198365760fe79cd82566cc34a66a2226d54.1454303080.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
References: <79e1257a6eb8ed2fa57f92fb34adc8b14ed880fe.1454303080.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454303080.git.raj.khem@gmail.com>
References: <cover.1454303080.git.raj.khem@gmail.com>
Subject: [PATCH 3/8] distutils: Consider S != B case
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
X-List-Received-Date: Mon, 01 Feb 2016 05:08:35 -0000

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
2.7.0


