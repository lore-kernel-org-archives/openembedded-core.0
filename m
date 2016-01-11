Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 181FA6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B0VU9w024677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 16:31:30 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:31 +0800
Message-ID: <3fdfae547db74bfec3668d0d640fabe9a3e1b373.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] dhcp: 4.3.2 -> 4.3.3
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:34 -0000
Content-Type: text/plain

- Rebase: fix-external-bind.patch and fixsepbuild.patch for 4.3.3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../dhcp/dhcp/fix-external-bind.patch              | 79 +++++++++++-----------
 .../dhcp/dhcp/fixsepbuild.patch                    | 19 ------
 .../dhcp/{dhcp_4.3.2.bb => dhcp_4.3.3.bb}          |  4 +-
 3 files changed, 43 insertions(+), 59 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.2.bb => dhcp_4.3.3.bb} (70%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
index a291fda..956c5d8 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
@@ -6,24 +6,25 @@ this patch is to allow building with external bind
 
 Signed-off-by: Qing He <qing.he@intel.com>
 
-Index: dhcp-4.3.0/Makefile.am
-===================================================================
---- dhcp-4.3.0.orig/Makefile.am
-+++ dhcp-4.3.0/Makefile.am
+Rebase the patch to 4.3.3
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+diff --git a/Makefile.am b/Makefile.am
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -25,7 +25,7 @@ EXTRA_DIST = RELNOTES LICENSE \
- 	     bind/Makefile bind/bind.tar.gz bind/version.tmp \
+ 	     bind/Makefile.in bind/bind.tar.gz bind/version.tmp \
  	     common/tests/Atffile server/tests/Atffile
  
--SUBDIRS = bind includes tests common dst omapip client dhcpctl relay server
-+SUBDIRS = includes tests common dst omapip client dhcpctl relay server
+-SUBDIRS = bind includes tests common omapip client dhcpctl relay server
++SUBDIRS = includes tests common omapip client dhcpctl relay server
  
  nobase_include_HEADERS = dhcpctl/dhcpctl.h
  
-Index: dhcp-4.3.0/client/Makefile.am
-===================================================================
---- dhcp-4.3.0.orig/client/Makefile.am
-+++ dhcp-4.3.0/client/Makefile.am
-@@ -4,8 +4,8 @@ dhclient_SOURCES = clparse.c dhclient.c
+diff --git a/client/Makefile.am b/client/Makefile.am
+--- a/client/Makefile.am
++++ b/client/Makefile.am
+@@ -10,8 +10,8 @@ dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
  		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
  		   scripts/netbsd scripts/nextstep scripts/openbsd \
  		   scripts/solaris scripts/openwrt
@@ -34,22 +35,20 @@ Index: dhcp-4.3.0/client/Makefile.am
  man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
  EXTRA_DIST = $(man_MANS)
  
-Index: dhcp-4.3.0/configure.ac
-===================================================================
---- dhcp-4.3.0.orig/configure.ac
-+++ dhcp-4.3.0/configure.ac
-@@ -566,6 +566,7 @@ no)
- 	libbind="$use_libbind"
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -623,6 +623,7 @@ no)
+ 	fi	
  	;;
  esac
 +AC_SUBST([libbind])
  
  # OpenLDAP support.
  AC_ARG_WITH(ldap,
-Index: dhcp-4.3.0/dhcpctl/Makefile.am
-===================================================================
---- dhcp-4.3.0.orig/dhcpctl/Makefile.am
-+++ dhcp-4.3.0/dhcpctl/Makefile.am
+diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
+--- a/dhcpctl/Makefile.am
++++ b/dhcpctl/Makefile.am
 @@ -6,12 +6,12 @@ EXTRA_DIST = $(man_MANS)
  
  omshell_SOURCES = omshell.c
@@ -67,10 +66,9 @@ Index: dhcp-4.3.0/dhcpctl/Makefile.am
 -               ../bind/lib/libisccfg.a ../bind/lib/libisc.a
 +	       $(libbind)/libirs.a $(libbind)/libdns.a \
 +               $(libbind)/libisccfg.a $(libbind)/libisc.a
-Index: dhcp-4.3.0/omapip/Makefile.am
-===================================================================
---- dhcp-4.3.0.orig/omapip/Makefile.am
-+++ dhcp-4.3.0/omapip/Makefile.am
+diff --git a/omapip/Makefile.am b/omapip/Makefile.am
+--- a/omapip/Makefile.am
++++ b/omapip/Makefile.am
 @@ -10,6 +10,6 @@ man_MANS = omapi.3
  EXTRA_DIST = $(man_MANS)
  
@@ -80,11 +78,10 @@ Index: dhcp-4.3.0/omapip/Makefile.am
 +svtest_LDADD = libomapi.a $(libbind)/libirs.a $(libbind)/libdns.a \
 +		$(libbind)/libisccfg.a $(libbind)/libisc.a
  
-Index: dhcp-4.3.0/relay/Makefile.am
-===================================================================
---- dhcp-4.3.0.orig/relay/Makefile.am
-+++ dhcp-4.3.0/relay/Makefile.am
-@@ -3,8 +3,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localst
+diff --git a/relay/Makefile.am b/relay/Makefile.am
+--- a/relay/Makefile.am
++++ b/relay/Makefile.am
+@@ -3,8 +3,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
  dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
@@ -95,18 +92,24 @@ Index: dhcp-4.3.0/relay/Makefile.am
  man_MANS = dhcrelay.8
  EXTRA_DIST = $(man_MANS)
  
-Index: dhcp-4.3.0/server/Makefile.am
-===================================================================
---- dhcp-4.3.0.orig/server/Makefile.am
-+++ dhcp-4.3.0/server/Makefile.am
-@@ -14,8 +14,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c c
+diff --git a/server/Makefile.am b/server/Makefile.am
+--- a/server/Makefile.am
++++ b/server/Makefile.am
+@@ -14,10 +14,12 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
  
  dhcpd_CFLAGS = $(LDAP_CFLAGS)
  dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
 -	      ../dhcpctl/libdhcpctl.a ../bind/lib/libirs.a \
--	      ../bind/lib/libdns.a ../bind/lib/libisccfg.a ../bind/lib/libisc.a
+-	      ../bind/lib/libdns.a ../bind/lib/libisccfg.a ../bind/lib/libisc.a \
 +	      ../dhcpctl/libdhcpctl.a $(libbind)/libirs.a \
-+	      $(libbind)/libdns.a $(libbind)/libisccfg.a $(libbind)/libisc.a
++	      $(libbind)/libdns.a $(libbind)/libisccfg.a $(libbind)/libisc.a \
+ 	      $(LDAP_LIBS)		
  
++ dhcpd_CFLAGS = $(LDAP_CFLAGS)
++
  man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
  EXTRA_DIST = $(man_MANS)
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
index 14e75a3..b3f8fdb 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
@@ -7,15 +7,6 @@ RP 2013/03/21
 Rebase to 4.3.1
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- client/Makefile.am  | 6 ++++--
- common/Makefile.am  | 2 +-
- dhcpctl/Makefile.am | 2 ++
- dst/Makefile.am     | 2 +-
- omapip/Makefile.am  | 2 ++
- relay/Makefile.am   | 2 +-
- server/Makefile.am  | 2 +-
- 7 files changed, 12 insertions(+), 6 deletions(-)
-
 diff --git a/client/Makefile.am b/client/Makefile.am
 index 8411960..1740f72 100644
 --- a/client/Makefile.am
@@ -60,16 +51,6 @@ index 2987a53..cd72d75 100644
  bin_PROGRAMS = omshell
  lib_LIBRARIES = libdhcpctl.a
  noinst_PROGRAMS = cltest
-diff --git a/dst/Makefile.am b/dst/Makefile.am
-index 8937fe8..a14798b 100644
---- a/dst/Makefile.am
-+++ b/dst/Makefile.am
-@@ -1,4 +1,4 @@
--AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5
-+AM_CPPFLAGS = -DMINIRES_LIB -DHMAC_MD5 -I$(top_srcdir)/includes
- 
- lib_LIBRARIES = libdst.a
- 
 diff --git a/omapip/Makefile.am b/omapip/Makefile.am
 index 5074479..9c0fab3 100644
 --- a/omapip/Makefile.am
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
similarity index 70%
rename from meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
index b4a05fc..6fcdddc 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://replace-ifconfig-route.patch \
            "
 
-SRC_URI[md5sum] = "5a284875dd2c12ddd388416d69156a67"
-SRC_URI[sha256sum] = "6246c9b358759f6cdcc45104caaf76e732a211dbbbbf64a21f499c8db1298165"
+SRC_URI[md5sum] = "c5577b09c9017cdd319a11ff6364268e"
+SRC_URI[sha256sum] = "553c4945b09b1c1b904c4780f34f72aaefa2fc8c6556715de0bc9d4e3d255ede"
-- 
1.9.1


