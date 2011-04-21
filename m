Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QD1Yl-0002K0-DU
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 23:37:11 +0200
Received: by pwj9 with SMTP id 9so81839pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 14:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+AOd+YOQS2+UhyIoR4DqRmwcrwOUdss1GHEtcGTebh4=;
	b=v/FwY4l855mqfNpx6YQUe7hZQkKqnQzTy1MREUwYCrbrCciKhSbWefmocWqwnLekbR
	8/HkMQa6IAijVMR5rOqU0+H9gW9CVygLW7152WdVJuAmbkxmZz4mDoOE95dYkTUKRHno
	x4mBCQe4Ae86E48KX8Um7DvbzsFSL6pnE2geU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NQK4O7A02WljO7d6p/I9PLBBdJSOPLXRhOT9oRLPkb0aZAAqRbG9Uk0N/zOEPCkHXP
	uhX3nTJaKCxEJIhfhyuPwKBRwA2QmK/Z3DJVPkaYSgIT0iLYkBbZ34WxUo11kuhrrtzB
	uWRdYFACxj0UII7A2sjmLfJ/VbvSiX3gt2R80=
Received: by 10.68.27.170 with SMTP id u10mr551291pbg.529.1303421682759;
	Thu, 21 Apr 2011 14:34:42 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k4sm1540168pbi.62.2011.04.21.14.34.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 14:34:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 14:34:37 -0700
Message-Id: <5229fedbad28b1700cb4c177d6aec81bc6b47988.1303421567.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303421567.git.raj.khem@gmail.com>
References: <cover.1303421567.git.raj.khem@gmail.com>
Subject: [PATCH V2 1/1] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Thu, 21 Apr 2011 21:37:11 -0000

version workaround is done in recipe itself
by adding PV to CFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pcmciautils-017/version_workaround.patch       |   16 ------------
 .../makefile_fix.patch                             |   25 +++++++++++--------
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 ---------
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 ++++++++
 5 files changed, 26 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
 rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 => pcmciautils-018}/makefile_fix.patch (87%)
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
similarity index 87%
rename from meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch
rename to meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
index 82dbfa8..5a0baf2 100644
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
@@ -28,7 +31,7 @@ index 26f3e4b..31f0cdf 100644
  else
  	CFLAGS  += $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
  	STRIPCMD = $(STRIP) -s --remove-section=.note --remove-section=.comment
-@@ -264,30 +264,32 @@ clean:
+@@ -273,30 +273,32 @@ clean:
  
  install-hotplug:
  	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
@@ -68,7 +71,7 @@ index 26f3e4b..31f0cdf 100644
  
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
1.7.4.1



