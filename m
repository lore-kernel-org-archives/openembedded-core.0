Received: from mail-qa0-f43.google.com ([209.85.216.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UHMm9-0000Tp-0X
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 00:14:09 +0100
Received: by mail-qa0-f43.google.com with SMTP id dx4so1347522qab.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 15:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=BUyhkDsMkUDdyDlhMCUeAxTPnw9QKgkrTPKKcp7M1LU=;
	b=xeILbJuZpifAbTo6/x+NW3HZWfLXG3ykS/5J4c0PVDh9evqftB48UNodSBiSdeoG+d
	v+4RL+ONK1ulosNbrWFigjZ0u4kZtjS5wMxIkG4kJlTVQ0H4Os/ziXoJYtDLYTQ7Y58H
	Y4Chf7y3wBIbPsIAZwspnq6BKYh3mk0mYhD/9T45pstmPzzXoNdi453lI+i7HA6ssTl4
	z0DiMTugJJA8u8CP4Czn5g0/4b6Pn0LmWKtzFzvpicOxMxgRZe2vZPJL+HW1tdzDzBq7
	AC/1qpaomSZVSVpTCzGv5ySb6fy7bsBsCPl8DXFxd1lJgO9CibR251zQyiZm8ZvlSoki
	Kfuw==
X-Received: by 10.224.122.140 with SMTP id l12mr11808388qar.77.1363561033596; 
	Sun, 17 Mar 2013 15:57:13 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id hn9sm28724644qab.8.2013.03.17.15.57.11
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Mar 2013 15:57:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Mar 2013 15:56:24 -0700
Message-Id: <1363560984-11493-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] iptables: Turn ipv6 and libnfnetlink support into PACKAGECONFIG
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
X-List-Received-Date: Sun, 17 Mar 2013 23:14:09 -0000

Detection of libnfnetlink is automatic in configure which means
that when you have meta-networking in your cosmos, it would create
a race condition where if libnfnetlink is already staged then it
will be enabled otherwise disabled. The issue happens quite often
with sstate and high parallelism. Since the dependency libnfnetlink
is not part of OE-Core, this patch turns it into a PACKAGECONFIG
which is diabled by default and iptables is patched to provide
the knob.

If you want to enable libnfnetlink support then it can be done
in a bbappend where you are sure that you are also including
meta-networking in your distro.

While at it also turned ipv6 support into packageconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Add-option-to-enable-disable-libnfnetlink.patch |   47 ++++++++++++++++++++
 meta/recipes-extended/iptables/iptables_1.4.17.bb  |   15 +++++--
 2 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch

diff --git a/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
new file mode 100644
index 0000000..ab609e2
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0001-configure-Add-option-to-enable-disable-libnfnetlink.patch
@@ -0,0 +1,47 @@
+From 5c47cf5061b852c02178f01e23690bfe38a99d93 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 17 Mar 2013 11:21:35 -0700
+Subject: [PATCH] configure: Add option to enable/disable libnfnetlink
+
+This changes the configure behaviour from autodetecting
+for libnfnetlink to having an option to disable it explicitly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ configure.ac |   11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ba616ab..ce2d315 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -53,6 +53,9 @@ AC_ARG_ENABLE([libipq],
+ AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
+ 	[Path to the pkgconfig directory [[LIBDIR/pkgconfig]]]),
+ 	[pkgconfigdir="$withval"], [pkgconfigdir='${libdir}/pkgconfig'])
++AC_ARG_ENABLE([libnfnetlink],
++	AS_HELP_STRING([--disable-libnfnetlink], [Do not use netfilter netlink library]),
++	[enable_libnfnetlink="$enableval"], [enable_libnfnetlink="yes"])
+ 
+ libiptc_LDFLAGS2="";
+ AX_CHECK_LINKER_FLAGS([-Wl,--no-as-needed],
+@@ -89,9 +92,11 @@ AM_CONDITIONAL([ENABLE_LARGEFILE], [test "$enable_largefile" = "yes"])
+ AM_CONDITIONAL([ENABLE_DEVEL], [test "$enable_devel" = "yes"])
+ AM_CONDITIONAL([ENABLE_LIBIPQ], [test "$enable_libipq" = "yes"])
+ 
+-PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0],
+-	[nfnetlink=1], [nfnetlink=0])
+-AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "$nfnetlink" = 1])
++AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
++  PKG_CHECK_MODULES([libnfnetlink], [libnfnetlink >= 1.0])
++  ])
++
++AM_CONDITIONAL([HAVE_LIBNFNETLINK], [test "x$enable_libnfnetlink" = "xyes"])
+ 
+ regular_CFLAGS="-Wall -Waggregate-return -Wmissing-declarations \
+ 	-Wmissing-prototypes -Wredundant-decls -Wshadow -Wstrict-prototypes \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/iptables/iptables_1.4.17.bb b/meta/recipes-extended/iptables/iptables_1.4.17.bb
index f8ef7b6..aa932ce 100644
--- a/meta/recipes-extended/iptables/iptables_1.4.17.bb
+++ b/meta/recipes-extended/iptables/iptables_1.4.17.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
 
-PR = "r0"
+PR = "r1"
 
 RRECOMMENDS_${PN} = "kernel-module-x-tables \
                      kernel-module-ip-tables \
@@ -24,14 +24,23 @@ FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://fix-link-failure-ip6t-NETMAP.patch \
-           file://fix-iptables-extensions-build-error.patch"
+           file://fix-iptables-extensions-build-error.patch \
+           file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
+          "
 SRC_URI[md5sum] = "c3fb2ffd5b39d0d54b06ccc4c8660116"
 SRC_URI[sha256sum] = "51e7a769469383b6ad308a6a19cdd2bd813cf4593e21a156a543a1cd70554925"
 
 inherit autotools
 
 EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
-                ${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
+               "
+PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+                 "
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
+# libnfnetlink recipe is in meta-networking layer
+PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libnfnetlink"
 
 do_configure_prepend() {
 	# Remove some libtool m4 files
-- 
1.7.9.5



