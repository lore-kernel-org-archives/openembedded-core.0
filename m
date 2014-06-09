Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1901E6FA3B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:53:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; 
	d="scan'208,223";a="554544782"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:53:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:53:43 +0100
Message-Id: <9a53d82b7680a9c988569673d89132ae3f32dbdd.1402329157.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [dora][PATCH 1/6] openssl: fix CVE-2014-0195
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From the OpenSSL Security Advisory [05 Jun 2014]
http://www.openssl.org/news/secadv_20140605.txt

DTLS invalid fragment vulnerability (CVE-2014-0195)

A buffer overrun attack can be triggered by sending invalid DTLS fragments
to an OpenSSL DTLS client or server. This is potentially exploitable to
run arbitrary code on a vulnerable client or server.

Only applications using OpenSSL as a DTLS client or server affected.

(Patch borrowed from Fedora.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl-1.0.1e-cve-2014-0195.patch             | 40 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0195.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0195.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0195.patch
new file mode 100644
index 0000000..0c43919
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-0195.patch
@@ -0,0 +1,40 @@
+commit 208d54db20d58c9a5e45e856a0650caadd7d9612
+Author: Dr. Stephen Henson <steve@openssl.org>
+Date:   Tue May 13 18:48:31 2014 +0100
+
+    Fix for CVE-2014-0195
+    
+    A buffer overrun attack can be triggered by sending invalid DTLS fragments
+    to an OpenSSL DTLS client or server. This is potentially exploitable to
+    run arbitrary code on a vulnerable client or server.
+    
+    Fixed by adding consistency check for DTLS fragments.
+    
+    Thanks to Jüri Aedla for reporting this issue.
+
+Patch borrowed from Fedora
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/ssl/d1_both.c b/ssl/d1_both.c
+index 2e8cf68..07f67f8 100644
+--- a/ssl/d1_both.c
++++ b/ssl/d1_both.c
+@@ -627,7 +627,16 @@ dtls1_reassemble_fragment(SSL *s, struct hm_header_st* msg_hdr, int *ok)
+ 		frag->msg_header.frag_off = 0;
+ 		}
+ 	else
++		{
+ 		frag = (hm_fragment*) item->data;
++		if (frag->msg_header.msg_len != msg_hdr->msg_len)
++			{
++			item = NULL;
++			frag = NULL;
++			goto err;
++			}
++		}
++
+ 
+ 	/* If message is already reassembled, this must be a
+ 	 * retransmit and can be dropped.
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 842a903..7783206 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
             file://CVE-2014-0160.patch \
             file://openssl-CVE-2014-0198-fix.patch \
+            file://openssl-1.0.1e-cve-2014-0195.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.3


