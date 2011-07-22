Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABc-0008Se-R7
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084126"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:25:49 -0700
Message-Id: <bf4052365f2e197d25d83fa6eb4e4684fe3112ae.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/16] dhcp: Fix libdir issue for multilib
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:17 -0000

From: Mei Lei <lei.mei@intel.com>

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |   14 +++++++-------
 meta/recipes-connectivity/dhcp/dhcp4.inc           |    2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
index f03936d..4f11655 100644
--- a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
@@ -28,7 +28,7 @@ index 77ed055..5a77f2d 100644
  		   scripts/solaris scripts/openwrt
  dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
 -		 ../bind/lib/libdns.a ../bind/lib/libisc.a
-+		 $(libbind)/lib/libdns.a $(libbind)/lib/libisc.a
++		 $(libbind)/libdns.a $(libbind)/libisc.a
  man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
  EXTRA_DIST = $(man_MANS)
  
@@ -53,7 +53,7 @@ index 61049be..85aefa3 100644
  omshell_SOURCES = omshell.c
  omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
 -	        ../bind/lib/libdns.a ../bind/lib/libisc.a
-+	        $(libbind)/lib/libdns.a $(libbind)/lib/libisc.a
++	        $(libbind)/libdns.a $(libbind)/libisc.a
  
  libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
  
@@ -61,7 +61,7 @@ index 61049be..85aefa3 100644
  cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
 -	       ../bind/lib/libdns.a ../bind/lib/libisc.a
 \ No newline at end of file
-+	       $(libbind)/lib/libdns.a $(libbind)/lib/libisc.a
++	       $(libbind)/libdns.a $(libbind)/libisc.a
 diff --git a/omapip/Makefile.am b/omapip/Makefile.am
 index 595950a..17f2233 100644
 --- a/omapip/Makefile.am
@@ -71,7 +71,7 @@ index 595950a..17f2233 100644
  
  svtest_SOURCES = test.c
 -svtest_LDADD = libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
-+svtest_LDADD = libomapi.a $(libbind)/lib/libdns.a $(libbind)/lib/libisc.a
++svtest_LDADD = libomapi.a $(libbind)/libdns.a $(libbind)/libisc.a
  
 diff --git a/relay/Makefile.am b/relay/Makefile.am
 index d8757ca..a7885da 100644
@@ -82,7 +82,7 @@ index d8757ca..a7885da 100644
  dhcrelay_SOURCES = dhcrelay.c
  dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
 -		 ../bind/lib/libdns.a ../bind/lib/libisc.a
-+		 $(libbind)/lib/libdns.a $(libbind)/lib/libisc.a
++		 $(libbind)/libdns.a $(libbind)/libisc.a
  man_MANS = dhcrelay.8
  EXTRA_DIST = $(man_MANS)
  
@@ -96,8 +96,8 @@ index cdfaf47..d2c254b 100644
  dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
 -	      ../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
 -	      ../bind/lib/libisc.a
-+	      ../dhcpctl/libdhcpctl.a $(libbind)/lib/libdns.a \
-+	      $(libbind)/lib/libisc.a
++	      ../dhcpctl/libdhcpctl.a $(libbind)/libdns.a \
++	      $(libbind)/libisc.a
  
  man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
  EXTRA_DIST = $(man_MANS)
diff --git a/meta/recipes-connectivity/dhcp/dhcp4.inc b/meta/recipes-connectivity/dhcp/dhcp4.inc
index 885cc19..bdaa5e9 100644
--- a/meta/recipes-connectivity/dhcp/dhcp4.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp4.inc
@@ -25,7 +25,7 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
                 --with-cli-lease-file=${localstatedir}/lib/dhcp/dhclient.leases \
                 --with-cli6-lease-file=${localstatedir}/lib/dhcp/dhclient6.leases \
-                --with-libbind=${STAGING_LIBDIR}/.. \
+                --with-libbind=${STAGING_LIBDIR}/ \
                "
 
 do_compile_prepend () {
-- 
1.7.3.4



