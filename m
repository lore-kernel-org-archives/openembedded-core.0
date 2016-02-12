Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id C9308731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:54:25 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id s68so29217147qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AaqDgIfe68ybgK+0PgGvOtRovx8AS6D0jJTr7/2sBXw=;
	b=IYBnZ42wBAQLrT3ygFc6rudGU1z4e9UaXFcV/v2YLM/n8Wn1A4G+cGrxbPxZQC3b1V
	2bP2SZXhodwSR7pJF7+4a2as+JR090xUvtHhA7lPLbzIVleGpUWn4iR5M/so0UY3lnBL
	xIBbAV8+PIdvagSswpH/mflPiIN5Nv938AOKhxSSAMVt6seGl97XBrC29FGPfiO2YSzP
	Vg6e3fockAFiLnZS/j00bUFQaJ3/SO6CLQhsmuUdoi3kirUfo2pnLjXFHUxLOPEnRWrJ
	iZtg4eDcqbgi7QVB/yMCSGT7HYVWEx8uZQLHD6C7WqUk8IIJ6KWt3KvWqaNKmmRnsHKb
	nETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AaqDgIfe68ybgK+0PgGvOtRovx8AS6D0jJTr7/2sBXw=;
	b=ifHlMhcrkF8Hmcrpik5RJrZW2rQlU+tgk0j6hWfJVhZnN5E5SfiP8S1kv/8SMnUt5S
	TLZ/+LkWK95a0JkAJKP/ysBSiJZooJhA1ePY73bjen2PJ8LgxdbSXa40mPfWoaMml4GU
	4BZU7OtmExhE2RrvwQ4DCswq/Sf2YV+Mj1tFFDi0AXQ7eCuf33znBt1WcSkBzwJAmphR
	Pv9nKRMfCDx3x67PTfLdHIPbSoPtOJKxHkM6yuUjXkFWHNubidcTQN0BFKRoS7qikpHr
	mXZ58Zjbf7/0rT7rn97DQTX2NzCXgmRMDCO8KReEzA1gnx4rG8QxSAobppFHEHXOom/x
	hfJw==
X-Gm-Message-State: AG10YOQ8u+7qUXTNKZMUxvA83wr/fndFEb2cJBBeKFlat3DwUcKOnp8+Hv6AZx62wutlCg==
X-Received: by 10.55.72.77 with SMTP id v74mr617910qka.88.1455270866038;
	Fri, 12 Feb 2016 01:54:26 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id b6sm5293982qkh.12.2016.02.12.01.54.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 01:54:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 09:54:19 +0000
Message-Id: <a997c7ca1892e6e80f07bec311292baadb07334a.1455270652.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1455270652.git.raj.khem@gmail.com>
References: <cover.1455270652.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] distutils: Consider S != B case
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
X-List-Received-Date: Fri, 12 Feb 2016 09:54:26 -0000

out of tree builds can break the assumption about setup.py being in the
current directory, seen especially with devtool when using externalsrc
many python modules cant build since it cant find setup.py in devtool
workspace

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils.bbclass  | 24 ++++++++++++++----------
 meta/classes/distutils3.bbclass | 19 ++++++++++++-------
 2 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index cd06713..1705fea 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -7,18 +7,23 @@ DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
 DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
+do_compile[dirs] = "${S}"
+stage_headers[dirs] = "${S}"
+stage_all[dirs] = "${S}"
+do_install[dirs] = "${S}"
+
 distutils_do_compile() {
-         STAGING_INCDIR=${STAGING_INCDIR} \
-         STAGING_LIBDIR=${STAGING_LIBDIR} \
-         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "${PYTHON_PN} setup.py build execution failed."
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py build execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
 
@@ -28,7 +33,7 @@ distutils_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 
@@ -38,14 +43,14 @@ distutils_do_install() {
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
@@ -65,7 +70,6 @@ distutils_do_install() {
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py*
-        
         #
         # FIXME: Bandaid against wrong datadir computation
         #
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 443bf3a..ed57810 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -8,6 +8,11 @@ DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
 DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
+do_compile[dirs] = "${S}"
+stage_headers[dirs] = "${S}"
+stage_all[dirs] = "${S}"
+do_install[dirs] = "${S}"
+
 distutils3_do_compile() {
         if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
                 SYS=${MACHINE}
@@ -17,8 +22,8 @@ distutils3_do_compile() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-        build ${DISTUTILS_BUILD_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py \
+        build -build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
 }
 distutils3_do_compile[vardepsexclude] = "MACHINE"
@@ -31,7 +36,7 @@ distutils3_stage_headers() {
                 SYS=${HOST_SYS}
         fi
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
 distutils3_stage_headers[vardepsexclude] = "MACHINE"
@@ -47,7 +52,7 @@ distutils3_stage_all() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} ${S}/setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 distutils3_stage_all[vardepsexclude] = "MACHINE"
@@ -63,13 +68,13 @@ distutils3_do_install() {
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
@@ -84,7 +89,7 @@ distutils3_do_install() {
         fi
 
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-        
+
         #
         # FIXME: Bandaid against wrong datadir computation
         #
-- 
2.7.1


