Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWYL-0005nC-Aq
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:42:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Apr 2011 23:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="424248391"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 22 Apr 2011 23:29:27 -0700
Message-Id: <7899ea60ec0f39a465166eea196a5b554e5cd3f5.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Tue, 19 Apr 2011 16:19:29 -0700
Date: Fri, 22 Apr 2011 23:29:26 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 10:00:03 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 32/37] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Sat, 23 Apr 2011 06:42:49 -0000

From: Khem Raj <raj.khem@gmail.com>

version workaround is done in recipe itself
by adding PV to CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pcmciautils-017/version_workaround.patch       |   16 -------------
 .../makefile_fix.patch                             |   24 ++++++++++----------
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 ----------
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 +++++++++
 5 files changed, 24 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
 rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 => pcmciautils-018}/makefile_fix.patch (89%)
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
similarity index 89%
rename from meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch
rename to meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
index 82dbfa8..81269c9 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
@@ -1,16 +1,16 @@
-rebase the patch to 017, removing hardcoded path for true
+Hardcoded paths are bad...
+This lets us use the install from OE's native sysroot
+rebase the patch to 018, removing hardcoded path for true
 as well. Removing of -D in install invocation is a little
 questionable, is it some GNU extention?
 
-07/14/2010 - qhe, original patch note follows
-
-Hardcoded paths are bad...
+-Khem Raj <raj.khem@gmail.com>
 
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
  
@@ -19,7 +19,7 @@ index 26f3e4b..31f0cdf 100644
  INSTALL_PROGRAM = ${INSTALL}
  INSTALL_DATA  = ${INSTALL} -m 644
  INSTALL_SCRIPT = ${INSTALL_PROGRAM}
-@@ -171,7 +171,7 @@ endif
+@@ -180,7 +180,7 @@ endif
  # if DEBUG is enabled, then we do not strip or optimize
  ifeq ($(strip $(DEBUG)),true)
  	CFLAGS  += -O1 -g -DDEBUG -D_GNU_SOURCE
@@ -28,7 +28,7 @@ index 26f3e4b..31f0cdf 100644
  else
  	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
  	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
-@@ -264,30 +264,32 @@ clean:
+@@ -273,30 +273,32 @@ clean:
  
  install-hotplug:
  	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
@@ -68,7 +68,7 @@ index 26f3e4b..31f0cdf 100644
  
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
1.7.1.1



