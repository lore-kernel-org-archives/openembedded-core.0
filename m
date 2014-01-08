Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E09B96CE84
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 10:00:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s08A0sj8018234
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jan 2014 02:00:54 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 8 Jan 2014 02:00:53 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jan 2014 17:59:40 +0800
Message-ID: <73962dc0bed9aec6a662b80a5075bca11521942e.1389173902.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389173902.git.Chong.Lu@windriver.com>
References: <cover.1389173902.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tcl: enable ptest support
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
X-List-Received-Date: Wed, 08 Jan 2014 10:00:53 -0000
Content-Type: text/plain

Install tcl test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest |  8 ++++++++
 meta/recipes-devtools/tcltk/tcl_8.6.1.bb  | 13 ++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/tcltk/tcl/run-ptest

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
new file mode 100644
index 0000000..a5d6548
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+for i in `ls tests/*.test |awk -F/ '{print $2}'`; \
+    do TCL_LIBRARY=library ./tcltest tests/all.tcl -file $i &>$i.tmp; \
+    grep -q "^Files with failing tests:" $i.tmp; \
+    if [ $? == 0 ]; then echo "FAIL: $i"; \
+    else echo "PASS: $i"; rm -f $i.tmp; fi; \
+done
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
index c5eb205..662261b 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://no_packages.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
+           file://run-ptest \
           "
 SRC_URI[md5sum] = "aae4b701ee527c6e4e1a6f9c7399882e"
 SRC_URI[sha256sum] = "16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514"
@@ -30,7 +31,7 @@ S = "${WORKDIR}/tcl${PV}/unix"
 
 VER = "8.6.1"
 
-inherit autotools
+inherit autotools ptest
 
 DEPENDS_class-native = ""
 
@@ -79,3 +80,13 @@ RDEPENDS_${PN} += "tcl-lib"
 RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
+
+do_compile_ptest() {
+	oe_runmake tcltest
+}
+
+do_install_ptest() {
+	cp ${B}/tcltest ${D}${PTEST_PATH}
+	cp -r ${S}/../library ${D}${PTEST_PATH}
+	cp -r ${S}/../tests ${D}${PTEST_PATH}
+}
-- 
1.8.1.2


