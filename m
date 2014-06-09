Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7690A65FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:51:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2014 08:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; 
	d="scan'208,223";a="552717659"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2014 08:51:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:51:19 +0100
Message-Id: <0c140862797a8058b6547fd2c70d6ced5e10b296.1402328991.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402328991.git.paul.eggleton@linux.intel.com>
References: <cover.1402328991.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402328991.git.paul.eggleton@linux.intel.com>
References: <cover.1402328991.git.paul.eggleton@linux.intel.com>
Subject: [daisy][PATCH 4/5] openssl: fix CVE-2014-0224
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

SSL/TLS MITM vulnerability (CVE-2014-0224)

An attacker using a carefully crafted handshake can force the use of weak
keying material in OpenSSL SSL/TLS clients and servers. This can be exploited
by a Man-in-the-middle (MITM) attack where the attacker can decrypt and
modify traffic from the attacked client and server.

The attack can only be performed between a vulnerable client *and*
server. OpenSSL clients are vulnerable in all versions of OpenSSL. Servers
are only known to be vulnerable in OpenSSL 1.0.1 and 1.0.2-beta1. Users
of OpenSSL servers earlier than 1.0.1 are advised to upgrade as a precaution.

(Patch borrowed from Fedora.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssl/openssl-1.0.1e-cve-2014-0224.patch     | 103 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0224.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0224.patch b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0224.patch
new file mode 100644
index 0000000..0ed1d12
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/openssl-1.0.1e-cve-2014-0224.patch
@@ -0,0 +1,103 @@
+Fix for CVE-2014-0224
+
+Only accept change cipher spec when it is expected instead of at any
+time. This prevents premature setting of session keys before the master
+secret is determined which an attacker could use as a MITM attack.
+
+Thanks to KIKUCHI Masashi (Lepidum Co. Ltd.) for reporting this issue
+and providing the initial fix this patch is based on.
+
+
+Patch borrowed from Fedora
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+
+diff -up openssl-1.0.1e/ssl/ssl3.h.keying-mitm openssl-1.0.1e/ssl/ssl3.h
+--- openssl-1.0.1e/ssl/ssl3.h.keying-mitm	2014-06-02 19:48:04.518100562 +0200
++++ openssl-1.0.1e/ssl/ssl3.h	2014-06-02 19:48:04.642103429 +0200
+@@ -388,6 +388,7 @@ typedef struct ssl3_buffer_st
+ #define TLS1_FLAGS_TLS_PADDING_BUG		0x0008
+ #define TLS1_FLAGS_SKIP_CERT_VERIFY		0x0010
+ #define TLS1_FLAGS_KEEP_HANDSHAKE		0x0020
++#define SSL3_FLAGS_CCS_OK			0x0080
+  
+ /* SSL3_FLAGS_SGC_RESTART_DONE is set when we
+  * restart a handshake because of MS SGC and so prevents us
+diff -up openssl-1.0.1e/ssl/s3_clnt.c.keying-mitm openssl-1.0.1e/ssl/s3_clnt.c
+--- openssl-1.0.1e/ssl/s3_clnt.c.keying-mitm	2013-02-11 16:26:04.000000000 +0100
++++ openssl-1.0.1e/ssl/s3_clnt.c	2014-06-02 19:49:57.042701985 +0200
+@@ -559,6 +559,7 @@ int ssl3_connect(SSL *s)
+ 		case SSL3_ST_CR_FINISHED_A:
+ 		case SSL3_ST_CR_FINISHED_B:
+ 
++			s->s3->flags |= SSL3_FLAGS_CCS_OK;
+ 			ret=ssl3_get_finished(s,SSL3_ST_CR_FINISHED_A,
+ 				SSL3_ST_CR_FINISHED_B);
+ 			if (ret <= 0) goto end;
+@@ -916,6 +917,7 @@ int ssl3_get_server_hello(SSL *s)
+ 		SSLerr(SSL_F_SSL3_GET_SERVER_HELLO,SSL_R_ATTEMPT_TO_REUSE_SESSION_IN_DIFFERENT_CONTEXT);
+ 		goto f_err;
+ 		}
++	    s->s3->flags |= SSL3_FLAGS_CCS_OK;
+ 	    s->hit=1;
+ 	    }
+ 	else	/* a miss or crap from the other end */
+diff -up openssl-1.0.1e/ssl/s3_pkt.c.keying-mitm openssl-1.0.1e/ssl/s3_pkt.c
+--- openssl-1.0.1e/ssl/s3_pkt.c.keying-mitm	2014-06-02 19:48:04.640103383 +0200
++++ openssl-1.0.1e/ssl/s3_pkt.c	2014-06-02 19:48:04.643103452 +0200
+@@ -1298,6 +1298,15 @@ start:
+ 			goto f_err;
+ 			}
+ 
++		if (!(s->s3->flags & SSL3_FLAGS_CCS_OK))
++			{
++			al=SSL_AD_UNEXPECTED_MESSAGE;
++			SSLerr(SSL_F_SSL3_READ_BYTES,SSL_R_CCS_RECEIVED_EARLY);
++			goto f_err;
++			}
++
++		s->s3->flags &= ~SSL3_FLAGS_CCS_OK;
++
+ 		rr->length=0;
+ 
+ 		if (s->msg_callback)
+@@ -1432,7 +1441,7 @@ int ssl3_do_change_cipher_spec(SSL *s)
+ 
+ 	if (s->s3->tmp.key_block == NULL)
+ 		{
+-		if (s->session == NULL) 
++		if (s->session == NULL || s->session->master_key_length == 0)
+ 			{
+ 			/* might happen if dtls1_read_bytes() calls this */
+ 			SSLerr(SSL_F_SSL3_DO_CHANGE_CIPHER_SPEC,SSL_R_CCS_RECEIVED_EARLY);
+diff -up openssl-1.0.1e/ssl/s3_srvr.c.keying-mitm openssl-1.0.1e/ssl/s3_srvr.c
+--- openssl-1.0.1e/ssl/s3_srvr.c.keying-mitm	2014-06-02 19:48:04.630103151 +0200
++++ openssl-1.0.1e/ssl/s3_srvr.c	2014-06-02 19:48:04.643103452 +0200
+@@ -673,6 +673,7 @@ int ssl3_accept(SSL *s)
+ 		case SSL3_ST_SR_CERT_VRFY_A:
+ 		case SSL3_ST_SR_CERT_VRFY_B:
+ 
++			s->s3->flags |= SSL3_FLAGS_CCS_OK;
+ 			/* we should decide if we expected this one */
+ 			ret=ssl3_get_cert_verify(s);
+ 			if (ret <= 0) goto end;
+@@ -700,6 +701,7 @@ int ssl3_accept(SSL *s)
+ 
+ 		case SSL3_ST_SR_FINISHED_A:
+ 		case SSL3_ST_SR_FINISHED_B:
++			s->s3->flags |= SSL3_FLAGS_CCS_OK;
+ 			ret=ssl3_get_finished(s,SSL3_ST_SR_FINISHED_A,
+ 				SSL3_ST_SR_FINISHED_B);
+ 			if (ret <= 0) goto end;
+@@ -770,7 +772,10 @@ int ssl3_accept(SSL *s)
+ 				s->s3->tmp.next_state=SSL3_ST_SR_FINISHED_A;
+ #else
+ 				if (s->s3->next_proto_neg_seen)
++					{
++					s->s3->flags |= SSL3_FLAGS_CCS_OK;
+ 					s->s3->tmp.next_state=SSL3_ST_SR_NEXT_PROTO_A;
++					}
+ 				else
+ 					s->s3->tmp.next_state=SSL3_ST_SR_FINISHED_A;
+ #endif
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
index d4084de..64e8f82 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1g.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-1.0.1e-cve-2014-0195.patch \
             file://openssl-1.0.1e-cve-2014-0198.patch \
             file://openssl-1.0.1e-cve-2014-0221.patch \
+            file://openssl-1.0.1e-cve-2014-0224.patch \
             file://openssl-CVE-2010-5298.patch \
            "
 
-- 
1.9.3


