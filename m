Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 83AA971E02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 01:50:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Feb 2017 17:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,167,1484035200"; d="scan'208";a="59017098"
Received: from unknown (HELO rebeccas-z640.png.intel.com) ([10.221.118.141])
	by orsmga004.jf.intel.com with ESMTP; 15 Feb 2017 17:50:36 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 09:53:32 +0800
Message-Id: <1487210012-50236-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487210012-50236-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1487210012-50236-1-git-send-email-rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
Subject: [jethro][PATCH 2/2] openssl: CVE: CVE-2017-3731
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
X-List-Received-Date: Thu, 16 Feb 2017 01:50:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Alexandru Moise <alexandru.moise@windriver.com>

If an SSL/TLS server or client is running on a 32-bit host, and a
specific cipher is being used, then a truncated packet can cause that
server or client  to perform an out-of-bounds read, usually resulting
in a crash.

Backported from:
https://github.com/openssl/openssl/commit/8e20499629b6bcf868d0072c7011e590b5c2294d
https://github.com/openssl/openssl/commit/2198b3a55de681e1f3c23edb0586afe13f438051

* CVE: CVE-2017-3731

Upstream-status: Backport

(From OE-Core rev: 1fe1cb3e6e03b4f7f0d30b2b67edc8809a18fe70)

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
Signed-off-by: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 .../openssl/openssl/0001-CVE-2017-3731.patch       | 46 +++++++++++++++++++
 .../openssl/openssl/0002-CVE-2017-3731.patch       | 53 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch b/meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch
new file mode 100644
index 0000000..04ef526
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch
@@ -0,0 +1,46 @@
+From 0cde9a9645c949fd0acf657dadc747676245cfaf Mon Sep 17 00:00:00 2001
+From: Alexandru Moise <alexandru.moise@windriver.com>
+Date: Tue, 7 Feb 2017 11:13:19 +0200
+Subject: [PATCH 1/2] crypto/evp: harden RC4_MD5 cipher.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Originally a crash in 32-bit build was reported CHACHA20-POLY1305
+cipher. The crash is triggered by truncated packet and is result
+of excessive hashing to the edge of accessible memory (or bogus
+MAC value is produced if x86 MD5 assembly module is involved). Since
+hash operation is read-only it is not considered to be exploitable
+beyond a DoS condition.
+
+Thanks to Robert Święcki for report.
+
+CVE-2017-3731
+
+Backported from upstream commit:
+8e20499629b6bcf868d0072c7011e590b5c2294d
+
+Upstream-Status: Backport
+
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
+---
+ crypto/evp/e_rc4_hmac_md5.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/crypto/evp/e_rc4_hmac_md5.c b/crypto/evp/e_rc4_hmac_md5.c
+index 5e92855..3293419 100644
+--- a/crypto/evp/e_rc4_hmac_md5.c
++++ b/crypto/evp/e_rc4_hmac_md5.c
+@@ -269,6 +269,8 @@ static int rc4_hmac_md5_ctrl(EVP_CIPHER_CTX *ctx, int type, int arg,
+             len = p[arg - 2] << 8 | p[arg - 1];
+ 
+             if (!ctx->encrypt) {
++		if (len < MD5_DIGEST_LENGTH)
++                    return -1;
+                 len -= MD5_DIGEST_LENGTH;
+                 p[arg - 2] = len >> 8;
+                 p[arg - 1] = len;
+-- 
+2.10.2
+
diff --git a/meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch b/meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
new file mode 100644
index 0000000..b56b2d5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch
@@ -0,0 +1,53 @@
+From 6427f1accc54b515bb899370f1a662bfcb1caa52 Mon Sep 17 00:00:00 2001
+From: Alexandru Moise <alexandru.moise@windriver.com>
+Date: Tue, 7 Feb 2017 11:16:13 +0200
+Subject: [PATCH 2/2] crypto/evp: harden AEAD ciphers.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Originally a crash in 32-bit build was reported CHACHA20-POLY1305
+cipher. The crash is triggered by truncated packet and is result
+of excessive hashing to the edge of accessible memory. Since hash
+operation is read-only it is not considered to be exploitable
+beyond a DoS condition. Other ciphers were hardened.
+
+Thanks to Robert Święcki for report.
+
+CVE-2017-3731
+
+Backported from upstream commit:
+2198b3a55de681e1f3c23edb0586afe13f438051
+
+Upstream-Status: Backport
+
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
+---
+ crypto/evp/e_aes.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/evp/e_aes.c b/crypto/evp/e_aes.c
+index 1734a82..16dcd10 100644
+--- a/crypto/evp/e_aes.c
++++ b/crypto/evp/e_aes.c
+@@ -1235,10 +1235,15 @@ static int aes_gcm_ctrl(EVP_CIPHER_CTX *c, int type, int arg, void *ptr)
+         {
+             unsigned int len = c->buf[arg - 2] << 8 | c->buf[arg - 1];
+             /* Correct length for explicit IV */
++	    if (len < EVP_GCM_TLS_EXPLICIT_IV_LEN)
++	        return 0;
+             len -= EVP_GCM_TLS_EXPLICIT_IV_LEN;
+             /* If decrypting correct for tag too */
+-            if (!c->encrypt)
++            if (!c->encrypt) {
++		if (len < EVP_GCM_TLS_TAG_LEN)
++		    return 0;
+                 len -= EVP_GCM_TLS_TAG_LEN;
++	    }
+             c->buf[arg - 2] = len >> 8;
+             c->buf[arg - 1] = len & 0xff;
+         }
+-- 
+2.10.2
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index fc5e3e3..e552503 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -52,6 +52,8 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2016-2179.patch \
             file://CVE-2016-8610.patch \
             file://CVE-2016-7055.patch \
+            file://0001-CVE-2017-3731.patch \
+            file://0002-CVE-2017-3731.patch \
            "
 
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
-- 
2.7.4


