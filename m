Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id D28C46EADA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:11:58 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id fa1so2640168pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0QvEXYldmI1ea5bV+rIh7ZWysc0QBdfOa/hxQG2h/vY=;
	b=S6UNIKivUtdHiFFWWrlOG8rIEE08pjL9oHsvFsZHa+CS0FeN1LamA4P9hRzHTZcNpF
	CbeqigTwfE2hFH+rJb0iTEYgThsyoE2HwNe0u8Xs4pZWksCRKoQGo+JlWU8ThUlOGp6Y
	HNRQAgOxrDBrdC34CBG06gLTzAxhiXu0/FIj+jstpUb/Orj5k4WuVKreDxjE9/JJCWIP
	VuT8FGygOtU8mYwHJubiicwycYVYyCfidydH7VU+HAypgf4D0RFNWJ5q2O83rJtaqPRB
	5ViHWj1AHQF2lDIswGseucnkgvoBgse4e/r7BLaVqxA06ou4WuWvPIW+3RS8dSNaBhgz
	3hVQ==
X-Received: by 10.68.20.1 with SMTP id j1mr12188111pbe.148.1391055120203;
	Wed, 29 Jan 2014 20:12:00 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.11.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:11:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:35 -0800
Message-Id: <e859adbc8668c66923482004d3855c3e4bc10fb8.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 13/15] distutils3.bbclass: Use MACHINE for sysroot when not building for build host
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
X-List-Received-Date: Thu, 30 Jan 2014 04:11:59 -0000

Python's machinery replaces directories in sysroot path to match OE's
staging area sysroots. Earlier we use to have HOST_SYS represent sysroot
always but now we use MACHINE to represent target sysroots but HOST_SYS
to represent host sysroot. This patch caters to that difference

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3.bbclass |   41 +++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 9c841e4..bbd645c 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -9,40 +9,57 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
 distutils3_do_compile() {
-         STAGING_INCDIR=${STAGING_INCDIR} \
-         STAGING_LIBDIR=${STAGING_LIBDIR} \
-         BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-         build_ext --include-dirs ${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
-         --library-dirs ${STAGING_LIBDIR}/${PYTHON_DIR} \
-         ${DISTUTILS_BUILD_EXT_ARGS} \
-         build ${DISTUTILS_BUILD_ARGS} || \
-         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
+        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
+                SYS=${MACHINE}
+        else
+                SYS=${HOST_SYS}
+        fi
+        STAGING_INCDIR=${STAGING_INCDIR} \
+        STAGING_LIBDIR=${STAGING_LIBDIR} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+        build ${DISTUTILS_BUILD_ARGS} || \
+        bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
 }
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
+        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
+                SYS=${MACHINE}
+        else
+                SYS=${HOST_SYS}
+        fi
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
 
 distutils3_stage_all() {
+        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
+                SYS=${MACHINE}
+        else
+                SYS=${HOST_SYS}
+        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 
 distutils3_do_install() {
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
+                SYS=${MACHINE}
+        else
+                SYS=${HOST_SYS}
+        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MACHINE} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
-- 
1.7.10.4


