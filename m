Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BE81772032
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 06:14:55 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Thu, 6 Nov 2014
	07:14:55 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Nov 2014 07:14:32 +0100
Message-ID: <1415254473-43690-3-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415254473-43690-1-git-send-email-sona.sarmadi@enea.com>
References: <1415254473-43690-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [dora][PATCH 3/4] openssl: Fix for CVE-2014-3567
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
X-List-Received-Date: Thu, 06 Nov 2014 06:14:57 -0000
Content-Type: text/plain

Fix for session tickets memory leak.

This patch is a backport from OpenSSL_1.0.1j.

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../openssl-1.0.1e/openssl-fix-CVE-2014-3567.patch | 32 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-CVE-2014-3567.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-CVE-2014-3567.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-CVE-2014-3567.patch
new file mode 100644
index 0000000..61f821b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-fix-CVE-2014-3567.patch
@@ -0,0 +1,32 @@
+From 748270554824d2a51d1718f52a8d3ab34116bbfb Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
+Date: Wed, 15 Oct 2014 01:53:55 +0100
+Subject: [PATCH] Fix for session tickets memory leak.
+
+CVE-2014-3567
+
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Signed-off-by: Catalin Popeanga <catalin.popeanga@enea.com>
+---
+ ssl/t1_lib.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index 879467c..77fe232 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -3380,7 +3380,10 @@ static int tls_decrypt_ticket(SSL *s, const unsigned char *etick, int eticklen,
+ 	HMAC_Final(&hctx, tick_hmac, NULL);
+ 	HMAC_CTX_cleanup(&hctx);
+ 	if (CRYPTO_memcmp(tick_hmac, etick + eticklen, mlen))
++		{
++		EVP_CIPHER_CTX_cleanup(&ctx);
+ 		return 2;
++		}
+ 	/* Attempt to decrypt session data */
+ 	/* Move p after IV to start of encrypted ticket, update length */
+ 	p = etick + 16 + EVP_CIPHER_CTX_iv_length(&ctx);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index 8282822..6af4ee9 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -46,6 +46,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-CVE-2010-5298.patch \
 	    file://openssl-fix-CVE-2014-3566.patch \
 	    file://openssl-fix-CVE-2014-3513.patch \
+	    file://openssl-fix-CVE-2014-3567.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.9.1


