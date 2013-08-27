Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 21BAD6BB96
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:26 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id p10so5122402pdj.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=335QKnmBfxetvco/U4WILXP23jmCzduXmiBBFrvatjc=;
	b=vdE+hal6p0Oou15LhYmCpI7ZMTZcW5gSyeCJnfvB3GrDh+Gu/CDTZwtVU16XiCtOKR
	+IszXENYFcEkqi6IyiKGx1x+9TEL1koc6UwuyjUVzOfsHjOAu80jR8wPBmqspvViOzdn
	dKI8XfH3DkimW0hvwOtjCu2C8fZROjYF3bOXpEGZK5zmuEJLm0Cxa/BpgBoIZtuf8OT2
	+I3uxwvsYvrkS0yOVqMG3h2yQewiIPDH/aC5Jw4EuByhN61vtHkVNubELZmYgxFcjFpG
	6PeFQnGqte/fvee4zpuU2GnWTZDbX6AW3TM+Hav1RbOlmY0A3FFWIB5BRyx4mP9x8UYQ
	+FHg==
X-Received: by 10.68.5.228 with SMTP id v4mr22607235pbv.117.1377623787231;
	Tue, 27 Aug 2013 10:16:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:16 -0700
Message-Id: <152dc3b3cac33fbe7422f4e93cc00ef8afe43f1d.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 17/20] distutils3.bbclass: Use MACHINE for sysroot when not building for build host
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:26 -0000

Python's machinery replaces directories in sysroot path to match OE's
staging area sysroots. Earlier we use to have HOST_SYS represent sysroot
always but now we use MACHINE to represent target sysroots but HOST_SYS
to represent host sysroot. This patch caters to that difference

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3.bbclass | 41 +++++++++++++++++++++++++++++------------
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
1.8.3.4


