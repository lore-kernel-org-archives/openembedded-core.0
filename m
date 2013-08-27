Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A77A76BBA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:07 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y10so5138007pdj.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=JWl/+uD1JR/dKv3hDeO9eWFXAiOOPhIH5DsTDzaa6UA=;
	b=LXMByRbxfA4aZidbLULstXcNjy50Vb27iJS6vFyum8jomnjOJgFf5bGYHeMP8v+hTn
	zWEjTadYeQD4wzUxCdDWJEKNonjIOXKysuuZNm/RKLlH7HmQJAzqOymJgeEKu93cjLZp
	pkqD3SAPDprfNkkFjnyHn2vYqgtqBcO2AUb4IdDBJQtV7n4lu+pZwbO66key/58wzbRN
	OM/h25L2poVmswNudMDK3TdY0XAVC5bQ+LDcqRN/UG9lq/fA67d4zBuvmGfh2iXtQBUA
	l//x7v+rxuSaBDXsDdcMFV1JOcwFEryg19F2dqayAvma6e7LY/CtUBT1AFVIFYz9iB/a
	JcPg==
X-Received: by 10.66.228.3 with SMTP id se3mr22211243pac.37.1377623768678;
	Tue, 27 Aug 2013 10:16:08 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:07 -0700
Message-Id: <e5a9836c9ea4fdfbfdb5de9bfe21a8393ae03094.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 08/20] distutils3: Do build_ext as separate step during compile
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:07 -0000

Remove PYTHON_BASEVERSION its moved to distutils3-base class

Add DISTUTILS_BUILD_EXT_ARGS for modules to pass flags to build_ext step
in setup.py

Add build_ext as sepate step during compile and add
the cross sysrooted library and headers since we are cross
compiling

Use ${PYTHON_PN} in place of hardcoding python name

Remove the /etc/share if its empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils3.bbclass | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 602ce48..f118fa0 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -1,10 +1,7 @@
-
-PYTHON_BASEVERSION = "3.3"
-
-inherit distutils3-base 
-#distutils-tools
+inherit distutils3-base
 
 DISTUTILS_BUILD_ARGS ?= ""
+DISTUTILS_BUILD_EXT_ARGS ?= ""
 DISTUTILS_STAGE_HEADERS_ARGS ?= "--install-dir=${STAGING_INCDIR}/${PYTHON_DIR}"
 DISTUTILS_STAGE_ALL_ARGS ?= "--prefix=${STAGING_DIR_HOST}${prefix} \
     --install-data=${STAGING_DATADIR}"
@@ -15,7 +12,12 @@ distutils3_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
+         build_ext --include-dirs ${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI} \
+         --library-dirs ${STAGING_LIBCDIR}/${PYTHON_DIR} \
+         ${DISTUTILS_BUILD_EXT_ARGS} \
+         build ${DISTUTILS_BUILD_ARGS} || \
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build_ext ${DISTUTILS_BUILD_ARGS} || \
          bbfatal "${PYTHON_PN} setup.py build_ext execution failed."
 }
 
@@ -37,44 +39,33 @@ distutils3_stage_all() {
 }
 
 distutils3_do_install() {
-        echo "Beginning ${PN} Install ..."
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-
-        echo "Step 2 of ${PN} Install ..."
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal "${PYTHON_PN} setup.py install execution failed."
 
-        echo "Step 3 of ${PN} Install ..."
         # support filenames with *spaces*
         find ${D} -name "*.py" -print0 | while read -d $'\0' i ; do \
             sed -i -e s:${D}::g "$i"
         done
 
-        echo "Step 4 of ${PN} Install ..."
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                echo "Processing " $i; \
-                sed -i \
-                    -e s:${STAGING_BINDIR_NATIVE}/python3-native:${bindir}:g \
-                    $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
-        echo "Step 4 of ${PN} Install ..."
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
-                echo "Processing " $i; \
-                sed -i \
-                    -e s:${STAGING_BINDIR_NATIVE}/python3-native:${bindir}:g \
-                    $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
-        echo "Step 5 of ${PN} Install ..."
         rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
         
         #
@@ -82,6 +73,7 @@ distutils3_do_install() {
         #
         if test -e ${D}${datadir}/share; then
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
+            rmdir ${D}${datadir}/share
         fi
 }
 
-- 
1.8.3.4


