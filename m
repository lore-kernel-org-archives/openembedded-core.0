Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0619D78855
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 16:19:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jan 2018 08:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,349,1511856000"; d="scan'208";a="193450149"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 12 Jan 2018 08:19:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jan 2018 18:20:01 +0200
Message-Id: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
Subject: [morty][PATCH 1/2] ruby: update to 2.4.0
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
X-List-Received-Date: Fri, 12 Jan 2018 16:19:55 -0000

Existing version of ruby-native (2.2.5) was crashing on my machine (and others' too),
yet a functional ruby is necessary to upgrade webkit to a version that less vulnerable
to Spectre.

I've performed the update by copying the ruby recipe directory over from the current
pyro tree; if you want to see the list of specific commits, issue this command:

git log 99656fecf4fa6e24ba49ecb7f26f893e733818a0 meta/recipes-devtools/ruby
(up to commit e593d3aeb2ea5f08d6e0753133fe89e345b339e8)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/ruby/ruby.inc                |   5 +-
 .../recipes-devtools/ruby/ruby/CVE-2016-7798.patch | 164 -----------
 .../ruby/ruby/CVE-2017-14033.patch                 |  89 ------
 .../ruby/ruby/CVE-2017-14064.patch                 | 312 +++++++++++++++++++--
 .../recipes-devtools/ruby/ruby/CVE-2017-9226.patch |  33 ---
 .../recipes-devtools/ruby/ruby/CVE-2017-9227.patch |  24 --
 .../recipes-devtools/ruby/ruby/CVE-2017-9228.patch |  26 --
 .../recipes-devtools/ruby/ruby/CVE-2017-9229.patch |  36 ---
 meta/recipes-devtools/ruby/ruby/prevent-gc.patch   |  32 ---
 .../ruby/ruby/ruby-CVE-2017-9224.patch             |  41 +++
 .../ruby/ruby/ruby-CVE-2017-9226.patch             |  41 +++
 .../ruby/ruby/ruby-CVE-2017-9227.patch             |  32 +++
 .../ruby/ruby/ruby-CVE-2017-9228.patch             |  34 +++
 .../ruby/ruby/ruby-CVE-2017-9229.patch             |  59 ++++
 .../ruby/{ruby_2.2.5.bb => ruby_2.4.0.bb}          |  25 +-
 15 files changed, 516 insertions(+), 437 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2016-7798.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-14033.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9226.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9227.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9228.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2017-9229.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/prevent-gc.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
 rename meta/recipes-devtools/ruby/{ruby_2.2.5.bb => ruby_2.4.0.bb} (71%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index fde67e9407c..d71989889e3 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -8,10 +8,10 @@ HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD | GPLv2"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=837b32593517ae48b9c3b5c87a5d288c \
+    file://COPYING;md5=8a960b08d972f43f91ae84a6f00dcbfb \
     file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
     file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=c440adb575ba4e6e2344c2630b6a5584\
+    file://LEGAL;md5=daf349ad59dd19bd8c919171bff3c5d6 \
 "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
@@ -22,6 +22,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://extmk.patch \
            file://0002-Obey-LDFLAGS-for-the-link-of-libruby.patch \
            "
+UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2016-7798.patch b/meta/recipes-devtools/ruby/ruby/CVE-2016-7798.patch
deleted file mode 100644
index 2b8772ba41b..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2016-7798.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-cipher: don't set dummy encryption key in Cipher#initialize
-Remove the encryption key initialization from Cipher#initialize. This
-is effectively a revert of r32723 ("Avoid possible SEGV from AES
-encryption/decryption", 2011-07-28).
-
-r32723, which added the key initialization, was a workaround for
-Ruby Bug #2768. For some certain ciphers, calling EVP_CipherUpdate()
-before setting an encryption key caused segfault. It was not a problem
-until OpenSSL implemented GCM mode - the encryption key could be
-overridden by repeated calls of EVP_CipherInit_ex(). But, it is not the
-case for AES-GCM ciphers. Setting a key, an IV, a key, in this order
-causes the IV to be reset to an all-zero IV.
-
-The problem of Bug #2768 persists on the current versions of OpenSSL.
-So, make Cipher#update raise an exception if a key is not yet set by the
-user. Since encrypting or decrypting without key does not make any
-sense, this should not break existing applications.
-
-Users can still call Cipher#key= and Cipher#iv= multiple times with
-their own responsibility.
-
-Reference: https://bugs.ruby-lang.org/issues/2768
-Reference: https://bugs.ruby-lang.org/issues/8221
-
-Upstream-Status: Backport
-CVE: CVE-2016-7798
-
-Signed-off-by: Thiruvadi Rajaraman <trajaraman@mvista.com>
-
-Index: ruby-2.2.2/ext/openssl/ossl_cipher.c
-===================================================================
---- ruby-2.2.2.orig/ext/openssl/ossl_cipher.c
-+++ ruby-2.2.2/ext/openssl/ossl_cipher.c
-@@ -35,6 +35,7 @@
-  */
- VALUE cCipher;
- VALUE eCipherError;
-+static ID id_key_set;
- 
- static VALUE ossl_cipher_alloc(VALUE klass);
- static void ossl_cipher_free(void *ptr);
-@@ -119,7 +120,6 @@ ossl_cipher_initialize(VALUE self, VALUE
-     EVP_CIPHER_CTX *ctx;
-     const EVP_CIPHER *cipher;
-     char *name;
--    unsigned char key[EVP_MAX_KEY_LENGTH];
- 
-     name = StringValuePtr(str);
-     GetCipherInit(self, ctx);
-@@ -131,14 +131,7 @@ ossl_cipher_initialize(VALUE self, VALUE
-     if (!(cipher = EVP_get_cipherbyname(name))) {
- 	ossl_raise(rb_eRuntimeError, "unsupported cipher algorithm (%s)", name);
-     }
--    /*
--     * The EVP which has EVP_CIPH_RAND_KEY flag (such as DES3) allows
--     * uninitialized key, but other EVPs (such as AES) does not allow it.
--     * Calling EVP_CipherUpdate() without initializing key causes SEGV so we
--     * set the data filled with "\0" as the key by default.
--     */
--    memset(key, 0, EVP_MAX_KEY_LENGTH);
--    if (EVP_CipherInit_ex(ctx, cipher, NULL, key, NULL, -1) != 1)
-+    if (EVP_CipherInit_ex(ctx, cipher, NULL, NULL, NULL, -1) != 1)
- 	ossl_raise(eCipherError, NULL);
- 
-     return self;
-@@ -256,6 +249,8 @@ ossl_cipher_init(int argc, VALUE *argv,
-     if (EVP_CipherInit_ex(ctx, NULL, NULL, p_key, p_iv, mode) != 1) {
- 	ossl_raise(eCipherError, NULL);
-     }
-+    if (p_key)
-+	rb_ivar_set(self, id_key_set, Qtrue);
- 
-     return self;
- }
-@@ -343,6 +338,8 @@ ossl_cipher_pkcs5_keyivgen(int argc, VAL
-     OPENSSL_cleanse(key, sizeof key);
-     OPENSSL_cleanse(iv, sizeof iv);
- 
-+    rb_ivar_set(self, id_key_set, Qtrue);
-+
-     return Qnil;
- }
- 
-@@ -396,6 +393,9 @@ ossl_cipher_update(int argc, VALUE *argv
- 
-     rb_scan_args(argc, argv, "11", &data, &str);
- 
-+    if (!RTEST(rb_attr_get(self, id_key_set)))
-+	ossl_raise(eCipherError, "key not set");
-+
-     StringValue(data);
-     in = (unsigned char *)RSTRING_PTR(data);
-     if ((in_len = RSTRING_LEN(data)) == 0)
-@@ -495,6 +495,8 @@ ossl_cipher_set_key(VALUE self, VALUE ke
-     if (EVP_CipherInit_ex(ctx, NULL, NULL, (unsigned char *)RSTRING_PTR(key), NULL, -1) != 1)
-         ossl_raise(eCipherError, NULL);
- 
-+    rb_ivar_set(self, id_key_set, Qtrue);
-+
-     return key;
- }
- 
-@@ -1013,5 +1015,7 @@ Init_ossl_cipher(void)
-     rb_define_method(cCipher, "iv_len", ossl_cipher_iv_length, 0);
-     rb_define_method(cCipher, "block_size", ossl_cipher_block_size, 0);
-     rb_define_method(cCipher, "padding=", ossl_cipher_set_padding, 1);
-+    
-+    id_key_set = rb_intern_const("key_set");
- }
- 
-Index: ruby-2.2.2/test/openssl/test_cipher.rb
-===================================================================
---- ruby-2.2.2.orig/test/openssl/test_cipher.rb
-+++ ruby-2.2.2/test/openssl/test_cipher.rb
-@@ -80,6 +80,7 @@ class OpenSSL::TestCipher < Test::Unit::
- 
-   def test_empty_data
-     @c1.encrypt
-+    @c1.random_key
-     assert_raise(ArgumentError){ @c1.update("") }
-   end
- 
-@@ -127,13 +128,10 @@ class OpenSSL::TestCipher < Test::Unit::
-         assert_equal(pt, c2.update(ct) + c2.final)
-       }
-     end
--
--    def test_AES_crush
--      500.times do
--        assert_nothing_raised("[Bug #2768]") do
--          # it caused OpenSSL SEGV by uninitialized key
--          OpenSSL::Cipher::AES128.new("ECB").update "." * 17
--        end
-+    def test_update_raise_if_key_not_set
-+    assert_raise(OpenSSL::Cipher::CipherError) do
-+      # it caused OpenSSL SEGV by uninitialized key [Bug #2768]
-+      OpenSSL::Cipher::AES128.new("ECB").update "." * 17
-       end
-     end
-   end
-@@ -236,6 +234,23 @@ class OpenSSL::TestCipher < Test::Unit::
-     end
- 
-   end
-+  def test_aes_gcm_key_iv_order_issue
-+    pt = "[ruby/openssl#49]"
-+    cipher = OpenSSL::Cipher.new("aes-128-gcm").encrypt
-+    cipher.key = "x" * 16
-+    cipher.iv = "a" * 12
-+    ct1 = cipher.update(pt) << cipher.final
-+    tag1 = cipher.auth_tag
-+
-+    cipher = OpenSSL::Cipher.new("aes-128-gcm").encrypt
-+    cipher.iv = "a" * 12
-+    cipher.key = "x" * 16
-+    ct2 = cipher.update(pt) << cipher.final
-+    tag2 = cipher.auth_tag
-+
-+    assert_equal ct1, ct2
-+    assert_equal tag1, tag2
-+  end if has_cipher?("aes-128-gcm")
- 
-   private
- 
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2017-14033.patch b/meta/recipes-devtools/ruby/ruby/CVE-2017-14033.patch
deleted file mode 100644
index cbcd18c7883..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2017-14033.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 1648afef33c1d97fb203c82291b8a61269e85d3b Mon Sep 17 00:00:00 2001
-From: Kazuki Yamaguchi <k@rhe.jp>
-Date: Mon, 19 Sep 2016 15:38:44 +0900
-Subject: [PATCH] asn1: fix out-of-bounds read in decoding constructed objects
-
-OpenSSL::ASN1.{decode,decode_all,traverse} have a bug of out-of-bounds
-read. int_ossl_asn1_decode0_cons() does not give the correct available
-length to ossl_asn1_decode() when decoding the inner components of a
-constructed object. This can cause out-of-bounds read if a crafted input
-given.
-
-Reference: https://hackerone.com/reports/170316
-
-Upstream-Status: Backport
-CVE: CVE-2017-14033
-
-Signed-off-by: Rajkumar Veer<rveer@mvista.com>
----
- ext/openssl/ossl_asn1.c | 13 ++++++-------
- test/test_asn1.rb       | 23 +++++++++++++++++++++++
- 2 files changed, 29 insertions(+), 7 deletions(-)
---- a/ext/openssl/ossl_asn1.c
-+++ b/ext/openssl/ossl_asn1.c
-@@ -871,19 +871,18 @@
- {
-     VALUE value, asn1data, ary;
-     int infinite;
--    long off = *offset;
-+    long available_len, off = *offset;
- 
-     infinite = (j == 0x21);
-     ary = rb_ary_new();
- 
--    while (length > 0 || infinite) {
-+    available_len = infinite ? max_len : length;
-+    while (available_len > 0 ) {
- 	long inner_read = 0;
--	value = ossl_asn1_decode0(pp, max_len, &off, depth + 1, yield, &inner_read);
-+	value = ossl_asn1_decode0(pp, available_len, &off, depth + 1, yield, &inner_read);
- 	*num_read += inner_read;
--	max_len -= inner_read;
-+	available_len -= inner_read;
- 	rb_ary_push(ary, value);
--	if (length > 0)
--	    length -= inner_read;
- 
- 	if (infinite &&
- 	    NUM2INT(ossl_asn1_get_tag(value)) == V_ASN1_EOC &&
-@@ -974,7 +973,7 @@
-     if(j & V_ASN1_CONSTRUCTED) {
- 	*pp += hlen;
- 	off += hlen;
--	asn1data = int_ossl_asn1_decode0_cons(pp, length, len, &off, depth, yield, j, tag, tag_class, &inner_read);
-+	asn1data = int_ossl_asn1_decode0_cons(pp, length - hlen, len, &off, depth, yield, j, tag, tag_class, &inner_read);
- 	inner_read += hlen;
-     }
-     else {
---- a/test/openssl/test_asn1.rb
-+++ b/test/openssl/test_asn1.rb
-@@ -595,6 +595,29 @@
-     assert_equal(false, asn1.value[3].infinite_length)
-   end
- 
-+  def test_decode_constructed_overread
-+    test = %w{ 31 06 31 02 30 02 05 00 }
-+    #                          ^ <- invalid
-+    raw = [test.join].pack("H*")
-+    ret = []
-+    assert_raise(OpenSSL::ASN1::ASN1Error) {
-+      OpenSSL::ASN1.traverse(raw) { |x| ret << x }
-+    }
-+    assert_equal 2, ret.size
-+    assert_equal 17, ret[0][6]
-+    assert_equal 17, ret[1][6]
-+
-+    test = %w{ 31 80 30 03 00 00 }
-+    #                    ^ <- invalid
-+    raw = [test.join].pack("H*")
-+    ret = []
-+    assert_raise(OpenSSL::ASN1::ASN1Error) {
-+      OpenSSL::ASN1.traverse(raw) { |x| ret << x }
-+    }
-+    assert_equal 1, ret.size
-+    assert_equal 17, ret[0][6]
-+  end
-+
-   private
- 
-   def assert_universal(tag, asn1)
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2017-14064.patch b/meta/recipes-devtools/ruby/ruby/CVE-2017-14064.patch
index 073d214d882..700d1bc58ee 100644
--- a/meta/recipes-devtools/ruby/ruby/CVE-2017-14064.patch
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2017-14064.patch
@@ -1,19 +1,54 @@
-From 8f782fd8e181d9cfe9387ded43a5ca9692266b85 Mon Sep 17 00:00:00 2001
-From: Florian Frank <flori@ping.de>
-Date: Thu, 2 Mar 2017 12:12:33 +0100
-Subject: [PATCH] Fix arbitrary heap exposure problem
+From d86d283fcb35d1442a121b92030884523908a331 Mon Sep 17 00:00:00 2001
+From: nagachika <nagachika@b2dd03c8-39d4-4d8f-98ff-823fe69b080e>
+Date: Sat, 22 Apr 2017 07:29:01 +0000
+Subject: [PATCH] merge revision(s) 58323,58324:
+
+	Merge json-2.0.4.
+
+	  * https://github.com/flori/json/releases/tag/v2.0.4
+	  * https://github.com/flori/json/blob/09fabeb03e73ed88dc8ce8f19d76ac59e51dae20/CHANGES.md#2017-03-23-204
+	Use `assert_raise` instead of `assert_raises`.
+
+git-svn-id: svn+ssh://ci.ruby-lang.org/ruby/branches/ruby_2_4@58445 b2dd03c8-39d4-4d8f-98ff-823fe69b080e
 
 Upstream-Status: Backport
 CVE: CVE-2017-14064
 
-Signed-off-by: Rajkumar Veer<rveer@mvista.com>
+Signed-off-by: Armin Kuster <akuster@mvisa.com>
+
 ---
- ext/json/ext/generator/generator.c | 12 ++++++------
- ext/json/ext/generator/generator.h |  1 -
- 2 files changed, 6 insertions(+), 7 deletions(-)
---- a/ext/json/generator/generator.c
-+++ b/ext/json/generator/generator.c
-@@ -301,7 +301,7 @@
+ ext/json/fbuffer/fbuffer.h       |   3 ---
+ ext/json/generator/generator.c   |  12 +++++-----
+ ext/json/generator/generator.h   |   1 -
+ ext/json/json.gemspec            | Bin 5473 -> 5474 bytes
+ ext/json/lib/json/version.rb     |   2 +-
+ ext/json/parser/parser.c         |  48 +++++++++++++++++++++++----------------
+ ext/json/parser/parser.rl        |  14 +++++++++---
+ test/json/json_encoding_test.rb  |   2 ++
+ test/json/json_generator_test.rb |   0
+ version.h                        |   2 +-
+ 10 files changed, 49 insertions(+), 35 deletions(-)
+ mode change 100755 => 100644 test/json/json_generator_test.rb
+
+Index: ruby-2.4.0/ext/json/fbuffer/fbuffer.h
+===================================================================
+--- ruby-2.4.0.orig/ext/json/fbuffer/fbuffer.h
++++ ruby-2.4.0/ext/json/fbuffer/fbuffer.h
+@@ -12,9 +12,6 @@
+ #define RFLOAT_VALUE(val) (RFLOAT(val)->value)
+ #endif
+ 
+-#ifndef RARRAY_PTR
+-#define RARRAY_PTR(ARRAY) RARRAY(ARRAY)->ptr
+-#endif
+ #ifndef RARRAY_LEN
+ #define RARRAY_LEN(ARRAY) RARRAY(ARRAY)->len
+ #endif
+Index: ruby-2.4.0/ext/json/generator/generator.c
+===================================================================
+--- ruby-2.4.0.orig/ext/json/generator/generator.c
++++ ruby-2.4.0/ext/json/generator/generator.c
+@@ -308,7 +308,7 @@ static char *fstrndup(const char *ptr, u
    char *result;
    if (len <= 0) return NULL;
    result = ALLOC_N(char, len);
@@ -22,7 +57,7 @@ Signed-off-by: Rajkumar Veer<rveer@mvista.com>
    return result;
  }
  
-@@ -1055,7 +1055,7 @@
+@@ -1062,7 +1062,7 @@ static VALUE cState_indent_set(VALUE sel
          }
      } else {
          if (state->indent) ruby_xfree(state->indent);
@@ -31,7 +66,7 @@ Signed-off-by: Rajkumar Veer<rveer@mvista.com>
          state->indent_len = len;
      }
      return Qnil;
-@@ -1093,7 +1093,7 @@
+@@ -1100,7 +1100,7 @@ static VALUE cState_space_set(VALUE self
          }
      } else {
          if (state->space) ruby_xfree(state->space);
@@ -40,7 +75,7 @@ Signed-off-by: Rajkumar Veer<rveer@mvista.com>
          state->space_len = len;
      }
      return Qnil;
-@@ -1129,7 +1129,7 @@
+@@ -1136,7 +1136,7 @@ static VALUE cState_space_before_set(VAL
          }
      } else {
          if (state->space_before) ruby_xfree(state->space_before);
@@ -49,7 +84,7 @@ Signed-off-by: Rajkumar Veer<rveer@mvista.com>
          state->space_before_len = len;
      }
      return Qnil;
-@@ -1166,7 +1166,7 @@
+@@ -1173,7 +1173,7 @@ static VALUE cState_object_nl_set(VALUE
          }
      } else {
          if (state->object_nl) ruby_xfree(state->object_nl);
@@ -58,17 +93,19 @@ Signed-off-by: Rajkumar Veer<rveer@mvista.com>
          state->object_nl_len = len;
      }
      return Qnil;
-@@ -1201,7 +1201,7 @@
+@@ -1208,7 +1208,7 @@ static VALUE cState_array_nl_set(VALUE s
          }
      } else {
          if (state->array_nl) ruby_xfree(state->array_nl);
 -        state->array_nl = strdup(RSTRING_PTR(array_nl));
-+        state->array_nl = fstrndup(RSTRING_PTR(array_nl), len); 
++        state->array_nl = fstrndup(RSTRING_PTR(array_nl), len);
          state->array_nl_len = len;
      }
      return Qnil;
---- a/ext/json/generator/generator.h
-+++ b/ext/json/generator/generator.h
+Index: ruby-2.4.0/ext/json/generator/generator.h
+===================================================================
+--- ruby-2.4.0.orig/ext/json/generator/generator.h
++++ ruby-2.4.0/ext/json/generator/generator.h
 @@ -1,7 +1,6 @@
  #ifndef _GENERATOR_H_
  #define _GENERATOR_H_
@@ -77,3 +114,240 @@ Signed-off-by: Rajkumar Veer<rveer@mvista.com>
  #include <math.h>
  #include <ctype.h>
  
+Index: ruby-2.4.0/ext/json/lib/json/version.rb
+===================================================================
+--- ruby-2.4.0.orig/ext/json/lib/json/version.rb
++++ ruby-2.4.0/ext/json/lib/json/version.rb
+@@ -1,7 +1,7 @@
+ # frozen_string_literal: false
+ module JSON
+   # JSON version
+-  VERSION         = '2.0.2'
++  VERSION         = '2.0.4'
+   VERSION_ARRAY   = VERSION.split(/\./).map { |x| x.to_i } # :nodoc:
+   VERSION_MAJOR   = VERSION_ARRAY[0] # :nodoc:
+   VERSION_MINOR   = VERSION_ARRAY[1] # :nodoc:
+Index: ruby-2.4.0/ext/json/parser/parser.c
+===================================================================
+--- ruby-2.4.0.orig/ext/json/parser/parser.c
++++ ruby-2.4.0/ext/json/parser/parser.c
+@@ -1435,13 +1435,21 @@ static VALUE json_string_unescape(VALUE
+                     break;
+                 case 'u':
+                     if (pe > stringEnd - 4) {
+-                        return Qnil;
++                      rb_enc_raise(
++                        EXC_ENCODING eParserError,
++                        "%u: incomplete unicode character escape sequence at '%s'", __LINE__, p
++                      );
+                     } else {
+                         UTF32 ch = unescape_unicode((unsigned char *) ++pe);
+                         pe += 3;
+                         if (UNI_SUR_HIGH_START == (ch & 0xFC00)) {
+                             pe++;
+-                            if (pe > stringEnd - 6) return Qnil;
++                            if (pe > stringEnd - 6) {
++                              rb_enc_raise(
++                                EXC_ENCODING eParserError,
++                                "%u: incomplete surrogate pair at '%s'", __LINE__, p
++                                );
++                            }
+                             if (pe[0] == '\\' && pe[1] == 'u') {
+                                 UTF32 sur = unescape_unicode((unsigned char *) pe + 2);
+                                 ch = (((ch & 0x3F) << 10) | ((((ch >> 6) & 0xF) + 1) << 16)
+@@ -1471,7 +1479,7 @@ static VALUE json_string_unescape(VALUE
+ }
+ 
+ 
+-#line 1475 "parser.c"
++#line 1483 "parser.c"
+ enum {JSON_string_start = 1};
+ enum {JSON_string_first_final = 8};
+ enum {JSON_string_error = 0};
+@@ -1479,7 +1487,7 @@ enum {JSON_string_error = 0};
+ enum {JSON_string_en_main = 1};
+ 
+ 
+-#line 504 "parser.rl"
++#line 512 "parser.rl"
+ 
+ 
+ static int
+@@ -1501,15 +1509,15 @@ static char *JSON_parse_string(JSON_Pars
+ 
+     *result = rb_str_buf_new(0);
+ 
+-#line 1505 "parser.c"
++#line 1513 "parser.c"
+ 	{
+ 	cs = JSON_string_start;
+ 	}
+ 
+-#line 525 "parser.rl"
++#line 533 "parser.rl"
+     json->memo = p;
+ 
+-#line 1513 "parser.c"
++#line 1521 "parser.c"
+ 	{
+ 	if ( p == pe )
+ 		goto _test_eof;
+@@ -1534,7 +1542,7 @@ case 2:
+ 		goto st0;
+ 	goto st2;
+ tr2:
+-#line 490 "parser.rl"
++#line 498 "parser.rl"
+ 	{
+         *result = json_string_unescape(*result, json->memo + 1, p);
+         if (NIL_P(*result)) {
+@@ -1545,14 +1553,14 @@ tr2:
+             {p = (( p + 1))-1;}
+         }
+     }
+-#line 501 "parser.rl"
++#line 509 "parser.rl"
+ 	{ p--; {p++; cs = 8; goto _out;} }
+ 	goto st8;
+ st8:
+ 	if ( ++p == pe )
+ 		goto _test_eof8;
+ case 8:
+-#line 1556 "parser.c"
++#line 1564 "parser.c"
+ 	goto st0;
+ st3:
+ 	if ( ++p == pe )
+@@ -1628,7 +1636,7 @@ case 7:
+ 	_out: {}
+ 	}
+ 
+-#line 527 "parser.rl"
++#line 535 "parser.rl"
+ 
+     if (json->create_additions && RTEST(match_string = json->match_string)) {
+           VALUE klass;
+@@ -1675,7 +1683,7 @@ static VALUE convert_encoding(VALUE sour
+     }
+     FORCE_UTF8(source);
+   } else {
+-    source = rb_str_conv_enc(source, NULL, rb_utf8_encoding());
++    source = rb_str_conv_enc(source, rb_enc_get(source), rb_utf8_encoding());
+   }
+ #endif
+     return source;
+@@ -1808,7 +1816,7 @@ static VALUE cParser_initialize(int argc
+ }
+ 
+ 
+-#line 1812 "parser.c"
++#line 1820 "parser.c"
+ enum {JSON_start = 1};
+ enum {JSON_first_final = 10};
+ enum {JSON_error = 0};
+@@ -1816,7 +1824,7 @@ enum {JSON_error = 0};
+ enum {JSON_en_main = 1};
+ 
+ 
+-#line 720 "parser.rl"
++#line 728 "parser.rl"
+ 
+ 
+ /*
+@@ -1833,16 +1841,16 @@ static VALUE cParser_parse(VALUE self)
+   GET_PARSER;
+ 
+ 
+-#line 1837 "parser.c"
++#line 1845 "parser.c"
+ 	{
+ 	cs = JSON_start;
+ 	}
+ 
+-#line 736 "parser.rl"
++#line 744 "parser.rl"
+   p = json->source;
+   pe = p + json->len;
+ 
+-#line 1846 "parser.c"
++#line 1854 "parser.c"
+ 	{
+ 	if ( p == pe )
+ 		goto _test_eof;
+@@ -1876,7 +1884,7 @@ st0:
+ cs = 0;
+ 	goto _out;
+ tr2:
+-#line 712 "parser.rl"
++#line 720 "parser.rl"
+ 	{
+         char *np = JSON_parse_value(json, p, pe, &result, 0);
+         if (np == NULL) { p--; {p++; cs = 10; goto _out;} } else {p = (( np))-1;}
+@@ -1886,7 +1894,7 @@ st10:
+ 	if ( ++p == pe )
+ 		goto _test_eof10;
+ case 10:
+-#line 1890 "parser.c"
++#line 1898 "parser.c"
+ 	switch( (*p) ) {
+ 		case 13: goto st10;
+ 		case 32: goto st10;
+@@ -1975,7 +1983,7 @@ case 9:
+ 	_out: {}
+ 	}
+ 
+-#line 739 "parser.rl"
++#line 747 "parser.rl"
+ 
+   if (cs >= JSON_first_final && p == pe) {
+     return result;
+Index: ruby-2.4.0/ext/json/parser/parser.rl
+===================================================================
+--- ruby-2.4.0.orig/ext/json/parser/parser.rl
++++ ruby-2.4.0/ext/json/parser/parser.rl
+@@ -446,13 +446,21 @@ static VALUE json_string_unescape(VALUE
+                     break;
+                 case 'u':
+                     if (pe > stringEnd - 4) {
+-                        return Qnil;
++                      rb_enc_raise(
++                        EXC_ENCODING eParserError,
++                        "%u: incomplete unicode character escape sequence at '%s'", __LINE__, p
++                      );
+                     } else {
+                         UTF32 ch = unescape_unicode((unsigned char *) ++pe);
+                         pe += 3;
+                         if (UNI_SUR_HIGH_START == (ch & 0xFC00)) {
+                             pe++;
+-                            if (pe > stringEnd - 6) return Qnil;
++                            if (pe > stringEnd - 6) {
++                              rb_enc_raise(
++                                EXC_ENCODING eParserError,
++                                "%u: incomplete surrogate pair at '%s'", __LINE__, p
++                                );
++                            }
+                             if (pe[0] == '\\' && pe[1] == 'u') {
+                                 UTF32 sur = unescape_unicode((unsigned char *) pe + 2);
+                                 ch = (((ch & 0x3F) << 10) | ((((ch >> 6) & 0xF) + 1) << 16)
+@@ -570,7 +578,7 @@ static VALUE convert_encoding(VALUE sour
+     }
+     FORCE_UTF8(source);
+   } else {
+-    source = rb_str_conv_enc(source, NULL, rb_utf8_encoding());
++    source = rb_str_conv_enc(source, rb_enc_get(source), rb_utf8_encoding());
+   }
+ #endif
+     return source;
+Index: ruby-2.4.0/test/json/json_encoding_test.rb
+===================================================================
+--- ruby-2.4.0.orig/test/json/json_encoding_test.rb
++++ ruby-2.4.0/test/json/json_encoding_test.rb
+@@ -79,6 +79,8 @@ class JSONEncodingTest < Test::Unit::Tes
+     json = '["\ud840\udc01"]'
+     assert_equal json, generate(utf8, :ascii_only => true)
+     assert_equal utf8, parse(json)
++    assert_raise(JSON::ParserError) { parse('"\u"') }
++    assert_raise(JSON::ParserError) { parse('"\ud800"') }
+   end
+ 
+   def test_chars
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2017-9226.patch b/meta/recipes-devtools/ruby/ruby/CVE-2017-9226.patch
deleted file mode 100644
index fc783e8a150..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2017-9226.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-commit f015fbdd95f76438cd86366467bb2b39870dd7c6
-Author: K.Kosako <kosako@sofnec.co.jp>
-Date:   Fri May 19 15:44:47 2017 +0900
-
-    fix #55 : Byte value expressed in octal must be smaller than 256
-
-Upstream-Status: Backport
-
-CVE: CVE-2017-9226
-Signed-off-by: Thiruvadi Rajaraman <tajaraman@mvista.com>
-
-Index: ruby-2.2.5/regparse.c
-===================================================================
---- ruby-2.2.5.orig/regparse.c	2017-09-12 16:33:21.977835068 +0530
-+++ ruby-2.2.5/regparse.c	2017-09-12 16:34:40.987117744 +0530
-@@ -3222,7 +3222,7 @@
- 	PUNFETCH;
- 	prev = p;
- 	num = scan_unsigned_octal_number(&p, end, 3, enc);
--	if (num < 0) return ONIGERR_TOO_BIG_NUMBER;
-+	if (num < 0 || num >= 256) return ONIGERR_TOO_BIG_NUMBER;
- 	if (p == prev) {  /* can't read nothing. */
- 	  num = 0; /* but, it's not error */
- 	}
-@@ -3676,7 +3676,7 @@
-       if (IS_SYNTAX_OP(syn, ONIG_SYN_OP_ESC_OCTAL3)) {
- 	prev = p;
- 	num = scan_unsigned_octal_number(&p, end, (c == '0' ? 2:3), enc);
--	if (num < 0) return ONIGERR_TOO_BIG_NUMBER;
-+	if (num < 0 || num >= 256) return ONIGERR_TOO_BIG_NUMBER;
- 	if (p == prev) {  /* can't read nothing. */
- 	  num = 0; /* but, it's not error */
- 	}
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2017-9227.patch b/meta/recipes-devtools/ruby/ruby/CVE-2017-9227.patch
deleted file mode 100644
index f6eaefb7fdd..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2017-9227.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-commit 9690d3ab1f9bcd2db8cbe1fe3ee4a5da606b8814
-Author: K.Kosako <kosako@sofnec.co.jp>
-Date:   Tue May 23 16:15:35 2017 +0900
-
-    fix #58 : access to invalid address by reg->dmin value
-
-Upstream-Status: backport
-
-CVE: CVE-2017-9227
-Signed-off-by: Thiruvadi Rajaraman <trajaraman@mvista.com>
-
-Index: ruby-2.2.5/regexec.c
-===================================================================
---- ruby-2.2.5.orig/regexec.c	2014-09-15 21:48:41.000000000 +0530
-+++ ruby-2.2.5/regexec.c	2017-08-30 12:18:04.054828426 +0530
-@@ -3678,6 +3678,8 @@
-     }
-     else {
-       UChar *q = p + reg->dmin;
-+
-+      if (q >= end) return 0; /* fail */
-       while (p < q) p += enclen(reg->enc, p, end);
-     }
-   }
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2017-9228.patch b/meta/recipes-devtools/ruby/ruby/CVE-2017-9228.patch
deleted file mode 100644
index dc911bb20b5..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2017-9228.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-commit 3b63d12038c8d8fc278e81c942fa9bec7c704c8b
-Author: K.Kosako <kosako@sofnec.co.jp>
-Date:   Wed May 24 13:43:25 2017 +0900
-
-    fix #60 : invalid state(CCS_VALUE) in parse_char_class()
-
-Upstream-Status: Backport
-
-CVE: CVE-2017-9228
-Signed-off-by: Thiruvadi Rajaraman <trajaraman@mvista.com>
-
-Index: ruby-2.2.5/regparse.c
-===================================================================
---- ruby-2.2.5.orig/regparse.c	2014-09-16 08:14:10.000000000 +0530
-+++ ruby-2.2.5/regparse.c	2017-08-30 11:58:25.774275722 +0530
-@@ -4458,7 +4458,9 @@
-     }
-   }
- 
--  *state = CCS_VALUE;
-+  if (*state != CCS_START)
-+    *state = CCS_VALUE;
-+
-   *type  = CCV_CLASS;
-   return 0;
- }
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2017-9229.patch b/meta/recipes-devtools/ruby/ruby/CVE-2017-9229.patch
deleted file mode 100644
index 75bdfada57e..00000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2017-9229.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-commit b690371bbf97794b4a1d3f295d4fb9a8b05d402d
-Author: K.Kosako <kosako@sofnec.co.jp>
-Date:   Wed May 24 10:27:04 2017 +0900
-
-    fix #59 : access to invalid address by reg->dmax value
-
-Upstream-Status: Backport
-
-CVE: CVE-2017-9229
-Signed-off-by: Thiruvadi Rajaraman <trajaraman@mvista.com>
-
-Index: ruby-2.2.5/regexec.c
-===================================================================
---- ruby-2.2.5.orig/regexec.c	2017-09-13 12:17:08.429254209 +0530
-+++ ruby-2.2.5/regexec.c	2017-09-13 12:24:03.365312311 +0530
-@@ -3763,6 +3763,12 @@
-     }
-     else {
-       if (reg->dmax != ONIG_INFINITE_DISTANCE) {
-+        if (p - str < reg->dmax) {
-+          *low = (UChar* )str;
-+          if (low_prev)
-+            *low_prev = onigenc_get_prev_char_head(reg->enc, str, *low, end);
-+	}
-+	else {
- 	*low = p - reg->dmax;
- 	if (*low > s) {
- 	  *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
-@@ -3776,6 +3782,7 @@
- 	    *low_prev = onigenc_get_prev_char_head(reg->enc,
- 					       (pprev ? pprev : str), *low, end);
- 	}
-+	}
-       }
-     }
-     /* no needs to adjust *high, *high is used as range check only */
diff --git a/meta/recipes-devtools/ruby/ruby/prevent-gc.patch b/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
deleted file mode 100644
index 2eaa955fba2..00000000000
--- a/meta/recipes-devtools/ruby/ruby/prevent-gc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fix marshaling with gcc7. Based on upstream revision 57410:
-https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=revision&revision=57410
-https://github.com/ruby/ruby/commit/7c1b30a602ab109d8d5388d7dfb3c5b180ba24e1
-https://bugs.ruby-lang.org/issues/13150
-
-with the upstream patches intent ported to Ruby 2.2.5
-
-Upstream-Status: Backport
-
-Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
-
-Index: ruby-2.2.5/marshal.c
-===================================================================
---- ruby-2.2.5.orig/marshal.c
-+++ ruby-2.2.5/marshal.c
-@@ -17,7 +17,6 @@
- #include "ruby/io.h"
- #include "ruby/st.h"
- #include "ruby/util.h"
--
- #include <math.h>
- #ifdef HAVE_FLOAT_H
- #include <float.h>
-@@ -985,7 +984,7 @@ marshal_dump(int argc, VALUE *argv)
-     VALUE obj, port, a1, a2;
-     int limit = -1;
-     struct dump_arg *arg;
--    VALUE wrapper; /* used to avoid memory leak in case of exception */
-+    volatile VALUE wrapper; /* used to avoid memory leak in case of exception */
- 
-     port = Qnil;
-     rb_scan_args(argc, argv, "12", &obj, &a1, &a2);
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
new file mode 100644
index 00000000000..848139b7e35
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9224.patch
@@ -0,0 +1,41 @@
+From 690313a061f7a4fa614ec5cc8368b4f2284e059b Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Tue, 23 May 2017 10:28:58 +0900
+Subject: [PATCH] fix #57 : DATA_ENSURE() check must be before data access
+
+---
+ regexec.c |    5 -----
+ 1 file changed, 5 deletions(-)
+
+--- end of original header
+
+CVE: CVE-2017-9224
+
+Context modified so that patch applies for version 2.4.1.
+
+Upstream-Status: Pending
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/regexec.c b/regexec.c
+index 35fef11..d4e577d 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -1473,14 +1473,9 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+       NEXT;
+
+     CASE(OP_EXACT1)  MOP_IN(OP_EXACT1);
+-#if 0
+       DATA_ENSURE(1);
+       if (*p != *s) goto fail;
+       p++; s++;
+-#endif
+-      if (*p != *s++) goto fail;
+-      DATA_ENSURE(0);
+-      p++;
+       MOP_OUT;
+       break;
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
new file mode 100644
index 00000000000..0f2a4307cc9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9226.patch
@@ -0,0 +1,41 @@
+From b4bf968ad52afe14e60a2dc8a95d3555c543353a Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Thu, 18 May 2017 17:05:27 +0900
+Subject: [PATCH] fix #55 : check too big code point value for single byte
+ value in next_state_val()
+
+---
+ regparse.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+--- end of original header
+
+CVE: CVE-2017-9226
+
+Add check for octal number bigger than 255.
+
+Upstream-Status: Pending
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- ruby-2.4.1.orig/regparse.c
++++ ruby-2.4.1/regparse.c
+@@ -3644,7 +3644,7 @@ fetch_token(OnigToken* tok, UChar** src,
+       if (IS_SYNTAX_OP(syn, ONIG_SYN_OP_ESC_OCTAL3)) {
+ 	prev = p;
+ 	num = scan_unsigned_octal_number(&p, end, (c == '0' ? 2:3), enc);
+-	if (num < 0) return ONIGERR_TOO_BIG_NUMBER;
++	if (num < 0 || 0xff < num) return ONIGERR_TOO_BIG_NUMBER;
+ 	if (p == prev) {  /* can't read nothing. */
+ 	  num = 0; /* but, it's not error */
+ 	}
+@@ -4450,6 +4450,9 @@ next_state_val(CClassNode* cc, CClassNod
+   switch (*state) {
+   case CCS_VALUE:
+     if (*type == CCV_SB) {
++      if (*vs > 0xff)
++          return ONIGERR_INVALID_CODE_POINT_VALUE;
++
+       BITSET_SET_BIT_CHKDUP(cc->bs, (int )(*vs));
+       if (IS_NOT_NULL(asc_cc))
+ 	BITSET_SET_BIT(asc_cc->bs, (int )(*vs));
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
new file mode 100644
index 00000000000..85e7ccb3694
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9227.patch
@@ -0,0 +1,32 @@
+From 9690d3ab1f9bcd2db8cbe1fe3ee4a5da606b8814 Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Tue, 23 May 2017 16:15:35 +0900
+Subject: [PATCH] fix #58 : access to invalid address by reg->dmin value
+
+---
+ regexec.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+--- end of original header
+
+CVE: CVE-2017-9227
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/regexec.c b/regexec.c
+index d4e577d..2fa0f3d 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3154,6 +3154,8 @@ forward_search_range(regex_t* reg, const UChar* str, const UChar* end, UChar* s,
+     }
+     else {
+       UChar *q = p + reg->dmin;
++
++      if (q >= end) return 0; /* fail */
+       while (p < q) p += enclen(reg->enc, p, end);
+     }
+   }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
new file mode 100644
index 00000000000..d8bfba486cb
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9228.patch
@@ -0,0 +1,34 @@
+From 3b63d12038c8d8fc278e81c942fa9bec7c704c8b Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Wed, 24 May 2017 13:43:25 +0900
+Subject: [PATCH] fix #60 : invalid state(CCS_VALUE) in parse_char_class()
+
+---
+ regparse.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+--- end of original header
+
+CVE: CVE-2017-9228
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/regparse.c b/regparse.c
+index 69875fa..1988747 100644
+--- a/regparse.c
++++ b/regparse.c
+@@ -4081,7 +4081,9 @@ next_state_class(CClassNode* cc, OnigCodePoint* vs, enum CCVALTYPE* type,
+     }
+   }
+ 
+-  *state = CCS_VALUE;
++  if (*state != CCS_START)
++    *state = CCS_VALUE;
++
+   *type  = CCV_CLASS;
+   return 0;
+ }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
new file mode 100644
index 00000000000..6e765bf6dc0
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/ruby-CVE-2017-9229.patch
@@ -0,0 +1,59 @@
+From b690371bbf97794b4a1d3f295d4fb9a8b05d402d Mon Sep 17 00:00:00 2001
+From: "K.Kosako" <kosako@sofnec.co.jp>
+Date: Wed, 24 May 2017 10:27:04 +0900
+Subject: [PATCH] fix #59 : access to invalid address by reg->dmax value
+
+---
+ regexec.c |   27 +++++++++++++++++----------
+ 1 file changed, 17 insertions(+), 10 deletions(-)
+
+--- end of original header
+
+CVE: CVE-2017-9229
+
+Upstream-Status: Inappropriate [not author]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+diff --git a/regexec.c b/regexec.c
+index 49bcc50..c0626ef 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3756,18 +3756,25 @@ forward_search_range(regex_t* reg, const
+     }
+     else {
+       if (reg->dmax != ONIG_INFINITE_DISTANCE) {
+-	*low = p - reg->dmax;
+-	if (*low > s) {
+-	  *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
+-							      *low, end, (const UChar** )low_prev);
+-	  if (low_prev && IS_NULL(*low_prev))
+-	    *low_prev = onigenc_get_prev_char_head(reg->enc,
+-						   (pprev ? pprev : s), *low, end);
++        if (p - str < reg->dmax) {
++          *low = (UChar* )str;
++          if (low_prev)
++            *low_prev = onigenc_get_prev_char_head(reg->enc, str, *low, end);
+ 	}
+ 	else {
+-	  if (low_prev)
+-	    *low_prev = onigenc_get_prev_char_head(reg->enc,
+-					       (pprev ? pprev : str), *low, end);
++          *low = p - reg->dmax;
++          if (*low > s) {
++            *low = onigenc_get_right_adjust_char_head_with_prev(reg->enc, s,
++                                                 *low, end, (const UChar** )low_prev);
++            if (low_prev && IS_NULL(*low_prev))
++              *low_prev = onigenc_get_prev_char_head(reg->enc,
++                                                     (pprev ? pprev : s), *low, end);
++          }
++          else {
++            if (low_prev)
++              *low_prev = onigenc_get_prev_char_head(reg->enc,
++                                                     (pprev ? pprev : str), *low, end);
++          }
+ 	}
+       }
+     }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.2.5.bb b/meta/recipes-devtools/ruby/ruby_2.4.0.bb
similarity index 71%
rename from meta/recipes-devtools/ruby/ruby_2.2.5.bb
rename to meta/recipes-devtools/ruby/ruby_2.4.0.bb
index 750ddc690f8..b08837cfe82 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.4.0.bb
@@ -1,17 +1,16 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "bd8e349d4fb2c75d90817649674f94be"
-SRC_URI[sha256sum] = "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
-
-SRC_URI += "file://prevent-gc.patch \
-            file://CVE-2016-7798.patch \
-            file://CVE-2017-9227.patch \
-            file://CVE-2017-9228.patch \
-            file://CVE-2017-9226.patch \
-            file://CVE-2017-9229.patch \
-            file://CVE-2017-14033.patch \
-            file://CVE-2017-14064.patch \
-"
+SRC_URI += " \
+           file://ruby-CVE-2017-9224.patch \
+           file://ruby-CVE-2017-9226.patch \
+           file://ruby-CVE-2017-9227.patch \
+           file://ruby-CVE-2017-9228.patch \
+           file://ruby-CVE-2017-9229.patch \
+           file://CVE-2017-14064.patch \
+           "
+
+SRC_URI[md5sum] = "7e9485dcdb86ff52662728de2003e625"
+SRC_URI[sha256sum] = "152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
@@ -25,6 +24,8 @@ PACKAGECONFIG[valgrind] = "--with-valgrind=yes, --with-valgrind=no, valgrind"
 PACKAGECONFIG[gpm] = "--with-gmp=yes, --with-gmp=no, gmp"
 PACKAGECONFIG[ipv6] = ",--enable-wide-getaddrinfo,"
 
+EXTRA_AUTORECONF += "--exclude=aclocal"
+
 EXTRA_OECONF = "\
     --disable-versioned-paths \
     --disable-rpath \
-- 
2.15.1


