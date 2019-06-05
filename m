Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF387D718
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 18:41:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45JyL74KGQz3y
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 20:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559760079;
	bh=dCUgb8oZ9OA8R/5dK3Cq/POlOhxoBoxvrYHscQvxH30=;
	h=From:To:Subject:Date:From;
	b=tpXQ76UF3NjLW8Bh4xpywSpHAmhVIlKAIQaUXhe5FHz41R7oJQwLlXn6b7NQNZsRF
	FcF0rBeHzjvVChLDfsBzfAuHcFjEg/V49MpxWt/tN+J+xFj4ilIv5tZqEmAkgjq4EH
	KUHAZfseMyB/41wmBd+tEEaDAb6PTyB+UICe3lEqNvtgy6KPZjNVVbd0GTPb8pRpVt
	scMxsukdSIX6z0mrAUm+3U4F6cgAir2Br7uEqbUNuVdF3jtfLySZZBFUfWJAqp1y29
	xKsBxOi+HDBDc6eQXhkqKO0HX3B+CXlWYavGD34qern671B8SW1Ji3+UoelKzqUA29
	1+stB9d6YBDQwMnPAIwkBFLrtJjfynXOx3T//Y/zaRR6sEZrBq3/3BvMVxITMvRhPZ
	ryTrAfcVQbVmsHvWqbIry7UfwBX7t6yGm1bpcw4+VCJypz+b0R97ActqwZjlOOMeSP
	DKLK4/vUixGvXFwoF9wwpdpX74OhRckkgQQ4Jt/Y7Xk3z87lfZWlcHNxmsPF+ieVni
	Ao5aGui95E895cLVK7AUJdENJz8yjMUEJRk2pSYK6mh7C3REo+tdh4AgDMPM27mfxs
	NY0uupOfE/f74TFIaZbJpFLb00HL6w+iUcZcC1Cdalz/WjJLsdKKqCBTnfVHWy1g6Y
	RDLAuoPRLaKCyqrK8LhKCzY8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 21:41:16 +0300
Message-Id: <20190605184116.24297-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssl: Upgrade 1.1.1b -> 1.1.1c
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
X-List-Received-Date: Wed, 05 Jun 2019 18:41:19 -0000

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../openssl/openssl/CVE-2019-1543.patch       | 69 -------------------
 .../openssl/openssl/afalg.patch               |  6 +-
 .../{openssl_1.1.1b.bb => openssl_1.1.1c.bb}  |  5 +-
 3 files changed, 5 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1b.bb => openssl_1.1.1c.bb} (97%)

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
deleted file mode 100644
index 900ef97fce..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2019-1543.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Upstream-Status: Backport [https://github.com/openssl/openssl/commit/f426625b6ae9a7831010750490a5f0ad689c5ba3]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From f426625b6ae9a7831010750490a5f0ad689c5ba3 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Tue, 5 Mar 2019 14:39:15 +0000
-Subject: [PATCH] Prevent over long nonces in ChaCha20-Poly1305
-
-ChaCha20-Poly1305 is an AEAD cipher, and requires a unique nonce input for
-every encryption operation. RFC 7539 specifies that the nonce value (IV)
-should be 96 bits (12 bytes). OpenSSL allows a variable nonce length and
-front pads the nonce with 0 bytes if it is less than 12 bytes. However it
-also incorrectly allows a nonce to be set of up to 16 bytes. In this case
-only the last 12 bytes are significant and any additional leading bytes are
-ignored.
-
-It is a requirement of using this cipher that nonce values are unique.
-Messages encrypted using a reused nonce value are susceptible to serious
-confidentiality and integrity attacks. If an application changes the
-default nonce length to be longer than 12 bytes and then makes a change to
-the leading bytes of the nonce expecting the new value to be a new unique
-nonce then such an application could inadvertently encrypt messages with a
-reused nonce.
-
-Additionally the ignored bytes in a long nonce are not covered by the
-integrity guarantee of this cipher. Any application that relies on the
-integrity of these ignored leading bytes of a long nonce may be further
-affected.
-
-Any OpenSSL internal use of this cipher, including in SSL/TLS, is safe
-because no such use sets such a long nonce value. However user
-applications that use this cipher directly and set a non-default nonce
-length to be longer than 12 bytes may be vulnerable.
-
-CVE: CVE-2019-1543
-
-Fixes #8345
-
-Reviewed-by: Paul Dale <paul.dale@oracle.com>
-Reviewed-by: Richard Levitte <levitte@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/8406)
-
-(cherry picked from commit 2a3d0ee9d59156c48973592331404471aca886d6)
----
- crypto/evp/e_chacha20_poly1305.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/crypto/evp/e_chacha20_poly1305.c b/crypto/evp/e_chacha20_poly1305.c
-index c1917bb86a6..d3e2c622a1b 100644
---- a/crypto/evp/e_chacha20_poly1305.c
-+++ b/crypto/evp/e_chacha20_poly1305.c
-@@ -30,6 +30,8 @@ typedef struct {
- 
- #define data(ctx)   ((EVP_CHACHA_KEY *)(ctx)->cipher_data)
- 
-+#define CHACHA20_POLY1305_MAX_IVLEN     12
-+
- static int chacha_init_key(EVP_CIPHER_CTX *ctx,
-                            const unsigned char user_key[CHACHA_KEY_SIZE],
-                            const unsigned char iv[CHACHA_CTR_SIZE], int enc)
-@@ -533,7 +535,7 @@ static int chacha20_poly1305_ctrl(EVP_CIPHER_CTX *ctx, int type, int arg,
-         return 1;
- 
-     case EVP_CTRL_AEAD_SET_IVLEN:
--        if (arg <= 0 || arg > CHACHA_CTR_SIZE)
-+        if (arg <= 0 || arg > CHACHA20_POLY1305_MAX_IVLEN)
-             return 0;
-         actx->nonce_len = arg;
-         return 1;
diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
index 7c4b084f3d..b7c0e9697f 100644
--- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
+++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
@@ -18,14 +18,14 @@ index 3baa8ce..9ef52ed 100755
 -            ($mi2) = $mi2 =~ /(\d+)/;
 -            my $ver = $ma*10000 + $mi1*100 + $mi2;
 -            if ($ver < $minver) {
--                $disabled{afalgeng} = "too-old-kernel";
+-                disable('too-old-kernel', 'afalgeng');
 -            } else {
 -                push @{$config{engdirs}}, "afalg";
 -            }
 -        } else {
--            $disabled{afalgeng} = "cross-compiling";
+-            disable('cross-compiling', 'afalgeng');
 -        }
 +        push @{$config{engdirs}}, "afalg";
      } else {
-         $disabled{afalgeng}  = "not-linux";
+         disable('not-linux', 'afalgeng');
      }
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
similarity index 97%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 8bb3a309a2..669b1a1034 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -16,15 +16,14 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
-           file://CVE-2019-1543.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[md5sum] = "4532712e7bcc9414f5bce995e4e13930"
-SRC_URI[sha256sum] = "5c557b023230413dfb0756f3137a13e6d726838ccd1430888ad15bfb2b43ea4b"
+SRC_URI[md5sum] = "15e21da6efe8aa0e0768ffd8cd37a5f6"
+SRC_URI[sha256sum] = "f6fb3079ad15076154eda9413fed42877d668e7069d9b87396d0804fdb3f4c90"
 
 inherit lib_package multilib_header ptest
 
-- 
2.17.1


