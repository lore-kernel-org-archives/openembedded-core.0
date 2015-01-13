Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48062725F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5ifuC021744
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:41 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:07 +0800
Message-ID: <240f49642df6b238f267c1c761dc9233a909da64.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] dhcp: not override site.h
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:41 -0000
Content-Type: text/plain

Previously, site.h was overridden for setting _PATH_DHCPD_CONF
and _PATH_DHCLIENT_CONF, it caused other MACROs were missing,
so we use a patch to instead.

The macros NSUPDATE and COMPACT_LEASES existed in site.h

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  6 +----
 ...o-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch | 26 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp/site.h         | 21 -----------------
 3 files changed, 27 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/site.h

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 4949e02..6ced775 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=c5c64d696107f84b56fe337d14da1
 DEPENDS = "openssl bind"
 
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
-           file://site.h \
+           file://define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
@@ -36,10 +36,6 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-libbind=${STAGING_LIBDIR}/ \
                "
 
-do_compile_prepend () {
-	cp -f ${WORKDIR}/site.h ${S}/includes
-}
-
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${sysconfdir}/default
diff --git a/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
new file mode 100644
index 0000000..12d3c9b
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
@@ -0,0 +1,26 @@
+define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
+
+Upstream-Status: inappropriate <oe specific>
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ includes/site.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/includes/site.h b/includes/site.h
+index d87b309..17bc40d 100644
+--- a/includes/site.h
++++ b/includes/site.h
+@@ -139,7 +139,8 @@
+ /* Define this if you want the dhcpd.conf file to go somewhere other than
+    the default location.   By default, it goes in /etc/dhcpd.conf. */
+ 
+-/* #define _PATH_DHCPD_CONF	"/etc/dhcpd.conf" */
++#define _PATH_DHCPD_CONF	"/etc/dhcp/dhcpd.conf"
++#define _PATH_DHCLIENT_CONF	"/etc/dhcp/dhclient.conf"
+ 
+ /* Network API definitions.   You do not need to choose one of these - if
+    you don't choose, one will be chosen for you in your system's config
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp/site.h b/meta/recipes-connectivity/dhcp/dhcp/site.h
deleted file mode 100644
index 2289554..0000000
--- a/meta/recipes-connectivity/dhcp/dhcp/site.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/*
- * define config file location in ${S}/includes/site.h
- * still need to take care of installation path (${sysconfdir}/dhcpd.conf)
- *
- * 7/22/2010 - qhe
- */
-
-/* Define this if you want DNS update functionality to be available. */
-
-#define NSUPDATE
-
-/* Define this if you aren't debugging and you want to save memory
-   (potentially a _lot_ of memory) by allocating leases in chunks rather
-   than one at a time. */
-
-#define COMPACT_LEASES
-
-
-/* local */
-#define _PATH_DHCPD_CONF     "/etc/dhcp/dhcpd.conf"
-#define _PATH_DHCLIENT_CONF  "/etc/dhcp/dhclient.conf"
-- 
1.9.1


