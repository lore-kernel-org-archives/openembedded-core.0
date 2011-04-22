Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlq-0001pp-PN
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2011 00:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="913034221"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2011 00:24:54 -0700
Message-Id: <28ae024eeae08bcbf151f7d197b38aab6eac2157.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:19:29 -0700
Date: Fri, 22 Apr 2011  0:24:54 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 24/33] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:19 -0000

From: Khem Raj <raj.khem@gmail.com>

version workaround is done in recipe itself
by adding PV to CFLAGS

Since we define LIBC and pcmciutils use it too
which hinders build when we define LIBC in
environment. Its not used in the builds anyway
so we get rid of depending on it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pcmciautils-017/version_workaround.patch       |   16 ------
 .../makefile_fix.patch                             |   58 ++++++++++++++++----
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 ----
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 ++++
 5 files changed, 59 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
 rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 => pcmciautils-018}/makefile_fix.patch (63%)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
deleted file mode 100644
index 57efa68..0000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-PCMCIAUTILS_VERSION is specified on the commandline but doesn't compile properly 
-under arm gcc 3.4.x so we work around it.
-
-Index: pcmciautils-013/src/pccardctl.c
-===================================================================
---- pcmciautils-013.orig/src/pccardctl.c	2006-03-26 11:56:41.000000000 +0100
-+++ pcmciautils-013/src/pccardctl.c	2006-05-09 22:11:09.000000000 +0100
-@@ -350,7 +350,7 @@
- }
- 
- static void print_header(void) {
--	printf("pcmciautils %s\n", PCMCIAUTILS_VERSION);
-+	printf("pcmciautils 017\n");
- 	printf("Copyright (C) 2004-2005 Dominik Brodowski, (C) 1999 David A. Hinds\n");
- 	printf("Report errors and bugs to <linux-pcmcia@lists.infradead.org>, please.\n");
- }
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
similarity index 63%
rename from meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch
rename to meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
index 82dbfa8..295c810 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
@@ -1,16 +1,19 @@
-rebase the patch to 017, removing hardcoded path for true
+Hardcoded paths are bad...
+This lets us use the install from OE's native sysroot
+rebase the patch to 018, removing hardcoded path for true
 as well. Removing of -D in install invocation is a little
 questionable, is it some GNU extention?
+Also remove LIBC from makefiles. We do not need it
+since we link against staged libc correctly.
 
-07/14/2010 - qhe, original patch note follows
+-Khem Raj <raj.khem@gmail.com>
 
-Hardcoded paths are bad...
 
-diff --git a/Makefile b/Makefile
-index 26f3e4b..31f0cdf 100644
---- a/Makefile
-+++ b/Makefile
-@@ -69,7 +69,7 @@ sbindir =	${exec_prefix}/sbin
+Index: pcmciautils-018/Makefile
+===================================================================
+--- pcmciautils-018.orig/Makefile
++++ pcmciautils-018/Makefile
+@@ -76,7 +76,7 @@ sbindir =	${exec_prefix}/sbin
  mandir =	${prefix}/usr/share/man
  udevdir =	${prefix}/lib/udev
  
@@ -19,7 +22,7 @@ index 26f3e4b..31f0cdf 100644
  INSTALL_PROGRAM = ${INSTALL}
  INSTALL_DATA  = ${INSTALL} -m 644
  INSTALL_SCRIPT = ${INSTALL_PROGRAM}
-@@ -171,7 +171,7 @@ endif
+@@ -180,7 +180,7 @@ endif
  # if DEBUG is enabled, then we do not strip or optimize
  ifeq ($(strip $(DEBUG)),true)
  	CFLAGS  += -O1 -g -DDEBUG -D_GNU_SOURCE
@@ -28,7 +31,40 @@ index 26f3e4b..31f0cdf 100644
  else
  	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
  	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
