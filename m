Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC48E6D545
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 20:34:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i8so7328492wrm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=3VRclwCuDH3mW4T61mnMcGH8yFQ8Vao0xqOMw6miFuc=;
	b=x6RoJxaqH+vqis3dCDv2SmJjylKbHTYvmB4x3ob2FdM9zPtHrUTjGyjw9dqtSOJsM3
	SFZ4Knd9Lsl5SKQ265+ReDs8xEpl7IzaQHn6wHLPpJKb9b5aLf81IobgtKni7jKMBWnt
	7bEFEEmmA5aTEFKMq1uYR+Xzbohv2r0i7MLBnmii3qFh7S60jMNs/XkI6ktDYpxDqaHj
	RyOzuXxD02j98+kxNBRF5lmyZ+jj2V393HqgeFno6r3/TAmKlXQS/V40+C3wkaNjLapK
	viN3YIyVQgwe6BCL8nJRE83XUvCGCPrODZARv0qtJN5p9km1Ur41YjbcTY44IWgF+wkZ
	nFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3VRclwCuDH3mW4T61mnMcGH8yFQ8Vao0xqOMw6miFuc=;
	b=ZAN6Je4vymvBNWVFo4cycdX3ErPz+mP4DgCZYSQobk2/sbcLbk2gGWo7YIl6e4lg2t
	h8qZ0pEkI1T/bzDtF8m9HSn7In/JKVU9Kufas67I4/c8YpbfPP+aU7w18lQ43+bUht1E
	aFExxcvY9hcrx44sYKO+3kJaHcUqMY0p0hSpOjFxVB9TRW+AVNYajQgcjuCbC9qwCiNm
	wGU+qa/3vIQNrrgEJaXnp1FhPMqXZz8lCIjh0BIc9kfsjMQYX5MhsZe4YJ9Uq8E4b02o
	e9OQNbgLhygfWIZGtQ7Bbki8qlIn5ye8b5Mi0kPLLtiqTPIY6dKn3LkmfeoCBWIVBXzy
	q0rA==
X-Gm-Message-State: APjAAAV84AgxPazKfd9rGQyRa+0hiuMmcBYM6XKiOUdELKdAGH6M9Gzs
	RNRQI4SoCZg8XobOAldgRkxvUa+jC6A=
X-Google-Smtp-Source: APXvYqzdJWpCfZ+1UPid1V8E+Kwqc2exiVkajp6OF9cGLhsaab32a6OQII3nKOtNrTMY7hXm0VFflw==
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr14953945wrp.218.1552595648875;
	Thu, 14 Mar 2019 13:34:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm10357824wrw.85.2019.03.14.13.34.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Mar 2019 13:34:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2019 20:34:04 +0000
Message-Id: <20190314203404.22208-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] openssl: fix CVE-2019-1543
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
X-List-Received-Date: Thu, 14 Mar 2019 20:34:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../openssl/openssl/CVE-2019-1543.patch            | 69 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.1a.bb |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
new file mode 100644
index 00000000000..59a92f06e42
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/f426625b6ae9a7831010750490a5f0ad689c5ba3]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From f426625b6ae9a7831010750490a5f0ad689c5ba3 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 5 Mar 2019 14:39:15 +0000
+Subject: [PATCH] Prevent over long nonces in ChaCha20-Poly1305
+
+ChaCha20-Poly1305 is an AEAD cipher, and requires a unique nonce input for
+every encryption operation. RFC 7539 specifies that the nonce value (IV)
+should be 96 bits (12 bytes). OpenSSL allows a variable nonce length and
+front pads the nonce with 0 bytes if it is less than 12 bytes. However it
+also incorrectly allows a nonce to be set of up to 16 bytes. In this case
+only the last 12 bytes are significant and any additional leading bytes are
+ignored.
+
+It is a requirement of using this cipher that nonce values are unique.
+Messages encrypted using a reused nonce value are susceptible to serious
+confidentiality and integrity attacks. If an application changes the
+default nonce length to be longer than 12 bytes and then makes a change to
+the leading bytes of the nonce expecting the new value to be a new unique
+nonce then such an application could inadvertently encrypt messages with a
+reused nonce.
+
+Additionally the ignored bytes in a long nonce are not covered by the
+integrity guarantee of this cipher. Any application that relies on the
+integrity of these ignored leading bytes of a long nonce may be further
+affected.
+
+Any OpenSSL internal use of this cipher, including in SSL/TLS, is safe
+because no such use sets such a long nonce value. However user
+applications that use this cipher directly and set a non-default nonce
+length to be longer than 12 bytes may be vulnerable.
+
+CVE-2019-1543
+
+Fixes #8345
+
+Reviewed-by: Paul Dale <paul.dale@oracle.com>
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/8406)
+
+(cherry picked from commit 2a3d0ee9d59156c48973592331404471aca886d6)
+---
+ crypto/evp/e_chacha20_poly1305.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/evp/e_chacha20_poly1305.c b/crypto/evp/e_chacha20_poly1305.c
+index c1917bb86a6..d3e2c622a1b 100644
+--- a/crypto/evp/e_chacha20_poly1305.c
++++ b/crypto/evp/e_chacha20_poly1305.c
+@@ -30,6 +30,8 @@ typedef struct {
+ 
+ #define data(ctx)   ((EVP_CHACHA_KEY *)(ctx)->cipher_data)
+ 
++#define CHACHA20_POLY1305_MAX_IVLEN     12
++
+ static int chacha_init_key(EVP_CIPHER_CTX *ctx,
+                            const unsigned char user_key[CHACHA_KEY_SIZE],
+                            const unsigned char iv[CHACHA_CTR_SIZE], int enc)
+@@ -533,7 +535,7 @@ static int chacha20_poly1305_ctrl(EVP_CIPHER_CTX *ctx, int type, int arg,
+         return 1;
+ 
+     case EVP_CTRL_AEAD_SET_IVLEN:
+-        if (arg <= 0 || arg > CHACHA_CTR_SIZE)
++        if (arg <= 0 || arg > CHACHA20_POLY1305_MAX_IVLEN)
+             return 0;
+         actx->nonce_len = arg;
+         return 1;
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 30e0e7a19a0..0046c25554c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
+           file://CVE-2019-1543.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.11.0


