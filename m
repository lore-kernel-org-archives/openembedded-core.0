Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ypaSD0ycIMyOeacQZsiStI2pjiQneF5Zc1YqbR25Lp2Xyd0x+1eFE6U5WRWIc5Z6mLnhR2NOdV
 g3OCDkqR9wzA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258293"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258293"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:25 -0700
IronPort-SDR: GHAeQB7NbWTrovmTz5VN1rmCEN8+JooRh1OmCjYHCvo4mz7oBYvmwFqp/j3xNomMbFBl+TOFFC
 tWLwaS8umOEg==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883633"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/10] libssh2: fix build failure with option no-ecdsa
Date: Thu, 29 Apr 2021 12:40:59 +0800
Message-Id: <d70cf4cd57d61f7db7179673b211e631c944e0e6.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

libssh2 fails at do_compile if
DEPRECATED_CRYPTO_FLAGS = "no-ecdsa" is set in recipe:

../src/.libs/libssh2.so: undefined reference to
`LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY'

References:
https://github.com/libssh2/libssh2/issues/549

Upstream patches:
https://github.com/libssh2/libssh2/commit/1f76151c92e1b52e9c24ebf06adc77fbd6c062bc

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2bb146e7315f8080cb49a95212231ccb76a4a822)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...EC-macro-outside-of-if-check-549-550.patch | 112 ++++++++++++++++++
 meta/recipes-support/libssh2/libssh2_1.9.0.bb |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch

diff --git a/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch b/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
new file mode 100644
index 0000000000..b331c1bf81
--- /dev/null
+++ b/meta/recipes-support/libssh2/files/0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch
@@ -0,0 +1,112 @@
+From 1f76151c92e1b52e9c24ebf06adc77fbd6c062bc Mon Sep 17 00:00:00 2001
+From: Will Cosgrove <will@panic.com>
+Date: Tue, 26 Jan 2021 11:41:21 -0800
+Subject: [PATCH] kex.c: move EC macro outside of if check #549 (#550)
+
+File: kex.c
+
+Notes:
+Moved the macro LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY outside of the LIBSSH2_ECDSA since it's also now used by the ED25519 code.
+
+Sha 256, 384 and 512 need to be defined for all backends now even if they aren't used directly. I believe this is already the case, but just a heads up.
+
+Credit:
+Stefan-Ghinea
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://github.com/libssh2/libssh2/commit/1f76151c92e1b52e9c24ebf06adc77fbd6c062bc
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ src/kex.c | 66 +++++++++++++++++++++++++++----------------------------
+ 1 file changed, 33 insertions(+), 33 deletions(-)
+
+diff --git a/src/kex.c b/src/kex.c
+index cb16639..19ab6ec 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -1885,39 +1885,6 @@ kex_method_diffie_hellman_group_exchange_sha256_key_exchange
+ }
+ 
+ 
+-#if LIBSSH2_ECDSA
+-
+-/* kex_session_ecdh_curve_type
+- * returns the EC curve type by name used in key exchange
+- */
+-
+-static int
+-kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
+-{
+-    int ret = 0;
+-    libssh2_curve_type type;
+-
+-    if(name == NULL)
+-        return -1;
+-
+-    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
+-        type = LIBSSH2_EC_CURVE_NISTP256;
+-    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
+-        type = LIBSSH2_EC_CURVE_NISTP384;
+-    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
+-        type = LIBSSH2_EC_CURVE_NISTP521;
+-    else {
+-        ret = -1;
+-    }
+-
+-    if(ret == 0 && out_type) {
+-        *out_type = type;
+-    }
+-
+-    return ret;
+-}
+-
+-
+ /* LIBSSH2_KEX_METHOD_EC_SHA_HASH_CREATE_VERIFY
+  *
+  * Macro that create and verifies EC SHA hash with a given digest bytes
+@@ -2027,6 +1994,39 @@ kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
+ }                                                                       \
+ 
+ 
++#if LIBSSH2_ECDSA
++
++/* kex_session_ecdh_curve_type
++ * returns the EC curve type by name used in key exchange
++ */
++
++static int
++kex_session_ecdh_curve_type(const char *name, libssh2_curve_type *out_type)
++{
++    int ret = 0;
++    libssh2_curve_type type;
++
++    if(name == NULL)
++        return -1;
++
++    if(strcmp(name, "ecdh-sha2-nistp256") == 0)
++        type = LIBSSH2_EC_CURVE_NISTP256;
++    else if(strcmp(name, "ecdh-sha2-nistp384") == 0)
++        type = LIBSSH2_EC_CURVE_NISTP384;
++    else if(strcmp(name, "ecdh-sha2-nistp521") == 0)
++        type = LIBSSH2_EC_CURVE_NISTP521;
++    else {
++        ret = -1;
++    }
++
++    if(ret == 0 && out_type) {
++        *out_type = type;
++    }
++
++    return ret;
++}
++
++
+ /* ecdh_sha2_nistp
+  * Elliptic Curve Diffie Hellman Key Exchange
+  */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libssh2/libssh2_1.9.0.bb b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
index 0b8ccbd217..a5451628e7 100644
--- a/meta/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
            file://CVE-2019-17498.patch \
            file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
            file://run-ptest \
+           file://0001-kex.c-move-EC-macro-outside-of-if-check-549-550.patch \
 "
 
 SRC_URI_append_ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
-- 
2.30.2

