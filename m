Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CEFD6BE7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 09:08:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q984mI009038
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:08:04 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 02:08:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 17:08:44 +0800
Message-ID: <8bd05167a49279bdaf1899bf266a39fce93fdd43.1395823715.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395823715.git.jackie.huang@windriver.com>
References: <cover.1395823715.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] Security Advisory - openssl - CVE-2013-6450
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
X-List-Received-Date: Wed, 26 Mar 2014 09:08:03 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The DTLS retransmission implementation in OpenSSL through 0.9.8y and 1.x
through 1.0.1e does not properly maintain data structures for digest and
encryption contexts, which might allow man-in-the-middle attackers to
trigger the use of a different context by interfering with packet delivery,
related to ssl/d1_both.c and ssl/t1_enc.c.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...DTLS-retransmission-from-previous-session.patch |   81 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
new file mode 100644
index 0000000..39592e2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-DTLS-retransmission-from-previous-session.patch
@@ -0,0 +1,81 @@
+From 34628967f1e65dc8f34e000f0f5518e21afbfc7b Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Fri, 20 Dec 2013 15:26:50 +0000
+Subject: [PATCH] Fix DTLS retransmission from previous session.
+
+Upstream-Status: Backport
+commit 34628967f1e65dc8f34e000f0f5518e21afbfc7b upstream
+
+For DTLS we might need to retransmit messages from the previous session
+so keep a copy of write context in DTLS retransmission buffers instead
+of replacing it after sending CCS. CVE-2013-6450.
+---
+ ssl/d1_both.c  |    6 ++++++
+ ssl/ssl_locl.h |    2 ++
+ ssl/t1_enc.c   |   17 +++++++++++------
+ 4 files changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/ssl/d1_both.c b/ssl/d1_both.c
+index 65ec001..7a5596a 100644
+--- a/ssl/d1_both.c
++++ b/ssl/d1_both.c
+@@ -214,6 +214,12 @@ dtls1_hm_fragment_new(unsigned long frag_len, int reassembly)
+ static void
+ dtls1_hm_fragment_free(hm_fragment *frag)
+ 	{
++
++	if (frag->msg_header.is_ccs)
++		{
++		EVP_CIPHER_CTX_free(frag->msg_header.saved_retransmit_state.enc_write_ctx);
++		EVP_MD_CTX_destroy(frag->msg_header.saved_retransmit_state.write_hash);
++		}
+ 	if (frag->fragment) OPENSSL_free(frag->fragment);
+ 	if (frag->reassembly) OPENSSL_free(frag->reassembly);
+ 	OPENSSL_free(frag);
+diff --git a/ssl/ssl_locl.h b/ssl/ssl_locl.h
+index 96ce9a7..e485907 100644
+--- a/ssl/ssl_locl.h
++++ b/ssl/ssl_locl.h
+@@ -621,6 +621,8 @@ extern SSL3_ENC_METHOD TLSv1_enc_data;
+ extern SSL3_ENC_METHOD SSLv3_enc_data;
+ extern SSL3_ENC_METHOD DTLSv1_enc_data;
+ 
++#define SSL_IS_DTLS(s) (s->method->version == DTLS1_VERSION)
++
+ #define IMPLEMENT_tls_meth_func(version, func_name, s_accept, s_connect, \
+ 				s_get_meth) \
+ const SSL_METHOD *func_name(void)  \
+diff --git a/ssl/t1_enc.c b/ssl/t1_enc.c
+index 72015f5..56db834 100644
+--- a/ssl/t1_enc.c
++++ b/ssl/t1_enc.c
+@@ -414,15 +414,20 @@ int tls1_change_cipher_state(SSL *s, int which)
+ 			s->mac_flags |= SSL_MAC_FLAG_WRITE_MAC_STREAM;
+ 			else
+ 			s->mac_flags &= ~SSL_MAC_FLAG_WRITE_MAC_STREAM;
+-		if (s->enc_write_ctx != NULL)
++		if (s->enc_write_ctx != NULL && !SSL_IS_DTLS(s))
+ 			reuse_dd = 1;
+-		else if ((s->enc_write_ctx=OPENSSL_malloc(sizeof(EVP_CIPHER_CTX))) == NULL)
++		else if ((s->enc_write_ctx=EVP_CIPHER_CTX_new()) == NULL)
+ 			goto err;
+-		else
+-			/* make sure it's intialized in case we exit later with an error */
+-			EVP_CIPHER_CTX_init(s->enc_write_ctx);
+ 		dd= s->enc_write_ctx;
+-		mac_ctx = ssl_replace_hash(&s->write_hash,NULL);
++		if (SSL_IS_DTLS(s))
++			{
++			mac_ctx = EVP_MD_CTX_create();
++			if (!mac_ctx)
++				goto err;
++			s->write_hash = mac_ctx;
++			}
++		else
++			mac_ctx = ssl_replace_hash(&s->write_hash,NULL);
+ #ifndef OPENSSL_NO_COMP
+ 		if (s->compress != NULL)
+ 			{
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 3e92234..4b9fd36 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://configure-targets.patch \
             file://initial-aarch64-bits.patch \
             file://find.pl \
             file://0001-Fix-for-TLS-record-tampering-bug-CVE-2013-4353.patch \
+            file://0001-Fix-DTLS-retransmission-from-previous-session.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.7.9.5


