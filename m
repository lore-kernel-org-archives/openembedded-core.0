Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1SMem9-0002nL-OD
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 14:23:21 +0200
Received: by lbjn8 with SMTP id n8so415346lbj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZNCZLsKiE4sYGuUE2unwQk0OUConZQpwDo1vpA8JHlc=;
	b=eoBtXQMZNWkunnlZI8TGk67UVGn0ng3+VEA5E2gEl03l2b9f9hA2Xn9P97j7rgQlb1
	hyXVFVTSlQYRd8YvQcqbtltPExsh2esTN1IJt+M3HVzvsLh4z3pXhAFoGrr+9kTwg3aV
	5dzdXGkLEzd+SPvwsfPSOoGBCxwTZuTfHvaYSleRbC75U+1CTs4xDC28B8JoYYrdKFsD
	WLQvASqEU3G2CAxYRXbfgizrW+FdrsZSMkjkOVeN24qGQF1X6MhFH0OGDfG8mLlOMpvV
	T9Ls3msOxUfHiepF6RwcPRnpLqz+yuSfNK0C0jyycWqhb5WJLQuDn4KY8MKDMUR+dtX6
	waxA==
Received: by 10.152.132.166 with SMTP id ov6mr20597490lab.35.1335269626763;
	Tue, 24 Apr 2012 05:13:46 -0700 (PDT)
Received: from arpc01.inne.proxdynamics.com ([84.49.231.147])
	by mx.google.com with ESMTPS id oi3sm18891963lab.12.2012.04.24.05.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 05:13:45 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 02:12:04 +0200
Message-Id: <1335312724-27599-1-git-send-email-tasskjapp@gmail.com>
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
X-List-Received-Date: Tue, 24 Apr 2012 12:23:21 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 meta/recipes-support/boost/boost.inc |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index c9306df..5341a8c 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -16,7 +16,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
 
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
-- 
1.7.9.5



