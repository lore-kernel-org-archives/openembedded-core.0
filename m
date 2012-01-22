Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp25K-00038n-Fl
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:24:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jan 2012 10:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="99363784"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga001.jf.intel.com with ESMTP; 22 Jan 2012 10:16:26 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:29:57 +0800
Message-Id: <9a7c4bbb47060d4568799d6443f39fe3f826a329.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <5508508491b90ad0747c9aa4a9817274ea88d378.1327255446.git.shane.wang@intel.com>
References: <5508508491b90ad0747c9aa4a9817274ea88d378.1327255446.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 15/18] pciutils: upgrade to 3.1.9
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
X-List-Received-Date: Sun, 22 Jan 2012 18:24:11 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../configure.patch                                |   69 ++++++++++----------
 .../guess-fix.patch                                |    0
 .../lib-build-fix.patch                            |    0
 .../makefile.patch                                 |    0
 .../pcimodules-pciutils.diff                       |    0
 .../{pciutils_3.1.7.bb => pciutils_3.1.9.bb}       |    6 +-
 6 files changed, 38 insertions(+), 37 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 => pciutils-3.1.9}/configure.patch (85%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 => pciutils-3.1.9}/guess-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 => pciutils-3.1.9}/lib-build-fix.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 => pciutils-3.1.9}/makefile.patch (100%)
 rename meta/recipes-bsp/pciutils/{pciutils-3.1.7 => pciutils-3.1.9}/pcimodules-pciutils.diff (100%)
 rename meta/recipes-bsp/pciutils/{pciutils_3.1.7.bb => pciutils_3.1.9.bb} (91%)

diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
similarity index 85%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
index ff6f20c..658e597 100644
--- a/meta/recipes-bsp/pciutils/pciutils-3.1.7/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils-3.1.9/configure.patch
@@ -6,10 +6,40 @@ Upstream-Status: Inappropriate [embedded specific]
 ---
 
 7/30/2010 - rebased to 3.1.5 by Qing He <qing.he@intel.com>
+1/22/2012 - rebased to 3.1.9 by Shane Wang <shane.wang@intel.com>
 
-diff -uNr pciutils-3.1.5.orig/lib/configure pciutils-3.1.5/lib/configure
---- pciutils-3.1.5.orig/lib/configure	2010-07-30 13:51:58.000000000 +0800
-+++ pciutils-3.1.5/lib/configure	2010-07-30 13:53:25.000000000 +0800
+diff -r af2b10cc3c14 Makefile
+--- a/Makefile	Sun Jan 22 18:36:34 2012 +0800
++++ b/Makefile	Sun Jan 22 18:38:54 2012 +0800
+@@ -37,7 +37,6 @@
+ # Commands
+ INSTALL=install
+ DIRINSTALL=install -d
+-STRIP=-s
+ CC=$(CROSS_COMPILE)gcc
+ AR=$(CROSS_COMPILE)ar
+ RANLIB=$(CROSS_COMPILE)ranlib
+@@ -86,7 +85,7 @@
+ example.o: example.c $(PCIINC)
+ 
+ %: %.o
+-	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
++	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) -o $@
+ 
+ %.8 %.7: %.man
+ 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
+@@ -101,7 +100,7 @@
+ install: all
+ # -c is ignored on Linux, but required on FreeBSD
+ 	$(DIRINSTALL) -m 755 $(DESTDIR)$(SBINDIR) $(DESTDIR)$(IDSDIR) $(DESTDIR)$(MANDIR)/man8 $(DESTDIR)$(MANDIR)/man7
+-	$(INSTALL) -c -m 755 $(STRIP) lspci setpci $(DESTDIR)$(SBINDIR)
++	$(INSTALL) -c -m 755 lspci setpci $(DESTDIR)$(SBINDIR)
+ 	$(INSTALL) -c -m 755 update-pciids $(DESTDIR)$(SBINDIR)
+ 	$(INSTALL) -c -m 644 $(PCI_IDS) $(DESTDIR)$(IDSDIR)
+ 	$(INSTALL) -c -m 644 lspci.8 setpci.8 update-pciids.8 $(DESTDIR)$(MANDIR)/man8
+diff -r af2b10cc3c14 lib/configure
+--- a/lib/configure	Sun Jan 22 18:36:34 2012 +0800
++++ b/lib/configure	Sun Jan 22 18:38:54 2012 +0800
 @@ -14,6 +14,10 @@
  	fi
  }
