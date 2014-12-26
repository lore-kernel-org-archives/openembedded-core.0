Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96C1C726D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:35:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBQ9ZcWY015298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 01:35:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Dec 2014 01:35:38 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:35:30 +0800
Message-ID: <797bacc18327b84f2e8a66eba7e4e2b3911f3c60.1419586441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419586441.git.Qi.Chen@windriver.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] pciutils: upgrade to 3.3.0
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
X-List-Received-Date: Fri, 26 Dec 2014 09:35:42 -0000
Content-Type: text/plain

lib-build-fix.patch is removed as it doesn't seem useful.
do_compile_prepend is removed because it's not useful for the new version.
The following line is removed as I don't see any problem without it.
PARALLEL_MAKE = ""

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../pciutils/pciutils/lib-build-fix.patch          | 92 ----------------------
 .../{pciutils_3.2.1.bb => pciutils_3.3.0.bb}       | 14 +---
 2 files changed, 3 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch
 rename meta/recipes-bsp/pciutils/{pciutils_3.2.1.bb => pciutils_3.3.0.bb} (82%)

diff --git a/meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch b/meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch
deleted file mode 100644
index 413ef0e..0000000
--- a/meta/recipes-bsp/pciutils/pciutils/lib-build-fix.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-Link directly to lib/libpci.so.3.1.5 will hard code this versioned
-string into lspci and other utilities, which is not desirable and
-won't work. In the other hand, linking to a symbolic link lib/libpci.so
-doesn't have this issue.
-
-Upstream-Status: Pending
-
-7/30/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/Makefile b/Makefile
-index 74c570a..31337e0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -56,9 +56,9 @@ PCIINC_INS=lib/config.h lib/header.h lib/pci.h lib/types.h
- 
- export
- 
--all: lib/$(PCILIB) lspci setpci example lspci.8 setpci.8 pcilib.7 update-pciids update-pciids.8 $(PCI_IDS)
-+all: lib/$(PCILIB_DEV) lspci setpci example lspci.8 setpci.8 pcilib.7 update-pciids update-pciids.8 $(PCI_IDS)
- 
--lib/$(PCILIB): $(PCIINC) force
-+lib/$(PCILIB) lib/$(PCILIB_DEV): $(PCIINC) force
- 	$(MAKE) -C lib all
- 
- force:
-@@ -66,8 +66,8 @@ force:
- lib/config.h lib/config.mk:
- 	cd lib && ./configure
- 
--lspci: lspci.o ls-vpd.o ls-caps.o ls-ecaps.o ls-kernel.o ls-tree.o ls-map.o common.o lib/$(PCILIB)
--setpci: setpci.o common.o lib/$(PCILIB)
-+lspci: lspci.o ls-vpd.o ls-caps.o ls-ecaps.o ls-kernel.o ls-tree.o ls-map.o common.o lib/$(PCILIB_DEV)
-+setpci: setpci.o common.o lib/$(PCILIB_DEV)
- 
- LSPCIINC=lspci.h pciutils.h $(PCIINC)
- lspci.o: lspci.c $(LSPCIINC)
-@@ -89,7 +89,7 @@ update-pciids: update-pciids.sh
- 	chmod +x $@
- 
- # The example of use of libpci
--example: example.o lib/$(PCILIB)
-+example: example.o lib/$(PCILIB_DEV)
- example.o: example.c $(PCIINC)
- 
- %: %.o
-diff --git a/lib/Makefile b/lib/Makefile
-index 1eb06a5..a8dab56 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -42,7 +42,7 @@ ifdef PCI_HAVE_PM_NBSD_LIBPCI
- OBJS += nbsd-libpci
- endif
- 
--all: $(PCILIB) $(PCILIBPC)
-+all: $(PCILIB_DEV) $(PCILIBPC)
- 
- ifeq ($(SHARED),no)
- $(PCILIB): $(addsuffix .o,$(OBJS))
-@@ -53,6 +53,9 @@ else
- CFLAGS += -fPIC -fvisibility=hidden
- $(PCILIB): $(addsuffix .o,$(OBJS))
- 	$(CC) -shared $(LDFLAGS) $(SONAME) -Wl,--version-script=libpci.ver -o $@ $^ $(LIB_LDLIBS)
-+
-+$(PCILIB_DEV): $(PCILIB)
-+	ln -s $< $@
- endif
- 
- $(PCILIBPC): libpci.pc.in
-diff --git a/lib/configure b/lib/configure
-index 27388bc..6c508cf 100755
---- a/lib/configure
-+++ b/lib/configure
-@@ -216,16 +216,18 @@ fi
- echo "Checking whether to build a shared library... $SHARED (set manually)"
- if [ "$SHARED" = no ] ; then
- 	echo >>$m 'PCILIB=$(LIBNAME).a'
-+	echo >>$m 'PCILIB_DEV=$(LIBNAME).a'
- 	echo >>$m 'LDLIBS=$(WITH_LIBS)'
- 	echo >>$m 'LIB_LDLIBS='
- else
- 	echo >>$m 'PCILIB=$(LIBNAME).so.$(VERSION)'
-+	echo >>$m 'PCILIB_DEV=$(LIBNAME).so'
- 	# We link the dependencies _to_ the library, so we do not need explicit deps in .pc
- 	echo >>$m 'LDLIBS='
- 	echo >>$m 'LIB_LDLIBS=$(WITH_LIBS)'
- 	echo >>$c '#define PCI_SHARED_LIB'
- 	if [ "$SHARED" = yes ] ; then
--		echo >>$m 'SONAME=-Wl,-soname,$(LIBNAME).so$(ABI_VERSION)'
-+		echo >>$m 'SONAME=-Wl,-soname -Wl,$(LIBNAME).so$(ABI_VERSION)'
- 	fi
- fi
- echo >>$m 'PCILIBPC=$(LIBNAME).pc'
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
similarity index 82%
rename from meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
index 6e29953..71f7e04 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
@@ -8,19 +8,16 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib kmod"
 
-SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
+SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch \
-           file://lib-build-fix.patch \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "425b1acad6854cc2bbb06ac8e48e76fc"
-SRC_URI[sha256sum] = "12d52b19042e2fd058af12e7d877bbbce72213cb3a0b5ec7ff0703ac09e3dcde"
+SRC_URI[md5sum] = "3c19adf32a8457983b71ff376ef7dafe"
+SRC_URI[sha256sum] = "413395d4bdc66fdedd6c993ed9083d1dd73812bf2a679d320f73de35c7801301"
 
 inherit multilib_header
 
-PARALLEL_MAKE = ""
-
 PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
 
 # see configure.patch
@@ -31,11 +28,6 @@ do_configure () {
 	)
 }
 
-do_compile_prepend () {
-	# Avoid this error:  ln: failed to create symbolic link `libpci.so': File exists
-	rm -f ${S}/lib/libpci.so
-}
-
 export PREFIX = "${prefix}"
 export SBINDIR = "${sbindir}"
 export SHAREDIR = "${datadir}"
-- 
1.9.1


