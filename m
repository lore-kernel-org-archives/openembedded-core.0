Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 79C6F615BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 06:52:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s036qOX2013549
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jan 2014 22:52:24 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 2 Jan 2014 22:52:24 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jan 2014 14:51:30 +0800
Message-ID: <29084ecc445706197816544474e8333ead90a314.1388730750.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388730750.git.Chong.Lu@windriver.com>
References: <cover.1388730750.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] quilt: enable ptest support
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
X-List-Received-Date: Fri, 03 Jan 2014 06:52:23 -0000
Content-Type: text/plain

Install quilt test suite and run it as ptest.
Exclude delete.test and mail.test.
delete.test need execute with normal user and mail.test need depend
on mail agent, else these test cases will fail. So exclude them order
to make ptest all pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/quilt/quilt-0.61.inc  | 24 ++++++++++++++++++++++--
 meta/recipes-devtools/quilt/quilt/Makefile  | 13 +++++++++++++
 meta/recipes-devtools/quilt/quilt/run-ptest |  5 +++++
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/quilt/quilt/Makefile
 create mode 100755 meta/recipes-devtools/quilt/quilt/run-ptest

diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
index c4a929d..85643b1 100644
--- a/meta/recipes-devtools/quilt/quilt-0.61.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
@@ -5,12 +5,15 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
-        file://install.patch"
+        file://install.patch \
+        file://run-ptest \
+        file://Makefile \
+"
 
 SRC_URI[md5sum] = "24417eba5961592b64103bdda001ebf4"
 SRC_URI[sha256sum] = "1eec0a270ac4d41eea0fd5823603c9d2a35ab6b8ab73a90dd92ce1291b2a9fc3"
 
-inherit autotools
+inherit autotools ptest
 
 EXTRA_OECONF_darwin += "--without-date \
                         --without-getopt \
@@ -34,3 +37,20 @@ do_install () {
 	# cleanup unpackaged files
 	rm -rf ${D}/${datadir}/emacs
 }
+
+do_compile_ptest() {
+	oe_runmake bin/patch-wrapper test/.depend
+}
+
+do_install_ptest() {
+	tar -cf - bin/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -cf - compat/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -cf - quilt/ --exclude \*.in | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	tar -cf - test/ --exclude mail.test --exclude delete.test | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
+}
+
+RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
+                        perl-module-filehandle perl-module-getopt-std \
+                        perl-module-posix perl-module-file-temp \
+"
diff --git a/meta/recipes-devtools/quilt/quilt/Makefile b/meta/recipes-devtools/quilt/quilt/Makefile
new file mode 100644
index 0000000..7b3ac8a
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/Makefile
@@ -0,0 +1,13 @@
+PATH :=         $(CURDIR)/bin:$(CURDIR)/compat:$(PATH)
+QUILT_DIR :=    $(CURDIR)/quilt
+QUILTRC :=      $(CURDIR)/test/test.quiltrc
+export QUILT_DIR QUILTRC
+CHECK_ENV := P=patches/; _P=../patches/; export P _P
+-include test/.depend
+
+check-% : test/%.test
+	@LANG=C; LC_ALL=C; \
+	export LANG LC_ALL; \
+	$(CHECK_ENV); \
+	cd $(<D); \
+	./run -q $(<F)
diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
new file mode 100755
index 0000000..1ea0dae
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+ln -sf /bin/ed /usr/bin/ed
+for i in `ls test/*.test |awk -F. '{print $1}' |awk -F/ '{print $2}'`; do make check-$i; if [ $? == 0 ]; then echo PASS: $i.test; else echo FAIL: $i.test; fi; done
+rm -f /usr/bin/ed
-- 
1.8.1.2


