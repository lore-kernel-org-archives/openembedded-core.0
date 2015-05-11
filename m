Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2E39873EFD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:52:31 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yrtke-0005rJ-J5 from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 May 2015 12:52:32 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 11 May 2015 20:52:31 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 22:52:29 +0300
Message-ID: <1431373949-24262-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libevent: add ptest
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
X-List-Received-Date: Mon, 11 May 2015 19:52:31 -0000
Content-Type: text/plain

Use provided regression testing as a ptest for libevent package.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/recipes-support/libevent/libevent/run-ptest | 18 ++++++++++++++++++
 meta/recipes-support/libevent/libevent_2.0.22.bb | 17 ++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libevent/libevent/run-ptest

diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
new file mode 100644
index 0000000..d521688
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+fail=0
+for test in ./test/*
+do
+	$test
+	if [ $? -eq 0 ]
+	then
+		fail=1
+	fi
+done
+
+if [ $fail -eq 0 ]
+then
+	echo "PASS: libevent"
+else
+	echo "FAIL: libevent"
+fi
diff --git a/meta/recipes-support/libevent/libevent_2.0.22.bb b/meta/recipes-support/libevent/libevent_2.0.22.bb
index 3f9475e..2f49293 100644
--- a/meta/recipes-support/libevent/libevent_2.0.22.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.22.bb
@@ -6,7 +6,10 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=45c5316ff684bcfe2f9f86d8b1279559"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/levent/${BP}-stable.tar.gz"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/levent/${BP}-stable.tar.gz \
+    file://run-ptest \
+"
 
 SRC_URI[md5sum] = "c4c56f986aa985677ca1db89630a2e11"
 SRC_URI[sha256sum] = "71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3"
@@ -20,3 +23,15 @@ inherit autotools
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.0.so"
+
+inherit ptest
+
+DEPENDS = "zlib"
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}/test
+	for file in ${B}/test/.libs/regress ${B}/test/.libs/test*
+	do
+		install -m 0755 $file ${D}${PTEST_PATH}/test
+	done
+}
-- 
2.1.4