@@ -36,8 +66,8 @@ diff -uNr pciutils-3.1.5.orig/lib/configure pciutils-3.1.5/lib/configure
  		proc=`/usr/sbin/lsdev -C -c processor -S available -F name | head -1`
  		cpu=`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
  	else
--		cpu=`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/'`
-+		cpu=${4:-`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/'`}
+-		cpu=`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`
++		cpu=${4:-`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/`}
  	fi
  	if [ "$sys" = "GNU/kFreeBSD" -o "$sys" = "DragonFly" ]
  	then
@@ -72,32 +102,3 @@ diff -uNr pciutils-3.1.5.orig/lib/configure pciutils-3.1.5/lib/configure
  c=config.h
  m=config.mk
  echo >$c '#define PCI_CONFIG_H'
-diff -uNr pciutils-3.1.5.orig/Makefile pciutils-3.1.5/Makefile
---- pciutils-3.1.5.orig/Makefile	2010-07-30 13:51:58.000000000 +0800
-+++ pciutils-3.1.5/Makefile	2010-07-30 13:52:24.000000000 +0800
-@@ -37,7 +37,6 @@
- # Commands
- INSTALL=install
- DIRINSTALL=install -d
--STRIP=-s
- CC=$(CROSS_COMPILE)gcc
- AR=$(CROSS_COMPILE)ar
- RANLIB=$(CROSS_COMPILE)ranlib
-@@ -86,7 +85,7 @@
- example.o: example.c $(PCIINC)
- 
- %: %.o
--	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-+	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) -o $@
- 
- %.8 %.7: %.man
- 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
-@@ -101,7 +100,7 @@
- install: all
- # -c is ignored on Linux, but required on FreeBSD
- 	$(DIRINSTALL) -m 755 $(DESTDIR)$(SBINDIR) $(DESTDIR)$(IDSDIR) $(DESTDIR)$(MANDIR)/man8 $(DESTDIR)$(MANDIR)/man7
--	$(INSTALL) -c -m 755 $(STRIP) lspci setpci $(DESTDIR)$(SBINDIR)
-+	$(INSTALL) -c -m 755 lspci setpci $(DESTDIR)$(SBINDIR)
- 	$(INSTALL) -c -m 755 update-pciids $(DESTDIR)$(SBINDIR)
- 	$(INSTALL) -c -m 644 $(PCI_IDS) $(DESTDIR)$(IDSDIR)
- 	$(INSTALL) -c -m 644 lspci.8 setpci.8 update-pciids.8 $(DESTDIR)$(MANDIR)/man8
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.9/guess-fix.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.7/guess-fix.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.9/guess-fix.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/lib-build-fix.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.9/lib-build-fix.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.7/lib-build-fix.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.9/lib-build-fix.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch b/meta/recipes-bsp/pciutils/pciutils-3.1.9/makefile.patch
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.7/makefile.patch
rename to meta/recipes-bsp/pciutils/pciutils-3.1.9/makefile.patch
diff --git a/meta/recipes-bsp/pciutils/pciutils-3.1.7/pcimodules-pciutils.diff b/meta/recipes-bsp/pciutils/pciutils-3.1.9/pcimodules-pciutils.diff
similarity index 100%
rename from meta/recipes-bsp/pciutils/pciutils-3.1.7/pcimodules-pciutils.diff
rename to meta/recipes-bsp/pciutils/pciutils-3.1.9/pcimodules-pciutils.diff
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
similarity index 91%
rename from meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
index b48aaf0..51e7476 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.9.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib"
 RDEPENDS_${PN} = "${PN}-ids"
-PR = "r2"
+PR = "r0"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
@@ -18,8 +18,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://guess-fix.patch \
            file://makefile.patch"
 
-SRC_URI[md5sum] = "35222edb86b50a6641352c66fe829b2e"
-SRC_URI[sha256sum] = "d8fe23b6966c1abf29b3b38b08b0cf33f731cd6e6a89d9b8d2b8d5e982c3f544"
+SRC_URI[md5sum] = "79cc1d0bff8603d3a550fa63802cd1db"
+SRC_URI[sha256sum] = "e4ce5d56ae4a9611d51ba0cc2ea45806f9539a18aceb4aa70b8ded50f6923c4f"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.6



