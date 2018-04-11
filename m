Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A862871A18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 00:21:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3B0LKP3023776
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 17:21:20 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 10 Apr 2018 17:21:19 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 08:21:18 +0800
Message-ID: <1523406078-26064-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [sumo][PATCH] dhcp: Security Advisory - CVE-2017-3144
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
X-List-Received-Date: Wed, 11 Apr 2018 00:21:20 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Fix CVE-2017-3144

References:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-3144
https://kb.isc.org/article/AA-01541

Patch from:
https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commitdiff;h=5097bc0559f592683faac1f67bf350e1bddf6ed4

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp/CVE-2017-3144.patch                  | 74 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb       |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch b/meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
new file mode 100644
index 0000000..2b2688c
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2017-3144.patch
@@ -0,0 +1,74 @@
+From 8cfdedee369c26d2869b6ec4a64460b5f5a30934 Mon Sep 17 00:00:00 2001
+From: Thomas Markwalder <tmark@isc.org>
+Date: Thu, 7 Dec 2017 11:39:30 -0500
+Subject: [PATCH] [v4_3] Plugs a socket descriptor leak in OMAPI
+
+        Merges in rt46767.
+
+Upstream-Status: Backport
+[https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commitdiff;h=5097bc0559f592683faac1f67bf350e1bddf6ed4]
+
+CVE: CVE-2017-3144
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ RELNOTES         | 7 +++++++
+ omapip/buffer.c  | 9 +++++++++
+ omapip/message.c | 2 +-
+ 3 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/RELNOTES b/RELNOTES
+index dd40aaf..3741b80 100644
+--- a/RELNOTES
++++ b/RELNOTES
+@@ -66,6 +66,13 @@ We welcome comments from DHCP users, about this or anything else we do.
+ Email Vicky Risk, Product Manager at vicky@isc.org or discuss on 
+ dhcp-users@lists.isc.org.
+ 
++- Plugged a socket descriptor leak in OMAPI, that can occur when there is
++  data pending to be written to an OMAPI connection, when the connection
++  is closed by the reader.  Thanks to Pavel Zhukov at RedHat for bringing
++  this issue to our attention and whose patch helped guide us in the right
++  direction.
++  [ISc-Bugs #46767]
++
+ 			Changes since 4.3.6b1
+ 
+ - None
+diff --git a/omapip/buffer.c b/omapip/buffer.c
+index f7fdc32..809034d 100644
+--- a/omapip/buffer.c
++++ b/omapip/buffer.c
+@@ -566,6 +566,15 @@ isc_result_t omapi_connection_writer (omapi_object_t *h)
+ 			omapi_buffer_dereference (&buffer, MDL);
+ 		}
+ 	}
++
++	/* If we had data left to write when we're told to disconnect,
++	* we need recall disconnect, now that we're done writing.
++	* See rt46767. */
++	if (c->out_bytes == 0 && c->state == omapi_connection_disconnecting) {
++		omapi_disconnect (h, 1);
++		return ISC_R_SHUTTINGDOWN;
++	}
++
+ 	return ISC_R_SUCCESS;
+ }
+ 
+diff --git a/omapip/message.c b/omapip/message.c
+index 59ccdc2..21bcfc3 100644
+--- a/omapip/message.c
++++ b/omapip/message.c
+@@ -339,7 +339,7 @@ isc_result_t omapi_message_unregister (omapi_object_t *mo)
+ }
+ 
+ #ifdef DEBUG_PROTOCOL
+-static const char *omapi_message_op_name(int op) {
++const char *omapi_message_op_name(int op) {
+ 	switch (op) {
+ 	case OMAPI_OP_OPEN:    return "OMAPI_OP_OPEN";
+ 	case OMAPI_OP_REFRESH: return "OMAPI_OP_REFRESH";
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
index 6615ae2..cc13549 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.6.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.pat
             file://0010-build-shared-libs.patch \
             file://0011-Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
             file://0012-dhcp-correct-the-intention-for-xml2-lib-search.patch \
+            file://CVE-2017-3144.patch \
            "
 
 SRC_URI[md5sum] = "afa6e9b3eb7539ea048421a82c668adc"
-- 
2.7.4


