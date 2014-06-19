Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 252826FEE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:18:17 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so2650281wib.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=umqtbEPswyr+aHtUIw++8UuVRaSgboQe2Z1huWg62r4=;
	b=kPyYExF0S2To+O8lwBGhnc7XzU5ycEbTc9t0XRiutUAe18J2Sd3dSuqbt77jTfii53
	BVhPbWzxfXvrQ8cNrwpD6RjiD0LR9Elspffv51xZTil4qxHtF+UZwuWoihRfaHS7RYu+
	j8t+Zr8zVKOk2XFivyqDoQsmwTpPwKSSJ85j5dJzPquH9h9ll9t66PsWtVEQa96L2sPt
	VQTTcmAEpXIQkDU6mDnjBrNmDeJ5WC6KAM8NsMigk72+uSWdip2VZTjtg5iIzJRGcva0
	v8G6jCIQnVLpTuSSz5upBoN+b26p6FTv2jcXjDNnp9hZfdJFO95lXpM/v+LCXazyJob1
	QW6g==
X-Received: by 10.180.73.169 with SMTP id m9mr5498464wiv.53.1403176697030;
	Thu, 19 Jun 2014 04:18:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l9sm10633507wic.21.2014.06.19.04.18.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 04:18:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jun 2014 13:18:15 +0200
Message-Id: <1403176695-18917-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [DO-NOT-MERGE][RFC][PATCH] DO-NOT-MERGE: distutils3.bbclass: Don't use MACHINE variable
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
X-List-Received-Date: Thu, 19 Jun 2014 11:18:18 -0000

The original patch says this about MACHINE variables:

    Use MACHINE for sysroot when not building for build host

    Python's machinery replaces directories in sysroot path to match OE's
    staging area sysroots. Earlier we use to have HOST_SYS represent sysroot
    always but now we use MACHINE to represent target sysroots but HOST_SYS
    to represent host sysroot. This patch caters to that difference

But I think we need to find some different solution, because right now the only
user of distutils3 bbclass python3-distribute becames effectivelly MACHINE_ARCH
because of this. Detected with sstate-diff-machines.sh script:

 == Comparing signatures for python3-distribute.do_populate_sysroot.sigdata between qemux86 and qemux86copy ==
  Hash for dependent task python3-distribute_0.6.32.bb.do_install changed from ef2f64ea6aecf1f9c2c6a0f201c52f67 to 7afd17fd366b28cf4a0353c7dd5e1c5b

  $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-distribute*/*do_install*
    basehash changed from 5311d29c25ff324645de9c17cdefe083 to 2f079b81b13427faddeb040e7a115965
    Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
    Hash for dependent task python3-distribute_0.6.32.bb.do_compile changed from 4fcb29eb2a0df7bef2f9806a0d9cdd92 to e7df3cdd7b82733d69c87f1822b7177b

  $ bitbake-diffsigs sstate-diff/1403174194/qemux86*/i586*/python3-distribute*/*do_compile*
    basehash changed from 870a9e01c2c4eb73dd57451eeb2a7f0c to c061ae11d7f16d74d49f667243a21be0
    Variable MACHINE value changed from 'qemux86copy' to 'qemux86'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/distutils3.bbclass | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index bbd645c..8cf29d5 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -9,14 +9,9 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
 distutils3_do_compile() {
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build ${DISTUTILS_BUILD_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
@@ -24,42 +19,27 @@ distutils3_do_compile() {
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install_headers execution failed."
 }
 
 distutils3_stage_all() {
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install (stage) execution failed."
 }
 
 distutils3_do_install() {
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
-- 
2.0.0


