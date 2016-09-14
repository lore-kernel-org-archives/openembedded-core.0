Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 554B273695
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:41:42 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b187so8023119wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ABgXcuMJHQPXMCEIecslhW4i3FAt+WJMvJryYL92qps=;
	b=PU11r4kWhDKsR60ZMg7dIlUmK3XDRBjxt4Be9+xpXObR97Z/6popN6zOmsvlubV08c
	GBxER+jrFYTeQ2Hak3xKbeMzwlxdWm5Xs/IGMiMAyNoxFrRn6OZj+xGnMXCKikjkXjJk
	xVIcaV3GjPVbx3/KNelVnfwqZ/qW6OKpQHxoZnXX3xvCt9tHPaYqoQ5XoGT8v2hYAjQj
	Szz3cs+9NCFzr13KqU/Q4NdhEhn68Wu43UotH5KAWG7HKx+h1PgY6zH/eVL9pW1YiZvN
	dS7ZwxZE6WsO+3Ij0ub+5Rkv8oZR0zwPXtsO5wmfaw/l/wpVCr1rC+s+/kotaWkAo6hL
	kVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ABgXcuMJHQPXMCEIecslhW4i3FAt+WJMvJryYL92qps=;
	b=mYVCllb7Tf7M6Pc95apuxiPRI6XSQSOuRPRx/uOusPFDWMhGAWc07IJ9gsD95xdV1C
	84AKMIiDXQ+zLp+TE6d+31y9zYONa8+5qg+OTb/M92dnO3oclgielCVl+z8i/8KT20jv
	Q4Kiq3t8mVAbIYp3MKCHPyTEuryb+zVXDjvYv/9Nh9jLQ2UMuSMFnSSe/e/MUQO36axE
	gB3akrpEm/QbPT8AiUTXzxguJSp28FzESLp4EEsMc+UYXArxfgvwRz0wXSpO5h5k2OxY
	wM9ysNqosooylWHxCIoxc2AuWcxm8bD6jr76PTtXtZPwqVkAHwmAJ194jUTwii/AqZWE
	bvaw==
X-Gm-Message-State: AE9vXwM7RSzxy7m55H/VbyhlG3p7u1EEm2NrM3AfSYvt50K9eLdsXkLlKN416wtwiVb4dhRE
X-Received: by 10.194.5.202 with SMTP id u10mr3925090wju.149.1473871303007;
	Wed, 14 Sep 2016 09:41:43 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p13sm5025189wmd.1.2016.09.14.09.41.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Sep 2016 09:41:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 17:41:35 +0100
Message-Id: <1473871297-28966-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/3] cmake: don't inherit autotools
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
X-List-Received-Date: Wed, 14 Sep 2016 16:41:43 -0000

cmake doesn't use autotools, the functions get replaced by either cmake.bbclass
(target) or the recipe itself (native) leaving just lots of superfluous
dependencies.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/cmake/cmake-native_3.6.1.bb | 15 +++++++++++++++
 meta/recipes-devtools/cmake/cmake.inc             |  9 ---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
index 33930fb..f3a485f 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
@@ -8,6 +8,9 @@ SRC_URI += "\
     file://cmlibarchive-disable-ext2fs.patch \
 "
 
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
 # Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
     -DBUILD_CursesDialog=0 \
@@ -15,4 +18,16 @@ CMAKE_EXTRACONF = "\
     -DHAVE_SYS_ACL_H=0 \
 "
 
+do_configure () {
+	${S}/configure --prefix=${prefix} -- ${CMAKE_EXTRACONF}
+}
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
 do_compile[progress] = "percent"
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1f73b3a..4fcb0b1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,8 +21,6 @@ SRC_URI[sha256sum] = "28ee98ec40427d41a45673847db7a905b59ce9243bb866eaf59dce0f58
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools
-
 # Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
 # and possibly missing qmake binary (qtbase-native can be removed from sysroot
 # e.g. in order to upgrade it, even when there is target qtbase)
@@ -45,10 +43,3 @@ do_configure_prepend() {
 	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/CMakeLists.txt
 	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/autorcc_depends/CMakeLists.txt
 }
-
-# Extra flags to pass to cmake invoked by bootstrap
-CMAKE_EXTRACONF = ""
-
-do_configure () {
-	${S}/configure --prefix=${prefix} -- ${CMAKE_EXTRACONF}
-}
-- 
2.8.1


