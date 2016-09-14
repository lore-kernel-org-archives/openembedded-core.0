Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DF6BE7719A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:25:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8E5PUSi032418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 22:25:30 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Sep 2016 22:25:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2016 13:08:48 +0800
Message-ID: <20160914050848.14612-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] boost: add support for additional boost libs
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
X-List-Received-Date: Wed, 14 Sep 2016 05:25:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Added libs:
  - container
  - context
  - coroutine
  - exception
  - graph_parallel
  - locale
  - math
  - mpi
  - wave

* Add PACKAGECONFIG to add proper dependencies for boost-locale

* context and coroutine are added only for x86 and powerpc

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 5696b6a..2386b00 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -8,11 +8,16 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 BOOST_LIBS = "\
 	atomic \
 	chrono \
+	container \
 	date_time \
+	exception \
 	filesystem \
 	graph \
+	graph_parallel \
 	iostreams \
 	log \
+	math \
+	mpi \
 	program_options \
 	random \
 	regex \
@@ -22,12 +27,24 @@ BOOST_LIBS = "\
 	timer \
 	test \
 	thread \
+	wave \
 	"
 
-# optional boost-python library
-PACKAGECONFIG ??= ""
+# only supported by x86 and powerpc
+BOOST_LIBS_append_x86 = " context coroutine"
+BOOST_LIBS_append_x86-64 = " context coroutine"
+BOOST_LIBS_append_powerpc = " context coroutine"
+
+# optional libraries
+PACKAGECONFIG ??= "locale"
 PACKAGECONFIG[python] = ",,python python3"
-BOOST_LIBS += "${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '', d)}"
+PACKAGECONFIG[locale] = ",,icu"
+
+BOOST_LIBS += "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python python3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'locale', 'locale', '', d)} \
+"
+
 inherit python-dir
 PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 
@@ -54,6 +71,7 @@ python __anonymous () {
 }
 
 # Override the contents of specific packages
+FILES_${PN}-locale = "${libdir}/libboost_locale.so.*"
 FILES_boost-serialization = "${libdir}/libboost_serialization*.so.* \
 	${libdir}/libboost_wserialization*.so.*"
 FILES_boost-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
-- 
2.8.1


