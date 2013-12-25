Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 73B496AF96
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2013 08:18:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBP8I2Dw015744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Dec 2013 00:18:03 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 25 Dec 2013 00:18:03 -0800
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Dec 2013 16:17:49 +0800
Message-ID: <42beb3f6bc475b3bd51234d98f3ef16b9f1927ac.1387958505.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387958505.git.Chong.Lu@windriver.com>
References: <cover.1387958505.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] beecrypt: add ptest support
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
X-List-Received-Date: Wed, 25 Dec 2013 08:18:03 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

Install beecrypt test suite and run it as ptest.
Make all ptest pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/beecrypt/beecrypt-ptest.inc   | 10 ++++++++++
 .../beecrypt/beecrypt/enable-ptest.patch           | 22 ++++++++++++++++++++++
 meta/recipes-support/beecrypt/beecrypt/run-ptest   |  5 +++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  2 ++
 4 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt-ptest.inc
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/enable-ptest.patch
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/run-ptest

diff --git a/meta/recipes-support/beecrypt/beecrypt-ptest.inc b/meta/recipes-support/beecrypt/beecrypt-ptest.inc
new file mode 100644
index 0000000..fde0018
--- /dev/null
+++ b/meta/recipes-support/beecrypt/beecrypt-ptest.inc
@@ -0,0 +1,10 @@
+inherit ptest
+
+SRC_URI += "file://run-ptest \
+            file://enable-ptest.patch \
+"
+
+do_install_ptest () {
+	mkdir ${D}${PTEST_PATH}/tests
+	cp -r ${B}/tests/.libs/test* ${D}${PTEST_PATH}/tests
+}
diff --git a/meta/recipes-support/beecrypt/beecrypt/enable-ptest.patch b/meta/recipes-support/beecrypt/beecrypt/enable-ptest.patch
new file mode 100644
index 0000000..f66ea1b
--- /dev/null
+++ b/meta/recipes-support/beecrypt/beecrypt/enable-ptest.patch
@@ -0,0 +1,22 @@
+diff --git a/Makefile.am b/Makefile.am
+index b7e7869..9fed3c2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -73,3 +73,6 @@ DISTCLEANFILES = mpopt.s blowfishopt.s sha1opt.s
+ 
+ bench:
+ 	(cd tests && $(MAKE) $(AM_MAKEFLAGS) bench)
++
++install-ptest:
++	(cd tests && $(MAKE) $(AM_MAKEFLAGS) check_PROGRAMS)
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1604e5e..37fb316 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -101,3 +101,6 @@ bench: benchme benchrsa benchhf benchbc
+ 	./benchbc AES 128
+ 	./benchbc Blowfish 128
+ 	./benchbc Blowfish 128
++
++check_PROGRAMS:
++	$(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS)
diff --git a/meta/recipes-support/beecrypt/beecrypt/run-ptest b/meta/recipes-support/beecrypt/beecrypt/run-ptest
new file mode 100644
index 0000000..5bc7460
--- /dev/null
+++ b/meta/recipes-support/beecrypt/beecrypt/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+cd tests
+for i in `ls`; do ./$i; if [ $? == 0 ]; then echo "PASS: $i"; \
+    else echo "FAIL: $i"; fi; done
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 5874f9e..e1c3a7a 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -35,3 +35,5 @@ FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
 
 BBCLASSEXTEND = "native nativesdk"
+
+require beecrypt-ptest.inc
-- 
1.8.1.2


