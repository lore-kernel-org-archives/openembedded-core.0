Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 000FA73BB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:21:42 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so90010760wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3997iK7fDrOLwOj1RuVzKdhGzbdyRpz66cxNsYprBt4=;
	b=y9ha/lcxzQhX63YQt6CJtWtvC5Pwe7L6LorlEEmMI+pE4IC9/KGyqmlxGgEXN3LYgF
	DrJVk2b9daugD1YgMERkGNaMdR8LPdf1Fmm9I6y0KUNuKaPqB2zvRJKP9QATQJkNOwHy
	43geJTAryEtldtXJ+O40MKT1z2F2UTmfhvX3l2zLCp0y1st/GpmzjJQVAS5o7SQGHCmJ
	hnS5p6MI9NnwpdW7//3rY1crBHITK4S2FyKJzEeF30qq1Nvzh4F7BNvSiFmWRn98ukL1
	95pd78T7sP/6cnTpzKyGWpQ8sMGakwoQD0ntQ0wHwbAFb8fUcPMm6A5LU7pdYTS0gzoi
	niZQ==
X-Received: by 10.194.93.3 with SMTP id cq3mr2676502wjb.20.1437553302128;
	Wed, 22 Jul 2015 01:21:42 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by smtp.googlemail.com with ESMTPSA id
	k2sm2133919wif.4.2015.07.22.01.21.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jul 2015 01:21:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 10:21:10 +0200
Message-Id: <1437553270-9514-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] boost: add python3 support
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
X-List-Received-Date: Wed, 22 Jul 2015 08:21:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Both - python/python3 - libs are build by adding 'python' to PACKAGECONFIG
  but are packed into separate packages
* Indention was wrong in __anonymous()

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-support/boost/boost.inc | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 27d489f..3288e84 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -24,8 +24,8 @@ BOOST_LIBS = "\
 
 # optional boost-python library
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[python] = ",,python"
-BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python', '', d)}"
+PACKAGECONFIG[python] = ",,python python3"
+BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '', d)}"
 inherit python-dir
 PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 
@@ -35,9 +35,16 @@ python __anonymous () {
     packages = []
     extras = []
     for lib in d.getVar('BOOST_LIBS', True).split( ):
-            pkg = "boost-%s" % lib.replace("_", "-")
+        # BJAM does not know '--with-python3' (only --with-python)
+        if lib != "python3":
             extras.append("--with-%s" % lib)
-            packages.append(pkg)
+        pkg = "boost-%s" % lib.replace("_", "-")
+        packages.append(pkg)
+        if lib == "python":
+            # special: python*.so matches python3.so !!
+            if not d.getVar("FILES_%s" % pkg, True):
+                    d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s.so.*" % lib)
+        else:
             if not d.getVar("FILES_%s" % pkg, True):
                     d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
     d.setVar("BOOST_PACKAGES", " ".join(packages))
@@ -101,7 +108,6 @@ BJAM_TOOLS   = "--ignore-site-config \
 		'-sGCC_INCLUDE_DIRECTORY=${STAGING_INCDIR}' \
 		'-sGCC_STDLIB_DIRECTORY=${STAGING_LIBDIR}' \
 		'-sBUILD=release <optimization>space <threading>multi <inlining>on <debug-symbols>off' \
-		'-sPYTHON_VERSION=${PYTHON_BASEVERSION}' \
 		'-sPYTHON_ROOT=${PYTHON_ROOT}' \
 		'--layout=system' \
 		"
@@ -149,6 +155,7 @@ do_boostconfig() {
 	sed -i "/^using python : ${PYTHON_BASEVERSION}"/d ${S}/tools/build/example/user-config.jam
 	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-config.jam
 	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/example/user-config.jam
+	echo "using python : 3.4 : : ${STAGING_INCDIR}/python3.4m ;" >> ${S}/tools/build/example/user-config.jam
 
 	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
 	sed -i '/^using python/d' project-config.jam
-- 
1.9.3


