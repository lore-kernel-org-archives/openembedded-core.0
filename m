Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 47D167C087
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 08:43:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2018 00:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,376,1539673200"; d="scan'208";a="112046164"
Received: from lwong-mobl2.gar.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.137.224])
	by orsmga003.jf.intel.com with ESMTP; 20 Dec 2018 00:43:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 16:43:36 +0800
Message-Id: <20181220084336.7294-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181220084336.7294-1-anuj.mittal@intel.com>
References: <20181220084336.7294-1-anuj.mittal@intel.com>
Subject: [PATCH 5/5] libpcap: upgrade 1.8.1 -> 1.9.0
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
X-List-Received-Date: Thu, 20 Dec 2018 08:43:43 -0000

* For changes, see:
https://www.tcpdump.org/libpcap-changes.txt

* Merge inc and bb and remove unnecessary flags.

* Remove all patches, they have either been upstreamed or fixed
differently.

* Compilation with bluez5 works just fine, enable it and remove bluez4
config.

* Backport a commit to fix musl builds.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...te_t.ai-usage-when-INET6-is-not-defi.patch | 41 -----------
 ...-add-missing-limits.h-for-musl-syste.patch | 30 ++++++++
 ...d-missing-compiler_state_t-parameter.patch | 67 -----------------
 .../libpcap/libpcap/disable-remote.patch      | 36 ---------
 .../libpcap/libpcap/fix-grammar-deps.patch    | 29 --------
 .../libpcap/libpcap-pkgconfig-support.patch   | 73 -------------------
 .../libpcap/libpcap_1.8.1.bb                  | 31 --------
 .../libpcap/{libpcap.inc => libpcap_1.9.0.bb} | 29 ++++----
 8 files changed, 46 insertions(+), 290 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
 rename meta/recipes-connectivity/libpcap/{libpcap.inc => libpcap_1.9.0.bb} (58%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch
deleted file mode 100644
index edb6ae5667..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 64aa033a061c43fc15c711f2490ae41d23b868c3 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 17 Nov 2016 09:44:42 -0200
-Subject: [PATCH 1/2] Fix compiler_state_t.ai usage when INET6 is not defined
-Organization: O.S. Systems Software LTDA.
-
-Fix error:
-
-/
-| ../libpcap-1.8.1/gencode.c: In function 'pcap_compile':
-| ../libpcap-1.8.1/gencode.c:693:8: error: 'compiler_state_t
-| {aka struct _compiler_state}' has no member named 'ai'
-|   cstate.ai = NULL;
-\
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/the-tcpdump-group/libpcap/pull/541
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- gencode.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/gencode.c b/gencode.c
-index a887f27..e103c70 100644
---- a/gencode.c
-+++ b/gencode.c
-@@ -690,7 +690,9 @@ pcap_compile(pcap_t *p, struct bpf_program *program,
- 	}
- 	initchunks(&cstate);
- 	cstate.no_optimize = 0;
-+#ifdef INET6
- 	cstate.ai = NULL;
-+#endif
- 	cstate.ic.root = NULL;
- 	cstate.ic.cur_mark = 0;
- 	cstate.bpf_pcap = p;
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
new file mode 100644
index 0000000000..6c4f12aa63
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch
@@ -0,0 +1,30 @@
+From aafa3512b7b742f5e66a5543e41974cc5e7eebfa Mon Sep 17 00:00:00 2001
+From: maxice8 <thinkabit.ukim@gmail.com>
+Date: Sun, 22 Jul 2018 18:54:17 -0300
+Subject: [PATCH] pcap-usb-linux.c: add missing limits.h for musl systems.
+
+fix compilation on musl libc systems like Void Linux and Alpine.
+
+Upstream-Status:
+Backport[https://github.com/the-tcpdump-group/libpcap/commit/d557c98a16dc254aaff03762b694fe624e180bea]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ pcap-usb-linux.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pcap-usb-linux.c b/pcap-usb-linux.c
+index 6f8adf65..b92c05ea 100644
+--- a/pcap-usb-linux.c
++++ b/pcap-usb-linux.c
+@@ -50,6 +50,7 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <string.h>
+ #include <dirent.h>
+ #include <byteswap.h>
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch b/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch
deleted file mode 100644
index 032b265f05..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/0002-Add-missing-compiler_state_t-parameter.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 50ec0a088d5924a8305b2d70dcba71b0942dee1a Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 17 Nov 2016 09:47:29 -0200
-Subject: [PATCH 2/2] Add missing compiler_state_t parameter
-Organization: O.S. Systems Software LTDA.
-
-Fix error:
-
-/
-|../libpcap-1.8.1/gencode.c: In function 'gen_gateway':
-|../libpcap-1.8.1/gencode.c:4914:13: error: 'cstate' undeclared
-| (first use in this function)
-|    bpf_error(cstate, "direction applied to 'gateway'");
-\
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/the-tcpdump-group/libpcap/pull/541
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- gencode.c | 15 ++++++++-------
- 1 file changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/gencode.c b/gencode.c
-index e103c70..f07c0be 100644
---- a/gencode.c
-+++ b/gencode.c
-@@ -523,7 +523,7 @@ static struct block *gen_host6(compiler_state_t *, struct in6_addr *,
-     struct in6_addr *, int, int, int);
- #endif
- #ifndef INET6
--static struct block *gen_gateway(const u_char *, bpf_u_int32 **, int, int);
-+static struct block *gen_gateway(compiler_state_t *, const u_char *, bpf_u_int32 **, int, int);
- #endif
- static struct block *gen_ipfrag(compiler_state_t *);
- static struct block *gen_portatom(compiler_state_t *, int, bpf_int32);
-@@ -4904,11 +4904,12 @@ gen_host6(compiler_state_t *cstate, struct in6_addr *addr,
- 
- #ifndef INET6
- static struct block *
--gen_gateway(eaddr, alist, proto, dir)
--	const u_char *eaddr;
--	bpf_u_int32 **alist;
--	int proto;
--	int dir;
-+gen_gateway(cstate, eaddr, alist, proto, dir)
-+    compiler_state_t *cstate;
-+    const u_char *eaddr;
-+    bpf_u_int32 **alist;
-+    int proto;
-+    int dir;
- {
- 	struct block *b0, *b1, *tmp;
- 
-@@ -6472,7 +6473,7 @@ gen_scode(compiler_state_t *cstate, const char *name, struct qual q)
- 		alist = pcap_nametoaddr(name);
- 		if (alist == NULL || *alist == NULL)
- 			bpf_error(cstate, "unknown host '%s'", name);
--		b = gen_gateway(eaddr, alist, proto, dir);
-+		b = gen_gateway(cstate, eaddr, alist, proto, dir);
- 		free(eaddr);
- 		return b;
- #else
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch b/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
deleted file mode 100644
index 7e1eea6b1e..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Disable bits of remote capture support inherited from the WinPCAP merge
-which cause applications to FTBFS if they define HAVE_REMOTE.
-
-Patch from:
-https://anonscm.debian.org/cgit/users/rfrancoise/libpcap.git/commit/?
-id=f35949969269dfdcc3549b12fade604755e1e326
-
-Upstream-Status: Pending
-
---- a/pcap/pcap.h
-+++ b/pcap/pcap.h
-@@ -506,6 +506,11 @@
-   #define MODE_STAT 1
-   #define MODE_MON 2
- 
-+#ifdef HAVE_REMOTE
-+  /* Includes most of the public stuff that is needed for the remote capture */
-+  #include <remote-ext.h>
-+#endif	 /* HAVE_REMOTE */
-+
- #elif defined(MSDOS)
- 
-   /*
-@@ -526,11 +531,6 @@
- 
- #endif /* _WIN32/MSDOS/UN*X */
- 
--#ifdef HAVE_REMOTE
--  /* Includes most of the public stuff that is needed for the remote capture */
--  #include <remote-ext.h>
--#endif	 /* HAVE_REMOTE */
--
- #ifdef __cplusplus
- }
- #endif
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch b/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
deleted file mode 100644
index f40e655c44..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Fix a missing dependency that can result in:
-
-../libpcap-1.8.1/grammar.y:78:10: fatal error: scanner.h: No such file or directory
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 0dd90a6bdbce4dca14106859eee63ef643a106e2 Mon Sep 17 00:00:00 2001
-From: Alfredo Alvarez Fernandez <alfredoalvarezernandez@gmail.com>
-Date: Tue, 21 Feb 2017 11:41:43 +0100
-Subject: [PATCH] Makefile.in: Fix missing dependency
-
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 7044f043..f5d443ae 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -465,7 +465,7 @@ grammar.h: grammar.c
- 		$(MAKE) $(MAKEFLAGS) grammar.c; \
- 	fi
- 
--grammar.o: grammar.c
-+grammar.o: grammar.c scanner.h
- 	$(CC) $(FULL_CFLAGS) -c grammar.c
- 
- gencode.o: $(srcdir)/gencode.c grammar.h scanner.h
diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
deleted file mode 100644
index afaa3bea9b..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 2796129af52901dd68595e5e88a639308541def9 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 3 Nov 2016 17:56:29 -0200
-Subject: [PATCH] libpcap: pkgconfig support
-Organization: O.S. Systems Software LTDA.
-
-Adding basic structure to support pkg-config.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- Makefile.in   |  5 +++++
- configure.ac  |  1 +
- libpcap.pc.in | 10 ++++++++++
- 3 files changed, 16 insertions(+)
- create mode 100644 libpcap.pc.in
-
-diff --git a/Makefile.in b/Makefile.in
-index e71d973..d7004ed 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -61,6 +61,10 @@ V_RPATH_OPT = @V_RPATH_OPT@
- DEPENDENCY_CFLAG = @DEPENDENCY_CFLAG@
- PROG=libpcap
- 
-+# pkgconfig support
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = libpcap.pc
-+
- # Standard CFLAGS
- FULL_CFLAGS = $(CCOPT) $(INCLS) $(DEFS) $(CFLAGS)
- 
-@@ -286,6 +290,7 @@ EXTRA_DIST = \
- 	lbl/os-solaris2.h \
- 	lbl/os-sunos4.h \
- 	lbl/os-ultrix4.h \
-+	libpcap.pc \
- 	missing/getopt.c \
- 	missing/getopt.h \
- 	missing/snprintf.c \
-diff --git a/configure.ac b/configure.ac
-index da2f940..4fc67bf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1805,6 +1805,7 @@ fi
- AC_PROG_INSTALL
- 
- AC_CONFIG_HEADER(config.h)
-+AC_CONFIG_FILES([libpcap.pc])
- 
- AC_OUTPUT_COMMANDS([if test -f .devel; then
- 	echo timestamp > stamp-h
-diff --git a/libpcap.pc.in b/libpcap.pc.in
-new file mode 100644
-index 0000000..4f78ad8
---- /dev/null
-+++ b/libpcap.pc.in
-@@ -0,0 +1,10 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+Name: libpcap
-+Description: System-independent interface for user-level packet capture.
-+Version: @VERSION@
-+Libs: -L${libdir} -lpcap
-+Cflags: -I${includedir}
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
deleted file mode 100644
index 13dfbd67a8..0000000000
--- a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require libpcap.inc
-
-SRC_URI += " \
-    file://libpcap-pkgconfig-support.patch \
-    file://0001-Fix-compiler_state_t.ai-usage-when-INET6-is-not-defi.patch \
-    file://0002-Add-missing-compiler_state_t-parameter.patch \
-    file://disable-remote.patch \
-    file://fix-grammar-deps.patch \
-"
-
-SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
-SRC_URI[sha256sum] = "673dbc69fdc3f5a86fb5759ab19899039a8e5e6c631749e48dcd9c6f0c83541e"
-
-#
-# make install doesn't cover the shared lib
-# make install-shared is just broken (no symlinks)
-#
-
-do_configure_prepend () {
-    #remove hardcoded references to /usr/include
-    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.ac
-}
-
-do_install_prepend () {
-    install -d ${D}${libdir}
-    install -d ${D}${bindir}
-    oe_runmake install-shared DESTDIR=${D}
-    oe_libinstall -a -so libpcap ${D}${libdir}
-    sed "s|@VERSION@|${PV}|" -i ${B}/libpcap.pc
-    install -D -m 0644 libpcap.pc ${D}${libdir}/pkgconfig/libpcap.pc
-}
diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
similarity index 58%
rename from meta/recipes-connectivity/libpcap/libpcap.inc
rename to meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
index e57ea87b37..78361561e6 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.9.0.bb
@@ -10,33 +10,36 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5eb289217c160e2920d2e35bddc36453 \
                     file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
-INC_PR = "r5"
+SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.gz \
+           file://0001-pcap-usb-linux.c-add-missing-limits.h-for-musl-syste.patch \
+           "
+SRC_URI[md5sum] = "dffd65cb14406ab9841f421732eb0f33"
+SRC_URI[sha256sum] = "2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019"
 
-SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz"
+inherit autotools binconfig-disabled pkgconfig bluetooth
 
 BINCONFIG = "${bindir}/pcap-config"
 
-inherit autotools binconfig-disabled pkgconfig bluetooth
-
-EXTRA_OECONF = "--with-pcap=linux"
+# Explicitly disable dag support. We don't have recipe for it and if enabled here,
+# configure script poisons the include dirs with /usr/local/include even when the
+# support hasn't been detected.
+EXTRA_OECONF = " \
+                 --with-pcap=linux \
+                 --without-dag \
+                 "
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
-# Add a dummy PACKAGECONFIG for bluez5 since it is not supported by libpcap.
-PACKAGECONFIG[bluez5] = ",,"
+PACKAGECONFIG[bluez5] = "--enable-bluetooth,--disable-bluetooth,bluez5"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
 
-CPPFLAGS_prepend = "-I${S} "
-CFLAGS_prepend = "-I${S} "
-CXXFLAGS_prepend = "-I${S} "
-
 do_configure_prepend () {
-    sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
+    #remove hardcoded references to /usr/include
+    sed 's|\([ "^'\''I]\+\)/usr/include/|\1${STAGING_INCDIR}/|g' -i ${S}/configure.ac
 }
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


