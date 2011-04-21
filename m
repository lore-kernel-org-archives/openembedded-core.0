Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QCz8p-0004kj-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 21:02:15 +0200
Received: by pvc30 with SMTP id 30so16322pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=2SUBMYkq1ibzfgfquo8b7vGFKaHIpZlLcXHCN6N20cc=;
	b=fxtF5v/g4GzIFqoJFrSxhyCvW+06j2vO67RFr0Qw5njTv0iA7q/7bJovxh9OrbpsFL
	18M6i2sLz7wftfpoi1MG08lKIXSztJmthZrUK+addMecQ2FUXbff3ckazlov9SO/T6lh
	YlJEV0hZEZhmYbtog9atAWNwyYtRV8DaQ32vs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=PxY0NpB86uIac3z9IETD2SvVOfZfOQsYsy8t/TfvWKLEoSsMt8CZuAMw9oQFzHA9Yk
	r0WdXQl1JnYu0eqeuGlsidf2/laPBSt3B0wvy/ukKAe3l8T9eJMIgnjtfgYlG158UrFQ
	tbheVh0XJ1nqiG31LGCWjjjXVKX86ja4+0TEE=
Received: by 10.68.44.65 with SMTP id c1mr402871pbm.151.1303412390097;
	Thu, 21 Apr 2011 11:59:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i3sm1474157pbb.26.2011.04.21.11.59.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 11:59:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 11:59:44 -0700
Message-Id: <9efd8eca294cb7e3206e47e3b9bea503f3c87ac8.1303412254.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1303412254.git.raj.khem@gmail.com>
References: <cover.1303412254.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Thu, 21 Apr 2011 19:02:15 -0000

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
1.7.4.1



