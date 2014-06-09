Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 26D4B6FA47
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:53:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; 
	d="scan'208,223";a="554544800"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:53:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:53:45 +0100
Message-Id: <499ed141558ca50a9e97fc9a979c131fca27ba21.1402329159.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 3/6] openssl: fix CVE-2014-0221
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
X-List-Received-Date: Mon, 09 Jun 2014 15:53:57 -0000

From the OpenSSL Security Advisory [05 Jun 2014]
http://www.openssl.org/news/secadv_20140605.txt

DTLS recursion flaw (CVE-2014-0221)

By sending an invalid DTLS handshake to an OpenSSL DTLS client the code
can be made to recurse eventually crashing in a DoS attack.

Only applications using OpenSSL as a DTLS client are affected.

(Patch borrowed from Fedora.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl-1.0.1e-cve-2014-0221.patch             | 38 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0221.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0221.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0221.patch
new file mode 100644
index 0000000..bf730a8
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0221.patch
@@ -0,0 +1,38 @@
+commit d30e582446b027868cdabd0994681643682045a4
+Author: Dr. Stephen Henson <steve@openssl.org>
+Date:   Fri May 16 13:00:45 2014 +0100
+
+    Fix CVE-2014-0221
+    
+    Unnecessary recursion when receiving a DTLS hello request can be used to
+    crash a DTLS client. Fixed by handling DTLS hello request without recursion.
+    
+    Thanks to Imre Rad (Search-Lab Ltd.) for discovering this issue.
+
+Patch borrowed from Fedora
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/ssl/d1_both.c b/ssl/d1_both.c
+index 07f67f8..4c2fd03 100644
+--- a/ssl/d1_both.c
++++ b/ssl/d1_both.c
+@@ -793,6 +793,7 @@ dtls1_get_message_fragment(SSL *s, int st1, int stn, long max, int *ok)
+ 	int i,al;
+ 	struct hm_header_st msg_hdr;
+ 
++	redo:
+ 	/* see if we have the required fragment already */
+ 	if ((frag_len = dtls1_retrieve_buffered_fragment(s,max,ok)) || *ok)
+ 		{
+@@ -851,8 +852,7 @@ dtls1_get_message_fragment(SSL *s, int st1, int stn, long max, int *ok)
+ 					s->msg_callback_arg);
+ 			
+ 			s->init_num = 0;
+-			return dtls1_get_message_fragment(s, st1, stn,
+-				max, ok);
++			goto redo;
+ 			}
+ 		else /* Incorrectly formated Hello request */
+ 			{
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 38cdb3f..dc77330 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2014-0160.patch \
             file://openssl-1.0.1e-cve-2014-0195.patch \
             file://openssl-1.0.1e-cve-2014-0198.patch \
+            file://openssl-1.0.1e-cve-2014-0221.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.3


