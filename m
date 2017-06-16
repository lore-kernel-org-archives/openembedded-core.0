Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4477578442
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 08:42:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G8gVDo022963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 09:42:32 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLmpr-0000PG-Lh; Fri, 16 Jun 2017 09:42:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 09:42:28 +0100
Message-Id: <1497602550-1491-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 09:42:32 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/4] pciutils: Fold patches into a single patch with a description
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
X-List-Received-Date: Fri, 16 Jun 2017 08:42:35 -0000

Patches patching content from other patches is bad. This folds the three
patches into one, improves some of what its doing to be a little
cleaner and adds a proper description to the patch header.

This also moves the STRIP override to the configure commandline rather
than patching and handles passing libdir the same way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/pciutils/pciutils/configure.patch | 69 +++++++++-------------
 meta/recipes-bsp/pciutils/pciutils/guess-fix.patch | 27 ---------
 meta/recipes-bsp/pciutils/pciutils/makefile.patch  | 26 --------
 meta/recipes-bsp/pciutils/pciutils_3.5.4.bb        |  6 +-
 4 files changed, 30 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
 delete mode 100644 meta/recipes-bsp/pciutils/pciutils/makefile.patch

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index c87b350..55edfea 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -1,46 +1,36 @@
-Upstream-Status: Inappropriate [embedded specific]
+This patch:
+* ensures we link correctly
+* allows us to optionally pass target information to configure rather than using uname
+* select linux as the platform in most cases we care about
+
+This is a merge of various tweaks to allow us to build pciutils including 
+work from:
 
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
----
+7/30/2010 - Qing He <qing.he@intel.com>
+1/22/2012 - Shane Wang <shane.wang@intel.com>
+Ionut Radu <ionutx.radu@intel.com>
+2017/6/15 - RP - Cleanups and merging patches
 
-7/30/2010 - rebased to 3.1.5 by Qing He <qing.he@intel.com>
-1/22/2012 - rebased to 3.1.9 by Shane Wang <shane.wang@intel.com>
+Upstream-Status: Inappropriate [embedded specific]
 
-diff -r af2b10cc3c14 Makefile
---- a/Makefile	Sun Jan 22 18:36:34 2012 +0800
-+++ b/Makefile	Sun Jan 22 18:38:54 2012 +0800
-@@ -37,7 +37,6 @@
- # Commands
- INSTALL=install
- DIRINSTALL=install -d
--STRIP=-s
- CC=$(CROSS_COMPILE)gcc
- AR=$(CROSS_COMPILE)ar
- RANLIB=$(CROSS_COMPILE)ranlib
-@@ -86,7 +85,7 @@
+Index: pciutils-3.5.4/Makefile
+===================================================================
+--- pciutils-3.5.4.orig/Makefile
++++ pciutils-3.5.4/Makefile
+@@ -96,7 +95,7 @@ example: example.o lib/$(PCILIB)
  example.o: example.c $(PCIINC)
  
  %: %.o
 -	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-+	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) -o $@
++	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
  
  %.8 %.7: %.man
  	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
-@@ -101,7 +100,7 @@
- install: all
- # -c is ignored on Linux, but required on FreeBSD
- 	$(DIRINSTALL) -m 755 $(DESTDIR)$(SBINDIR) $(DESTDIR)$(IDSDIR) $(DESTDIR)$(MANDIR)/man8 $(DESTDIR)$(MANDIR)/man7
--	$(INSTALL) -c -m 755 $(STRIP) lspci setpci $(DESTDIR)$(SBINDIR)
-+	$(INSTALL) -c -m 755 lspci setpci $(DESTDIR)$(SBINDIR)
- 	$(INSTALL) -c -m 755 update-pciids $(DESTDIR)$(SBINDIR)
- 	$(INSTALL) -c -m 644 $(PCI_IDS) $(DESTDIR)$(IDSDIR)
- 	$(INSTALL) -c -m 644 lspci.8 setpci.8 update-pciids.8 $(DESTDIR)$(MANDIR)/man8
-diff -r af2b10cc3c14 lib/configure
---- a/lib/configure	Sun Jan 22 18:36:34 2012 +0800
-+++ b/lib/configure	Sun Jan 22 18:38:54 2012 +0800
-@@ -14,6 +14,10 @@
+Index: pciutils-3.5.4/lib/configure
+===================================================================
+--- pciutils-3.5.4.orig/lib/configure
++++ pciutils-3.5.4/lib/configure
+@@ -14,6 +14,10 @@ echo_n() {
  	fi
  }
  
@@ -51,7 +41,7 @@ diff -r af2b10cc3c14 lib/configure
  if [ -z "$VERSION" -o -z "$IDSDIR" ] ; then
  	echo >&2 "Please run the configure script from the top-level Makefile"
  	exit 1
