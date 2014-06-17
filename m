Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 079416FF6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:01:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5H71YZR023271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 00:01:34 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 00:01:33 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 15:01:05 +0800
Message-ID: <412e8eb2fe854868e8d0d5df8c30ca2ff2f03a8b.1402988295.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402988295.git.hongxu.jia@windriver.com>
References: <cover.1402988295.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/4] libnewt/libnewt-python: upgrade to 0.52.17
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
X-List-Received-Date: Tue, 17 Jun 2014 07:01:34 -0000
Content-Type: text/plain

- The company address has changed in COPYING.

- Rebase fix_SHAREDDIR.patch to 0.52.17

- Rebase cross_ar.patch to 0.52.17

- Obsolete fix_python_fpic.patch, since the patch has been
  merged by upstream;

- The upstream rename snackmodule to snack in 0.52.17, so tweak
  libnewt-python_0.52.17.bb;

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/newt/files/cross_ar.patch    | 19 +++++++++++------
 .../newt/files/fix_SHAREDDIR.patch                 | 12 +++++++++--
 .../newt/files/fix_python_fpic.patch               | 24 ----------------------
 ...python_0.52.14.bb => libnewt-python_0.52.17.bb} |  4 ++--
 .../{libnewt_0.52.14.bb => libnewt_0.52.17.bb}     |  8 ++++----
 5 files changed, 29 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch
 rename meta/recipes-extended/newt/{libnewt-python_0.52.14.bb => libnewt-python_0.52.17.bb} (87%)
 rename meta/recipes-extended/newt/{libnewt_0.52.14.bb => libnewt_0.52.17.bb} (81%)

diff --git a/meta/recipes-extended/newt/files/cross_ar.patch b/meta/recipes-extended/newt/files/cross_ar.patch
index f67239a..03007aa 100644
--- a/meta/recipes-extended/newt/files/cross_ar.patch
+++ b/meta/recipes-extended/newt/files/cross_ar.patch
@@ -12,11 +12,13 @@ Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 
 Upstream-Status: Pending
 
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile.in  |    3 ++-
- configure.ac |    4 ++++
+ Makefile.in  | 3 ++-
+ configure.ac | 4 ++++
  2 files changed, 6 insertions(+), 1 deletion(-)
 
+diff --git a/Makefile.in b/Makefile.in
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
@@ -27,8 +29,8 @@ Upstream-Status: Pending
  
  VERSION = @VERSION@
  TAG = r$(subst .,-,$(VERSION))
-@@ -95,7 +96,7 @@ whiptcl.so: $(WHIPTCLOBJS) $(LIBNEWTSH)
- 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.so $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
+@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNEWTSH)
+ 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.$(SOEXT) $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
  
  $(LIBNEWT): $(LIBOBJS)
 -	ar rv $@ $^
@@ -36,12 +38,14 @@ Upstream-Status: Pending
  
  newt.o $(SHAREDDIR)/newt.o: newt.c Makefile
  
+diff --git a/configure.ac b/configure.ac
+index 92e6da8..cd83d57 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -14,6 +14,10 @@ AC_PROG_CC
- AC_PROG_INSTALL
+@@ -15,6 +15,10 @@ AC_PROG_INSTALL
  AC_PROG_LN_S
  AC_PROG_GREP
+ AC_SYS_LARGEFILE
 +AN_MAKEVAR([AR], [AC_PROG_AR])
 +AN_PROGRAM([ar], [AC_PROG_AR])
 +AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
@@ -49,3 +53,6 @@ Upstream-Status: Pending
  
  # Are we using GNU ld?
  AC_MSG_CHECKING([for GNU ld])
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
index 7795260..b0a1e8c 100644
--- a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
+++ b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
@@ -9,17 +9,22 @@ ensure the directory ${SHAREDDIR} exists.
 We need to push the patch to upstream.
 
 Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/Makefile.in b/Makefile.in
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -114,12 +114,12 @@
+@@ -128,12 +128,12 @@ $(SHAREDDIR):
  
  sharedlib: $(LIBNEWTSH)
  
 -$(LIBNEWTSH): $(SHAREDDIR) $(SHAREDOBJS)
 +$(LIBNEWTSH): $(SHAREDOBJS)
  	$(CC) -shared -o $(LIBNEWTSH) $(SHLIBFLAGS) $(SHAREDOBJS) $(LDFLAGS) $(LIBS)
