Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id F1C026C260
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 21:48:02 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r9-v6so6323667pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 13:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=T0eQrFZoPr07InHtNWwfpyyu8REHzu/CubVYGV714Eg=;
	b=nC26EzB4O1w1Ih86z0aFfWWOwdY9I1GfQx0O1sOcKtyIOjW6IEnQEULvsSmmtwdMgk
	qpjA/cvQdTiPOT3EWVQB7JAIFLDx/TZ3SOz4LhytQommP37fIth+q7+d55YIf/HRUZZn
	3vbnbj9CL9mo3u3cdJNkSZOOViQELzwezDrxKgmAw9z2lW3SSRLdZPR9zxTDf7/Nx/aE
	CCcYxLyyooVf+HaN/PrU8mmBtm7NuMg2WRoybkyqBOtH6IMXGKspjeqJKdfjQuPEfWcl
	rJijJLrOZgde+F++ORFDdDbURI1LDEaIeytN5jsVPyk9hdA26mAIzK28Z1KFme8B2kpF
	xC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T0eQrFZoPr07InHtNWwfpyyu8REHzu/CubVYGV714Eg=;
	b=O0sqy4PEnACtgFd9VWaHAMW+ucus+ptqeowL6omOtSh9RfDzGWU7gBvZzDbUS0pfNi
	aEf5isMkZHFDutloCvQkw7/jDEjP9bZ+G2GJ4VTFItEfLvCAby62RfCHGPAYvd9zD47p
	f+RoSoCutOHxh3MXzANRc/WoqE5HJ5A8IKBbFu8Nnf06aYTixh9g5kLE6wOwY/oTjSHp
	S6jTkWN8BKZ2jRTPCyuyCVnEO652/ye/MH5he1nHC8px3tjjJioORkCVKQEdUQDD9Nww
	EjzkQ1i0UhwbPXZ3OXi5Hy5U9EUBaGV90ihSfIczd/lwjxcD9L+Xw5J0dkNZtFI7134S
	qyiA==
X-Gm-Message-State: AGRZ1gKwCpbXGrUrkNSTA77WBcWwQ28BP9X1Ed42THrTVudm1Swi+a3F
	ZveP7HlhD+TrBjBiOXsG7YSerwxg
X-Google-Smtp-Source: AJdET5cG6Ql5EatP54qqC7tPulhv+3wOIgVfLEaJlX0BzZPMLj7QTX13HdwlrmEbFVw/k31NLWLqkA==
X-Received: by 2002:a62:e30a:: with SMTP id
	g10-v6mr6858793pfh.151.1542145683504; 
	Tue, 13 Nov 2018 13:48:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:75ee:9e74:d500:909d])
	by smtp.gmail.com with ESMTPSA id
	h10sm20085272pgn.11.2018.11.13.13.48.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Nov 2018 13:48:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 13:48:01 -0800
Message-Id: <1542145681-29392-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [sumo][PATCH] dhcp: allow for excluding the external bind
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
X-List-Received-Date: Tue, 13 Nov 2018 21:48:03 -0000

There is a known issue when using ISC DHCP alongside bind 9.10. DHCP uses libraries
provided by bind and there is a bug which results in dhcpd/dhclient not
running in the background and not responding to sigterm.

The issue was first reported in 02/2015 by the fedora team here:

https://lists.isc.org/pipermail/bind-users/2015-February/094636.html

and as of 02/2018 it is still unresolved:

https://bugzilla.redhat.com/show_bug.cgi?id=1457871

Fedora's workaround seems to consist of providing working libraries from the bind 9.9
package just for DHCP.

added 'ext-bind' in PACKACGECONFIG
added notes on how to enable the workaround
refreshed patches too

