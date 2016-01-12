Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4255760796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:55:13 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aIvfV-0003Rw-8P from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jan 2016 01:55:13 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 12 Jan 2016 09:55:12 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jan 2016 14:55:03 +0500
Message-ID: <1452592503-7197-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dhcp: search libxml2 for bind
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
X-List-Received-Date: Tue, 12 Jan 2016 09:55:16 -0000
Content-Type: text/plain

libdns requires libxml2 if bind was built with libxml2 support
enabled. Compilation will fail for omapip/test.c in case
-lxml2 isn't used during the build. So, we add losely coupled
search path which will pick up the lib if it is present.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  3 ++-
 .../dhcp/dhcp/search-for-libxml2.patch             | 23 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index a673dbc..9c4233b 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -18,7 +18,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
            file://dhcpd.service file://dhcrelay.service \
-           file://dhcpd6.service "
+           file://dhcpd6.service \
+           file://search-for-libxml2.patch "
 
 UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
diff --git a/meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch b/meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch
new file mode 100644
index 0000000..a08a5b7
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/search-for-libxml2.patch
@@ -0,0 +1,23 @@
+libdns requires libxml2 if bind was built with libxml2 support
+enabled. Compilation will fail for omapip/test.c in case
+lxml2 isn't used during the build. So, we add losely coupled
+search path which will pick up the lib if it is present.
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+Upstream-Status: Pending
+
+diff --git a/configure.ac b/configure.ac
+index c9dc8b5..85f59be 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -602,6 +602,10 @@ no)
+ esac
+ AC_SUBST([libbind])
+ 
++# We need to find libxml2 if bind was built with support enabled
++# otherwise we'll fail to build omapip/test.c
++AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],)
++
+ # OpenLDAP support.
+ AC_ARG_WITH(ldap,
+     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (default is no)]),
-- 
1.9.1


