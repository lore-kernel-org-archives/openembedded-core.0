Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TfThN-0005eu-Rk
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 11:56:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Ag8v1001834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Dec 2012 02:42:08 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 3 Dec 2012 02:42:08 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Dec 2012 18:42:34 +0800
Message-ID: <d0cc337d8d8334a0df5712ce72cac0efb0e53da5.1354531187.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354531187.git.Qi.Chen@windriver.com>
References: <cover.1354531187.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/4] pth: add pkgconfig support
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
X-List-Received-Date: Mon, 03 Dec 2012 10:56:38 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add pkgconfig support to pth.

[YOCTO #2453]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../pth/files/pth-add-pkgconfig-support.patch      |  105 ++++++++++++++++++++
 meta/recipes-support/pth/pth_2.0.7.bb              |    7 +-
 2 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch

diff --git a/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch b/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
new file mode 100644
index 0000000..67a28ab
--- /dev/null
+++ b/meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
@@ -0,0 +1,105 @@
+Upstream-Status: Pending
+
+Add pkgconfig support to pth.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Index: Makefile.in
+===========================================================
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -47,6 +47,9 @@ datadir     = @datadir@
+ 
+ DESTDIR     =
+ 
++pkgconfigdir = ${libdir}/pkgconfig
++pkgconfig_DATA = pth.pc
++
+ ##
+ ##  ____ TOOL DEFINITIONS ___________________________________________
+ ##
+@@ -216,7 +219,7 @@ test_pthread: test_pthread.o test_common.o libpthread.la
+ 
+ #   install the package
+ install: all-for-install
+-	@$(MAKE) $(MKFLAGS) install-dirs install-pth @INSTALL_PTHREAD@
++	@$(MAKE) $(MKFLAGS) install-dirs install-pth @INSTALL_PTHREAD@ install-pkgconfigDATA
+ 	@touch .done-install >/dev/null 2>&1 || $(TRUE)
+ 	@$(MAKE) $(MKFLAGS) what-next
+ install-dirs:
+@@ -227,6 +230,7 @@ install-dirs:
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man3
+ 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(datadir)/aclocal
++	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(pkgconfigdir)
+ install-pth:
+ 	$(SHTOOL) install -c -m 755 pth-config $(DESTDIR)$(bindir)/pth-config
+ 	$(SHTOOL) install -c -m 644 $(S)pth-config.1 $(DESTDIR)$(mandir)/man1/pth-config.1
+@@ -242,12 +246,16 @@ install-pthread:
+ 	$(SHTOOL) install -c -m 644 $(S)pthread.3 $(DESTDIR)$(mandir)/man3/pthread.3
+ 	@umask 022; $(LIBTOOL) --mode=install \
+ 	$(SHTOOL) install -c libpthread.la $(DESTDIR)$(libdir)/libpthread.la
++install-pkgconfigDATA: $(pkgconfig_DATA)
++	$(SHTOOL) install -c -m 644 $(pkgconfig_DATA) $(DESTDIR)$(pkgconfigdir)/$(pkgconfig_DATA)
+ 
+ #   uninstall the package
+ uninstall:
+-	@$(MAKE) $(MKFLAGS) @UNINSTALL_PTHREAD@ uninstall-pth uninstall-dirs
++	@$(MAKE) $(MKFLAGS) uninstall-pkgconfigDATA @UNINSTALL_PTHREAD@ uninstall-pth uninstall-dirs
+ 	@touch .done-uninstall >/dev/null 2>&1 || $(TRUE)
+ 	@$(MAKE) $(MKFLAGS) what-next
++uninstall-pkgconfigDATA:
++	$(RM) $(DESTDIR)$(pkgconfigdir)/$(pkgconfig_DATA)
+ uninstall-pthread:
+ 	$(RM) $(DESTDIR)$(bindir)/pthread-config
+ 	$(RM) $(DESTDIR)$(mandir)/man1/pthread-config.1
+@@ -271,6 +279,7 @@ uninstall-dirs:
+ 	-$(RMDIR) $(DESTDIR)$(includedir) >/dev/null 2>&1 || $(TRUE)
+ 	-$(RMDIR) $(DESTDIR)$(bindir) >/dev/null 2>&1 || $(TRUE)
+ 	-$(RMDIR) $(DESTDIR)$(prefix) >/dev/null 2>&1 || $(TRUE)
++	-$(RMDIR) $(DESTDIR)$(pkgconfigdir) > /dev/null 2>&1 ||$(TRUE)
+ 
+ #   strip down the source tree to its minimum
+ striptease:
+Index: configure.ac
+===========================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -656,6 +656,13 @@ pth_acmac.h dnl
+ chmod +rx pthread-config
+ chmod +rx pth-config
+ )dnl
++
++PTH_VERSION=`echo $PTH_VERSION_STR | cut -d' ' -f1`
++AC_SUBST(PTH_VERSION)
++
++AC_CONFIG_FILES([pth.pc])
++AC_OUTPUT
++
+ if test ".$enable_pthread" = .no; then
+     rm -f pthread-config
+     rm -f pthread.h
+Index: pth.pc.in
+===========================================================
+--- /dev/null
++++ b/pth.pc.in
+@@ -0,0 +1,16 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++bindir=@bindir@
++mandir=@mandir@
++datadir=@datadir@
++acdir=@datadir@/aclocal
++
++Name: pth
++Description: GNU Portable Threads
++Requires:
++Version: @PTH_VERSION@
++Libs: -L${libdir} -lpth
++Libs.private: 
++Cflags: -I${includedir}
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 83a03b3..fc9ed16 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/pth/"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=12;endline=15;md5=a48af114a80c222cafd37f24370a77b1"
-PR = "r2"
+PR = "r3"
 
 python __anonymous () {
     import re
@@ -13,16 +13,17 @@ python __anonymous () {
 }
 
 SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
-          "
+          file://pth-add-pkgconfig-support.patch"
 
 SRC_URI[md5sum] = "9cb4a25331a4c4db866a31cbe507c793"
 SRC_URI[sha256sum] = "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232"
 
 PARALLEL_MAKE=""
 
-inherit autotools binconfig
+inherit autotools binconfig pkgconfig
 
 do_configure() {
 	gnu-configize
+	autoconf
 	oe_runconf
 }
-- 
1.7.9.5



