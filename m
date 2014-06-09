Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 345466FA51
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:53:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; 
	d="scan'208,223";a="554544818"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:53:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:53:47 +0100
Message-Id: <3a55c1ad45c1cff61671adde3add7b00e2a2bccc.1402329160.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402329156.git.paul.eggleton@linux.intel.com>
References: <cover.1402329156.git.paul.eggleton@linux.intel.com>
Subject: [dora][PATCH 5/6] openssl: fix CVE-2014-3470
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

Anonymous ECDH denial of service (CVE-2014-3470)

OpenSSL TLS clients enabling anonymous ECDH ciphersuites are subject to a
denial of service attack.

(Patch borrowed from Fedora.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl-1.0.1e-cve-2014-3470.patch             | 31 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-3470.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-3470.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-3470.patch
new file mode 100644
index 0000000..025727f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-1.0.1e-cve-2014-3470.patch
@@ -0,0 +1,31 @@
+commit 4ad43d511f6cf064c66eb4bfd0fb0919b5dd8a86
+Author: Dr. Stephen Henson <steve@openssl.org>
+Date:   Thu May 29 15:00:05 2014 +0100
+
+    Fix CVE-2014-3470
+    
+    Check session_cert is not NULL before dereferencing it.
+
+Patch borrowed from Fedora
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+
+diff --git a/ssl/s3_clnt.c b/ssl/s3_clnt.c
+index d35376d..4324f8d 100644
+--- a/ssl/s3_clnt.c
++++ b/ssl/s3_clnt.c
+@@ -2511,6 +2511,13 @@ int ssl3_send_client_key_exchange(SSL *s)
+ 			int ecdh_clnt_cert = 0;
+ 			int field_size = 0;
+ 
++			if (s->session->sess_cert == NULL) 
++				{
++				ssl3_send_alert(s,SSL3_AL_FATAL,SSL_AD_UNEXPECTED_MESSAGE);
++				SSLerr(SSL_F_SSL3_SEND_CLIENT_KEY_EXCHANGE,SSL_R_UNEXPECTED_MESSAGE);
++				goto err;
++				}
++
+ 			/* Did we send out the client's
+ 			 * ECDH share for use in premaster
+ 			 * computation as part of client certificate?
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index fae0b93..65083fb 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -42,6 +42,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.1e-cve-2014-0198.patch \
             file://openssl-1.0.1e-cve-2014-0221.patch \
             file://openssl-1.0.1e-cve-2014-0224.patch \
+            file://openssl-1.0.1e-cve-2014-3470.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.3


