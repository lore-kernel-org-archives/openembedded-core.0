Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DB9D17FA15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znM14LPVz5d
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280301;
	bh=cC4V3DGWC9KNjJC1p5G0slXi+pW3NBh6jsYpDPvTnAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QERaiP2+w6MtSslUN/dkU5mfcGmZxjrDSPwMu4rltiao9u64p6ec7HtvBqlaBhU+E
	7g6Z6ozpah6OIXYE/QZajeAvFvmy6/gGgNsAqUywn+ExpbdAlnr22P1MbtkCED7x9b
	sOnYpNkx+VU9qaEN+0laCi3VtqO/EBRhZRtw3FKr1DTjfcL3lCH7U7sI3D7ESzMbz1
	EzSJwwu1hTxONwes+Uh2rPiQN1sNkBgu0j+3V+RUBVYiixskTMZUuKOZn2P6gXvQQ9
	s2ewlQp2j4XiWWActkyRhWfvJHlGCsJKP+y7ytbo1YKZXBMtnimRpB/m7fKk1YdtDK
	1bLgaMBm/hFQhImX7sHLEyKc2O6U8BY0wxRiPYjQZHLekEfzmsy+Lsu/0+gfFGUMtO
	FfCjSdkWgXkPzyRsyk86/izleqftgzj3e0TGioXDPA7Lnvw3yEHTi4b5AtVFxovHjx
	EcWKbrOyoQDGWZ4hulumg0GjFUJ4qFzO0yhrMLZsUjr+Zwd5heOdVE/cct5zN6rw2k
	iErAVe+TgkGmH9RelHjFmfMa4v6h7CXPIZJcURTVOvN032LTXmCcaYUwFhswoKixHd
	I94edAa+RSlg7wHZvYxF8iDtSPlLmbf/c781RhUL+es0tkplO5xgiJh/sfD8luUO6K
	opC7ohPXilOVzxv9RkdDodXg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 18:58:15 +0200
Message-Id: <20200117165819.2542-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117165819.2542-1-bunk@stusta.de>
References: <20200117165819.2542-1-bunk@stusta.de>
Subject: [warrior][PATCH] openssl: Upgrade 1.1.1b -> 1.1.1c
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:22 -0000

Backported patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 13e6ad4db7..94f4d49724 100644
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


