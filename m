Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE5F36BF85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:51:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2014 08:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; 
	d="scan'208,223";a="552717667"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2014 08:51:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:51:20 +0100
Message-Id: <dfc10562d2b6fec8b4c4f5bce40179059b01ee86.1402328991.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402328991.git.paul.eggleton@linux.intel.com>
References: <cover.1402328991.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402328991.git.paul.eggleton@linux.intel.com>
References: <cover.1402328991.git.paul.eggleton@linux.intel.com>
Subject: [daisy][PATCH 5/5] openssl: fix CVE-2014-3470
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
X-List-Received-Date: Mon, 09 Jun 2014 15:51:48 -0000

From the OpenSSL Security Advisory [05 Jun 2014]
http://www.openssl.org/news/secadv_20140605.txt

Anonymous ECDH denial of service (CVE-2014-3470)

OpenSSL TLS clients enabling anonymous ECDH ciphersuites are subject to a
denial of service attack.

(Patch borrowed from Fedora.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/openssl-1.0.1e-cve-2014-3470.patch     | 31 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-3470.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-3470.patch b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-3470.patch
new file mode 100644
index 0000000..025727f
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-3470.patch
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index 64e8f82..274c69d 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -38,6 +38,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.1e-cve-2014-0198.patch \
             file://openssl-1.0.1e-cve-2014-0221.patch \
             file://openssl-1.0.1e-cve-2014-0224.patch \
+            file://openssl-1.0.1e-cve-2014-3470.patch \
             file://openssl-CVE-2010-5298.patch \
            "
 
-- 
1.9.3


