Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC4F4605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 12:49:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3ICnJkM011206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 05:49:19 -0700
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 18 Apr 2016 05:49:18 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 15:52:16 +0300
Message-ID: <1460983936-8037-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dhcp: CVE-2016-2774
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
X-List-Received-Date: Mon, 18 Apr 2016 12:49:20 -0000
Content-Type: text/plain

ISC DHCP 4.1.x before 4.1-ESV-R13 and 4.2.x and 4.3.x before
4.3.4 does not restrict the number of concurrent TCP sessions,
which allows remote attackers to cause a denial of service
(INSIST assertion failure or request-processing outage)
by establishing many sessions.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2774

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../dhcp/dhcp/CVE-2016-2774.patch                  | 65 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch
new file mode 100644
index 0000000..93ff54a
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch
@@ -0,0 +1,65 @@
+From b9f56d578ebfd649b5d829960540859ac6ca931c Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Tue, 12 Apr 2016 18:23:31 +0300
+Subject: [PATCH] Add patch to limit the value of an fd we accept for a
+ connection.
+
+By limiting the highest value we accept for an fd we limit the number
+of connections.
+
+Upstream-Status: Backport
+CVE: CVE-2016-2774
+
+Author: Shawn Routhier <sar@isc.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ includes/site.h   | 6 ++++++
+ omapip/listener.c | 9 +++++++--
+ 3 files changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/includes/site.h b/includes/site.h
+index 9c33de3..df020c8 100644
+--- a/includes/site.h
++++ b/includes/site.h
+@@ -290,6 +290,12 @@
+    this option will be removed at some time. */
+ /* #define INCLUDE_OLD_DHCP_ISC_ERROR_CODES */
+ 
++/* Limit the value of a file descriptor the serve will use
++   when accepting a connecting request.  This can be used to
++   limit the number of TCP connections that the server will
++   allow at one time.  A value of 0 means there is no limit.*/
++#define MAX_FD_VALUE 200
++
+ /* Include definitions for various options.  In general these
+    should be left as is, but if you have already defined one
+    of these and prefer your definition you can comment the 
+diff --git a/omapip/listener.c b/omapip/listener.c
+index 8bdcdbd..61473cf 100644
+--- a/omapip/listener.c
++++ b/omapip/listener.c
+@@ -3,7 +3,7 @@
+    Subroutines that support the generic listener object. */
+ 
+ /*
+- * Copyright (c) 2012,2014 by Internet Systems Consortium, Inc. ("ISC")
++ * Copyright (c) 2012,2014,2016 by Internet Systems Consortium, Inc. ("ISC")
+  * Copyright (c) 2004,2007,2009 by Internet Systems Consortium, Inc. ("ISC")
+  * Copyright (c) 1999-2003 by Internet Software Consortium
+  *
+@@ -233,7 +233,12 @@ isc_result_t omapi_accept (omapi_object_t *h)
+ 			return ISC_R_NORESOURCES;
+ 		return ISC_R_UNEXPECTED;
+ 	}
+-	
++
++	if ((MAX_FD_VALUE != 0) && (socket > MAX_FD_VALUE)) {
++		close(socket);
++		return (ISC_R_NORESOURCES);
++	}
++
+ #if defined (TRACING)
+ 	/* If we're recording a trace, remember the connection. */
+ 	if (trace_record ()) {
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
index 970617f..4e8cd27 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.3.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://replace-ifconfig-route.patch \
             file://CVE-2015-8605.patch \
             file://0001-site.h-enable-gentle-shutdown.patch \
+            file://CVE-2016-2774.patch \
            "
 
 SRC_URI[md5sum] = "c5577b09c9017cdd319a11ff6364268e"
-- 
2.7.4


