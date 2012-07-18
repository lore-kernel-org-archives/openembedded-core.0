Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1SrQiQ-0006PQ-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 11:38:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6I9RJnD009627
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jul 2012 02:27:19 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 18 Jul 2012 02:27:18 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <sgw@linux.intel.com>
Date: Wed, 18 Jul 2012 17:25:48 +0800
Message-ID: <1342603549-3695-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1342603549-3695-1-git-send-email-sen.zhang@windriver.com>
References: <5005B1CC.1020907@linux.intel.com>
	<1342603549-3695-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] grub: fix grub-mkconfig_lib install dir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 09:38:43 -0000
Content-Type: text/plain

The current fix_for_automake patch is not complete. It fixes the install
dir of grub-mkconfig_lib but neglects to update its references in
grub-mkconfig and the grub.d/* scripts. grub-mkconfig would complain:

    # grub-mkconfig
    /usr/sbin/grub-mkconfig: line 98: /usr/lib/grub/grub-mkconfig_lib: No such file or directory

Backport upstream patch to fix all the references.

[YOCTO #2777]

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  203 +++++++++++++++-----
 meta/recipes-bsp/grub/grub_1.99.bb                 |    2 +-
 2 files changed, 152 insertions(+), 53 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch b/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
index 4d729e5..459b4fc 100644
--- a/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
+++ b/meta/recipes-bsp/grub/files/grub-1.99_fix_for_automake_1.11.2.patch
@@ -1,37 +1,32 @@
-Upstream-Status: Pending
+Upstream-Status: Backport
 
-Fixes these errors observed with automake 1.11.2
-The useof pkglibhas become more strict compared to the earlier release of
-automake resulting in these failures.
-Fixed the files related to automake to avoid the issue.
+http://bzr.savannah.gnu.org/lh/grub/trunk/grub/revision/3766
+    Handle newer autotools. Add some missing quotes while on it.
 
-| conf/Makefile.common:140: `pkglibdir' is not a legitimate directory for `DATA'
-| grub-core/Makefile.am:5:   `conf/Makefile.common' included from here
-| conf/Makefile.common:140: `pkglibdir' is not a legitimate directory for `DATA'
-| Makefile.am:6:   `conf/Makefile.common' included from here
-| autoreconf: automake failed with exit status: 1
-| ERROR: autoreconf execution failed.
+http://bzr.savannah.gnu.org/lh/grub/trunk/grub/revision/3983
+    gentpl.py: Remove obsolete pkglib_DATA handling.
 
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
 
-
-| conf/Makefile.common:150: `pkglibdir' is not a legitimate directory for `SCRIPTS'
-| grub-core/Makefile.am:5:   `conf/Makefile.common' included from here
-| conf/Makefile.common:140: `pkglibdir' is not a legitimate directory for `DATA'
-| grub-core/Makefile.am:5:   `conf/Makefile.common' included from here
-| conf/Makefile.common:150: `pkglibdir' is not a legitimate directory for `SCRIPTS'
-| Makefile.am:6:   `conf/Makefile.common' included from here
-| conf/Makefile.common:140: `pkglibdir' is not a legitimate directory for `DATA'
-| Makefile.am:6:   `conf/Makefile.common' included from here
-| autoreconf: automake failed with exit status: 1
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/01/12
-
-
-Index: grub-1.99/conf/Makefile.common
-===================================================================
---- grub-1.99.orig/conf/Makefile.common
-+++ grub-1.99/conf/Makefile.common
+diff --git a/Makefile.am b/Makefile.am
+index 9301c91..d706968 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -101,8 +101,8 @@ CLEANFILES += widthspec.h
+ # Install config.h into platformdir
+ platform_HEADERS = config.h
+ 
+-pkglib_DATA += grub-mkconfig_lib
+-pkglib_DATA += update-grub_lib
++pkgdata_DATA += grub-mkconfig_lib
++pkgdata_DATA += update-grub_lib
+ 
+ 
+ if COND_i386_coreboot
+diff --git a/conf/Makefile.common b/conf/Makefile.common
+index 5aa13cd..2040a2e 100644
+--- a/conf/Makefile.common
++++ b/conf/Makefile.common
 @@ -137,7 +137,7 @@ KERNEL_HEADER_FILES =
  
  man_MANS =
@@ -41,40 +36,144 @@ Index: grub-1.99/conf/Makefile.common
  bin_SCRIPTS =
  sbin_SCRIPTS =
  bin_PROGRAMS =
-@@ -147,7 +147,7 @@ check_SCRIPTS =
+@@ -147,7 +147,6 @@ check_SCRIPTS =
  grubconf_DATA =
  check_PROGRAMS =
  noinst_SCRIPTS =
 -pkglib_SCRIPTS =
-+pkglibexec_SCRIPTS =
  noinst_PROGRAMS =
  grubconf_SCRIPTS =
  noinst_LIBRARIES =
-Index: grub-1.99/Makefile.am
-===================================================================
---- grub-1.99.orig/Makefile.am
-+++ grub-1.99/Makefile.am
-@@ -101,8 +101,8 @@ CLEANFILES += widthspec.h
- # Install config.h into platformdir
- platform_HEADERS = config.h
- 
--pkglib_DATA += grub-mkconfig_lib
--pkglib_DATA += update-grub_lib
-+pkgdata_DATA += grub-mkconfig_lib
-+pkgdata_DATA += update-grub_lib
- 
- 
- if COND_i386_coreboot
-Index: grub-1.99/gentpl.py
-===================================================================
---- grub-1.99.orig/gentpl.py
-+++ grub-1.99/gentpl.py
+diff --git a/gentpl.py b/gentpl.py
+index a42a606..7992376 100644
+--- a/gentpl.py
++++ b/gentpl.py
 @@ -440,7 +440,7 @@ def script(platform):
      r += "[+ ENDIF +]"
  
      r += rule("[+ name +]", platform_sources(platform) + " $(top_builddir)/config.status", """
 -$(top_builddir)/config.status --file=-:$< | sed -e 's,@pkglib_DATA@,$(pkglib_DATA),g' > $@
-+$(top_builddir)/config.status --file=-:$< | sed -e 's,@pkgdata_DATA@,$(pkgdata_DATA),g' > $@
++$(top_builddir)/config.status --file=$@:$<
  chmod a+x [+ name +]
  """)
  
+diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
+index afc66f8..0c81084 100644
+--- a/util/grub-mkconfig.in
++++ b/util/grub-mkconfig.in
+@@ -95,7 +95,7 @@ do
+     esac
+ done
+ 
+-. ${libdir}/grub/grub-mkconfig_lib
++. ${datadir}/grub/grub-mkconfig_lib
+ 
+ if [ "x$EUID" = "x" ] ; then
+   EUID=`id -u`
+diff --git a/util/grub.d/00_header.in b/util/grub.d/00_header.in
+index 9da1511..30d61f1 100644
+--- a/util/grub.d/00_header.in
++++ b/util/grub.d/00_header.in
+@@ -25,7 +25,7 @@ libdir=@libdir@
+ locale_dir=`echo ${GRUB_PREFIX}/locale | sed ${transform}`
+ grub_lang=`echo $LANG | cut -d . -f 1`
+ 
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ # Do this as early as possible, since other commands might depend on it.
+ # (e.g. the `loadfont' command might need lvm or raid modules)
+diff --git a/util/grub.d/10_hurd.in b/util/grub.d/10_hurd.in
+index 8c54eab..d823ba3 100644
+--- a/util/grub.d/10_hurd.in
++++ b/util/grub.d/10_hurd.in
+@@ -20,7 +20,7 @@ set -e
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ CLASS="--class gnu --class os"
+ 
+diff --git a/util/grub.d/10_kfreebsd.in b/util/grub.d/10_kfreebsd.in
+index 3600c74..fd8399b 100644
+--- a/util/grub.d/10_kfreebsd.in
++++ b/util/grub.d/10_kfreebsd.in
+@@ -21,7 +21,7 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ bindir=@bindir@
+ libdir=@libdir@
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ export TEXTDOMAIN=@PACKAGE@
+ export TEXTDOMAINDIR=@localedir@
+diff --git a/util/grub.d/10_linux.in b/util/grub.d/10_linux.in
+index 1d1eb40..0977700 100644
+--- a/util/grub.d/10_linux.in
++++ b/util/grub.d/10_linux.in
+@@ -21,7 +21,7 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ bindir=@bindir@
+ libdir=@libdir@
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ export TEXTDOMAIN=@PACKAGE@
+ export TEXTDOMAINDIR=@localedir@
+diff --git a/util/grub.d/10_netbsd.in b/util/grub.d/10_netbsd.in
+index ffd31ad..ce77096 100644
+--- a/util/grub.d/10_netbsd.in
++++ b/util/grub.d/10_netbsd.in
+@@ -21,7 +21,7 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ bindir=@bindir@
+ libdir=@libdir@
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ export TEXTDOMAIN=@PACKAGE@
+ export TEXTDOMAINDIR=@localedir@
+diff --git a/util/grub.d/10_windows.in b/util/grub.d/10_windows.in
+index fd068dd..9b73dc6 100644
+--- a/util/grub.d/10_windows.in
++++ b/util/grub.d/10_windows.in
+@@ -20,7 +20,7 @@ set -e
+ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ case "`uname 2>/dev/null`" in
+   CYGWIN*)  ;;
+diff --git a/util/grub.d/20_linux_xen.in b/util/grub.d/20_linux_xen.in
+index a900760..aef5bea 100644
+--- a/util/grub.d/20_linux_xen.in
++++ b/util/grub.d/20_linux_xen.in
+@@ -21,7 +21,7 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ bindir=@bindir@
+ libdir=@libdir@
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ export TEXTDOMAIN=@PACKAGE@
+ export TEXTDOMAINDIR=@localedir@
+diff --git a/util/grub.d/30_os-prober.in b/util/grub.d/30_os-prober.in
+index d9d4b0a..485b224 100644
+--- a/util/grub.d/30_os-prober.in
++++ b/util/grub.d/30_os-prober.in
+@@ -21,7 +21,7 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ 
+-. ${libdir}/grub/grub-mkconfig_lib
++. @datadir@/grub/grub-mkconfig_lib
+ 
+ if [ "x${GRUB_DISABLE_OS_PROBER}" = "xtrue" ]; then
+   exit 0
+-- 
+1.7.7
+
diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/grub_1.99.bb
index 775c6aa..1009ce8 100644
--- a/meta/recipes-bsp/grub/grub_1.99.bb
+++ b/meta/recipes-bsp/grub/grub_1.99.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
-- 
1.7.7



