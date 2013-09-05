Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0FBE8615F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:44 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc17so1247912pbc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=pZqkCcNQ40JItk0+XFb0AfwbSz7FbT4uW0tAYI33YDM=;
	b=w48Nvp1nmksofmfJJ9IciahMUfQG83myUvRYw2/JeIBgOG2k2puXe1eVhk87I955gY
	iDWZFUI4sU+bq/jJfAlHGDAF+NQUJA75A1mqpp3AzL1u9c0GGgo2y7l9GeJzhlsqppIM
	p25zXQpQFi6v5TTBe6KoUx//9pRweidOk7fT+pGOf5qLlSD1q0mWZ6hXcI0iVw1GI+iF
	AnWexelakZ0KdNpktT5DJc8ZOD1wnr8cfT8YsPyQeP9cN4LHb+D+wQwmO5v4lveRAPTr
	5e0t8CkD9chIGsJ6m3mHjHkSDpot6Tob15uOKy0g2SlcAZBYyZr7vXS3b1x9g61ZzbeY
	aHaw==
X-Received: by 10.68.255.229 with SMTP id at5mr6923634pbd.130.1378354666146;
	Wed, 04 Sep 2013 21:17:46 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:13 -0700
Message-Id: <748f002411f00778cbc9b64166a9c9e2feba2c07.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 08/13] distutils3: Do build_ext as separate step during compile
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:44 -0000

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
1.8.4