[ Yocto # 12744 ]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  3 +-
 .../dhcp/0008-tweak-to-support-external-bind.patch | 69 +++++++++---------
 .../dhcp/dhcp/0010-build-shared-libs.patch         | 83 +++++++++++-----------
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       | 17 ++++-
 4 files changed, 89 insertions(+), 83 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index e943707..44e946c 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.isc.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1753"
 
-DEPENDS = "openssl bind"
+DEPENDS = "openssl"
 
 SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
@@ -48,7 +48,6 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
                 --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
                 --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
-                --with-libbind=${STAGING_LIBDIR}/ \
                 --enable-paranoia --disable-static \
                 --with-randomdev=/dev/random \
                "
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
index 006d18a..a20b5f9 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0008-tweak-to-support-external-bind.patch
@@ -20,10 +20,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  server/tests/Makefile.am | 2 +-
  8 files changed, 8 insertions(+), 8 deletions(-)
 
-diff --git a/client/Makefile.am b/client/Makefile.am
-index 4730bb3..84d8131 100644
---- a/client/Makefile.am
-+++ b/client/Makefile.am
+Index: dhcp-4.3.6/client/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/client/Makefile.am
++++ dhcp-4.3.6/client/Makefile.am
 @@ -4,7 +4,7 @@
  # production code. Sadly, we are not there yet.
  SUBDIRS = . tests
@@ -33,10 +33,10 @@ index 4730bb3..84d8131 100644
  
  AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
  	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
-diff --git a/client/tests/Makefile.am b/client/tests/Makefile.am
-index 5031d0c..a8dfd26 100644
---- a/client/tests/Makefile.am
-+++ b/client/tests/Makefile.am
+Index: dhcp-4.3.6/client/tests/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/client/tests/Makefile.am
++++ dhcp-4.3.6/client/tests/Makefile.am
 @@ -1,6 +1,6 @@
  SUBDIRS = .
  
@@ -45,10 +45,10 @@ index 5031d0c..a8dfd26 100644
  
  AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
  AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
-diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index f6a43e4..2f98d22 100644
---- a/common/tests/Makefile.am
-+++ b/common/tests/Makefile.am
+Index: dhcp-4.3.6/common/tests/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/common/tests/Makefile.am
++++ dhcp-4.3.6/common/tests/Makefile.am
 @@ -1,6 +1,6 @@
  SUBDIRS = .
  
@@ -57,40 +57,40 @@ index f6a43e4..2f98d22 100644
  
  AM_CPPFLAGS = $(ATF_CFLAGS) -I$(top_srcdir)/includes
  
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index ba8dd8b..9b2486e 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
+Index: dhcp-4.3.6/dhcpctl/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/dhcpctl/Makefile.am
++++ dhcp-4.3.6/dhcpctl/Makefile.am
 @@ -1,4 +1,4 @@
 -BINDLIBDIR = @BINDDIR@/lib
 +BINDLIBDIR = @BINDDIR@
  
  AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
  
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index dd1afa0..e4a8599 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
+Index: dhcp-4.3.6/omapip/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/omapip/Makefile.am
++++ dhcp-4.3.6/omapip/Makefile.am
 @@ -1,4 +1,4 @@
 -BINDLIBDIR = @BINDDIR@/lib
 +BINDLIBDIR = @BINDDIR@
  AM_CPPFLAGS = -I$(top_srcdir)/includes
  
- lib_LIBRARIES = libomapi.a
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index 6d652f6..b3bf578 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
+ lib_LTLIBRARIES = libomapi.la
+Index: dhcp-4.3.6/relay/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/relay/Makefile.am
++++ dhcp-4.3.6/relay/Makefile.am
 @@ -1,4 +1,4 @@
 -BINDLIBDIR = @BINDDIR@/lib
 +BINDLIBDIR = @BINDDIR@
  
  AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
  
-diff --git a/server/Makefile.am b/server/Makefile.am
-index 3990b9c..b5d8c2d 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
+Index: dhcp-4.3.6/server/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/server/Makefile.am
++++ dhcp-4.3.6/server/Makefile.am
 @@ -4,7 +4,7 @@
  # production code. Sadly, we are not there yet.
  SUBDIRS = . tests
@@ -100,10 +100,10 @@ index 3990b9c..b5d8c2d 100644
  
  AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
  
-diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index a87c5e7..9821081 100644
---- a/server/tests/Makefile.am
-+++ b/server/tests/Makefile.am
+Index: dhcp-4.3.6/server/tests/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/server/tests/Makefile.am
++++ dhcp-4.3.6/server/tests/Makefile.am
 @@ -1,6 +1,6 @@
  SUBDIRS = .
  
@@ -112,6 +112,3 @@ index a87c5e7..9821081 100644
  
  AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
  AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
index f128731..898b1fc 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0010-build-shared-libs.patch
@@ -23,11 +23,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  server/tests/Makefile.am |  7 +++----
  8 files changed, 26 insertions(+), 43 deletions(-)
 
-diff --git a/client/Makefile.am b/client/Makefile.am
-index 84d8131..e776bf0 100644
---- a/client/Makefile.am
-+++ b/client/Makefile.am
-@@ -15,7 +15,7 @@ dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
+Index: dhcp-4.3.6/client/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/client/Makefile.am
++++ dhcp-4.3.6/client/Makefile.am
+@@ -15,7 +15,7 @@ dhclient_SOURCES = $(srcdir)/clparse.c $
  		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
  		   scripts/netbsd scripts/nextstep scripts/openbsd \
  		   scripts/solaris scripts/openwrt
@@ -37,11 +37,11 @@ index 84d8131..e776bf0 100644
 +		  -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
  man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
  EXTRA_DIST = $(man_MANS)
-diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
-index 2f98d22..8745e88 100644
---- a/common/tests/Makefile.am
-+++ b/common/tests/Makefile.am
-@@ -15,26 +15,23 @@ ATF_TESTS += alloc_unittest dns_unittest misc_unittest ns_name_unittest
+Index: dhcp-4.3.6/common/tests/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/common/tests/Makefile.am
++++ dhcp-4.3.6/common/tests/Makefile.am
+@@ -15,26 +15,23 @@ ATF_TESTS += alloc_unittest dns_unittest
  alloc_unittest_SOURCES = test_alloc.c $(top_srcdir)/tests/t_api_dhcp.c
  alloc_unittest_LDADD = $(ATF_LDFLAGS)
  alloc_unittest_LDADD += ../libdhcp.a  \
@@ -73,11 +73,11 @@ index 2f98d22..8745e88 100644
  
  check: $(ATF_TESTS)
  	@if test $(top_srcdir) != ${top_builddir}; then \
-diff --git a/configure.ac b/configure.ac
-index 8e9f509..bfe988a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -47,16 +47,8 @@ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
+Index: dhcp-4.3.6/configure.ac
+===================================================================
+--- dhcp-4.3.6.orig/configure.ac
++++ dhcp-4.3.6/configure.ac
+@@ -47,16 +47,8 @@ AM_CONDITIONAL(CROSS_COMPILING, test "$c
  # Use this to define _GNU_SOURCE to pull in the IPv6 Advanced Socket API.
  AC_USE_SYSTEM_EXTENSIONS
  
@@ -96,11 +96,11 @@ index 8e9f509..bfe988a 100644
  
  AC_CONFIG_HEADERS([includes/config.h])
  
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index 9b2486e..784cdf7 100644
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -3,19 +3,17 @@ BINDLIBDIR = @BINDDIR@
+Index: dhcp-4.3.6/dhcpctl/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/dhcpctl/Makefile.am
++++ dhcp-4.3.6/dhcpctl/Makefile.am
+@@ -3,19 +3,17 @@ BINDLIBDIR = @BINDDIR@/lib
  AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
  
  bin_PROGRAMS = omshell
@@ -126,12 +126,12 @@ index 9b2486e..784cdf7 100644
 -               $(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
 +cltest_LDADD = libdhcpctl.la ../common/libdhcp.a ../omapip/libomapi.la \
 +	       -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index e4a8599..c0c7a1e 100644
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
+Index: dhcp-4.3.6/omapip/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/omapip/Makefile.am
++++ dhcp-4.3.6/omapip/Makefile.am
 @@ -1,10 +1,10 @@
- BINDLIBDIR = @BINDDIR@
+ BINDLIBDIR = @BINDDIR@/lib
  AM_CPPFLAGS = -I$(top_srcdir)/includes
  
 -lib_LIBRARIES = libomapi.a
@@ -151,11 +151,11 @@ index e4a8599..c0c7a1e 100644
 -		$(BINDLIBDIR)/libisccfg.a $(BINDLIBDIR)/libisc.a
 +svtest_LDADD = libomapi.la -L$(BINDLIBDIR) -lirs -ldns -lisccfg -lisc
  
-diff --git a/relay/Makefile.am b/relay/Makefile.am
-index b3bf578..f47009f 100644
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -4,9 +4,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+Index: dhcp-4.3.6/relay/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/relay/Makefile.am
++++ dhcp-4.3.6/relay/Makefile.am
+@@ -4,9 +4,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localst
  
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
@@ -167,11 +167,11 @@ index b3bf578..f47009f 100644
  man_MANS = dhcrelay.8
  EXTRA_DIST = $(man_MANS)
  
-diff --git a/server/Makefile.am b/server/Makefile.am
-index b5d8c2d..d7f876d 100644
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -15,10 +15,9 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
+Index: dhcp-4.3.6/server/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/server/Makefile.am
++++ dhcp-4.3.6/server/Makefile.am
+@@ -15,10 +15,9 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c c
  		dhcpv6.c mdb6.c ldap.c ldap_casa.c leasechain.c ldap_krb_helper.c
  
  dhcpd_CFLAGS = $(LDAP_CFLAGS)
@@ -185,11 +185,11 @@ index b5d8c2d..d7f876d 100644
  
  man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
  EXTRA_DIST = $(man_MANS)
-diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
-index 9821081..de95872 100644
---- a/server/tests/Makefile.am
-+++ b/server/tests/Makefile.am
-@@ -19,10 +19,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpars.c ../db.c ../class.c      \
+Index: dhcp-4.3.6/server/tests/Makefile.am
+===================================================================
+--- dhcp-4.3.6.orig/server/tests/Makefile.am
++++ dhcp-4.3.6/server/tests/Makefile.am
+@@ -19,10 +19,9 @@ DHCPSRC = ../dhcp.c ../bootp.c ../confpa
            ../ddns.c ../dhcpleasequery.c ../dhcpv6.c ../mdb6.c        \
            ../ldap.c ../ldap_casa.c ../dhcpd.c ../leasechain.c
  
@@ -203,6 +203,3 @@ index 9821081..de95872 100644
  
  ATF_TESTS =
  if HAVE_ATF
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
index cc13549..8b30579 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
@@ -7,7 +7,6 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-Rea.patch \
             file://0006-site.h-enable-gentle-shutdown.patch \
             file://0007-Add-configure-argument-to-make-the-libxml2-dependenc.patch \
-            file://0008-tweak-to-support-external-bind.patch \
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0010-build-shared-libs.patch \
             file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
@@ -15,8 +14,22 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://CVE-2017-3144.patch \
            "
 
+# use internal libisc libraries which are based on bind 9.9.11 - there
+# is a bug in bind 9.10.x (normally supplied by OE) that prevents
+# dhcpd/dhclient from shutting down cleanly on sigterm and from running
+# in the background
+#
+# [https://bugzilla.yoctoproject.org/show_bug.cgi?id=12744]
+#
+# remove "ext-bind" and
+# also set PARALLEL_MAKE = "" 
+# [ Yocto 12744 ]
+#
+SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'ext-bind', 'file://0008-tweak-to-support-external-bind.patch', '', d)}"
+
 SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
 SRC_URI[sha256sum] = "a41eaf6364f1377fe065d35671d9cf82bbbc8f21207819b2b9f33f652aec6f1b"
 
-PACKAGECONFIG ?= ""
+PACKAGECONFIG ?= "ext-bind"
 PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
+PACKAGECONFIG[ext-bind] = "--with-libbind=${STAGING_LIBDIR}, --without-libbind, bind"
-- 
2.7.4


