Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C70D6BD90
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 02:58:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s062wdL3015506
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2014 18:58:39 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 5 Jan 2014 18:58:39 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2014 10:57:35 +0800
Message-ID: <e6254f1b673b690c77c1e51e63e4d6d5011c7aff.1388976868.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388976868.git.Chong.Lu@windriver.com>
References: <cover.1388976868.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] beecrypt: add ptest support
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
X-List-Received-Date: Mon, 06 Jan 2014 02:58:38 -0000
Content-Type: text/plain

Install beecrypt test suite and run it as ptest.
Make all ptest pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../beecrypt/beecrypt/enable-ptest.patch           | 22 ++++++++++++++++++++++
 meta/recipes-support/beecrypt/beecrypt/run-ptest   |  5 +++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    | 12 ++++++++++--
 3 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/enable-ptest.patch
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/run-ptest

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
index 5874f9e..3c7cdd2 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -7,7 +7,10 @@ HOMEPAGE="http://sourceforge.net/projects/beecrypt"
 SRC_URI="${SOURCEFORGE_MIRROR}/beecrypt/beecrypt-${PV}.tar.gz \
 	 file://disable-icu-check.patch \
 	 file://fix-security.patch \
-         file://fix-for-gcc-4.7.patch"
+         file://fix-for-gcc-4.7.patch \
+         file://run-ptest \
+         file://enable-ptest.patch \
+"
 
 SRC_URI[md5sum] = "8441c014170823f2dff97e33df55af1e"
 SRC_URI[sha256sum] = "286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d"
@@ -18,7 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
 
 PR = "r3"
 
-inherit autotools multilib_header
+inherit autotools multilib_header ptest
 acpaths=""
 
 do_install_append() {
@@ -35,3 +38,8 @@ FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
 
 BBCLASSEXTEND = "native nativesdk"
+
+do_install_ptest () {
+	mkdir ${D}${PTEST_PATH}/tests
+	cp -r ${B}/tests/.libs/test* ${D}${PTEST_PATH}/tests
+}
-- 
1.8.1.2


