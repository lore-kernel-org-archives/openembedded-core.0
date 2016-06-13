Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD7DB6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5D9GdBx004393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Jun 2016 02:16:39 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:26 -0400
Message-ID: <acd769f2a7482961f4ce08f3dcd2def5cfbff3aa.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465808701.git.hongxu.jia@windriver.com>
References: <cover.1465808701.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] dhcp: upgrade to 4.3.4
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:40 -0000
Content-Type: text/plain

- Drop fix-external-bind.patch, which dhcp 4.3.4 supports
  option --with-libbind=PATH

- Add tweak-to-support-external-bind.patch, tweak the external
  bind to oe-core's sysroot rather than external bind source build.

- Drop CVE-2015-8605.patch, CVE-2016-2774.patch, dhcp 4.3.4 has fixed them

- Add configure option --with-randomdev=/dev/random

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |   3 +-
 .../dhcp/0001-site.h-enable-gentle-shutdown.patch  |   6 +-
 .../dhcp/dhcp/CVE-2015-8605.patch                  |  99 -----------------
 .../dhcp/dhcp/CVE-2016-2774.patch                  |  65 ------------
 ...dhclient-script-drop-resolv.conf.dhclient.patch |   2 +-
 .../dhcp/dhcp/fix-external-bind.patch              | 115 --------------------
 .../dhcp/dhcp/fixsepbuild.patch                    |  78 ++++++++------
 .../dhcp/dhcp/libxml2-configure-argument.patch     |  19 +++-
 .../dhcp/dhcp/link-with-lcrypto.patch              |  21 ++--
 .../dhcp/dhcp/replace-ifconfig-route.patch         |  34 ++++--
 .../dhcp/dhcp/tweak-to-support-external-bind.patch | 117 +++++++++++++++++++++
 .../dhcp/{dhcp_4.3.3.bb => dhcp_4.3.4.bb}          |   8 +-
 12 files changed, 222 insertions(+), 345 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.3.bb => dhcp_4.3.4.bb} (65%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 5e396f1..d237d58 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -46,7 +46,8 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
                 --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
                 --with-libbind=${STAGING_LIBDIR}/ \
-		--enable-paranoia \
+                --enable-paranoia \
+                --with-randomdev=/dev/random \
                "
 
 do_install_append () {
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
index 4344212..47443a5 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-site.h-enable-gentle-shutdown.patch
@@ -8,10 +8,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/includes/site.h b/includes/site.h
-index 73fa4e8..9c33de3 100644
+index 1dd1251..abb66e4 100644
 --- a/includes/site.h
 +++ b/includes/site.h
-@@ -280,7 +280,7 @@
+@@ -289,7 +289,7 @@
     situations.  We plan to revisit this feature and may
     make non-backwards compatible changes including the
     removal of this define.  Use at your own risk.  */
@@ -21,5 +21,5 @@ index 73fa4e8..9c33de3 100644
  /* Include old error codes.  This is provided in case you
     are building an external program similar to omshell for
 -- 
-1.9.1
+2.8.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
deleted file mode 100644
index 923d5d5..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Solves CVE-2015-8605 that caused DoS when an invalid lenght field in IPv4 UDP
-was recived by the server.
-
-Upstream-Status: Backport
-CVE: CVE-2015-8605
-
-Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
-
-=======================================================================
-diff --git a/common/packet.c b/common/packet.c
-index b530432..e600e37 100644
---- a/common/packet.c
-+++ b/common/packet.c
-@@ -220,7 +220,28 @@ ssize_t decode_hw_header (interface, buf, bufix, from)
- 	}
- }
- 
--/* UDP header and IP header decoded together for convenience. */
-+/*!
-+ *
-+ * \brief UDP header and IP header decoded together for convenience.
-+ *
-+ * Attempt to decode the UDP and IP headers and, if necessary, checksum
-+ * the packet.
-+ *
-+ * \param inteface - the interface on which the packet was recevied
-+ * \param buf - a pointer to the buffer for the received packet
-+ * \param bufix - where to start processing the buffer, previous
-+ *                routines may have processed parts of the buffer already
-+ * \param from - space to return the address of the packet sender
-+ * \param buflen - remaining length of the buffer, this will have been
-+ *                 decremented by bufix by the caller
-+ * \param rbuflen - space to return the length of the payload from the udp
-+ *                  header
-+ * \param csum_ready - indication if the checksum is valid for use
-+ *                     non-zero indicates the checksum should be validated
-+ *
-+ * \return - the index to the first byte of the udp payload (that is the
-+ *           start of the DHCP packet
-+ */
- 
- ssize_t
- decode_udp_ip_header(struct interface_info *interface,
-@@ -231,7 +252,7 @@ decode_udp_ip_header(struct interface_info *interface,
-   unsigned char *data;
-   struct ip ip;
-   struct udphdr udp;
--  unsigned char *upp, *endbuf;
-+  unsigned char *upp;
-   u_int32_t ip_len, ulen, pkt_len;
-   static unsigned int ip_packets_seen = 0;
-   static unsigned int ip_packets_bad_checksum = 0;
-@@ -241,11 +262,8 @@ decode_udp_ip_header(struct interface_info *interface,
-   static unsigned int udp_packets_length_overflow = 0;
-   unsigned len;
- 
--  /* Designate the end of the input buffer for bounds checks. */
--  endbuf = buf + bufix + buflen;
--
-   /* Assure there is at least an IP header there. */
--  if ((buf + bufix + sizeof(ip)) > endbuf)
-+  if (sizeof(ip) > buflen)
- 	  return -1;
- 
-   /* Copy the IP header into a stack aligned structure for inspection.
-@@ -257,13 +275,17 @@ decode_udp_ip_header(struct interface_info *interface,
-   ip_len = (*upp & 0x0f) << 2;
-   upp += ip_len;
- 
--  /* Check the IP packet length. */
-+  /* Check packet lengths are within the buffer:
-+   * first the ip header (ip_len)
-+   * then the packet length from the ip header (pkt_len)
-+   * then the udp header (ip_len + sizeof(udp)
-+   * We are liberal in what we accept, the udp payload should fit within
-+   * pkt_len, but we only check against the full buffer size.
-+   */
-   pkt_len = ntohs(ip.ip_len);
--  if (pkt_len > buflen)
--	return -1;
--
--  /* Assure after ip_len bytes that there is enough room for a UDP header. */
--  if ((upp + sizeof(udp)) > endbuf)
-+  if ((ip_len > buflen) ||
-+      (pkt_len > buflen) ||
-+      ((ip_len + sizeof(udp)) > buflen))
- 	  return -1;
- 
-   /* Copy the UDP header into a stack aligned structure for inspection. */
-@@ -284,7 +306,8 @@ decode_udp_ip_header(struct interface_info *interface,
- 	return -1;
- 
-   udp_packets_length_checked++;
--  if ((upp + ulen) > endbuf) {
-+  /* verify that the payload length from the udp packet fits in the buffer */
-+  if ((ip_len + ulen) > buflen) {
- 	udp_packets_length_overflow++;
- 	if (((udp_packets_length_checked > 4) &&
- 	     (udp_packets_length_overflow != 0)) &&
diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch
deleted file mode 100644
index 4836dbc..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From b9f56d578ebfd649b5d829960540859ac6ca931c Mon Sep 17 00:00:00 2001
-From: Catalin Enache <catalin.enache@windriver.com>
-Date: Tue, 12 Apr 2016 18:23:31 +0300
-Subject: [PATCH] Add patch to limit the value of an fd we accept for a
- connection.
-
-By limiting the highest value we accept for an fd we limit the number
-of connections.
-
-Upstream-Status: Backport
-CVE: CVE-2016-2774
-
-Author: Shawn Routhier <sar@isc.org>
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- includes/site.h   | 6 ++++++
- omapip/listener.c | 9 +++++++--
- 3 files changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/includes/site.h b/includes/site.h
-index 9c33de3..df020c8 100644
---- a/includes/site.h
-+++ b/includes/site.h
-@@ -290,6 +290,12 @@
-    this option will be removed at some time. */
- /* #define INCLUDE_OLD_DHCP_ISC_ERROR_CODES */
- 
-+/* Limit the value of a file descriptor the serve will use
-+   when accepting a connecting request.  This can be used to
-+   limit the number of TCP connections that the server will
-+   allow at one time.  A value of 0 means there is no limit.*/
-+#define MAX_FD_VALUE 200
-+
- /* Include definitions for various options.  In general these
-    should be left as is, but if you have already defined one
-    of these and prefer your definition you can comment the 
-diff --git a/omapip/listener.c b/omapip/listener.c
-index 8bdcdbd..61473cf 100644
---- a/omapip/listener.c
-+++ b/omapip/listener.c
-@@ -3,7 +3,7 @@
-    Subroutines that support the generic listener object. */
- 
- /*
-- * Copyright (c) 2012,2014 by Internet Systems Consortium, Inc. ("ISC")
-+ * Copyright (c) 2012,2014,2016 by Internet Systems Consortium, Inc. ("ISC")
-  * Copyright (c) 2004,2007,2009 by Internet Systems Consortium, Inc. ("ISC")
-  * Copyright (c) 1999-2003 by Internet Software Consortium
-  *
-@@ -233,7 +233,12 @@ isc_result_t omapi_accept (omapi_object_t *h)
- 			return ISC_R_NORESOURCES;
- 		return ISC_R_UNEXPECTED;
- 	}
--	
-+
-+	if ((MAX_FD_VALUE != 0) && (socket > MAX_FD_VALUE)) {
-+		close(socket);
-+		return (ISC_R_NORESOURCES);
-+	}
-+
- #if defined (TRACING)
- 	/* If we're recording a trace, remember the connection. */
- 	if (trace_record ()) {
--- 
-2.7.4
diff --git a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
index 47ea555..96095a5 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/dhclient-script-drop-resolv.conf.dhclient.patch
@@ -66,5 +66,5 @@ diff --git a/client/scripts/linux b/client/scripts/linux
  }
  
 -- 
-1.8.1.2
+2.8.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
deleted file mode 100644
index 956c5d8..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-Upstream-Status: Pending
-
-11/30/2010
---with-libbind=PATH is available but not used by Makefile,
-this patch is to allow building with external bind
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-Rebase the patch to 4.3.3
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
-diff --git a/Makefile.am b/Makefile.am
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -25,7 +25,7 @@ EXTRA_DIST = RELNOTES LICENSE \
- 	     bind/Makefile.in bind/bind.tar.gz bind/version.tmp \
- 	     common/tests/Atffile server/tests/Atffile
- 
--SUBDIRS = bind includes tests common omapip client dhcpctl relay server
-+SUBDIRS = includes tests common omapip client dhcpctl relay server
- 
- nobase_include_HEADERS = dhcpctl/dhcpctl.h
- 
-diff --git a/client/Makefile.am b/client/Makefile.am
---- a/client/Makefile.am
-+++ b/client/Makefile.am
-@@ -10,8 +10,8 @@ dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
- 		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
- 		   scripts/netbsd scripts/nextstep scripts/openbsd \
- 		   scripts/solaris scripts/openwrt
--dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a ../bind/lib/libirs.a \
--		 ../bind/lib/libdns.a ../bind/lib/libisccfg.a ../bind/lib/libisc.a
-+dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a $(libbind)/libirs.a \
-+		 $(libbind)/libdns.a $(libbind)/libisccfg.a $(libbind)/libisc.a
- man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
- EXTRA_DIST = $(man_MANS)
- 
-diff --git a/configure.ac b/configure.ac
---- a/configure.ac
-+++ b/configure.ac
-@@ -623,6 +623,7 @@ no)
- 	fi	
- 	;;
- esac
-+AC_SUBST([libbind])
- 
- # OpenLDAP support.
- AC_ARG_WITH(ldap,
-diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
---- a/dhcpctl/Makefile.am
-+++ b/dhcpctl/Makefile.am
-@@ -6,12 +6,12 @@ EXTRA_DIST = $(man_MANS)
- 
- omshell_SOURCES = omshell.c
- omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	        ../bind/lib/libirs.a ../bind/lib/libdns.a \
--	        ../bind/lib/libisccfg.a ../bind/lib/libisc.a
-+	        $(libbind)/libirs.a $(libbind)/libdns.a \
-+	        $(libbind)/libisccfg.a $(libbind)/libisc.a
- 
- libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
- 
- cltest_SOURCES = cltest.c
- cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
--	       ../bind/lib/libirs.a ../bind/lib/libdns.a \
--               ../bind/lib/libisccfg.a ../bind/lib/libisc.a
-+	       $(libbind)/libirs.a $(libbind)/libdns.a \
-+               $(libbind)/libisccfg.a $(libbind)/libisc.a
-diff --git a/omapip/Makefile.am b/omapip/Makefile.am
---- a/omapip/Makefile.am
-+++ b/omapip/Makefile.am
-@@ -10,6 +10,6 @@ man_MANS = omapi.3
- EXTRA_DIST = $(man_MANS)
- 
- svtest_SOURCES = test.c
--svtest_LDADD = libomapi.a ../bind/lib/libirs.a ../bind/lib/libdns.a \
--		../bind/lib/libisccfg.a ../bind/lib/libisc.a
-+svtest_LDADD = libomapi.a $(libbind)/libirs.a $(libbind)/libdns.a \
-+		$(libbind)/libisccfg.a $(libbind)/libisc.a
- 
-diff --git a/relay/Makefile.am b/relay/Makefile.am
---- a/relay/Makefile.am
-+++ b/relay/Makefile.am
-@@ -3,8 +3,8 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
- sbin_PROGRAMS = dhcrelay
- dhcrelay_SOURCES = dhcrelay.c
- dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--		 ../bind/lib/libirs.a ../bind/lib/libdns.a \
--		 ../bind/lib/libisccfg.a ../bind/lib/libisc.a
-+		 $(libbind)/libirs.a $(libbind)/libdns.a \
-+		 $(libbind)/libisccfg.a $(libbind)/libisc.a
- man_MANS = dhcrelay.8
- EXTRA_DIST = $(man_MANS)
- 
-diff --git a/server/Makefile.am b/server/Makefile.am
---- a/server/Makefile.am
-+++ b/server/Makefile.am
-@@ -14,10 +14,12 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c confpars.c db.c class.c failover.c \
- 
- dhcpd_CFLAGS = $(LDAP_CFLAGS)
- dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
--	      ../dhcpctl/libdhcpctl.a ../bind/lib/libirs.a \
--	      ../bind/lib/libdns.a ../bind/lib/libisccfg.a ../bind/lib/libisc.a \
-+	      ../dhcpctl/libdhcpctl.a $(libbind)/libirs.a \
-+	      $(libbind)/libdns.a $(libbind)/libisccfg.a $(libbind)/libisc.a \
- 	      $(LDAP_LIBS)		
- 
-+ dhcpd_CFLAGS = $(LDAP_CFLAGS)
-+
- man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
- EXTRA_DIST = $(man_MANS)
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
index b3f8fdb..2f44147 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/fixsepbuild.patch
@@ -4,80 +4,88 @@ Upstream-Status: Pending
 
 RP 2013/03/21
 
-Rebase to 4.3.1
+Rebase to 4.3.4
+
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
+ client/Makefile.am  | 4 ++--
+ common/Makefile.am  | 3 ++-
+ dhcpctl/Makefile.am | 2 ++
+ omapip/Makefile.am  | 1 +
+ relay/Makefile.am   | 2 +-
+ server/Makefile.am  | 2 +-
+ 6 files changed, 9 insertions(+), 5 deletions(-)
+
 diff --git a/client/Makefile.am b/client/Makefile.am
-index 8411960..1740f72 100644
+index 2cb83d8..4730bb3 100644
 --- a/client/Makefile.am
 +++ b/client/Makefile.am
-@@ -4,6 +4,8 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
+@@ -7,11 +7,11 @@ SUBDIRS = . tests
+ BINDLIBDIR = @BINDDIR@/lib
+ 
+ AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
+-	      -DLOCALSTATEDIR='"$(localstatedir)"'
++	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
  
-+AM_CPPFLAGS = -I$(top_srcdir)/includes
-+
  dist_sysconf_DATA = dhclient.conf.example
  sbin_PROGRAMS = dhclient
- dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
-@@ -17,8 +19,8 @@ EXTRA_DIST = $(man_MANS)
- 
- dhclient.o: dhclient.c
- 	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
--		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhclient.c
-+		   -DLOCALSTATEDIR='"$(localstatedir)"' -c $(srcdir)/dhclient.c
- 
- dhc6.o: dhc6.c
- 	$(COMPILE) -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
--		   -DLOCALSTATEDIR='"$(localstatedir)"' -c dhc6.c
-+		   -DLOCALSTATEDIR='"$(localstatedir)"' -c $(srcdir)/dhc6.c
+-dhclient_SOURCES = clparse.c dhclient.c dhc6.c \
++dhclient_SOURCES = $(srcdir)/clparse.c $(srcdir)/dhclient.c $(srcdir)/dhc6.c \
+ 		   scripts/bsdos scripts/freebsd scripts/linux scripts/macos \
+ 		   scripts/netbsd scripts/nextstep scripts/openbsd \
+ 		   scripts/solaris scripts/openwrt
 diff --git a/common/Makefile.am b/common/Makefile.am
-index eddef05..5ce045f 100644
+index 113aee8..0f24fbb 100644
 --- a/common/Makefile.am
 +++ b/common/Makefile.am
-@@ -1,4 +1,4 @@
--AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
+@@ -1,4 +1,5 @@
+-AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
 +AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"'
++
  AM_CFLAGS = $(LDAP_CFLAGS)
  
  noinst_LIBRARIES = libdhcp.a
 diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
-index 2987a53..cd72d75 100644
+index ceb0de1..ba8dd8b 100644
 --- a/dhcpctl/Makefile.am
 +++ b/dhcpctl/Makefile.am
-@@ -1,3 +1,5 @@
+@@ -1,5 +1,7 @@
+ BINDLIBDIR = @BINDDIR@/lib
+ 
 +AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
 +
  bin_PROGRAMS = omshell
  lib_LIBRARIES = libdhcpctl.a
  noinst_PROGRAMS = cltest
 diff --git a/omapip/Makefile.am b/omapip/Makefile.am
-index 5074479..9c0fab3 100644
+index 446a594..dd1afa0 100644
 --- a/omapip/Makefile.am
 +++ b/omapip/Makefile.am
-@@ -1,3 +1,5 @@
+@@ -1,4 +1,5 @@
+ BINDLIBDIR = @BINDDIR@/lib
 +AM_CPPFLAGS = -I$(top_srcdir)/includes
-+
+ 
  lib_LIBRARIES = libomapi.a
  noinst_PROGRAMS = svtest
- 
 diff --git a/relay/Makefile.am b/relay/Makefile.am
-index ec72a31..f842071 100644
+index 3060eca..6d652f6 100644
 --- a/relay/Makefile.am
 +++ b/relay/Makefile.am
-@@ -1,4 +1,4 @@
+@@ -1,6 +1,6 @@
+ BINDLIBDIR = @BINDDIR@/lib
+ 
 -AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
 +AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
  
  sbin_PROGRAMS = dhcrelay
  dhcrelay_SOURCES = dhcrelay.c
 diff --git a/server/Makefile.am b/server/Makefile.am
-index a446f0b..d0b873a 100644
+index 54feedf..3990b9c 100644
 --- a/server/Makefile.am
 +++ b/server/Makefile.am
-@@ -4,7 +4,7 @@
- # production code. Sadly, we are not there yet.
- SUBDIRS = . tests
+@@ -6,7 +6,7 @@ SUBDIRS = . tests
+ 
+ BINDLIBDIR = @BINDDIR@/lib
  
 -AM_CPPFLAGS = -I.. -DLOCALSTATEDIR='"@localstatedir@"'
 +AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
@@ -85,5 +93,5 @@ index a446f0b..d0b873a 100644
  dist_sysconf_DATA = dhcpd.conf.example
  sbin_PROGRAMS = dhcpd
 -- 
-1.9.1
+2.8.1
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch b/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
index 9d2fbfb..1435662 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/libxml2-configure-argument.patch
@@ -5,10 +5,18 @@ Upstream-Status: Pending
 
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 
---- dhcp-4.3.3.orig/configure.ac	2016-03-16 20:25:53.830697637 -0700
-+++ dhcp-4.3.3/configure.ac	2016-03-16 20:28:19.415355257 -0700
-@@ -631,7 +631,16 @@
+Rebase to 4.3.4
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
 
+diff --git a/configure.ac b/configure.ac
+index 726c88e..1684df1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -718,7 +718,16 @@ AC_SUBST(BINDSRCDIR)
+ 
  # We need to find libxml2 if bind was built with support enabled
  # otherwise we'll fail to build omapip/test.c
 -AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],)
@@ -22,6 +30,9 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 +                        AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
 +                    fi])
 +fi
-
+ 
  # OpenLDAP support.
  AC_ARG_WITH(ldap,
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
index 57e10b0..0d0e0dd 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/link-with-lcrypto.patch
@@ -5,14 +5,20 @@ From 4.2.0 final release, -lcrypto check was removed and we compile static libra
 from bind that are linked to libcrypto. This is why i added a patch in order to add
 -lcrypto to LIBS.
 
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
 
-Index: dhcp-4.2.3-P2-r0/dhcp-4.2.3-P2/configure.ac
-===================================================================
---- dhcp-4.2.3-P2.orig/configure.ac	2012-02-02 18:04:20.843023196 +0200
-+++ dhcp-4.2.3-P2/configure.ac	2012-02-02 17:58:16.000000000 +0200
-@@ -456,6 +456,10 @@
+Rebase to 4.3.4
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 097b0c3..726c88e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -584,6 +584,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo() __attribute__((noreturn));
  # Look for optional headers.
  AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
  
@@ -23,3 +29,6 @@ Index: dhcp-4.2.3-P2-r0/dhcp-4.2.3-P2/configure.ac
  # Solaris needs some libraries for functions
  AC_SEARCH_LIBS(socket, [socket])
  AC_SEARCH_LIBS(inet_ntoa, [nsl])
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch b/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
index 61dd6a7..d84df5c 100644
--- a/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
@@ -8,23 +8,32 @@ Upstream-Status: Pending
 
 Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
 
---- dhcp-4.2.5-P1/client/scripts/linux.orig	2013-09-04 12:22:55.000000000 +0500
-+++ dhcp-4.2.5-P1/client/scripts/linux	2013-09-04 12:52:19.068761518 +0500
-@@ -103,17 +103,11 @@
+Rebase to 4.3.4
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux | 82 ++++++++++++++++++++++++++++------------------------
+ 1 file changed, 45 insertions(+), 37 deletions(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index a02cfd9..232a0aa 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -101,17 +101,11 @@ fi
  if [ x$old_broadcast_address != x ]; then
    old_broadcast_arg="broadcast $old_broadcast_address"
  fi
 -if [ x$new_subnet_mask != x ]; then
 -  new_subnet_arg="netmask $new_subnet_mask"
--fi
++if [ -n "$new_subnet_mask" ]; then
++    new_mask="/$new_subnet_mask"
+ fi
 -if [ x$old_subnet_mask != x ]; then
 -  old_subnet_arg="netmask $old_subnet_mask"
 -fi
 -if [ x$alias_subnet_mask != x ]; then
 -  alias_subnet_arg="netmask $alias_subnet_mask"
-+if [ -n "$new_subnet_mask" ]; then
-+    new_mask="/$new_subnet_mask"
- fi
+-fi
 -if [ x$new_interface_mtu != x ]; then
 -  mtu_arg="mtu $new_interface_mtu"
 +if [ -n "$alias_subnet_mask" ]; then
@@ -32,7 +41,7 @@ Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
  fi
  if [ x$IF_METRIC != x ]; then
    metric_arg="metric $IF_METRIC"
-@@ -127,9 +121,9 @@
+@@ -125,9 +119,9 @@ fi
  if [ x$reason = xPREINIT ]; then
    if [ x$alias_ip_address != x ]; then
      # Bring down alias interface. Its routes will disappear too.
@@ -44,7 +53,7 @@ Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
  
    # We need to give the kernel some time to get the interface up.
    sleep 1
-@@ -156,25 +150,30 @@
+@@ -154,25 +148,30 @@ if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
    if [ x$old_ip_address != x ] && [ x$alias_ip_address != x ] && \
  		[ x$alias_ip_address != x$old_ip_address ]; then
      # Possible new alias. Remove old alias.
@@ -81,7 +90,7 @@ Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
      done
    else
      # we haven't changed the address, have we changed other options           
-@@ -182,21 +181,23 @@
+@@ -180,21 +179,23 @@ if [ x$reason = xBOUND ] || [ x$reason = xRENEW ] || \
      if [ x$new_routers != x ] && [ x$new_routers != x$old_routers ] ; then
        # if we've changed routers delete the old and add the new.
        for router in $old_routers; do
@@ -112,7 +121,7 @@ Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
    fi
    make_resolv_conf
    exit_with_hooks 0
-@@ -206,42 +207,49 @@
+@@ -204,42 +205,49 @@ if [ x$reason = xEXPIRE ] || [ x$reason = xFAIL ] || [ x$reason = xRELEASE ] \
     || [ x$reason = xSTOP ]; then
    if [ x$alias_ip_address != x ]; then
      # Turn off alias interface.
@@ -174,3 +183,6 @@ Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
    exit_with_hooks 1
  fi
  
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch
new file mode 100644
index 0000000..03c6abb
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch
@@ -0,0 +1,117 @@
+From ad7bb401f47714fc30c408853b796ce0f1c7e65f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sat, 11 Jun 2016 22:51:44 -0400
+Subject: [PATCH] tweak to support external bind
+
+Tweak the external bind to oe-core's sysroot rather than
+external bind source build.
+
+Upstream-Status: Inappropriate <oe-core specific>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/Makefile.am       | 2 +-
+ client/tests/Makefile.am | 2 +-
+ common/tests/Makefile.am | 2 +-
+ dhcpctl/Makefile.am      | 2 +-
+ omapip/Makefile.am       | 2 +-
+ relay/Makefile.am        | 2 +-
+ server/Makefile.am       | 2 +-
+ server/tests/Makefile.am | 2 +-
+ 8 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/client/Makefile.am b/client/Makefile.am
+index 4730bb3..84d8131 100644
+--- a/client/Makefile.am
++++ b/client/Makefile.am
+@@ -4,7 +4,7 @@
+ # production code. Sadly, we are not there yet.
+ SUBDIRS = . tests
+ 
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = -DCLIENT_PATH='"PATH=$(sbindir):/sbin:/bin:/usr/sbin:/usr/bin"' \
+ 	      -DLOCALSTATEDIR='"$(localstatedir)"' -I$(top_srcdir)/includes
+diff --git a/client/tests/Makefile.am b/client/tests/Makefile.am
+index da69ea9..fe35e57 100644
+--- a/client/tests/Makefile.am
++++ b/client/tests/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS = .
+ 
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
+ AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
+diff --git a/common/tests/Makefile.am b/common/tests/Makefile.am
+index f8d6b0e..05cd9c1 100644
+--- a/common/tests/Makefile.am
++++ b/common/tests/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS = .
+ 
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = $(ATF_CFLAGS) -I$(top_srcdir)/includes
+ 
+diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
+index ba8dd8b..9b2486e 100644
+--- a/dhcpctl/Makefile.am
++++ b/dhcpctl/Makefile.am
+@@ -1,4 +1,4 @@
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = -I$(top_srcdir)/includes -I$(top_srcdir)
+ 
+diff --git a/omapip/Makefile.am b/omapip/Makefile.am
+index dd1afa0..e4a8599 100644
+--- a/omapip/Makefile.am
++++ b/omapip/Makefile.am
+@@ -1,4 +1,4 @@
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ AM_CPPFLAGS = -I$(top_srcdir)/includes
+ 
+ lib_LIBRARIES = libomapi.a
+diff --git a/relay/Makefile.am b/relay/Makefile.am
+index 6d652f6..b3bf578 100644
+--- a/relay/Makefile.am
++++ b/relay/Makefile.am
+@@ -1,4 +1,4 @@
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+ 
+diff --git a/server/Makefile.am b/server/Makefile.am
+index 3990b9c..b5d8c2d 100644
+--- a/server/Makefile.am
++++ b/server/Makefile.am
+@@ -4,7 +4,7 @@
+ # production code. Sadly, we are not there yet.
+ SUBDIRS = . tests
+ 
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = -I$(top_srcdir) -DLOCALSTATEDIR='"@localstatedir@"' -I$(top_srcdir)/includes
+ 
+diff --git a/server/tests/Makefile.am b/server/tests/Makefile.am
+index 65a9f74..2892309 100644
+--- a/server/tests/Makefile.am
++++ b/server/tests/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS = .
+ 
+-BINDLIBDIR = @BINDDIR@/lib
++BINDLIBDIR = @BINDDIR@
+ 
+ AM_CPPFLAGS = $(ATF_CFLAGS) -DUNIT_TEST -I$(top_srcdir)/includes
+ AM_CPPFLAGS += -I@BINDDIR@/include -I$(top_srcdir)
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
similarity index 65%
rename from meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
index 97dde1d..9e08291 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
@@ -1,19 +1,17 @@
 require dhcp.inc
 
 SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-            file://fix-external-bind.patch \
             file://link-with-lcrypto.patch \
             file://fixsepbuild.patch \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
             file://replace-ifconfig-route.patch \
-            file://CVE-2015-8605.patch \
             file://0001-site.h-enable-gentle-shutdown.patch \
-            file://CVE-2016-2774.patch \
             file://libxml2-configure-argument.patch \
+            file://tweak-to-support-external-bind.patch \
            "
 
-SRC_URI[md5sum] = "c5577b09c9017cdd319a11ff6364268e"
-SRC_URI[sha256sum] = "553c4945b09b1c1b904c4780f34f72aaefa2fc8c6556715de0bc9d4e3d255ede"
+SRC_URI[md5sum] = "0138319fe2b788cf4bdf34fbeaf9ff54"
+SRC_URI[sha256sum] = "f5115aee3dd3e6925de4ba47b80ab732ba48b481c8364b6ebade2d43698d607e"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[bind-httpstats] = "--with-libxml2,--without-libxml2,libxml2"
-- 
2.8.1


