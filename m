Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2006011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 01:28:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O1SlYP013206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:28:47 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 23 Aug 2016 18:28:46 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2016 09:27:08 +0800
Message-ID: <178489d6a8f8ed3283d92eac959107ce81148878.1472001956.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472001956.git.kai.kang@windriver.com>
References: <cover.1472001956.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dhcp: build shared libraries
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
X-List-Received-Date: Wed, 24 Aug 2016 01:28:47 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable bind threads support, it fails to compile dhcp:

| tmp/work/armv5e-poky-linux-gnueabi/bind/9.10.3-P3-r0/build/lib/isc/pthreads/../../../../bind-9.10.3-P3/lib/isc/pthreads/thread.c:64: undefined reference to `pthread_create'

Enable build shared libraries for bind and dhcp to fix the build failure.
And the patch is ported from Fedora.

Add sub-package dhcp-libs to package shared libraries.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |   6 +-
 .../dhcp/dhcp/build-shared-libs.patch              | 186 +++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb       |   1 +
 3 files changed, 191 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index aafdd0a..969fdcb 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -46,7 +46,7 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
                 --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
                 --with-libbind=${STAGING_LIBDIR}/ \
-                --enable-paranoia \
+                --enable-paranoia --disable-static \
                 --with-randomdev=/dev/random \
                "
 
@@ -82,12 +82,14 @@ do_install_append () {
        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
 }
 
-PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
+PACKAGES += "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
 
 FILES_${PN} = ""
 RDEPENDS_${PN}-dev = ""
 RDEPENDS_${PN}-staticdev = ""
 
+FILES_${PN}-libs = "${libdir}/libdhcpctl.so.0* ${libdir}/libomapi.so.0*"
+
 FILES_${PN}-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
 RRECOMMENDS_${PN}-server = "dhcp-server-config"
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch b/meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch
new file mode 100644
index 0000000..0b3d6e4
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/build-shared-libs.patch
@@ -0,0 +1,186 @@
+Upstream-Status: Pending
+
+Port patches from Fedora to build shared libs rather than static libs.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/client/Makefile.am b/client/Makefile.am
+index 84d8131..e776bf0 100644
+--- a/client/Makefile.am
++++ b/client/Makefile.am
+@@ -15,7 +15,7 @@ dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
+ 		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
+ 		   scripts/netbsd scripts/nextstep scripts/openbsd \
+ 		   scripts/solaris scripts/openwrt
+-dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
+-		 $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
++dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
++		  -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+ man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
+ EXTRA_DIST = $(man_MANS)
+diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
+index 05cd9c1..ab7a5a3 100644
+--- a/common/tests/Makefile.am
++++ b/common/tests/Makefile.am
+@@ -15,26 +15,23 @@ ATF_TESTS += alloc_unittest dns_unittest misc_unittest ns_name_unittest
+ alloc_unittest_SOURCES = test_alloc.c $(top_srcdir)/tests/t_api_dhcp.c
+ alloc_unittest_LDADD = $(ATF_LDFLAGS)
+ alloc_unittest_LDADD += ../libdhcp.a  \
+-	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
+-	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
++	../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
+ 
+ dns_unittest_SOURCES = dns_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
+ dns_unittest_LDADD = $(ATF_LDFLAGS)
+ dns_unittest_LDADD += ../libdhcp.a  \
+-	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
+-	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
++	../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
+ 
+ misc_unittest_SOURCES = misc_unittest.c $(top_srcdir)/tests/t_api_dhcp.c
+ misc_unittest_LDADD = $(ATF_LDFLAGS)
+ misc_unittest_LDADD += ../libdhcp.a  \
+-	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
+-	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
++	../../omapip/libomapi.la -L$(BINDLIBDIR) -ldns -lisccfg -lisc
+ 
+ ns_name_unittest_SOURCES = ns_name_test.c $(top_srcdir)/tests/t_api_dhcp.c
+ ns_name_unittest_LDADD = $(ATF_LDFLAGS)
+ ns_name_unittest_LDADD += ../libdhcp.a  \
+-	../../omapip/libomapi.a $(BINDLIBDIR)/libirs.a \
+-	$(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a  $(BINDLIBDIR)/libisc.a
++	../../omapip/libomapi.a -L$(BINDLIBDIR) \
++	-ldns -lisccfg -lisc
+ 
+ check: $(ATF_TESTS)
+ 	-cp -n $(top_srcdir)/common/tests/Atffile Atffile
+diff --git a/configure.ac b/configure.ac
+index 1684df1..dadc3f1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -47,16 +47,8 @@ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
+ # Use this to define _GNU_SOURCE to pull in the IPv6 Advanced Socket API.
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+-AC_PROG_RANLIB
+-
+-AC_PATH_PROG(AR, ar)
+-AC_SUBST(AR)
+-
+-if test "X$AR" = "X"; then
+-	AC_MSG_ERROR([
+-ar program not found.  Please fix your PATH to include the directory in
+-which ar resides, or set AR in the environment with the full path to ar.])
+-fi
++# Use libtool to simplify building of shared libraries
++AC_PROG_LIBTOOL
+ 
+ AC_CONFIG_HEADERS([includes/config.h])
+ 
+diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
+index 9b2486e..784cdf7 100644
+--- a/dhcpctl/Makefile.am
++++ b/dhcpctl/Makefile.am
+@@ -3,19 +3,17 @@ BINDLIBDIR = @BINDDIR@
+ AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
+ 
+ bin_PROGRAMS = omshell
+-lib_LIBRARIES = libdhcpctl.a
++lib_LTLIBRARIES = libdhcpctl.la
+ noinst_PROGRAMS = cltest
+ man_MANS = omshell.1 dhcpctl.3
+ EXTRA_DIST = $(man_MANS)
+ 
+ omshell_SOURCES = omshell.c
+-omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	        $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
+-	        $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
++omshell_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
++	        -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+ 
+-libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
++libdhcpctl_la_SOURCES = dhcpctl.c callback.c remote.c
+ 
+ cltest_SOURCES = cltest.c
+-cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	       $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
+-               $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
++cltest_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
++	       -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+diff --git a/omapip/Makefile.am b/omapip/Makefile.am
+index e4a8599..c0c7a1e 100644
+--- a/omapip/Makefile.am
++++ b/omapip/Makefile.am
+@@ -1,10 +1,10 @@
+ BINDLIBDIR = @BINDDIR@
+ AM_CPPFLAGS = -I$(top_srcdir)/includes
+ 
+-lib_LIBRARIES = libomapi.a
++lib_LTLIBRARIES = libomapi.la
+ noinst_PROGRAMS = svtest
+ 
+-libomapi_a_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
++libomapi_la_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
+ 		     errwarn.c listener.c dispatch.c generic.c support.c \
+ 		     handle.c message.c convert.c hash.c auth.c inet_addr.c \
+ 		     array.c trace.c toisc.c iscprint.c isclib.c
+@@ -13,6 +13,5 @@ man_MANS = omapi.3
+ EXTRA_DIST = $(man_MANS)
+ 
+ svtest_SOURCES = test.c
+-svtest_LDADD = libomapi.a $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
+-		$(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
++svtest_LDADD = libomapi.la -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+ 
+diff --git a/relay/Makefile.am b/relay/Makefile.am
+index b3bf578..f47009f 100644
+--- a/relay/Makefile.am
++++ b/relay/Makefile.am
+@@ -4,9 +4,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+ 
+ sbin_PROGRAMS = dhcrelay
+ dhcrelay_SOURCES = dhcrelay.c
+-dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 $(BINDLIBDIR)/libirs.a $(BINDLIBDIR)/libdns.a \
+-		 $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
++dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
++		 -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+ man_MANS = dhcrelay.8
+ EXTRA_DIST = $(man_MANS)
+ 
+diff --git a/server/Makefile.am b/server/Makefile.am
+index b5d8c2d..d7f876d 100644
+--- a/server/Makefile.am
++++ b/server/Makefile.am
+@@ -15,10 +15,9 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
+ 		dhcpv6.c mdb6.c ldap.c ldap_casa.c leasechain.c ldap_krb_helper.c
+ 
+ dhcpd_CFLAGS = $(LDAP_CFLAGS)
+-dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-	      ../dhcpctl/libdhcpctl.a $(BINDLIBDIR)/libirs.a \
+-	      $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a \
+-	      $(BINDLIBDIR)/libisc.a $(LDAP_LIBS)
++dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.la \
++	      ../dhcpctl/libdhcpctl.la -L$(BINDLIBDIR) \
++	      -lirs -ldns -lisccfg -lisc $(LDAP_LIBS)
+ 
+ man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
+ EXTRA_DIST = $(man_MANS)
+diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
+index 2892309..056978b 100644
+--- a/server/tests/Makefile.am
++++ b/server/tests/Makefile.am
+@@ -19,10 +19,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpars.c ../db.c ../class.c      \
+           ../ddns.c ../dhcpleasequery.c ../dhcpv6.c ../mdb6.c        \
+           ../ldap.c ../ldap_casa.c ../dhcpd.c ../leasechain.c
+ 
+-DHCPLIBS = $(top_builddir)/common/libdhcp.a $(top_builddir)/omapip/libomapi.a \
+-          $(top_builddir)/dhcpctl/libdhcpctl.a $(BINDLIBDIR)/libirs.a \
+-	  $(BINDLIBDIR)/libdns.a $(BINDLIBDIR)/libisccfg.a \
+-	  $(BINDLIBDIR)/libisc.a
++DHCPLIBS = $(top_builddir)/common/libdhcp.a $(top_builddir)/omapip/libomapi.la \
++          $(top_builddir)/dhcpctl/libdhcpctl.la \
++          -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
+ 
+ ATF_TESTS =
+ if HAVE_ATF
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
index 4151eb1..587e0cf 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://libxml2-configure-argument.patch \
             file://tweak-to-support-external-bind.patch \
             file://remove-dhclient-script-bash-dependency.patch \
+            file://build-shared-libs.patch \
            "
 
 SRC_URI[md5sum] = "0138319fe2b788cf4bdf34fbeaf9ff54"
-- 
2.9.3


