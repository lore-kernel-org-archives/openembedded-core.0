Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TTfkh-0007kC-JU
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 22:23:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9VL9TDn007866
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 14:09:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Wed, 31 Oct 2012 14:09:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Oct 2012 16:19:23 -0500
Message-ID: <ec4b9ab0151e5a54afcf8eb221ac30fb6970cb50.1351718092.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1351718092.git.mark.hatle@windriver.com>
References: <cover.1351718092.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/4] rpm: Slightly change the way python-rpm is constructed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 21:23:08 -0000
Content-Type: text/plain

If python support is enabled we want to make sure that the RPM python support
is packaged properly.

Move the components into the site-packages directory, move the .la files to a
new -dev package.

Add "rpm" as a dependency of python-rpm, otherwise rpm and the associated
libraries won't be available.

Fixup python wrapper to handle automatic relocation, as supported by the
vendor WINDRIVER configuration.  (Based on a patch from Paul Eggleton)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch |   27 +++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb          |   16 ++++++++-----
 2 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
new file mode 100644
index 0000000..b65abc24
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
@@ -0,0 +1,27 @@
+python/rpmmodules.c: Change the way the python module loads the RPM config
+
+In order to support the RPM_VENDOR_WINDRIVER enhancement of dynamic
+runtime relocation paths, we need to call rpmcliInit instead of 
+rpmReadConfigFiles.  The rpmcliInit will end up calling rpmReadConfigFiles
+after the necessary relocation processing (if enabled).
+
+Code derived from changes suggested by Paul Eggleton.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/python/rpmmodule.c b/python/rpmmodule.c
+index f7282bc..dde68ca 100644
+--- a/python/rpmmodule.c
++++ b/python/rpmmodule.c
+@@ -392,7 +392,8 @@ void init_rpm(void)
+     if (Py_AtExit(rpm_exithook) == -1)
+ 	return;
+ 
+-    rpmReadConfigFiles(NULL, NULL);
++    const char *argv[1] = {"rpmmodule", 0};
++    rpmcliInit(1, argv, NULL);
+ 
+     d = PyModule_GetDict(m);
+ 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index e838f40..ee28061 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r52"
+PR = "r53"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -80,6 +80,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://makefile-am-exec-hook.patch \
 	   file://rpm-stub-out-git_strerror.patch \
 	   file://rpm-db_buffer_small.patch \
+	   file://rpm-py-init.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
@@ -107,7 +108,7 @@ PACKAGECONFIG[xar] = "--with-xar,--without-xar,xar,"
 
 WITH_PYTHON = " --with-python=${PYTHON_BASEVERSION} \
 		--with-python-inc-dir=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
-		--with-python-lib-dir=${libdir}/python${PYTHON_BASEVERSION} \
+		--with-python-lib-dir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
 		--without-pythonembed"
 PACKAGECONFIG[python] = "${WITH_PYTHON},--without-python,python,"
 
@@ -189,7 +190,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -302,9 +303,12 @@ RDEPENDS_${PN} = "base-files"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}-build = "file"
 
-FILES_python-rpm-dbg = "${libdir}/python*/rpm/.debug/_*"
-FILES_python-rpm-staticdev = "${libdir}/python*/rpm/*.a"
-FILES_python-rpm = "${libdir}/python*/rpm"
+RDEPENDS_python-rpm = "${PN}"
+
+FILES_python-rpm-dbg = "${libdir}/python*/site-packages/rpm/.debug/_*"
+FILES_python-rpm-dev = "${libdir}/python*/site-packages/rpm/*.la"
+FILES_python-rpm-staticdev = "${libdir}/python*/site-packages/rpm/*.a"
+FILES_python-rpm = "${libdir}/python*/site-packages/rpm"
 
 FILES_perl-module-rpm = "${libdir}/perl/*/* \
 		"
-- 
1.7.3.4



