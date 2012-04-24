Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SMdsr-0001nh-8D
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 13:26:13 +0200
Received: by lagw12 with SMTP id w12so378898lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 04:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vdQy8Wi/n+CVCe/KN6tkD3hCmF1EBiQi5Cd9nyMcPac=;
	b=nEp5dWELXKVDjuEptGB/6tlEfBE/Ta8mehj/s+RgjRRB9C4BjzPexCmdommOG04ox3
	5lxMYxuHNP7b56n98r4sEMDSlAM7xOzdRauceEYWtMy18QcEQ2xJZSZlL3Yl3qrL1tR3
	tIaGYOqXZxe4qDOmKzr8q7zPdJx751l96TZXmJRMZtWyVRQfdlI2IJFKAiYo3mDXIDhh
	hERqtlKQtPsvfOD8TfPy2jSA4+5C/eBpB86MniCyuSY/ykSs8lk7yyGTJgPj5TBTlhG/
	f4R3vkzk7N1Cxlh6GuIG9g0t143b5lzSU1PV1HlJQBO2mhuy9fX3dn4ApTJWyjX+/OLA
	nLXw==
Received: by 10.112.47.8 with SMTP id z8mr1383774lbm.51.1335266198627;
	Tue, 24 Apr 2012 04:16:38 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com (147.84-49-231.nextgentel.com.
	[84.49.231.147])
	by mx.google.com with ESMTPS id ph8sm18741175lab.15.2012.04.24.04.16.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 04:16:37 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 01:14:44 +0200
Message-Id: <1335309284-8645-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4F9714DD.6070608@gmail.com>
References: <4F9714DD.6070608@gmail.com>
Subject: [PATCH] boost: set python-root correctly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 11:26:13 -0000

---
 meta/recipes-support/boost/boost.inc       |    8 +++++++-
 meta/recipes-support/boost/boost_1.49.0.bb |    2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c9306df..fbdf292 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -42,7 +42,7 @@ BOOST_LIBS = "\
 #BOOST_LIBS += "python"
 #DEPENDS += "python"
 #PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
-#PYTHON_VERSION = "2.5"
+#PYTHON_VERSION = "2.7"
 
 # Make a package for each library, plus -dev
 PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
@@ -123,6 +123,7 @@ BJAM_TOOLS   = "-sTOOLS=gcc \
 		'-sNO_ZLIB=1' \
 		'-sBUILD=release <optimization>space <threading>multi <inlining>on <debug-symbols>off' \
 		'-sPYTHON_VERSION=${PYTHON_VERSION}' \
+		'-sPYTHON_ROOT=${PYTHON_ROOT}' \
 		'--layout=system' \
 		"
 
@@ -140,6 +141,11 @@ do_boostconfig() {
 	then
 		echo 'using gcc : 4.3.1 : ${CXX} : compileflags -DBOOST_SP_USE_PTHREADS -I${includedir} linkflags -L${libdir} ;' >> ${S}/tools/build/v2/user-config.jam
 	fi	
+
+        echo "using python : ${PYTHON_VERSION} : : ${STAGING_INCDIR}/python${PYTHON_VERSION} ;" >> ${S}/tools/build/v2/user-config.jam
+
+        CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
+        sed -i '/^using python/d' project-config.jam
 }
 
 addtask do_boostconfig after do_patch before do_configure
diff --git a/meta/recipes-support/boost/boost_1.49.0.bb b/meta/recipes-support/boost/boost_1.49.0.bb
index 71fdc48..533cd10 100644
--- a/meta/recipes-support/boost/boost_1.49.0.bb
+++ b/meta/recipes-support/boost/boost_1.49.0.bb
@@ -2,7 +2,7 @@ include boost.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://arm-intrinsics.patch"
 
-- 
1.7.9.5



