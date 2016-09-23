Return-Path: <anujx.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 797416FFCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:48:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 23 Sep 2016 01:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="764782675"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2016 01:48:06 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 16:48:37 +0800
Message-Id: <1474620517-4809-1-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [master][PATCH] openssl: security fix CVE-2016-6304
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
X-List-Received-Date: Fri, 23 Sep 2016 08:48:06 -0000

Reference:
https://www.openssl.org/news/secadv/20160922.txt

Upstream fix:
https://github.com/openssl/openssl/commit/e408c09bbf7c3057bda4b8d20bec1b3a7771c15b

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 .../openssl/openssl/CVE-2016-6304.patch            | 75 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
new file mode 100644
index 0000000..59d66f0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2016-6304.patch
@@ -0,0 +1,75 @@
+From ea39b16b71e4e72a228a4535bd6d6a02c5edbc1f Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Fri, 9 Sep 2016 10:08:45 +0100
+Subject: [PATCH] Fix OCSP Status Request extension unbounded memory growth
+
+A malicious client can send an excessively large OCSP Status Request
+extension. If that client continually requests renegotiation,
+sending a large OCSP Status Request extension each time, then there will
+be unbounded memory growth on the server. This will eventually lead to a
+Denial Of Service attack through memory exhaustion. Servers with a
+default configuration are vulnerable even if they do not support OCSP.
+Builds using the "no-ocsp" build time option are not affected.
+
+I have also checked other extensions to see if they suffer from a similar
+problem but I could not find any other issues.
+
+CVE-2016-6304
+
+Issue reported by Shi Lei.
+Reviewed-by: Rich Salz <rsalz@openssl.org>
+
+CVE: CVE-2016-6304
+Upstream-Status: Backport
+https://github.com/openssl/openssl/commit/e408c09bbf7c3057bda4b8d20bec1b3a7771c15b
+
+Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
+---
+ ssl/t1_lib.c | 24 +++++++++++++++++-------
+ 1 file changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/ssl/t1_lib.c b/ssl/t1_lib.c
+index fbcf2e6..e4b4e27 100644
+--- a/ssl/t1_lib.c
++++ b/ssl/t1_lib.c
+@@ -2316,6 +2316,23 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
+                 size -= 2;
+                 if (dsize > size)
+                     goto err;
++
++                /*
++                 * We remove any OCSP_RESPIDs from a previous handshake
++                 * to prevent unbounded memory growth - CVE-2016-6304
++                 */
++                sk_OCSP_RESPID_pop_free(s->tlsext_ocsp_ids,
++                                        OCSP_RESPID_free);
++                if (dsize > 0) {
++                    s->tlsext_ocsp_ids = sk_OCSP_RESPID_new_null();
++                    if (s->tlsext_ocsp_ids == NULL) {
++                        *al = SSL_AD_INTERNAL_ERROR;
++                        return 0;
++                    }
++                } else {
++                    s->tlsext_ocsp_ids = NULL;
++                }
++
+                 while (dsize > 0) {
+                     OCSP_RESPID *id;
+                     int idsize;
+@@ -2335,13 +2352,6 @@ static int ssl_scan_clienthello_tlsext(SSL *s, unsigned char **p,
+                         OCSP_RESPID_free(id);
+                         goto err;
+                     }
+-                    if (!s->tlsext_ocsp_ids
+-                        && !(s->tlsext_ocsp_ids =
+-                             sk_OCSP_RESPID_new_null())) {
+-                        OCSP_RESPID_free(id);
+-                        *al = SSL_AD_INTERNAL_ERROR;
+-                        return 0;
+-                    }
+                     if (!sk_OCSP_RESPID_push(s->tlsext_ocsp_ids, id)) {
+                         OCSP_RESPID_free(id);
+                         *al = SSL_AD_INTERNAL_ERROR;
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
index c8444d3..c369d01 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
@@ -42,6 +42,7 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
             file://CVE-2016-2177.patch \
             file://CVE-2016-2178.patch \
             file://openssl-util-perlpath.pl-cwd.patch \
+            file://CVE-2016-6304.patch \
            "
 SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
 SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
-- 
1.9.1


