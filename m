Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0bC2-0004to-Nx
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128652348"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.72])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2012 07:58:31 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 07:58:09 -0800
Message-Id: <d28f5ff4798828e1bb683016358b0f8f5102ae14.1330012543.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330012543.git.sgw@linux.intel.com>
References: <cover.1330012543.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/25] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:55 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

1. Update to 4.2.3-P2
2. From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
from bind that are linked to libcrypto. This is why i added a patch in order to add
-lcrypto to LIBS.
3. Add openssl in DEPENDS as we need libcrypto from this package
4. Drop installing /var/lib/dhcp/ as it is handled in pkg_postinst

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../dhcp-3.0.3-dhclient-dbus.patch                 |    0
 .../fix-client-path.patch                          |    0
 .../fix-external-bind.patch                        |    0
 .../fixincludes.patch                              |    0
 .../dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch     |   25 ++++++++++++++++++++
 .../{dhcp-4.2.0 => dhcp-4.2.3-P2}/noattrmode.patch |    0
 .../dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/site.h      |    0
 meta/recipes-connectivity/dhcp/dhcp.inc            |    6 +---
 .../dhcp/{dhcp_4.2.0.bb => dhcp_4.2.3-P2.bb}       |    8 +++---
 9 files changed, 31 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/dhcp-3.0.3-dhclient-dbus.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/fix-client-path.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/fix-external-bind.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/fixincludes.patch (100%)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/noattrmode.patch (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp-4.2.0 => dhcp-4.2.3-P2}/site.h (100%)
 rename meta/recipes-connectivity/dhcp/{dhcp_4.2.0.bb => dhcp_4.2.3-P2.bb} (48%)

diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-client-path.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-client-path.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
new file mode 100644
index 0000000..57e10b0
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
@@ -0,0 +1,25 @@
+Author: Andrei Gherzan <andrei@gherzan.ro>
+Date:   Thu Feb 2 23:59:11 2012 +0200
+
+From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
+from bind that are linked to libcrypto. This is why i added a patch in order to add
+-lcrypto to LIBS.
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+Upstream-Status: Pending
+
+Index: dhcp-4.2.3-P2-r0/dhcp-4.2.3-P2/configure.ac
+===================================================================
+--- dhcp-4.2.3-P2.orig/configure.ac	2012-02-02 18:04:20.843023196 +0200
++++ dhcp-4.2.3-P2/configure.ac	2012-02-02 17:58:16.000000000 +0200
+@@ -456,6 +456,10 @@
+ # Look for optional headers.
+ AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
+ 
++# find an MD5 library
++AC_SEARCH_LIBS(MD5_Init, [crypto])
++AC_SEARCH_LIBS(MD5Init, [crypto])
++
+ # Solaris needs some libraries for functions
+ AC_SEARCH_LIBS(socket, [socket])
+ AC_SEARCH_LIBS(inet_ntoa, [nsl])
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
diff --git a/meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h b/meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
similarity index 100%
rename from meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h
rename to meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index f66dfba..8ead016 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -10,9 +10,9 @@ HOMEPAGE = "http://www.isc.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=bb6fd41f5895b67088ebea61ad365e74"
 
-DEPENDS = "bind"
+DEPENDS = "openssl bind"
 
-SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-${PV}.tar.gz \
+SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://site.h \
 	   file://init-relay file://default-relay \
 	   file://init-server file://default-server \
@@ -51,8 +51,6 @@ do_install_append () {
 		mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
 	fi
 	install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient-script
-
-	install -d ${D}${localstatedir}/lib/dhcp/
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
similarity index 48%
rename from meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
rename to meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
index 3b1c0e2..24b50ba 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
@@ -1,12 +1,12 @@
 require dhcp.inc
 
-PR = "r7"
+PR = "r0"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-            file://fix-client-path.patch \
             file://fix-external-bind.patch \
+            file://link-with-lcrypto.patch \
            "
 
-SRC_URI[md5sum] = "83abd7c4f9c24d8dd024ca5a71380c0a"
-SRC_URI[sha256sum] = "6260d43423e4c406ba63cd7199502a395e952b13c80a955026c4b82a4e9d4943"
+SRC_URI[md5sum] = "14f57fd580d01633d0fad4809007a801"
+SRC_URI[sha256sum] = "5cf7ae2cad9c4ca0103748b2476ec8ea78484e408f8fe597e4e0a4afb051b469"
-- 
1.7.6.5



