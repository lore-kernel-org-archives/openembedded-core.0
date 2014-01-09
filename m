Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D07D161FE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 10:03:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s09A3SMs021218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jan 2014 02:03:28 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 9 Jan 2014 02:03:28 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jan 2014 18:02:11 +0800
Message-ID: <6422a763adc5b9909e47c2354a58d4b7a0dd017a.1389259902.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389259902.git.Chong.Lu@windriver.com>
References: <cover.1389259902.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] attr: enable ptest support
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
X-List-Received-Date: Thu, 09 Jan 2014 10:03:28 -0000
Content-Type: text/plain

Install attr test suite and run it as ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/attr/attr.inc                 | 15 +++-
 .../attr/files/attr-make-ptest-pass.patch          | 82 ++++++++++++++++++++++
 meta/recipes-support/attr/files/run-ptest          |  5 ++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/files/attr-make-ptest-pass.patch
 create mode 100644 meta/recipes-support/attr/files/run-ptest

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 4961ba7..8cb08e4 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -11,7 +11,10 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
                     file://attr/attr.c;endline=17;md5=be0403261f0847e5f43ed5b08d19593c \
                     file://libattr/libattr.c;endline=17;md5=7970f77049f8fa1199fff62a7ab724fb"
 
-SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
+           file://attr-make-ptest-pass.patch \
+           file://run-ptest \
+"
 
 require ea-acl.inc
 
@@ -20,3 +23,13 @@ do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+
+inherit ptest
+
+do_install_ptest() {
+	cp -r ${S}/test ${D}${PTEST_PATH}
+	mkdir ${D}${PTEST_PATH}/include
+	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
+}
+
+RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
diff --git a/meta/recipes-support/attr/files/attr-make-ptest-pass.patch b/meta/recipes-support/attr/files/attr-make-ptest-pass.patch
new file mode 100644
index 0000000..e2da8b0
--- /dev/null
+++ b/meta/recipes-support/attr/files/attr-make-ptest-pass.patch
@@ -0,0 +1,82 @@
+attr: make ptest pass
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Delete the second '@' character of the same row in test/Makefile, else
+we would get the error as below:
+    @echo: command not found
+In fs.test file, the result of `ls -s' is incorrect. Change it to make
+ext-tests pass.
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ test/Makefile    |    4 ++--
+ test/ext/fs.test |   22 +++++++++++-----------
+ 2 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/test/Makefile b/test/Makefile
+index b7bd8db..d916bf4 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -40,10 +40,10 @@ $(TEST):
+ 	@echo "*** $@ ***"; perl run $@
+ 
+ $(EXT):
+-	@echo "EXT specific tests"; @echo "*** $@ ***"; perl run $@
++	@echo "EXT specific tests"; echo "*** $@ ***"; perl run $@
+ 
+ $(ROOT):
+-	@echo "Note: Tests must run as root"; @echo "*** $@ ***"; perl run $@
++	@echo "Note: Tests must run as root"; echo "*** $@ ***"; perl run $@
+ 
+ .PHONY: $(TEST) $(EXT) $(ROOT)
+ .NOTPARALLEL:
+diff --git a/test/ext/fs.test b/test/ext/fs.test
+index cc28fec..381d54b 100644
+--- a/test/ext/fs.test
++++ b/test/ext/fs.test
+@@ -19,15 +19,15 @@ Test extended attribute block sharing
+ 	$ touch f g h
+ 	$ setfattr -n user.novalue f g h
+ 	$ ls -s f g h
+-	> 4 f
+-	> 4 g
+-	> 4 h
++	> 0 f
++	> 0 g
++	> 0 h
+ 
+ 	$ setfattr -n user.name -v value f
+ 	$ ls -s f g h
+-	> 4 f
+-	> 4 g
+-	> 4 h
++	> 0 f
++	> 0 g
++	> 0 h
+ 
+ 	$ getfattr -d f g h
+ 	> # file: f
+@@ -43,14 +43,14 @@ Test extended attribute block sharing
+ 
+ 	$ setfattr -n user.name -v value g
+ 	$ ls -s f g h
+-	> 4 f
+-	> 4 g
+-	> 4 h
++	> 0 f
++	> 0 g
++	> 0 h
+ 
+ 	$ setfattr -x user.novalue h
+ 	$ ls -s f g h
+-	> 4 f
+-	> 4 g
++	> 0 f
++	> 0 g
+ 	> 0 h
+ 
+ 	$ setfattr -n user.name -v other-value g
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/attr/files/run-ptest b/meta/recipes-support/attr/files/run-ptest
new file mode 100644
index 0000000..f0bd9fc
--- /dev/null
+++ b/meta/recipes-support/attr/files/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+make -C test -k tests root-tests ext-tests |sed \
+ -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
+ -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
-- 
1.8.1.2


