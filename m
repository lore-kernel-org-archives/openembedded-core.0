Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D13E46E81B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 09:51:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q9pY4m018314
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 01:51:34 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 26 Jan 2014 01:51:34 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 17:51:29 +0800
Message-ID: <53e725077a0f00a42ee84710ec15cc004f1b3f8d.1390729721.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1390729721.git.Chong.Lu@windriver.com>
References: <cover.1390729721.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] attr: enable ptest support
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
X-List-Received-Date: Sun, 26 Jan 2014 09:51:34 -0000
Content-Type: text/plain

Install attr test suite and run it as ptest.
ext test cases need depend on specific filesystem. So exclude them
order to make ptest all pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/attr/attr.inc        | 17 ++++++++++++++++-
 meta/recipes-support/attr/files/run-ptest |  5 +++++
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/run-ptest

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 4961ba7..873c1ff 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
                     file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
                     file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
 
-SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
+           file://run-ptest \
+"
 
 require ea-acl.inc
 
@@ -20,3 +22,16 @@ do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+
+inherit ptest
+
+do_install_ptest() {
+	tar -cf - test/ --exclude ext | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	mkdir ${D}${PTEST_PATH}/include
+	for i in builddefs buildmacros buildrules; \
+	  do cp ${S}/include/$i ${D}${PTEST_PATH}/include/; \
+	done
+	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
+}
+
+RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
diff --git a/meta/recipes-support/attr/files/run-ptest b/meta/recipes-support/attr/files/run-ptest
new file mode 100644
index 0000000..a6c6867
--- /dev/null
+++ b/meta/recipes-support/attr/files/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+make -C test -k tests root-tests |sed \
+ -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
+ -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
-- 
1.8.1.2


