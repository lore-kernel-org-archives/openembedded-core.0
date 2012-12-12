Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1Tik4a-00075O-4U
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 12:02:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBCAlLOH008417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Dec 2012 02:47:21 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 12 Dec 2012 02:47:21 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 12 Dec 2012 18:48:07 +0800
Message-ID: <58aafb8241ddc377b72b2732c45f3f15fb20f7d6.1355309061.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1355309061.git.kai.kang@windriver.com>
References: <cover.1355309061.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] newt: enable python support
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
X-List-Received-Date: Wed, 12 Dec 2012 11:02:31 -0000
X-List-Received-Date: Wed, 12 Dec 2012 11:02:31 -0000
Content-Type: text/plain

Compile newt with python support. There may be packages that need newt's
python extension.

Add python to DEPENDS. And add patch fix_python_fpic.patch to compile
python .so module with flag -fPIC.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../newt/files/fix_python_fpic.patch               |   24 ++++++++++++++++++++
 meta/recipes-extended/newt/libnewt_0.52.14.bb      |   24 +++++++++++++++-----
 2 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch

diff --git a/meta/recipes-extended/newt/files/fix_python_fpic.patch b/meta/recipes-extended/newt/files/fix_python_fpic.patch
new file mode 100644
index 0000000..3ef94e0
--- /dev/null
+++ b/meta/recipes-extended/newt/files/fix_python_fpic.patch
@@ -0,0 +1,24 @@
+Fix relocations warning when compile python module
+
+After enable python support in newt, bitbake complains warning:
+
+WARNING: QA Issue: ELF binary '/mnt/sda10/poky-all-platform/build/tmp/work/i586-poky-linux/libnewt/0.52.14-r2/packages-split/libnewt-python/usr/lib/python2.7/site-packages/_snackmodule.so' has relocations in .text
+
+Add flag -fPIC to compile _snackmodule.so to fix the warning.
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+Upstream-Status: Pending
+
+---
+--- newt-0.52.14/Makefile.in	2012-12-04 17:27:27.578915801 +0800
++++ newt-0.52.14/Makefile.in.new	2012-12-04 17:28:43.274918472 +0800
+@@ -84,7 +84,7 @@
+ 			PIFLAGS=`$$ver-config --includes`; \
+ 			PLDFLAGS=`$$ver-config --ldflags`; \
+ 			PLFLAGS=`$$ver-config --libs`; \
+-	        $(CC) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
++	        $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
+ 	        $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snackmodule.so $$ver/snackmodule.o -L.  -lnewt $(LIBS);\
+ 	done || :
+ 	touch $@
diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.14.bb
index 0208695..c1ec029 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.14.bb
@@ -15,28 +15,40 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 # slang needs to be >= 2.2
-DEPENDS = "slang popt"
+DEPENDS = "slang popt python"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch \
-           file://cross_ar.patch"
+           file://cross_ar.patch \
+           file://fix_python_fpic.patch"
 
 SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
 SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
 
 S = "${WORKDIR}/newt-${PV}"
 
-EXTRA_OECONF = "--without-python --without-tcl"
+EXTRA_OECONF = "--without-tcl"
 
-inherit autotools
+inherit autotools pythonnative python-dir
 
-PACKAGES_prepend = "whiptail "
+EXTRA_OEMAKE = "PYTHONVERS=${PYTHON_DIR}"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+export BUILD_SYS
+export HOST_SYS
+
+PACKAGES_prepend = "whiptail ${PN}-python "
 
 do_configure_prepend() {
     sh autogen.sh
 }
 
 FILES_whiptail = "${bindir}/whiptail"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
+FILES_${PN}-staticdev = "${libdir}/*.a"
-- 
1.7.5.4