-@@ -264,30 +264,32 @@ clean:
+@@ -234,15 +234,15 @@ build/ccdv: build/ccdv.c
+ 	mv y.tab.c $*.c
+ 	mv y.tab.h $*.h
+ 
+-$(PCCARDCTL): $(LIBC) src/$(PCCARDCTL).o src/$(PCCARDCTL).c $(OBJS) $(HEADERS)
++$(PCCARDCTL): src/$(PCCARDCTL).o src/$(PCCARDCTL).c $(OBJS) $(HEADERS)
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/$(PCCARDCTL).o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-$(PCMCIA_CHECK_BROKEN_CIS): $(LIBC) src/$(PCMCIA_CHECK_BROKEN_CIS).o src/read-cis.o $(OBJS) $(HEADERS)
++$(PCMCIA_CHECK_BROKEN_CIS): src/$(PCMCIA_CHECK_BROKEN_CIS).o src/read-cis.o $(OBJS) $(HEADERS)
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/$(PCMCIA_CHECK_BROKEN_CIS).o src/read-cis.o $(LIB_PLAIN_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-$(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/lex_config.o $(OBJS) $(HEADERS)
++$(PCMCIA_SOCKET_STARTUP): src/startup.o src/yacc_config.o src/lex_config.o $(OBJS) $(HEADERS)
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+@@ -251,11 +251,11 @@ yacc_config.o lex_config.o: %.o: %.c
+ 
+ debugtools: ccdv $(CBDUMP) $(CISDUMP)
+ 
+-$(CBDUMP): $(LIBC) debug/cbdump.o
++$(CBDUMP): debug/cbdump.o
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) debug/$(CBDUMP).o $(LIB_PCI_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+-$(CISDUMP): $(LIBC) src/read-cis.o debug/parse_cis.o debug/dump_cis.o
++$(CISDUMP): src/read-cis.o debug/parse_cis.o debug/dump_cis.o
+ 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) debug/$(CISDUMP).o src/read-cis.o debug/parse_cis.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
+ 	$(QUIET) $(STRIPCMD) $@
+ 
+@@ -273,30 +273,32 @@ clean:
  
  install-hotplug:
  	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
@@ -68,7 +104,7 @@ index 26f3e4b..31f0cdf 100644
  
  uninstall-tools:
  	- rm -f $(DESTDIR)$(sbindir)/$(PCCARDCTL)
-@@ -296,22 +298,24 @@ uninstall-tools:
+@@ -305,22 +307,24 @@ uninstall-tools:
  
  install-config:
  	$(INSTALL) -d $(DESTDIR)$(pcmciaconfdir)
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 260cccb..410fa5d 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -22,6 +22,7 @@ export udevrulesdir = "${sysconfdir}/udev/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
+CFLAGS =+ -DPCMCIAUTILS_VERSION=\'${PV}\'
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-e 'STRIP=echo' 'LIB_OBJS=-lc -lsysfs' 'LEX=flex'"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_017.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
deleted file mode 100644
index ff67f7b..0000000
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require pcmciautils.inc
-
-PR = "r0"
-
-SRC_URI += "file://makefile_fix.patch \
-            file://version_workaround.patch"
-
-SRC_URI[md5sum] = "5245af28eeba57ec0606a874d44d10f7"
-SRC_URI[sha256sum] = "2045f0e8f837f44aed72ac91c1a8cf3b899caf098a25d04f47982be6386bd4e1"
-
-FILES_${PN}-dbg += "${libdir}/udev/.debug"
-FILES_${PN} += "${libdir}/udev"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
new file mode 100644
index 0000000..202437a
--- /dev/null
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -0,0 +1,11 @@
+require pcmciautils.inc
+
+SRC_URI += "file://makefile_fix.patch"
+
+SRC_URI[md5sum] = "5d85669b3440baa4532363da6caaf1b4"
+SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0dc8ed5"
+
+PR = "r0"
+
+FILES_${PN}-dbg += "${libdir}/udev/.debug"
+FILES_${PN} += "${libdir}/udev"
-- 
1.7.1