-@@ -21,8 +25,8 @@
+@@ -21,8 +25,8 @@ fi
  
  echo_n "Configuring libpci for your system..."
  if [ -z "$HOST" ] ; then
@@ -62,7 +52,7 @@ diff -r af2b10cc3c14 lib/configure
  	realsys="$sys"
  	if [ "$sys" = "AIX" -a -x /usr/bin/oslevel -a -x /usr/sbin/lsattr ]
  	then
-@@ -30,7 +34,7 @@
+@@ -30,7 +34,7 @@ if [ -z "$HOST" ] ; then
  		proc=`/usr/sbin/lsdev -C -c processor -S available -F name | head -1`
  		cpu=`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
  	else
@@ -71,7 +61,7 @@ diff -r af2b10cc3c14 lib/configure
  	fi
  	if [ "$sys" = "GNU/kFreeBSD" -o "$sys" = "DragonFly" ]
  	then
-@@ -40,7 +44,7 @@
+@@ -40,7 +44,7 @@ if [ -z "$HOST" ] ; then
  	then
  		sys=cygwin
  	fi
@@ -80,14 +70,11 @@ diff -r af2b10cc3c14 lib/configure
  fi
  [ -n "$RELEASE" ] && rel="${RELEASE}"
  # CAVEAT: tr on Solaris is a bit weird and the extra [] is otherwise harmless.
-@@ -49,6 +53,11 @@
+@@ -49,6 +53,8 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^
  sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
  echo " $host $rel $cpu $sys"
  
-+if [ "$host" = "linux--gnueabi" ]
-+then
-+	sys=linux
-+fi
++{ echo "$host" | grep linux; } && sys=linux
 +
  c=config.h
  m=config.mk
diff --git a/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
deleted file mode 100644
index f918e3b..0000000
--- a/meta/recipes-bsp/pciutils/pciutils/guess-fix.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-the original guess algorithm is broken for many archs
-for example, the following two would break:
-	arm-linux-gnueabi  --> sys=gnueabi
-	x86_64-unknown-pc-linux-gnu  --> sys = pc-linux-gnu
-
-use a simpler scheme here and hope it works for all the cases
-
-Upstream-Status: Pending
-
-7/30/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/lib/configure b/lib/configure
-index 4318b05..84f6acb 100755
---- a/lib/configure
-+++ b/lib/configure
-@@ -53,10 +53,7 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
- sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
- echo " $host $rel $cpu $sys"
- 
--if [ "$host" = "linux--gnueabi" ]
--then
--	sys=linux
--fi
-+{ echo "$host" | grep linux; } && sys=linux
- 
- c=config.h
- m=config.mk
diff --git a/meta/recipes-bsp/pciutils/pciutils/makefile.patch b/meta/recipes-bsp/pciutils/pciutils/makefile.patch
deleted file mode 100644
index c3fbc6f..0000000
--- a/meta/recipes-bsp/pciutils/pciutils/makefile.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Ionut Radu <ionutx.radu@intel.com>
-
-Index: pciutils-3.2.0/Makefile
-===================================================================
---- pciutils-3.2.0.orig/Makefile
-+++ pciutils-3.2.0/Makefile
-@@ -35,7 +35,7 @@ SHAREDIR=$(PREFIX)/share
- IDSDIR=$(SHAREDIR)
- MANDIR:=$(shell if [ -d $(PREFIX)/share/man ] ; then echo $(PREFIX)/share/man ; else echo $(PREFIX)/man ; fi)
- INCDIR=$(PREFIX)/include
--LIBDIR=$(PREFIX)/lib
-+LIBDIR=$(libdir)
- PKGCFDIR=$(LIBDIR)/pkgconfig
- 
- # Commands
-@@ -94,7 +94,7 @@ example: example.o lib/$(PCILIB_DEV)
- example.o: example.c $(PCIINC)
- 
- %: %.o
--	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) -o $@
-+	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
- 
- %.8 %.7: %.man
- 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
index d387fba..418f712 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.4.bb
@@ -9,9 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib kmod"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
-           file://configure.patch \
-           file://guess-fix.patch \
-           file://makefile.patch"
+           file://configure.patch"
 
 SRC_URI[md5sum] = "e82537cd2194111c45fa7e684b52252e"
 SRC_URI[sha256sum] = "64293c6ab9318c40ef262b76d87bd9097531759752bac556e50979b1e63cfe66"
@@ -21,7 +19,7 @@ inherit multilib_header
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
 PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
 
-PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
+PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes STRIP= LIBDIR=${libdir}"
 
 # see configure.patch
 do_configure () {
-- 
2.7.4