- 	ln -fs $(LIBNEWTSONAME) libnewt.so
+ 	ln -fs $(LIBNEWTSONAME) libnewt.$(SOEXT)
  	ln -fs $(LIBNEWTSH) $(LIBNEWTSONAME)
  
 -$(SHAREDDIR)/%.o : %.c
@@ -27,3 +32,6 @@ Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
  	$(CC) $(SHCFLAGS) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
  
  install: $(LIBNEWT) install-sh whiptail
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-extended/newt/files/fix_python_fpic.patch b/meta/recipes-extended/newt/files/fix_python_fpic.patch
deleted file mode 100644
index 3ef94e0..0000000
--- a/meta/recipes-extended/newt/files/fix_python_fpic.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix relocations warning when compile python module
-
-After enable python support in newt, bitbake complains warning:
-
-WARNING: QA Issue: ELF binary '/mnt/sda10/poky-all-platform/build/tmp/work/i586-poky-linux/libnewt/0.52.14-r2/packages-split/libnewt-python/usr/lib/python2.7/site-packages/_snackmodule.so' has relocations in .text
-
-Add flag -fPIC to compile _snackmodule.so to fix the warning.
-
-Signed-off-by: Kang Kai <kai.kang@windriver.com>
-
-Upstream-Status: Pending
-
----
---- newt-0.52.14/Makefile.in	2012-12-04 17:27:27.578915801 +0800
-+++ newt-0.52.14/Makefile.in.new	2012-12-04 17:28:43.274918472 +0800
-@@ -84,7 +84,7 @@
- 			PIFLAGS=`$$ver-config --includes`; \
- 			PLDFLAGS=`$$ver-config --ldflags`; \
- 			PLFLAGS=`$$ver-config --libs`; \
--	        $(CC) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
-+	        $(CC) $(SHCFLAGS) $(CPPFLAGS) $$PIFLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
- 	        $(CC) --shared $$PLDFLAGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snackmodule.so $$ver/snackmodule.o -L.  -lnewt $(LIBS);\
- 	done || :
- 	touch $@
diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb b/meta/recipes-extended/newt/libnewt-python_0.52.17.bb
similarity index 87%
rename from meta/recipes-extended/newt/libnewt-python_0.52.14.bb
rename to meta/recipes-extended/newt/libnewt-python_0.52.17.bb
index 871b195..d591fbd 100644
--- a/meta/recipes-extended/newt/libnewt-python_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.17.bb
@@ -12,12 +12,12 @@ EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
 
 do_compile () {
 	VERSION="$(sed -n 's/^VERSION = //p' Makefile)"
-	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snackmodule.so
+	oe_runmake "LIBNEWTSH=${STAGING_LIBDIR}/libnewt.so.$VERSION" _snack.so
 }
 
 do_install () {
 	install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-	install -m 0755 ${PYTHON_DIR}/_snackmodule.so ${D}${PYTHON_SITEPACKAGES_DIR}/
+	install -m 0755 ${PYTHON_DIR}/_snack.so ${D}${PYTHON_SITEPACKAGES_DIR}/
 	install -m 0644 snack.py ${D}${PYTHON_SITEPACKAGES_DIR}/
 }
 
diff --git a/meta/recipes-extended/newt/libnewt_0.52.14.bb b/meta/recipes-extended/newt/libnewt_0.52.17.bb
similarity index 81%
rename from meta/recipes-extended/newt/libnewt_0.52.14.bb
rename to meta/recipes-extended/newt/libnewt_0.52.17.bb
index 65bcf40..09b017e 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.14.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.17.bb
@@ -12,7 +12,7 @@ HOMEPAGE = "https://fedorahosted.org/newt/"
 SECTION = "libs"
 
 LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
@@ -23,10 +23,10 @@ SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
-           file://fix_python_fpic.patch"
+"
 
-SRC_URI[md5sum] = "eb78c6bb658b92ec7198908b5b8d0e37"
-SRC_URI[sha256sum] = "f70f4f58baa60388ddf2e39249ffb00898fb40f2b2767e42e2ab51fe4b40978e"
+SRC_URI[md5sum] = "f36d4d908965a0c89fd6fd8b61a6118b"
+SRC_URI[sha256sum] = "69837973ef2ee2fa644426f1c3e48d2b18785ebcd382ef7fd01eb2e67d2d632b"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
1.8.1.2


