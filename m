Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 985A571C7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 16:04:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	id 1e7OAC-0002K8-EE from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Oct 2017 09:04:16 -0700
Received: from svr-pkl-eng-07.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 25 Oct 2017 17:04:14 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Oct 2017 21:03:48 +0500
Message-ID: <20171025160348.29256-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
Subject: [PATCH] dhcp: fix build issue with libxml2 support
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
X-List-Received-Date: Wed, 25 Oct 2017 16:04:15 -0000
Content-Type: text/plain

A missing case breaks the build when libxml2 is
required and found appropriately. The third argument
to the function AC_SEARCH_LIB is action-if-found which
was mistakenly been used for the case where the library
is not found and hence breaks the configure phase
where it shoud actually pass.
We now pass on silently when action-if-found is
executed.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 ...correct-the-intention-for-xml2-lib-search.patch | 35 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
new file mode 100644
index 0000000000..6ded764d0e
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0012-dhcp-correct-the-intention-for-xml2-lib-search.patch
@@ -0,0 +1,35 @@
+From 501543b3ef715488a142e3d301ff2733aa33eec7 Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Wed, 25 Oct 2017 21:00:05 +0500
+Subject: [PATCH] dhcp: correct the intention for xml2 lib search
+
+A missing case breaks the build when libxml2 is
+required and found appropriately. The third argument
+to the function AC_SEARCH_LIB is action-if-found which
+was mistakenly been used for the case where the library
+is not found and hence breaks the configure phase
+where it shoud actually pass.
+We now pass on silently when action-if-found is
+executed.
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index bfe988a..f0459e6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -608,7 +608,7 @@ AC_ARG_WITH(libxml2,
+ 	with_libxml2="$withval", with_libxml2="no")
+ 
+ if test x$with_libxml2 != xno; then
+-	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
+ 		[if test x$with_libxml2 != xauto; then
+ 			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 and libxml2 was requested])
+ 		fi])
+-- 
+2.11.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
index 4634a01b04..6615ae2555 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0009-remove-dhclient-script-bash-dependency.patch \
             file://0010-build-shared-libs.patch \
             file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
+            file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
            "
 
 SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
-- 
2.11.1


