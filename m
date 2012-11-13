Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYKVS-0007Kt-Iq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:42:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 09:28:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="217197523"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.166])
	by azsmga001.ch.intel.com with ESMTP; 13 Nov 2012 09:28:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 17:27:56 +0000
Message-Id: <99f8ef5b79fc85b84bbf2fd69c25747f98756fe6.1352827498.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352827498.git.paul.eggleton@linux.intel.com>
References: <cover.1352827498.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1352827498.git.paul.eggleton@linux.intel.com>
References: <cover.1352827498.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/4] rpm: Slightly change the way python-rpm is constructed
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
X-List-Received-Date: Tue, 13 Nov 2012 17:42:38 -0000

From: Mark Hatle <mark.hatle@windriver.com>

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
 meta/recipes-devtools/rpm/rpm_5.4.9.bb          |   16 +++++++++-----
 2 files changed, 37 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-py-init.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-py-init.patch
new file mode 100644
index 0000000..b65abc2
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
index 0721284..44f1ca1 100644
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
1.7.9.5



