Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE1946078E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 11:48:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v17BmoEp030619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Feb 2017 03:48:51 -0800
Received: from otp-amoise-l1.corp.ad.wrs.com (128.224.14.53) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 7 Feb 2017 03:48:50 -0800
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Feb 2017 13:48:47 +0200
Message-ID: <1486468127-16643-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v5][morty] openssl: CVE: CVE-2017-3731
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
X-List-Received-Date: Tue, 07 Feb 2017 11:48:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

If an SSL/TLS server or client is running on a 32-bit host, and a
specific cipher is being used, then a truncated packet can cause that
server or client  to perform an out-of-bounds read, usually resulting
in a crash.

Backported from:
https://github.com/openssl/openssl/commit/8e20499629b6bcf868d0072c7011e590b5c2294d
https://github.com/openssl/openssl/commit/2198b3a55de681e1f3c23edb0586afe13f438051

* CVE: CVE-2017-3731

Upstream-status: Backport

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 .../openssl/openssl/0001-CVE-2017-3731.patch       | 46 +++++++++++++++++++
 .../openssl/openssl/0002-CVE-2017-3731.patch       | 53 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2j.bb |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-CVE-2017-3731.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch b/meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch
new file mode 100644
index 0000000..b378c5e
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
index 0000000..990cbfd
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
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
index f2aca36..9a7cded 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2j.bb
@@ -41,6 +41,8 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://parallel.patch \
             file://openssl-util-perlpath.pl-cwd.patch \
             file://CVE-2016-7055.patch \
+            file://0001-CVE-2017-3731.patch \
+            file://0002-CVE-2017-3731.patch \
            "
 SRC_URI[md5sum] = "96322138f0b69e61b7212bc53d5e912b"
 SRC_URI[sha256sum] = "e7aff292be21c259c6af26469c7a9b3ba26e9abaaffd325e3dccc9785256c431"
-- 
2.10.2


