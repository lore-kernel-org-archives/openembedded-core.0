Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9B073C8C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 08:47:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t448lei1021722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 May 2015 01:47:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 4 May 2015 01:47:39 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 May 2015 16:43:40 +0800
Message-ID: <1c99fc2600a8579c3ee046901b0b39596b7f0f22.1430727318.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430727318.git.rongqing.li@windriver.com>
References: <cover.1430727318.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dhcp: fix a building failure when upgrade bind
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
X-List-Received-Date: Mon, 04 May 2015 08:47:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The libdns.a and libisc.a from bind-9.10.2 maybe need the libxml2,
so add PKGCONFIG to make libxml2 dependence deterministic.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  7 ++++-
 .../dhcp/dhcp/0001-search-libxml2.patch            | 35 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-search-libxml2.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 6ced775..ed2849f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -17,7 +17,9 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
-           file://dhcpd.service file://dhcrelay.service"
+           file://dhcpd.service file://dhcrelay.service \
+           file://0001-search-libxml2.patch \
+"
 
 inherit autotools systemd
 
@@ -36,6 +38,9 @@ EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-libbind=${STAGING_LIBDIR}/ \
                "
 
+PACKAGECONFIG ?= "libxml2"
+PACKAGECONFIG[libxml2] = "--with-libxml2=yes,--with-libxml2=no,libxml2"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${sysconfdir}/default
diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-search-libxml2.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-search-libxml2.patch
new file mode 100644
index 0000000..27f0f7b
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-search-libxml2.patch
@@ -0,0 +1,35 @@
+[PATCH] search libxml2
+
+Upstream-Status: Pending
+
+The libdns.a and libisc.a from bind-9.10.2 maybe need libxml2
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.ac | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c9dc8b5..55ea877 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -602,6 +602,16 @@ no)
+ esac
+ AC_SUBST([libbind])
+ 
++# XML support.
++AC_ARG_WITH(libxml2,
++    AS_HELP_STRING([--with-libxml2],[enable XML2 support (default is no)]),
++    [libxml2=$withval],
++    [libxml2=no])
++
++if test x$libxml2 = xyes ; then
++    AC_SEARCH_LIBS(xmlTextWriterEndElement, [xml2],)
++fi
++
+ # OpenLDAP support.
+ AC_ARG_WITH(ldap,
+     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (default is no)]),
+-- 
+1.9.1
+
-- 
1.9.1


