Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 51C976FFD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 12:06:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 12 May 2016 05:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="951742623"
Received: from jxu11-mobl2.amr.corp.intel.com (HELO
	jlock-mobl2.ger.corp.intel.com) ([10.255.3.247])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2016 05:06:49 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 13:06:34 +0100
Message-Id: <3c0cf3525528245c6256ecb254fda0f57197889b.1463054731.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1463054447.git.joshua.g.lock@intel.com>
References: <cover.1463054447.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1463054731.git.joshua.g.lock@intel.com>
References: <cover.1463054731.git.joshua.g.lock@intel.com>
Subject: [fido][PATCH 1/1] openssl: prevent ABI break from earlier fido releases
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
X-List-Received-Date: Thu, 12 May 2016 12:06:48 -0000

The backported upgrade to 1.0.2h included an updated GNU LD
version-script which results in an ABI change. In order to try and
respect ABI for existing binaries built against fido this commit
partially reverts the version-script to maintain the existing ABI
and instead only add the new symbols required by 1.0.2h.

Suggested-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../openssl/debian1.0.2/version-script.patch       | 31 +++++++++++++++-------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
index 29f11a2..f53efdb 100644
--- a/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
+++ b/meta/recipes-connectivity/openssl/openssl/debian1.0.2/version-script.patch
@@ -15,8 +15,8 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld	2014-02-24 22:19:08.601827266 +0100
-@@ -0,0 +1,4608 @@
-+OPENSSL_1.0.2d {
+@@ -0,0 +1,4621 @@
++OPENSSL_1.0.0 {
 +	global:
 +		BIO_f_ssl;
 +		BIO_new_buffer_ssl_connect;
@@ -4314,6 +4314,14 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		CRYPTO_cbc128_decrypt;
 +		CRYPTO_cfb128_encrypt;
 +		CRYPTO_cfb128_8_encrypt;
++
++	local:
++		*;
++};
++
++
++OPENSSL_1.0.1 {
++	global:
 +		SSL_renegotiate_abbreviated;
 +		TLSv1_1_method;
 +		TLSv1_1_client_method;
@@ -4475,7 +4483,15 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		BIO_s_datagram_sctp;
 +		BIO_dgram_is_sctp;
 +		BIO_dgram_sctp_notification_cb;
++} OPENSSL_1.0.0;
++
++OPENSSL_1.0.1d {
++	global:
 +		CRYPTO_memcmp;
++} OPENSSL_1.0.1;
++
++OPENSSL_1.0.2 {
++	global:
 +		SSL_CTX_set_alpn_protos;
 +		SSL_set_alpn_protos;
 +		SSL_CTX_set_alpn_select_cb;
@@ -4613,23 +4629,20 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/openssl.ld
 +		BUF_strnlen;
 +		sk_deep_copy;
 +		SSL_test_functions;
-+
-+	local:
-+		*;
-+};
++} OPENSSL_1.0.1d;
 +
 +OPENSSL_1.0.2g {
 +       global:
 +               SRP_VBASE_get1_by_user;
 +               SRP_user_pwd_free;
-+} OPENSSL_1.0.2d;
++} OPENSSL_1.0.2;
 +
 Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/openssl.ld	2014-02-24 21:02:30.000000000 +0100
 @@ -0,0 +1,10 @@
-+OPENSSL_1.0.2 {
++OPENSSL_1.0.0 {
 +	global:
 +		bind_engine;
 +		v_check;
@@ -4644,7 +4657,7 @@ Index: openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
 +++ openssl-1.0.2~beta1.obsolete.0.0498436515490575/engines/ccgost/openssl.ld	2014-02-24 21:02:30.000000000 +0100
 @@ -0,0 +1,10 @@
-+OPENSSL_1.0.2 {
++OPENSSL_1.0.0 {
 +	global:
 +		bind_engine;
 +		v_check;
-- 
2.5.5


