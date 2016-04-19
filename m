Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B49E6FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:22:23 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id v188so169220631wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 09:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3ILk0/QPW/O8jFjkf7vUi2ZTVsEv5ErClgo1UWfEugw=;
	b=R5/P4P7tqsbiL0Wum6Y9yM2h14qPsTeqvmoR3zUGN0W2j6D61dfAs4RlEP9Ep1P4cn
	tU0zyJhpa/5Io+YLB6ehosYR0xg7s73cMdxeUmBYd0upzyBVovfj7B9F8PjXqtshCv+D
	Lr7e0Oowxm0zVyESUY85eHVeMOgpmQ9013K8m+/PWVQBYEz8eSy2Zylg/8vVKzh4eL/k
	MlroDEPRsVs/Gt+Fga0fANoRrcB6lMMEhfvZp9e7O6M55CSUuc0hmmH0omK4hkYyuOYi
	942FG2v0F+laGhVb8qpST8XVSMJ92lycysv9HdoY+/NqSsklqSrKZ63G/x00DK+3Ha33
	U4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3ILk0/QPW/O8jFjkf7vUi2ZTVsEv5ErClgo1UWfEugw=;
	b=ffTdzGbae7d4XadRyyyoImt/r8PG3gK9Bhlvbdspa+Zhfh8NNzhBT6fUgyRF8hcmOw
	cDh8x57QRZCqoDOGLAJeuVL49USpCTcCPsIFBcwIGbTMlnSmEMpX3r/S77KWQ57lT8RB
	y+SvAKBko9EqcpNopMeSVVppOWKgWdi5lF6HLI1l1Se5JFXb/p/SzmQGF7aXES1bJsoj
	gS/LWGFKRHtAs7e91aJ970srR06h4ZKQqLo+vYMuGie9dJE2qXoIxQ5sAs7YJo/EHBpj
	wBm08aqgzsOwZMj89+icRFT46AnFZncfNTzIGr3Vebquwycq2Xbn1TPyfo03IItLPpx3
	m4IA==
X-Gm-Message-State: AOPr4FXxN5FTGDkMWYLPBULe+KMz96mT35AwLfkqcry0dChg12EJRR07GdMwETOQGjyWl973
X-Received: by 10.194.179.200 with SMTP id di8mr4043587wjc.50.1461082943590;
	Tue, 19 Apr 2016 09:22:23 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm1046271wjb.20.2016.04.19.09.22.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 09:22:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 17:22:17 +0100
Message-Id: <1461082937-23752-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461082937-23752-1-git-send-email-ross.burton@intel.com>
References: <1461082937-23752-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] boost: improve configure
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
X-List-Received-Date: Tue, 19 Apr 2016 16:22:23 -0000

Instead of adding a custom task (do_boostconfig) simply use the existing
do_configure.

Ensure that there are no relative paths in do_configure.

Instead of editing the user-config.jam sample file in the source tree (which is
entirely comments) and extending it on every build, create a new user-config.jam
in ${WORKDIR}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/boost/boost.inc | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 92c7bcb..5696b6a 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -142,7 +142,7 @@ def get_boost_parallel_make(d):
 BOOST_PARALLEL_MAKE = "${@get_boost_parallel_make(d)}"
 BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 		${BJAM_TOOLS} \
-		-sBOOST_BUILD_USER_CONFIG=${S}/tools/build/example/user-config.jam \
+		-sBOOST_BUILD_USER_CONFIG=${WORKDIR}/user-config.jam \
 		--build-dir=${S}/${TARGET_SYS} \
 		--disable-icu \
 		${BJAM_EXTRA}'
@@ -150,23 +150,19 @@ BJAM_OPTS    = '${BOOST_PARALLEL_MAKE} -d+2 -q \
 # Native compilation of bzip2 isn't working
 BJAM_OPTS_append_class-native = ' -sNO_BZIP2=1'
 
-do_boostconfig() {
-	cp -f boost/config/platform/linux.hpp boost/config/platform/linux-gnueabi.hpp
+do_configure() {
+	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
 
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc with the following parameters" during compilation.
-	sed -i "/^using gcc : 4.3.1/d" ${S}/tools/build/example/user-config.jam
-	sed -i "/^using python : ${PYTHON_BASEVERSION}"/d ${S}/tools/build/example/user-config.jam
-	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${S}/tools/build/example/user-config.jam
-	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${S}/tools/build/example/user-config.jam
-	echo "using python : 3.5 : : ${STAGING_INCDIR}/python3.5m ;" >> ${S}/tools/build/example/user-config.jam
+	rm -f ${WORKDIR}/user-config.jam
+	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
+	echo "using python : ${PYTHON_BASEVERSION} : : ${STAGING_INCDIR}/python${PYTHON_BASEVERSION} ;" >> ${WORKDIR}/user-config.jam
+	echo "using python : 3.5 : : ${STAGING_INCDIR}/python3.5m ;" >> ${WORKDIR}/user-config.jam
 
 	CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS}" ./bootstrap.sh --with-bjam=bjam --with-toolset=gcc --with-python-root=${PYTHON_ROOT}
-	sed -i '/^using python/d' project-config.jam
+	sed -i '/^using python/d' ${S}/project-config.jam
 }
 
-do_boostconfig[dirs] = "${S}"
-addtask do_boostconfig after do_patch before do_configure
-
 do_compile() {
 	set -ex
 	rm -rf ${S}/${TARGET_SYS}
-- 
2.8.0.rc3


